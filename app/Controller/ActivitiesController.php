<?php

App::uses('AppController', 'Controller');

class ActivitiesController extends AppController {

	public $components = array('Paginator');
	public $helpers = array('Paginator');

	public function index() {
		$activities = $this->Activity->allActive(
			$this->Player->gameMasterId($this->Auth->user('id')));
		$this->set('activities', $activities);
	}

	public function view($id) {
		$activity = $this->Activity->findById($id);
		if (!$activity) {
			throw new NotFoundException();
		}
		$this->set('activity', $activity);
	}

	public function inactivate($id) {
		if (!$this->isGameMaster) {
			return $this->redirect('/activities');
		}

		$this->Activity->id = $id;
		if (!$this->Activity->exists()) {
			$this->flashError(__('Activity not found!'));
		} else {
			$update = array('id' => $id, 'inactive' => 1);
			if ($this->Activity->save($update)) {
				$this->flashSuccess(__('Activity inactivated successfully!'));
			} else {
				//@codeCoverageIgnoreStart
				$this->flashError(__('An error occurred while trying to inactivate the activity.'));
				//@codeCoverageIgnoreEnd
			}
		}
		
		return $this->redirect('/activities');
	}

	public function myActivities() {
		$this->paginate = array(
			'order' => array('Log.acquired' => 'DESC', 'Log.created' => 'DESC'),
			'contain' => array(
				'Activity',
				'Domain',
				'Player',
				'PairedPlayer',
				'Tags',
				'LogVote' => array(
					'Player',
					'order' => array('LogVote.creation' => 'DESC')
				)
			),
			'limit' => 20,
			'conditions' => array(
				'Log.player_id' => $this->Auth->user('id')
			),
		);

		$this->set('logs', $this->paginate('Log'));
	}

	public function summary() {
		$playerId = (int)$this->Auth->user('id');
		$logs = $this->PlayerActivitySummary->allFromPlayer($playerId);
		$this->set('logs', $logs);
	}

	public function day($date, $playerId = null) {
		if (!$playerId) {
			$playerId = (int)$this->Auth->user('id');
		}
		$logs = $this->Log->find('all', array(
			'conditions' => array(
				'player_id' => $playerId,
				'acquired' => $date
			),
			'contain' => array(
				'Activity', 'Domain', 'Tags'
			) 
		));
		$this->set('date', $date);
		$this->set('logs', $logs);
		$this->set('player', $this->Player->findById($playerId));
	}

	public function myPending() {
		$playerId = (int)$this->Auth->user('id');
		$logs = $this->Log->allPendingFromPlayer($playerId);
		$this->set('logs', $logs);
	}

	public function calendar($playerId = null) {
		if (!$playerId) {
			$playerId = (int)$this->Auth->user('id');
		}
		$this->set('calendarLogs', $this->CalendarLog->findAllByPlayerId($playerId));
		$this->set('player', $this->Player->findById($playerId));
	}

	public function team() {
		$this->set('collapseSidebar', true);
		
		if ($this->request->is('post') || $this->request->is('put')) {
			$logVotes = array();
			foreach (@$this->request->data['Log'] as $id => $log) {
				$acceptanceComment = @$log['acceptance_comment'];
				$rejectionComment = @$log['rejection_comment'];
				$comment = $acceptanceComment? $acceptanceComment : $rejectionComment;

				if ($comment) {
					$vote = $acceptanceComment? +1 : -1;
					$logVotes[] = array('LogVote' => array(
						'vote' => $vote,
						'comment' => $comment,
						'player_id' => (int)$this->Auth->user('id'),
						'log_id' => $id
					));
				}
			}
			if (!empty($logVotes)){
				$this->LogVote->saveVotes($logVotes);
				$this->flashSuccess(__('Activities reviewed successfully!'));
			}
			return $this->redirect('/activities/team');
		}
		
		$logs = $this->Log->allPendingFromTeamNotFromPlayer($this->Auth->user('id'));

		foreach ($logs as &$log) {
			foreach ($log['LogVote'] as $vote) {
				if ($vote['player_id'] === $this->Auth->user('id')) {
					$log['MyVote'] = $vote;
				}
			}
		}

		$this->set('logs', $logs);
	}

	public function report($activityId = null) {
		$playerTypeId = $this->Auth->user('player_type_id');

		$this->set('activities', $this->Activity->simpleActiveFromPlayerType(
			$this->gameMasterId(), 
			$playerTypeId
		));
		$this->set('activitiesById', $this->Activity->allFromOwnerById($this->gameMasterId()));
		$this->set('players', $this->Player->simpleTeamMates($this->Auth->user('id')));
		$this->set('tags', $this->Tag->allActive($this->gameMasterId()));

		if ($this->request->is('post')) {
			$log = $this->request->data;

			$playerId = $this->Auth->user('id');
			$log['Log']['player_id'] = $playerId;
			$log['Log']['player_id_owner'] = $this->gameMasterId();
			$activityId = $log['Log']['activity_id'];

			// Valida o primeiro log apenas
			$firstLog = $log;
			$firstLog['Log']['count'] = count($log['Log']['description']); // used by model validation
			$firstLog['Log']['description'] = $firstLog['Log']['description'][0];
			$this->Log->set($firstLog);

			if ($this->Log->validates()) {
				$logsToSave = array();
				foreach ($log['Log']['description'] as $description) {
					if ($description) {
						$logToSave = $log;
						$logToSave['Log']['description'] = $description;
						$logsToSave[] = $logToSave;
					}
				}
				$this->Log->report($logsToSave);
				$activity = $this->Activity->findById($log['Log']['activity_id']);
				$this->request->data = array();
				$this->flashSuccess(__('Activity %s reported successfully!', '<strong>' .$activity['Activity']['name'] . '</strong>'));
			} else {
				$this->flashError(__('There are validation errors.'));
			}
		} else {
			$this->request->data = array(
				'Log' => array(
					'activity_id' => $activityId
			));
		}
	}

	public function _save($id = null) {
		if (!$this->isGameMaster) {
			throw new ForbiddenException();
		}

		$this->set('domains', $this->Domain->simpleFromOwner($this->gameMasterId()));

		if ($this->request->is('post') || $this->request->is('put')) {
            $this->request->data['Activity']['player_id_owner'] = $this->Auth->user('id');

			if ($this->Activity->save($this->request->data)) {
				$this->flashSuccess(__('Activity saved successfully!'));
				return $this->redirect('/activities');
			} else {
				$this->flashError(__('Error while trying to save activity.'));
			}
		} else if ($id !== null) {
			$this->request->data = $this->Activity->findById($id);
		} else {
			// Default values
			$this->request->data = array('Activity' => array(
				'new' => true
			));
		}
	}

	public function add() {
		$this->_save();
	}


	public function edit($id = null) {
		$this->_save($id);
	}
}