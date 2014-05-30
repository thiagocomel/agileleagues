<?php

App::uses('AppModel', 'Model');

class Activity extends AppModel {
	
	public $useTable = 'activity';
	public $order = array('Activity.domain_id' => 'ASC', 'Activity.name' => 'ASC');
	public $displayField = 'name';

	public $validate = array(
		'name' => 'notEmpty',
		'description' => 'notEmpty',
		'xp' => 'notEmpty',
		'domain_id' => 'notEmpty'
	);

	public $belongsTo = array(
		'Domain'
	);

	public $hasOne = array('LastWeekLog');

	public function allFromOwnerById($playerIdOwner) {
		return $this->all(array(
			'Activity.player_id_owner' => $playerIdOwner
		), 'id');
	}

	public function allActive($playerIdOwner) {
		return $this->find('all', array(
			'conditions' => array(
				'Activity.inactive' => 0,
				'Activity.player_id_owner' => $playerIdOwner
			)
		));
	}

	public function count($playerIdOwner) {
		return $this->find('count', array(
			'conditions' => array(
				'Activity.inactive' => 0,
				'Activity.player_id_owner' => $playerIdOwner
			))
		);
	}

	public function simpleActive($playerIdOwner) {
		return $this->simple(array(
			'Activity.inactive' => 0,
			'Activity.player_id_owner' => $playerIdOwner
		));
	}

	public function simpleActiveFromPlayerType($playerIdOwner, $playerTypeId) {
		return $this->find('list', array(
			'conditions' => array(
				'Activity.player_id_owner' => $playerIdOwner,
				'Activity.inactive' => 0, 
				'Domain.player_type_id' => $playerTypeId
			),
			'recursive' => 0
		));
	}

	public function simpleFromDomain($domainId) {
		return $this->simple(array('Activity.domain_id' => $domainId));
	}
	
	public function leaderboardsLastWeek($playerIdOwner) {
		return $this->query('
			SELECT * FROM activity_leaderboards_last_week AS Leaderboards
			INNER JOIN player AS Player ON Player.id = Leaderboards.player_id
			WHERE player_id_owner = ?
		', array($playerIdOwner));
	}
	
	public function leaderboardsLastMonth($playerIdOwner) {
		return $this->query('
			SELECT * FROM activity_leaderboards_last_month AS Leaderboards
			INNER JOIN player AS Player ON Player.id = Leaderboards.player_id
			WHERE player_id_owner = ?
		', array($playerIdOwner));
	}
	
	public function leaderboardsEver($playerIdOwner) {
		return $this->query('
			SELECT * FROM activity_leaderboards AS Leaderboards
			INNER JOIN player AS Player ON Player.id = Leaderboards.player_id
			WHERE player_id_owner = ?
		', array($playerIdOwner));
	}
	
	public function leaderboardsThisWeek($playerIdOwner) {
		return $this->query('
			SELECT * FROM activity_leaderboards_this_week AS Leaderboards
			INNER JOIN player AS Player ON Player.id = Leaderboards.player_id
			WHERE player_id_owner = ?
		', array($playerIdOwner));
	}

	public function leaderboardsThisMonth($playerIdOwner) {
		return $this->query('
			SELECT * FROM activity_leaderboards_this_month AS Leaderboards
			INNER JOIN player AS Player ON Player.id = Leaderboards.player_id
			WHERE player_id_owner = ?
		', array($playerIdOwner));
	}

	public function leastReported($playerTypeId, $limit = 20) {
		return $this->find('all', array(
			'conditions' => array(
				'Activity.inactive' => 0,
				'Activity.reported <>' => 0,
				'Domain.player_type_id' => $playerTypeId
			),
			'limit' => $limit,
			'order' => 'Activity.reported ASC'
		));
	}

	public function mostReported($playerTypeId, $limit = 20) {
		return $this->find('all', array(
			'conditions' => array(
				'Activity.inactive' => 0,
				'Activity.reported <>' => 0,
				'Domain.player_type_id' => $playerTypeId
			),
			'limit' => $limit,
			'order' => 'Activity.reported DESC'
		));
	}

	public function neverReported($playerTypeId, $limit = 20) {
		return $this->find('all', array(
			'conditions' => array(
				'Activity.inactive' => 0,
				'Activity.reported' => 0,
				'Domain.player_type_id' => $playerTypeId
			),
			'limit' => $limit
		));
	}
}