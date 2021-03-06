-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 09-Set-2014 às 00:36
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `agileleagues`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_tag_to_logs_with_activity`(
	_activity_id INT,
	_tag_id INT
)
    MODIFIES SQL DATA
BEGIN 
		
	DECLARE _id INT UNSIGNED DEFAULT NULL;
	DECLARE _done INT DEFAULT FALSE;
	DECLARE _cursor CURSOR FOR 
		SELECT id FROM log WHERE log.activity_id = _activity_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE;

	OPEN _cursor;

	  	read_loop: LOOP
	    	FETCH _cursor INTO _id;
	    
	    IF _done THEN
	    	LEAVE read_loop;
	    END IF;
	   
	    INSERT INTO log_tag SET log_id = _id, tag_id = _tag_id;

		END LOOP;

	CLOSE _cursor;


END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `player_level`(
	_xp INT(10) UNSIGNED
) RETURNS int(10) unsigned
    NO SQL
BEGIN

	RETURN FLOOR(1 + 0.0464159 * POW(_xp, 2/3));

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `access_log`
--

CREATE TABLE IF NOT EXISTS `access_log` (
`id` int(10) unsigned NOT NULL,
  `plugin` varchar(10) DEFAULT NULL,
  `controller` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `params` text,
  `post` text,
  `get` text,
  `player_id` int(10) unsigned NOT NULL
) ENGINE=ARCHIVE  DEFAULT CHARSET=latin1 AUTO_INCREMENT=668 ;

--
-- Extraindo dados da tabela `access_log`
--

INSERT INTO `access_log` (`id`, `plugin`, `controller`, `action`, `params`, `post`, `get`, `player_id`) VALUES
(1, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(2, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(3, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(4, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(5, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(6, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(7, NULL, 'badges', 'claimed', '[]', '[]', '[]', 6),
(8, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(9, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(10, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(11, NULL, 'players', 'logout', '[]', '[]', '[]', 1),
(12, NULL, 'players', 'login', '[]', '[]', '[]', 6),
(13, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(14, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(15, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(16, NULL, 'domains', 'add', '[]', '[]', '[]', 6),
(17, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(18, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(19, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(20, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(21, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(22, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(23, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(24, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Activity":{"domain_id":"2"}}}', '[]', 6),
(25, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(26, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(27, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Activity":{"domain_id":"1"}}}', '[]', 6),
(28, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(29, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(30, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Activity":{"domain_id":"1"}}}', '[]', 6),
(31, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Activity":{"domain_id":"1"}}}', '[]', 6),
(32, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(33, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Badge":{"domain_id":"1"}}}', '[]', 6),
(34, NULL, 'badges', 'add', '["1"]', '[]', '[]', 6),
(35, NULL, 'badges', 'add', '["1"]', '[]', '[]', 6),
(36, NULL, 'badges', 'add', '["1"]', '[]', '[]', 6),
(37, NULL, 'badges', 'add', '["1"]', '[]', '[]', 6),
(38, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(39, NULL, 'badges', 'add', '[]', '[]', '[]', 6),
(40, NULL, 'badges', 'add', '[]', '{"_method":"POST","data":{"Badge":{"domain_id":"3"}}}', '[]', 6),
(41, NULL, 'badges', 'add', '["3"]', '[]', '[]', 6),
(42, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(43, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(44, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(45, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(46, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(47, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(48, NULL, 'players', 'logout', '[]', '[]', '[]', 1),
(49, NULL, 'players', 'login', '[]', '[]', '[]', 9),
(50, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 9),
(51, NULL, 'players', 'logout', '[]', '[]', '[]', 9),
(52, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(53, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(54, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(55, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(56, NULL, 'activities', 'index', '[]', '[]', '[]', 1),
(57, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"11","description":["asdfasdfasdfasdf","asdfasdfasdf"],"acquired":{"month":"08","day":"09","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 1),
(58, NULL, 'players', 'login', '[]', '[]', '[]', 5),
(59, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 5),
(60, NULL, 'activities', 'report', '[]', '[]', '[]', 5),
(61, NULL, 'activities', 'myPending', '[]', '[]', '[]', 5),
(62, NULL, 'activities', 'team', '[]', '[]', '[]', 5),
(63, NULL, 'players', 'login', '[]', '[]', '[]', 5),
(64, NULL, 'activities', 'team', '[]', '[]', '[]', 5),
(65, NULL, 'activities', 'team', '[]', '{"_method":"POST","data":{"Log":{"1481":{"acceptance_comment":"sadfas"},"1483":{"acceptance_comment":"asdf"},"1479":{"acceptance_comment":"asdfasdf"},"1480":{"acceptance_comment":"dfasd"},"1482":{"acceptance_comment":"dfadf"},"1490":{"acceptance_comment":"asdf"},"1491":{"acceptance_comment":"fasdf"},"1492":{"acceptance_comment":"asdfasdfas"}}}}', '[]', 5),
(66, NULL, 'activities', 'team', '[]', '[]', '[]', 5),
(67, NULL, 'activities', 'report', '[]', '[]', '[]', 5),
(68, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"11","description":["asdfasdfasdf","asdfasdfasdf"],"acquired":{"month":"08","day":"09","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 5),
(69, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"11","description":["asdfasdfasdf","asdfasfasdfasdfsaf","asdfasdfasdfasdfasdfas"],"acquired":{"month":"08","day":"09","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 5),
(70, NULL, 'players', 'logout', '[]', '[]', '[]', 5),
(71, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(72, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(73, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(74, NULL, 'activities', 'team', '[]', '{"_method":"POST","data":{"Log":{"1495":{"acceptance_comment":"aaaa"},"1497":{"acceptance_comment":"aaaaaaaaaaaa"},"1496":{"acceptance_comment":"aaaaaaaaaaaaaaaaaaa"}}}}', '[]', 1),
(75, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(76, NULL, 'players', 'logout', '[]', '[]', '[]', 1),
(77, NULL, 'players', 'login', '[]', '[]', '[]', 6),
(78, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(79, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(80, NULL, 'players', 'invite', '[]', '[]', '[]', 6),
(81, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(82, NULL, 'players', 'invite', '[]', '[]', '[]', 6),
(83, NULL, 'players', 'invite', '[]', '{"_method":"POST","data":{"Player":{"name":"AL Contact","email":"contact@agileleagues.com","team_id":"2"}}}', '[]', 6),
(84, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(85, NULL, 'players', 'index', '[]', '[]', '[]', 1000),
(86, NULL, 'players', 'login', '[]', '[]', '[]', 1000),
(87, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1000),
(88, NULL, 'players', 'login', '[]', '[]', '[]', 1000),
(89, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1000),
(90, NULL, 'players', 'login', '[]', '[]', '[]', 1000),
(91, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1000),
(92, NULL, 'pages', 'display', '["home"]', '[]', '[]', 1000),
(93, NULL, 'players', 'signin', '[]', '{"_method":"POST","data":{"Player":{"email":"davi@versul.com.br","password":"sha2008"}}}', '[]', 1000),
(94, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(95, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(96, NULL, 'players', 'invitations', '[]', '[]', '[]', 6),
(97, NULL, 'players', 'invitations', '[]', '[]', '[]', 6),
(98, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(99, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(100, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(101, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(102, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(103, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(104, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(105, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(106, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(107, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(108, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(109, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(110, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(111, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(112, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(113, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(114, NULL, 'players', 'resentInvitation', '["22"]', '[]', '[]', 6),
(115, NULL, 'players', 'resentInvitation', '["22"]', '[]', '[]', 6),
(116, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(117, NULL, 'players', 'resendInvitation', '["22"]', '[]', '[]', 6),
(118, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(119, NULL, 'players', 'resendInvitation', '["22"]', '[]', '[]', 6),
(120, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(121, NULL, 'players', 'invite', '[]', '[]', '[]', 6),
(122, NULL, 'players', 'invite', '[]', '{"_method":"POST","data":{"Player":{"name":"AG Contact","email":"contact@agilegamification.org","team_id":"2"}}}', '[]', 6),
(123, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(124, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(125, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(126, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(127, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(128, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(129, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(130, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(131, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"11","description":["asdfasdfasdf"],"acquired":{"month":"08","day":"17","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 1),
(132, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"11","description":["asdfasdfasdf"],"acquired":{"month":"08","day":"15","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 1),
(133, NULL, 'activities', 'calendar', '[]', '[]', '[]', 1),
(134, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(135, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(136, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(137, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(138, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(139, NULL, 'activities', 'day', '["2014-08-15","1"]', '[]', '[]', 1),
(140, NULL, 'activities', 'day', '["2014-08-09","1"]', '[]', '[]', 1),
(141, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(142, NULL, 'activities', 'team', '[]', '{"_method":"POST"}', '[]', 1),
(143, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(144, NULL, 'activities', 'team', '[]', '{"_method":"POST"}', '[]', 1),
(145, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(146, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(147, NULL, 'activities', 'myPending', '[]', '[]', '[]', 1),
(148, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(149, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(150, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(151, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(152, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(153, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(154, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(155, NULL, 'activities', 'report', '[]', '{"_method":"POST","data":{"Log":{"activity_id":"9","description":["asdfasdfasdfasdfasdasdfasdfasdfasdf"],"acquired":{"month":"08","day":"22","year":"2014"},"event_id":"","player_id_pair":""}}}', '[]', 1),
(156, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(157, NULL, 'activities', 'calendar', '[]', '[]', '[]', 1),
(158, NULL, 'activities', 'day', '["2014-08-22","1"]', '[]', '[]', 1),
(159, NULL, 'activities', 'day', '["2014-08-22","1"]', '[]', '[]', 1),
(160, NULL, 'activities', 'calendar', '[]', '[]', '[]', 1),
(161, NULL, 'activities', 'calendar', '[]', '[]', '[]', 1),
(162, NULL, NULL, NULL, '[]', '[]', '{"case":"View\\\\Helper\\\\FormatHelper","code_coverage":"true"}', 1),
(163, NULL, NULL, NULL, '[]', '[]', '{"case":"View\\\\Helper\\\\FormatHelper","code_coverage":"true"}', 1),
(164, NULL, 'pages', 'display', '["welcome"]', '[]', '[]', 24),
(165, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(166, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(167, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(168, NULL, 'players', 'invite', '[]', '[]', '[]', 6),
(169, NULL, 'players', 'invite', '[]', '{"_method":"POST","data":{"Player":{"name":"DGBR","email":"davi.gbr@gmail.com","team_id":"2"}}}', '[]', 6),
(170, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(171, NULL, 'players', 'join', '["436907d3e019cfca6074b129efb88a67c340b00de13c449ad7282a63fadb13cc"]', '[]', '[]', 6),
(172, NULL, 'players', 'join', '["436907d3e019cfca6074b129efb88a67c340b00de13c449ad7282a63fadb13cc"]', '[]', '[]', 6),
(173, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(174, NULL, 'players', 'invite', '[]', '[]', '[]', 6),
(175, NULL, 'players', 'invite', '[]', '{"_method":"POST","data":{"Player":{"name":"DGBR","email":"davi.gbr@gmail.com","team_id":"2"}}}', '[]', 6),
(176, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(177, NULL, 'players', 'join', '["436907d3e019cfca6074b129efb88a67c340b00de13c449ad7282a63fadb13cc"]', '[]', '[]', 6),
(178, NULL, 'players', 'join', '["99f83a16959291cd6cd6567fec74f3752530c58925f1b41ccb54216310e5845d"]', '[]', '[]', 6),
(179, NULL, 'players', 'join', '["99f83a16959291cd6cd6567fec74f3752530c58925f1b41ccb54216310e5845d"]', '{"_method":"PUT","data":{"Player":{"id":"26","password":"123456","repeat_password":"123456"}}}', '[]', 6),
(180, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 26),
(181, NULL, 'players', 'logout', '[]', '[]', '[]', 26),
(182, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(183, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(184, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(185, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(186, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(187, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(188, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(189, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(190, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(191, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(192, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(193, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(194, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(195, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(196, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(197, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(198, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(199, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(200, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(201, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(202, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(203, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(204, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(205, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(206, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(207, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(208, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(209, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(210, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(211, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(212, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(213, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(214, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(215, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(216, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(217, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(218, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(219, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(220, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(221, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(222, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(223, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(224, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(225, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(226, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(227, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(228, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(229, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(230, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(231, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(232, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(233, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(234, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(235, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(236, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(237, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(238, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(239, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(240, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(241, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(242, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(243, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(244, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(245, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(246, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(247, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(248, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(249, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(250, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(251, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(252, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(253, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(254, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(255, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(256, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(257, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(258, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(259, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(260, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(261, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(262, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(263, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(264, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(265, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(266, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(267, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(268, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(269, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(270, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(271, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(272, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(273, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(274, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(275, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(276, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(277, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(278, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(279, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(280, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(281, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(282, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(283, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(284, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(285, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(286, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(287, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(288, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(289, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(290, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(291, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(292, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(293, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(294, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(295, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(296, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(297, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(298, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(299, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(300, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(301, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(302, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(303, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(304, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(305, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(306, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(307, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(308, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(309, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(310, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(311, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(312, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(313, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(314, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(315, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(316, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(317, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(318, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(319, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(320, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(321, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(322, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(323, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(324, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(325, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(326, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(327, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(328, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(329, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(330, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(331, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(332, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(333, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(334, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(335, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(336, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(337, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(338, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(339, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(340, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(341, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(342, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(343, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(344, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(345, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(346, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(347, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(348, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(349, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(350, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(351, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(352, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(353, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(354, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(355, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(356, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(357, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(358, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(359, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(360, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(361, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(362, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(363, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(364, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(365, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(366, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(367, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(368, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(369, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(370, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(371, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(372, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(373, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(374, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(375, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(376, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(377, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(378, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(379, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(380, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(381, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(382, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(383, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(384, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(385, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(386, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(387, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(388, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(389, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(390, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(391, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(392, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(393, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(394, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(395, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(396, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(397, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(398, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(399, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(400, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(401, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(402, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(403, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(404, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(405, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(406, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(407, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(408, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(409, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(410, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(411, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(412, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(413, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(414, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(415, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(416, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(417, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(418, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(419, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(420, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(421, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(422, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(423, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(424, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(425, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(426, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(427, NULL, 'players', 'invited', '[]', '[]', '[]', 1000),
(428, NULL, 'players', 'login', '[]', '[]', '[]', 1000),
(429, NULL, 'players', 'login', '[]', '[]', '[]', 1000),
(430, NULL, 'players', 'login', '[]', '[]', '[]', 26),
(431, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 26),
(432, NULL, 'players', 'logout', '[]', '[]', '[]', 26),
(433, NULL, 'players', 'login', '[]', '[]', '[]', 6),
(434, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(435, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(436, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(437, NULL, 'players', 'resendInvitation', '["26"]', '[]', '[]', 6),
(438, NULL, 'players', 'invited', '[]', '[]', '[]', 6),
(439, NULL, 'players', 'join', '["463f0601b91556d5ab5eb48341475eac95487ae96201ed9f21806a6f4fd6de58"]', '[]', '[]', 6),
(440, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 26),
(441, NULL, 'players', 'logout', '[]', '[]', '[]', 26),
(442, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(443, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(444, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(445, NULL, 'pages', 'display', '["home"]', '[]', '[]', 6),
(446, NULL, 'players', 'signin', '[]', '{"_method":"POST","data":{"Player":{"email":"davi@versul.com.br","password":"sha2008"}}}', '[]', 6),
(447, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(448, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(449, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(450, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(451, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(452, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(453, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(454, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(455, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(456, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(457, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(458, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(459, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(460, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(461, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(462, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(463, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(464, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(465, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(466, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(467, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(468, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(469, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(470, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(471, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(472, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(473, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(474, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(475, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(476, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(477, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(478, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(479, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(480, NULL, 'badges', 'index', '[]', '[]', '[]', 6),
(481, NULL, 'domains', 'badges', '["3"]', '[]', '[]', 6),
(482, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(483, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(484, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(485, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(486, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(487, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(488, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(489, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(490, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(491, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(492, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(493, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(494, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(495, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(496, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(497, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(498, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(499, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(500, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(501, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(502, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(503, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(504, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(505, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(506, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(507, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(508, NULL, 'domains', 'badges', '["4"]', '[]', '[]', 6),
(509, NULL, 'badges', 'view', '["60"]', '[]', '[]', 6),
(510, NULL, 'badges', 'view', '["60"]', '[]', '[]', 6),
(511, NULL, 'badges', 'view', '["60"]', '[]', '[]', 6),
(512, NULL, 'badges', 'view', '["60"]', '[]', '[]', 6),
(513, NULL, 'badges', 'view', '["60"]', '[]', '[]', 6),
(514, NULL, 'badges', 'view', '["63"]', '[]', '[]', 6),
(515, NULL, 'badges', 'view', '["59"]', '[]', '[]', 6),
(516, NULL, 'badges', 'view', '["58"]', '[]', '[]', 6),
(517, NULL, 'badges', 'view', '["53"]', '[]', '[]', 6),
(518, NULL, 'badges', 'view', '["51"]', '[]', '[]', 6),
(519, NULL, 'badges', 'view', '["52"]', '[]', '[]', 6),
(520, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(521, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(522, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(523, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(524, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(525, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(526, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(527, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(528, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(529, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(530, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(531, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(532, NULL, 'tags', 'add', '[]', '[]', '[]', 6),
(533, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(534, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(535, NULL, 'tags', 'edit', '["18"]', '[]', '[]', 6),
(536, NULL, 'tags', 'edit', '["18"]', '{"_method":"PUT","data":{"Tag":{"id":"18","name":"Pair","description":"Pair Programming","bonus_type":"%","bonus_value":"50","color":"#ff0000","new":"1"}}}', '[]', 6),
(537, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(538, NULL, 'pages', 'display', '["home"]', '[]', '[]', 6),
(539, NULL, 'players', 'login', '[]', '[]', '[]', 6),
(540, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(541, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(542, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(543, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(544, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(545, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(546, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(547, NULL, 'pages', 'display', '["welcome"]', '[]', '[]', 6),
(548, NULL, 'tags', 'index', '[]', '[]', '[]', 6),
(549, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(550, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(551, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(552, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(553, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(554, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(555, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(556, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(557, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(558, NULL, 'pages', 'display', '["home"]', '[]', '[]', 6),
(559, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(560, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(561, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(562, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(563, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(564, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(565, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(566, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(567, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(568, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(569, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(570, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(571, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(572, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(573, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(574, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(575, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(576, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(577, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(578, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(579, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(580, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(581, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(582, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(583, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(584, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(585, NULL, 'pages', 'display', '["new"]', '[]', '[]', 6),
(586, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(587, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(588, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(589, NULL, 'activities', 'add', '[]', '[]', '[]', 6),
(590, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(591, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(592, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(593, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(594, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(595, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(596, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(597, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(598, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(599, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(600, NULL, 'activities', 'view', '["11"]', '[]', '[]', 6),
(601, NULL, 'badges', 'claimed', '[]', '[]', '[]', 6),
(602, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(603, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(604, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(605, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(606, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(607, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(608, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(609, NULL, 'activities', 'index', '[]', '[]', '[]', 1),
(610, NULL, 'players', 'logout', '[]', '[]', '[]', 1),
(611, NULL, 'players', 'login', '[]', '[]', '[]', 26),
(612, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 26),
(613, NULL, 'players', 'logout', '[]', '[]', '[]', 26),
(614, NULL, 'players', 'login', '[]', '[]', '[]', 6),
(615, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(616, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(617, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(618, NULL, 'activities', 'edit', '["13"]', '[]', '[]', 6),
(619, NULL, 'activities', 'edit', '["13"]', '{"_method":"PUT","data":{"Activity":{"id":"13","domain_id":"2","name":"Library Item","description":"Trazer livro\\/revista para a biblioteca da empresa.","details":"Revista, livro, etc.","restrictions":"Deve ser \\u00fatil para a equipe.","xp":"15","acceptance_votes":"1","rejection_votes":"1","new":"0"}}}', '[]', 6),
(620, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(621, NULL, 'activities', 'view', '["13"]', '[]', '[]', 6),
(622, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(623, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(624, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(625, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(626, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(627, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(628, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(629, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(630, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(631, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(632, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(633, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(634, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(635, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(636, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(637, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(638, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(639, NULL, 'activities', 'view', '["26"]', '[]', '[]', 1),
(640, NULL, 'pages', 'display', '["home"]', '[]', '[]', 1),
(641, NULL, 'players', 'signin', '[]', '{"_method":"POST","data":{"Player":{"email":"davi@versul.com.br","password":"sha2008"}}}', '[]', 1),
(642, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(643, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(644, NULL, 'players', 'logout', '[]', '[]', '[]', 6),
(645, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(646, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(647, NULL, 'players', 'signin', '[]', '{"_method":"POST","data":{"Player":{"email":"davi@versul.com.br","password":"sha2008"}}}', '[]', 1),
(648, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(649, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(650, NULL, 'dashboards', 'xp', '[]', '[]', '[]', 6),
(651, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(652, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(653, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(654, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(655, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(656, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(657, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(658, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(659, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(660, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(661, NULL, 'dashboards', 'players', '[]', '[]', '[]', 6),
(662, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 6),
(663, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(664, NULL, 'teams', 'index', '[]', '[]', '[]', 6),
(665, NULL, 'players', 'index', '[]', '[]', '[]', 6),
(666, NULL, 'players', 'team', '["1"]', '[]', '[]', 6),
(667, NULL, 'players', 'team', '["1"]', '[]', '[]', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reported` int(10) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned NOT NULL,
  `acceptance_votes` int(10) unsigned NOT NULL DEFAULT '1',
  `rejection_votes` int(10) unsigned NOT NULL DEFAULT '1',
  `details` text NOT NULL,
  `restrictions` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Extraindo dados da tabela `activity`
--

INSERT INTO `activity` (`id`, `name`, `domain_id`, `description`, `inactive`, `new`, `xp`, `created`, `reported`, `player_id_owner`, `acceptance_votes`, `rejection_votes`, `details`, `restrictions`) VALUES
(1, 'Doc', 1, 'Criar documentação para funcionalidade nova (wordpress, por user story).', 1, 0, 0, '0000-00-00 00:00:00', 23, 6, 1, 1, '', ''),
(2, 'Code Doc', 1, 'Documentar código-fonte (código-fonte, por classe).', 0, 0, 5, '0000-00-00 00:00:00', 164, 6, 1, 1, '', ''),
(3, 'Glossary', 1, 'Adicionar termo no glossário (wordpress, por termo).', 0, 0, 20, '0000-00-00 00:00:00', 5, 6, 2, 1, '', ''),
(4, 'Improve Doc', 1, 'Melhorar documentação existente (wordpress, por página).', 1, 0, 0, '0000-00-00 00:00:00', 4, 6, 1, 1, '', ''),
(5, 'Question Doc', 1, 'Criar documentação para esclarecer dúvidas (wordpress, por dúvida).', 0, 0, 50, '0000-00-00 00:00:00', 2, 6, 2, 1, '', ''),
(6, 'Old Doc', 1, 'Adicionar documentação faltante para funcionalidades antigas (wordpress, por página).', 1, 0, 0, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(7, 'Visual Doc', 1, 'Criar fluxograma, caso de uso ou alguma outra documentação não-textual. Necessita justificativa!', 0, 0, 50, '0000-00-00 00:00:00', 5, 6, 2, 1, '', ''),
(8, 'Persona', 1, 'Criar uma persona (completa, com biografia efoto).', 0, 0, 50, '0000-00-00 00:00:00', 5, 6, 3, 1, '', ''),
(9, 'API Doc', 1, 'Criar documentação para função da API (controller).', 0, 0, 20, '0000-00-00 00:00:00', 17, 6, 1, 1, '', ''),
(10, 'Pair Doc', 1, 'Executar atividade de documentação em par. Deve ser ganho junto com outra atividade de documentação.', 1, 0, 0, '0000-00-00 00:00:00', 8, 6, 1, 1, '', ''),
(11, 'Acceptance Criteria', 1, 'Escrever/registrar os critérios de aceitação de uma User Story.', 0, 0, 40, '0000-00-00 00:00:00', 6, 6, 1, 1, '', ''),
(12, 'Chima', 2, 'Preparar chimarrão (deve ser aprovado pela equipe).', 0, 0, 2, '0000-00-00 00:00:00', 7, 6, 1, 1, '', ''),
(13, 'Library Item', 2, 'Trazer livro/revista para a biblioteca da empresa.', 0, 0, 15, '0000-00-00 00:00:00', 0, 6, 1, 1, 'Revista, livro, etc.', 'Deve ser útil para a equipe.'),
(14, 'Water Bottle', 2, 'Trocar a garrafa de água.', 0, 0, 2, '0000-00-00 00:00:00', 18, 6, 1, 1, '', ''),
(15, 'All-day Pair', 2, 'Parear durante um dia inteiro de trabalho.', 0, 0, 20, '0000-00-00 00:00:00', 67, 6, 2, 1, '', ''),
(16, 'Single Coaching', 2, 'Dar um treinamento de pelo menos 30 min para um membro da equipe.', 0, 0, 10, '0000-00-00 00:00:00', 5, 6, 2, 1, '', ''),
(17, 'Coffee', 2, 'Preparar café (deve ser aprovado pela equipe).', 0, 0, 2, '0000-00-00 00:00:00', 27, 6, 1, 1, '', ''),
(18, 'Team Coaching', 2, 'Dar treinamento à equipe sobre alguma tecnologia.', 0, 0, 50, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(19, 'Help the Team', 2, 'Atividade voluntária de auxílio ao time.', 0, 0, 5, '0000-00-00 00:00:00', 1, 6, 2, 1, '', ''),
(20, 'Lead Retrospective', 2, 'Conduzir reunião de retrospectiva.', 0, 0, 50, '0000-00-00 00:00:00', 0, 6, 3, 1, '', ''),
(21, 'Track Sprint Metrics', 2, 'Atualizar quadro com métricas do Sprint (velocity, burnup, risks, etc). Somente uma pessoa por Sprint.', 0, 0, 35, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(22, 'Daily Planning', 2, 'Planejar o dia antes da Daily Scrum e apresentar o que foi decidido na mesma.', 0, 0, 10, '0000-00-00 00:00:00', 3, 6, 1, 1, '', ''),
(23, 'Refactor', 3, 'Efetuar refatoração. Informar qual o tipo da refatoração, de acordo com "Refactoring: Improving the Design of Existing Code".', 0, 0, 10, '0000-00-00 00:00:00', 76, 6, 1, 1, '', ''),
(24, 'Read Article', 3, 'Ler artigo sobre algumas das seguintes tecnologias: XML, XPath, DTD, SVG ou XSLT.', 0, 0, 20, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(25, 'MySQL Book', 3, 'Ler livro, estudar ou criar projeto complexo de MySQL.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(26, 'Java Book', 3, 'Ler livro ou estudar sobre Java.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(27, 'JavaScript Book', 3, 'Ler livro ou estudar sobre JavaScript.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(28, 'PHP Book', 3, 'Ler livro ou estudar sobre PHP.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(29, 'Android Book', 3, 'Ler livro ou estudar Android (avançado).', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(30, 'HTML Book', 3, 'Ler livro ou estudar sobre HTML5.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(31, 'CSS Book', 3, 'Ler livro ou estudar sobre CSS3.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(32, 'RESTful Book', 3, 'Ler livro ou estudar sobre RESTful (avançado).', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(33, 'Refactor Book', 3, 'Ler livro sobre refatoração.', 0, 0, 200, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(34, 'OOP', 3, 'Ler livro ou estudar OOP Design Patterns.', 0, 0, 200, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(35, 'JavaScript Community', 3, 'Criar plugin para jQuery e publicar (github, site do jquery, etc) ou criar módulo para Node.js e publicar.', 0, 0, 50, '0000-00-00 00:00:00', 1, 6, 4, 1, '', ''),
(36, 'Pair Refactoring', 3, 'Executar refatoração em par. Deve ser ganho junto com a atividade Refactor.', 1, 0, 10, '0000-00-00 00:00:00', 36, 6, 1, 1, '', ''),
(37, 'Unit Test', 4, 'Criar teste unitário (por classe).', 0, 0, 10, '0000-00-00 00:00:00', 156, 6, 1, 1, '', ''),
(38, 'Legacy Test', 4, 'Criar teste unitário para uma funcionalidade antiga que não possui teste (por classe).', 1, 0, 15, '0000-00-00 00:00:00', 10, 6, 1, 1, '', ''),
(39, 'Unit Bug Trap', 4, 'Criar teste unitário para detectar bug antes de corrígi-lo (por bug).', 1, 0, 25, '0000-00-00 00:00:00', 39, 6, 1, 1, '', ''),
(40, 'TDD', 4, 'Criar teste de uma funcionalidade (classe de teste) nova antes de escrever o código (TDD).', 1, 0, 20, '0000-00-00 00:00:00', 60, 6, 1, 1, '', ''),
(41, 'System Test', 4, 'Auxiliar no teste de sistema junto com os QA''s.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 3, 1, '', ''),
(42, 'Improve Unit Test', 4, 'Melhorar teste unitário existente.', 0, 0, 5, '0000-00-00 00:00:00', 103, 6, 1, 1, '', ''),
(43, 'Pair Testing', 4, 'Executar atividade de teste em par. Deve ser ganho junto com outra atividade de teste.', 1, 0, 10, '0000-00-00 00:00:00', 91, 6, 1, 1, '', ''),
(44, 'JUnit Test', 4, 'Criar teste unitário utilizando JUnit (por classe).', 1, 0, 5, '0000-00-00 00:00:00', 83, 6, 1, 1, '', ''),
(45, 'PHPUnit Test', 4, 'Criar teste unitário utilizando PHPUnit (por classe).', 1, 0, 5, '0000-00-00 00:00:00', 88, 6, 1, 1, '', ''),
(46, 'Send Article', 2, 'Enviar artigo para a equipe por e-mail (1 por dia no máximo).', 0, 0, 10, '0000-00-00 00:00:00', 4, 6, 1, 1, '', ''),
(52, 'Estimation', 2, 'Executar Planning Poker para estimar user stories do backlog (uma vez por dia).', 0, 0, 3, '0000-00-00 00:00:00', 88, 6, 1, 1, '', ''),
(54, 'Read Article 2', 3, 'Ler artigo sobre um dos seguintes protocolos: TCP, HTTP, HTTPS/SSL, FTP.', 0, 0, 20, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(55, 'Spike', 3, 'Efetuar pesquisa para redução de risco ou dívida técnica.', 0, 0, 30, '0000-00-00 00:00:00', 1, 6, 2, 1, '', ''),
(56, 'API Improvements', 3, 'Melhorar API ou criar utilitários para agilizar a programação. Também válido para aprimoramentos em APIs RESTful.', 0, 0, 5, '0000-00-00 00:00:00', 15, 6, 1, 1, '', ''),
(57, 'Test Inspection', 4, 'Ser o responsável pelos testes durante um Sprint.', 0, 0, 50, '0000-00-00 00:00:00', 3, 6, 1, 1, '', ''),
(58, 'DoD Check', 2, 'Ao concluir o desenvolvimento de uma User Story, identificar/mostrar que todos os itens da DoD foram verificados.', 0, 0, 10, '0000-00-00 00:00:00', 60, 6, 1, 1, '', ''),
(59, 'Brainstorm', 2, 'Conduzir sessão de brainstorming.', 0, 0, 20, '0000-00-00 00:00:00', 1, 6, 1, 1, '', ''),
(61, 'Demonstration', 2, 'Demonstrar funcionalidade na reunião de revisão.', 0, 0, 10, '0000-00-00 00:00:00', 26, 6, 2, 1, '', ''),
(62, 'Iteration Plan', 2, 'Colaborar na construção do planejamento do Sprint.', 0, 0, 15, '0000-00-00 00:00:00', 8, 6, 1, 1, '', ''),
(63, 'Retrospective Action', 2, 'Concluir atividade identificada na reunião de retrospectiva.', 0, 0, 30, '0000-00-00 00:00:00', 1, 6, 3, 1, '', ''),
(64, 'Integration Bug Trap', 4, 'Criar teste de integração para detectar bug antes de corrígi-lo.', 1, 0, 40, '0000-00-00 00:00:00', 0, 6, 1, 1, '', ''),
(65, 'Build Automation', 4, 'Automatizar build de algum projeto.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(66, 'Test Automation', 4, 'Automatizar execução de testes de algum projeto.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(67, 'Deploy Automation', 4, 'Automatizar deploy (em ambiente de desenvolvimento) de alguma aplicação.', 0, 0, 100, '0000-00-00 00:00:00', 0, 6, 4, 1, '', ''),
(69, 'Fix Test', 4, 'Corrigir teste unitário ou de integração.', 0, 0, 10, '0000-00-00 00:00:00', 55, 6, 1, 1, '', ''),
(70, 'Ping-Pong Programming', 4, 'A escreve um teste. B implementa o código. B escreve o próximo teste. A implementa o código.', 0, 0, 50, '0000-00-00 00:00:00', 8, 6, 1, 1, '', ''),
(71, 'Pair Problem Solving', 2, 'Resolução de algum problema em dupla.', 0, 1, 5, '0000-00-00 00:00:00', 11, 6, 1, 1, '', ''),
(72, 'Exploratory Testing', 4, 'Efetuar teste exploratório/manual (por funcionalidade).', 0, 0, 10, '0000-00-00 00:00:00', 27, 6, 1, 1, '', ''),
(73, 'Integration Test', 4, 'Criar teste de integração entre diversas partes do sistema.', 0, 1, 20, '2014-07-05 16:01:58', 0, 6, 2, 1, '', ''),
(74, 'A crazy aactivity', 5, 'uahdfoiuahdf', 0, 1, 123, '2014-07-06 22:13:36', 2, 8, 1, 1, '', ''),
(75, 'Another crazy activity', 5, '45674897', 0, 1, 32, '2014-07-06 22:13:51', 4, 8, 2, 2, '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_last_month`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_last_month` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_last_week`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_last_week` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_this_month`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_this_month` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_this_week`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_this_week` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_ranking`
--
CREATE TABLE IF NOT EXISTS `activity_ranking` (
`count` bigint(21)
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite`
--

CREATE TABLE IF NOT EXISTS `activity_requisite` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=169 ;

--
-- Extraindo dados da tabela `activity_requisite`
--

INSERT INTO `activity_requisite` (`id`, `badge_id`, `activity_id`, `count`) VALUES
(28, 5, 11, 20),
(29, 6, 8, 5),
(30, 8, 9, 40),
(31, 9, 7, 10),
(33, 10, 5, 10),
(34, 11, 17, 20),
(35, 12, 12, 10),
(36, 13, 46, 10),
(37, 14, 19, 5),
(38, 15, 46, 10),
(39, 15, 19, 5),
(40, 16, 15, 30),
(41, 17, 16, 10),
(42, 18, 18, 3),
(45, 20, 13, 5),
(46, 21, 52, 30),
(47, 22, 59, 5),
(51, 24, 21, 5),
(52, 25, 63, 15),
(54, 26, 62, 10),
(55, 28, 61, 15),
(56, 29, 58, 30),
(64, 32, 23, 30),
(65, 36, 36, 30),
(66, 37, 27, 1),
(67, 37, 35, 3),
(68, 38, 30, 1),
(69, 39, 31, 1),
(70, 40, 28, 1),
(73, 41, 32, 1),
(74, 41, 56, 10),
(75, 42, 25, 1),
(80, 45, 24, 5),
(81, 45, 35, 2),
(82, 46, 56, 10),
(83, 46, 54, 4),
(84, 47, 29, 1),
(85, 47, 55, 5),
(86, 48, 56, 20),
(87, 48, 23, 30),
(88, 48, 55, 5),
(93, 51, 41, 3),
(98, 55, 37, 50),
(108, 62, 65, 3),
(109, 63, 66, 3),
(110, 64, 67, 2),
(111, 69, 57, 5),
(112, 66, 42, 30),
(115, 59, 37, 50),
(116, 58, 37, 50),
(118, 56, 37, 40),
(119, 56, 73, 5),
(120, 53, 73, 10),
(123, 57, 37, 50),
(124, 57, 37, 80),
(126, 60, 37, 100),
(127, 60, 37, 100),
(128, 54, 37, 40),
(129, 54, 73, 20),
(130, 49, 34, 1),
(131, 49, 23, 50),
(132, 49, 23, 20),
(133, 19, 16, 20),
(134, 19, 18, 6),
(135, 23, 20, 3),
(136, 23, 52, 50),
(137, 23, 59, 10),
(138, 30, 63, 20),
(139, 30, 62, 20),
(140, 30, 61, 20),
(141, 30, 58, 100),
(142, 31, 20, 5),
(143, 31, 21, 5),
(144, 31, 58, 80),
(145, 43, 26, 1),
(146, 43, 23, 40),
(147, 44, 23, 50),
(148, 44, 23, 30),
(155, 70, 74, 2),
(156, 70, 75, 2),
(157, 71, 75, 1),
(158, 71, 74, 1),
(161, 50, 37, 20),
(162, 52, 37, 20),
(164, 1, 3, 10),
(168, 2, 2, 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite_summary`
--

CREATE TABLE IF NOT EXISTS `activity_requisite_summary` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `activity_requisite_id` int(10) unsigned NOT NULL,
  `times` int(10) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1674 ;

--
-- Extraindo dados da tabela `activity_requisite_summary`
--

INSERT INTO `activity_requisite_summary` (`id`, `badge_id`, `player_id`, `activity_requisite_id`, `times`, `player_id_owner`) VALUES
(1489, 55, 1, 98, 130, 6),
(1490, 57, 1, 123, 130, 6),
(1491, 59, 1, 115, 27, 6),
(1492, 60, 1, 127, 27, 6),
(1493, 11, 1, 34, 2, 6),
(1494, 55, 2, 98, 13, 6),
(1495, 57, 2, 123, 13, 6),
(1496, 59, 2, 115, 2, 6),
(1497, 60, 2, 127, 2, 6),
(1498, 11, 2, 34, 2, 6),
(1499, 1, 4, 164, 1, 6),
(1500, 32, 4, 64, 6, 6),
(1501, 48, 4, 87, 6, 6),
(1502, 49, 4, 131, 6, 6),
(1503, 43, 4, 146, 6, 6),
(1504, 44, 4, 147, 6, 6),
(1505, 55, 4, 98, 72, 6),
(1506, 57, 4, 123, 72, 6),
(1507, 59, 4, 115, 21, 6),
(1508, 60, 4, 127, 21, 6),
(1509, 66, 4, 112, 9, 6),
(1510, 14, 5, 37, 1, 6),
(1511, 15, 5, 39, 1, 6),
(1512, 17, 5, 41, 1, 6),
(1513, 19, 5, 133, 1, 6),
(1514, 54, 1, 128, 18, 6),
(1515, 52, 1, 162, 18, 6),
(1516, 21, 4, 46, 13, 6),
(1517, 23, 4, 136, 13, 6),
(1518, 21, 1, 46, 18, 6),
(1519, 23, 1, 136, 18, 6),
(1520, 16, 1, 40, 22, 6),
(1521, 32, 3, 64, 26, 6),
(1522, 48, 3, 87, 26, 6),
(1523, 49, 3, 131, 26, 6),
(1524, 43, 3, 146, 26, 6),
(1525, 44, 3, 147, 26, 6),
(1526, 11, 3, 34, 10, 6),
(1527, 32, 5, 64, 63, 6),
(1528, 48, 5, 87, 63, 6),
(1529, 49, 5, 131, 63, 6),
(1530, 43, 5, 146, 63, 6),
(1531, 44, 5, 147, 63, 6),
(1532, 55, 5, 98, 78, 6),
(1533, 57, 5, 123, 78, 6),
(1534, 21, 5, 46, 18, 6),
(1535, 23, 5, 136, 18, 6),
(1536, 21, 2, 46, 19, 6),
(1537, 23, 2, 136, 19, 6),
(1538, 11, 5, 34, 11, 6),
(1539, 16, 2, 40, 13, 6),
(1540, 47, 5, 85, 1, 6),
(1541, 48, 5, 88, 1, 6),
(1542, 41, 3, 74, 1, 6),
(1543, 46, 3, 82, 1, 6),
(1544, 48, 3, 86, 1, 6),
(1545, 66, 1, 112, 30, 6),
(1546, 66, 2, 112, 3, 6),
(1547, 54, 2, 128, 1, 6),
(1548, 52, 2, 162, 1, 6),
(1549, 12, 4, 35, 5, 6),
(1550, 37, 5, 67, 1, 6),
(1551, 45, 5, 81, 1, 6),
(1552, 16, 5, 40, 6, 6),
(1553, 16, 3, 40, 17, 6),
(1554, 55, 3, 98, 63, 6),
(1555, 58, 3, 116, 14, 6),
(1556, 57, 3, 123, 63, 6),
(1557, 60, 3, 126, 14, 6),
(1558, 21, 3, 46, 16, 6),
(1559, 23, 3, 136, 16, 6),
(1560, 12, 5, 35, 2, 6),
(1561, 58, 5, 116, 16, 6),
(1562, 60, 5, 126, 16, 6),
(1563, 9, 5, 31, 3, 6),
(1564, 41, 1, 74, 3, 6),
(1565, 46, 1, 82, 3, 6),
(1566, 48, 1, 86, 3, 6),
(1567, 32, 1, 64, 11, 6),
(1568, 48, 1, 87, 11, 6),
(1569, 49, 1, 131, 11, 6),
(1570, 43, 1, 146, 11, 6),
(1571, 44, 1, 147, 11, 6),
(1572, 49, 1, 132, 3, 6),
(1573, 44, 1, 148, 3, 6),
(1574, 9, 3, 31, 2, 6),
(1575, 32, 2, 64, 6, 6),
(1576, 48, 2, 87, 6, 6),
(1577, 49, 2, 131, 6, 6),
(1578, 43, 2, 146, 6, 6),
(1579, 44, 2, 147, 6, 6),
(1580, 49, 2, 132, 3, 6),
(1581, 44, 2, 148, 3, 6),
(1582, 8, 4, 30, 10, 6),
(1583, 41, 4, 74, 1, 6),
(1584, 46, 4, 82, 1, 6),
(1585, 48, 4, 86, 1, 6),
(1586, 54, 4, 128, 5, 6),
(1587, 52, 4, 162, 5, 6),
(1588, 5, 1, 28, 3, 6),
(1589, 66, 5, 112, 29, 6),
(1590, 59, 5, 115, 18, 6),
(1591, 60, 5, 127, 18, 6),
(1592, 59, 3, 115, 15, 6),
(1593, 60, 3, 127, 15, 6),
(1594, 13, 1, 36, 3, 6),
(1595, 15, 1, 38, 3, 6),
(1596, 58, 4, 116, 17, 6),
(1597, 60, 4, 126, 17, 6),
(1598, 49, 5, 132, 19, 6),
(1599, 44, 5, 148, 19, 6),
(1600, 58, 1, 116, 31, 6),
(1601, 60, 1, 126, 31, 6),
(1602, 41, 5, 74, 9, 6),
(1603, 46, 5, 82, 9, 6),
(1604, 48, 5, 86, 9, 6),
(1605, 29, 1, 56, 30, 6),
(1606, 30, 1, 141, 30, 6),
(1607, 31, 1, 144, 30, 6),
(1608, 29, 3, 56, 28, 6),
(1609, 30, 3, 141, 28, 6),
(1610, 31, 3, 144, 28, 6),
(1611, 69, 1, 111, 1, 6),
(1612, 58, 2, 116, 4, 6),
(1613, 60, 2, 126, 4, 6),
(1614, 66, 3, 112, 29, 6),
(1615, 26, 2, 54, 3, 6),
(1616, 30, 2, 139, 3, 6),
(1617, 11, 4, 34, 2, 6),
(1618, 8, 5, 30, 1, 6),
(1619, 28, 5, 55, 5, 6),
(1620, 30, 5, 140, 5, 6),
(1621, 26, 1, 54, 3, 6),
(1622, 30, 1, 139, 3, 6),
(1623, 26, 5, 54, 1, 6),
(1624, 30, 5, 139, 1, 6),
(1625, 6, 1, 29, 5, 6),
(1626, 28, 1, 55, 9, 6),
(1627, 30, 1, 140, 9, 6),
(1628, 49, 4, 132, 1, 6),
(1629, 44, 4, 148, 1, 6),
(1630, 17, 1, 41, 3, 6),
(1631, 19, 1, 133, 3, 6),
(1632, 54, 3, 128, 8, 6),
(1633, 52, 3, 162, 8, 6),
(1634, 26, 3, 54, 1, 6),
(1635, 30, 3, 139, 1, 6),
(1636, 16, 4, 40, 8, 6),
(1637, 17, 4, 41, 1, 6),
(1638, 19, 4, 133, 1, 6),
(1639, 1, 1, 164, 4, 6),
(1640, 10, 1, 33, 2, 6),
(1641, 29, 5, 56, 1, 6),
(1642, 30, 5, 141, 1, 6),
(1643, 31, 5, 144, 1, 6),
(1644, 28, 4, 55, 9, 6),
(1645, 30, 4, 140, 9, 6),
(1646, 28, 3, 55, 3, 6),
(1647, 30, 3, 140, 3, 6),
(1648, 25, 1, 52, 1, 6),
(1649, 30, 1, 138, 1, 6),
(1650, 54, 5, 128, 7, 6),
(1651, 52, 5, 162, 7, 6),
(1652, 49, 3, 132, 10, 6),
(1653, 44, 3, 148, 10, 6),
(1654, 13, 4, 36, 1, 6),
(1655, 15, 4, 38, 1, 6),
(1656, 29, 4, 56, 1, 6),
(1657, 30, 4, 141, 1, 6),
(1658, 31, 4, 144, 1, 6),
(1659, 21, 7, 46, 4, 6),
(1660, 23, 7, 136, 4, 6),
(1661, 55, 7, 98, 10, 6),
(1662, 59, 7, 115, 5, 6),
(1663, 57, 7, 123, 10, 6),
(1664, 60, 7, 127, 5, 6),
(1665, 58, 7, 116, 1, 6),
(1666, 60, 7, 126, 1, 6),
(1667, 16, 7, 40, 1, 6),
(1668, 66, 7, 112, 3, 6),
(1669, 22, 1, 47, 1, 6),
(1670, 23, 1, 137, 1, 6),
(1671, 69, 4, 111, 1, 6),
(1672, 8, 1, 30, 6, 6),
(1673, 5, 5, 28, 3, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite_tag`
--

CREATE TABLE IF NOT EXISTS `activity_requisite_tag` (
`id` int(10) unsigned NOT NULL,
  `activity_requisite_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Extraindo dados da tabela `activity_requisite_tag`
--

INSERT INTO `activity_requisite_tag` (`id`, `activity_requisite_id`, `tag_id`) VALUES
(34, 115, 14),
(35, 116, 15),
(37, 118, 19),
(38, 119, 19),
(39, 120, 20),
(42, 124, 19),
(44, 126, 15),
(45, 127, 14),
(46, 128, 20),
(47, 129, 20),
(48, 132, 18),
(49, 148, 18),
(52, 155, 22),
(53, 156, 22),
(55, 161, 18),
(56, 162, 20);

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge`
--

CREATE TABLE IF NOT EXISTS `badge` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credly_badge_id` int(10) DEFAULT NULL,
  `credly_badge_name` varchar(255) DEFAULT NULL,
  `credly_badge_image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Extraindo dados da tabela `badge`
--

INSERT INTO `badge` (`id`, `name`, `domain_id`, `new`, `icon`, `created`, `player_id_owner`, `inactive`, `credly_badge_id`, `credly_badge_name`, `credly_badge_image_url`) VALUES
(1, 'Glossarier', 1, 0, 'fa fa-book', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(2, 'Code Clarifier', 1, 0, 'fa fa-code', '0000-00-00 00:00:00', 6, 0, 22328, 'Learn 7 steps to gamify agile', 'https://credlyapp.s3.amazonaws.com/badges/2a88193f24c63b5705759efc6564c005.png'),
(5, 'Acceptance Collector', 1, 0, 'entypo entypo-docs', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(6, 'Personificator', 1, 0, 'fa fa-users', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(8, 'API Documentator', 1, 0, 'fa fa-code-fork', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(9, 'Drawer', 1, 0, 'fa fa-picture-o', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(10, 'Inquisitor', 1, 0, 'entypo entypo-target', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(11, 'Coffeeholic', 2, 0, 'fa fa-coffee', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(12, 'Gauderio', 2, 0, 'fa fa-filter', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(13, 'Spammer', 2, 0, 'fa fa-exclamation-circle', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(14, 'F1', 2, 0, 'fa fa-question', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(15, 'Information Disseminator', 2, 0, 'fa fa-info', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(16, 'Pairer', 2, 0, 'entypo entypo-users', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(17, 'Single Coach', 2, 0, 'glyphicon glyphicon-pencil', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(18, 'Panelist', 2, 0, 'entypo entypo-graduation-cap', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(19, 'Coach', 2, 0, 'entypo entypo-language', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(20, 'Librarian', 2, 0, 'entypo entypo-book', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(21, 'Grooman', 2, 0, 'fa fa-th', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(22, 'Brainstormer', 2, 0, 'entypo-cloud-thunder', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(23, 'Retrospective Leader', 2, 0, 'glyphicon glyphicon-bullhorn', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(24, 'Radiator Updater', 2, 0, 'glyphicon glyphicon-stats', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(25, 'Retrospective Adept', 2, 0, 'entypo entypo-clipboard', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(26, 'Iteration Planner', 2, 0, 'glyphicon glyphicon-refresh', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(28, 'Demonstrator', 2, 0, 'glyphicon glyphicon-phone', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(29, 'DoD Lunatic', 2, 0, 'glyphicon glyphicon-check', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(30, 'Scrum Practitioner', 2, 0, 'entypo entypo-play', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(31, 'Agile Practitioner', 2, 0, 'entypo entypo-fast-forward', '0000-00-00 00:00:00', 6, 1, NULL, NULL, NULL),
(32, 'Refactor Apprentice', 3, 0, 'entypo entypo-cog', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(36, 'Pair Refactorer', 3, 0, 'entypo entypo-users', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(37, 'JavaScript Developer', 3, 0, 'entypo entypo-code', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(38, 'HTML Builder', 3, 0, 'fa fa-html5', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(39, 'CSS Expert', 3, 0, 'fa fa-css3', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(40, 'PHP Developer', 3, 0, 'fa fa-terminal', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(41, 'RESTfull Developer', 3, 0, 'fa fa-code', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(42, 'Database Developer', 3, 0, 'entypo entypo-database', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(43, 'Java Developer', 3, 0, 'fa fa-coffee', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(44, 'Refactor Master', 3, 0, 'fa fa-cogs', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(45, 'Frontend Developer', 3, 0, 'fa fa-picture-o', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(46, 'Backend Developer', 3, 0, 'fa fa-hdd-o', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(47, 'Mobile Developer', 3, 0, 'entypo entypo-mobile', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(48, 'Web Developer', 3, 0, 'entypo entypo-globe', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(49, 'OO Programmer', 3, 0, 'fa fa-plus', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(50, 'Pair Test Professional', 4, 0, 'entypo entypo-users', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(51, 'System Tester', 4, 0, 'fa fa-spinner', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(52, 'Unit Bug Trapper', 4, 0, 'fa fa-bug', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(53, 'Integration Bug Trapper', 4, 0, 'fa fa-bug', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(54, 'Insecticide', 4, 0, 'fa fa-bug', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(55, 'Unit Tester', 4, 0, 'entypo entypo-suitcase', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(56, 'Test-Driven Developer', 4, 0, 'entypo entypo-cw', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(57, 'Unit Test-Driven', 4, 0, 'entypo entypo-briefcase', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(58, 'JUnit Tester', 4, 0, 'fa fa-coffee', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(59, 'PHPUnit Tester', 4, 0, 'fa fa-terminal', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(60, 'Test Tools Expert', 4, 0, 'fa fa-wrench', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(62, 'Build Automator', 4, 0, 'fa fa-building-o', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(63, 'Test Automator', 4, 0, 'entypo entypo-lamp', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(64, 'Automatic Deployer', 4, 0, 'entypo-light-up', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(65, 'Integrator', 4, 0, 'fa fa-tasks', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(66, 'Legacy Unit Tester', 4, 0, 'fa fa-shield', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(69, 'Test Inspector', 4, 0, 'fa fa-crosshairs', '0000-00-00 00:00:00', 6, 0, NULL, NULL, NULL),
(70, 'A badge', 5, 1, 'fa fa-rub', '2014-07-06 22:14:33', 8, 0, NULL, NULL, NULL),
(71, 'Another badge', 5, 1, 'fa fa-arrow-circle-o-right', '2014-07-06 22:15:05', 8, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_activity_progress`
--
CREATE TABLE IF NOT EXISTS `badge_activity_progress` (
`player_id` int(10) unsigned
,`badge_id` int(10) unsigned
,`activity_requisite_id` int(10) unsigned
,`activity_id` int(10) unsigned
,`activities_completed` decimal(32,0)
,`activities_required` decimal(5,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_claimed`
--
CREATE TABLE IF NOT EXISTS `badge_claimed` (
`player_id` int(10) unsigned
,`badge_id` int(10) unsigned
,`claimed` int(1)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_log`
--

CREATE TABLE IF NOT EXISTS `badge_log` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `domain_id` int(10) unsigned NOT NULL,
  `credly_given` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `badge_log`
--

INSERT INTO `badge_log` (`id`, `badge_id`, `player_id`, `creation`, `domain_id`, `credly_given`) VALUES
(1, 6, 1, '2014-03-19 17:33:24', 1, 0),
(2, 32, 5, '2014-04-29 19:31:56', 3, 0),
(3, 50, 5, '2014-05-05 18:02:27', 4, 0),
(4, 50, 1, '2014-05-19 10:34:48', 4, 0),
(5, 50, 3, '2014-05-22 13:16:57', 4, 0),
(6, 2, 1, '0000-00-00 00:00:00', 1, 1),
(7, 55, 1, '0000-00-00 00:00:00', 4, 0),
(8, 60, 1, '0000-00-00 00:00:00', 4, 0),
(9, 29, 1, '0000-00-00 00:00:00', 2, 0),
(10, 66, 1, '0000-00-00 00:00:00', 4, 0),
(11, 2, 4, '0000-00-00 00:00:00', 1, 0),
(14, 70, 9, '2014-07-06 22:41:15', 5, 0),
(15, 71, 9, '2014-07-06 22:42:38', 5, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_requisite`
--

CREATE TABLE IF NOT EXISTS `badge_requisite` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `badge_id_requisite` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

--
-- Extraindo dados da tabela `badge_requisite`
--

INSERT INTO `badge_requisite` (`id`, `badge_id`, `badge_id_requisite`) VALUES
(42, 15, 13),
(43, 15, 14),
(57, 45, 38),
(58, 45, 39),
(59, 45, 37),
(60, 46, 41),
(61, 46, 40),
(62, 47, 43),
(63, 47, 42),
(64, 48, 45),
(65, 48, 46),
(72, 65, 62),
(73, 65, 63),
(74, 65, 64),
(77, 57, 55),
(78, 57, 56),
(79, 54, 52),
(80, 54, 53),
(81, 49, 47),
(82, 49, 44),
(83, 19, 19),
(84, 19, 18),
(85, 23, 21),
(86, 23, 22),
(87, 30, 25),
(88, 30, 26),
(89, 30, 28),
(90, 30, 29),
(91, 31, 23),
(92, 31, 24),
(93, 31, 30),
(94, 44, 32),
(95, 44, 36),
(97, 71, 70);

-- --------------------------------------------------------

--
-- Stand-in structure for view `calendar_log`
--
CREATE TABLE IF NOT EXISTS `calendar_log` (
`coins` bigint(21)
,`player_id` int(10) unsigned
,`acquired` date
,`domain_id` int(10) unsigned
,`activity_id` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
`id` int(10) unsigned NOT NULL,
  `key` varchar(30) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `different_activities_completed`
--
CREATE TABLE IF NOT EXISTS `different_activities_completed` (
`different_activities_completed` bigint(21)
,`domain_id` int(10) unsigned
,`domain_name` varchar(30)
,`player_id` int(10) unsigned
,`player_name` varchar(30)
,`player_id_owner` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `color` char(7) NOT NULL,
  `abbr` char(3) NOT NULL,
  `description` varchar(200) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `player_type_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `domain`
--

INSERT INTO `domain` (`id`, `name`, `color`, `abbr`, `description`, `icon`, `player_type_id`, `created`, `player_id_owner`, `inactive`) VALUES
(1, 'Documentation', '#0083b7', 'DOC', 'Documentation should be barely sufficient. But it is still important.', 'entypo entypo-doc-text', 1, '0000-00-00 00:00:00', 6, 0),
(2, 'Collaboration', '#00a45a', 'COL', 'Scrum, XP, Pair Programming, Coffee and more.', 'glyphicon glyphicon-link', 1, '0000-00-00 00:00:00', 6, 0),
(3, 'Software Engineering', '#701c1c', 'ENG', 'Programming Languages, Frameworks and Technologies.', 'fa fa-cogs', 1, '0000-00-00 00:00:00', 6, 0),
(4, 'Testing', '#f89d00', 'TST', 'Test-Driven Development and Continuous Integration.', 'entypo entypo-tools', 1, '0000-00-00 00:00:00', 6, 0),
(5, 'My crazy domain', '#FF8899', 'GAG', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ', 'fa fa-toggle-left', 1, '2014-07-06 21:51:32', 8, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `domain_activities_count`
--
CREATE TABLE IF NOT EXISTS `domain_activities_count` (
`domain_id` int(10) unsigned
,`player_id_owner` int(10) unsigned
,`count` bigint(21)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`id` int(10) unsigned NOT NULL,
  `event_type_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `xp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_activity`
--

CREATE TABLE IF NOT EXISTS `event_activity` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_activity_progress`
--
CREATE TABLE IF NOT EXISTS `event_activity_progress` (
`player_id` int(10) unsigned
,`event_id` int(1) unsigned
,`activity_id` int(10) unsigned
,`times_obtained` bigint(21)
,`times_required` smallint(5) unsigned
,`progress` decimal(16,0)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `event_complete_log`
--

CREATE TABLE IF NOT EXISTS `event_complete_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_join_log`
--

CREATE TABLE IF NOT EXISTS `event_join_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_task`
--

CREATE TABLE IF NOT EXISTS `event_task` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `xp` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_task_log`
--

CREATE TABLE IF NOT EXISTS `event_task_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `event_task_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `level_required` smallint(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `event_type`
--

INSERT INTO `event_type` (`id`, `name`, `level_required`) VALUES
(1, 'Mission', 10),
(2, 'Challenge', 20);

-- --------------------------------------------------------

--
-- Stand-in structure for view `last_week_logs`
--
CREATE TABLE IF NOT EXISTS `last_week_logs` (
`activity_id` int(10) unsigned
,`logs` varbinary(153)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id` int(10) unsigned NOT NULL,
  `acquired` date NOT NULL,
  `reviewed` timestamp NULL DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `event_id` int(1) unsigned DEFAULT NULL,
  `player_id_owner` int(10) unsigned NOT NULL,
  `player_id_pair` int(10) unsigned DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `rejected` timestamp NULL DEFAULT NULL,
  `acceptance_votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rejection_votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hash` char(64) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1500 ;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(1, 2, '2014-01-21 08:32:01', 1, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(2, 37, '2014-01-21 08:32:01', 1, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(3, 37, '2014-01-21 08:32:02', 1, '2014-01-20', '2014-03-11 23:49:23', '', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(4, 40, '2014-01-21 08:32:03', 1, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(5, 43, '2014-01-21 08:32:03', 1, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(7, 10, '2014-01-21 08:42:47', 1, '2014-01-20', '2014-03-11 23:49:23', '', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(8, 17, '2014-01-21 08:42:48', 1, '2014-01-20', '2014-03-11 23:49:23', '', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(9, 2, '2014-01-21 08:43:03', 2, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(10, 37, '2014-01-21 08:43:03', 2, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(11, 37, '2014-01-21 08:43:04', 2, '2014-01-20', '2014-03-11 23:49:23', '', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(12, 40, '2014-01-21 08:43:04', 2, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(13, 43, '2014-01-21 08:43:04', 2, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(14, 10, '2014-01-21 08:43:05', 2, '2014-01-20', '2014-03-11 23:49:23', '', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(15, 17, '2014-01-21 08:43:13', 2, '2014-01-20', '2014-03-11 23:49:23', '', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(16, 2, '2014-01-21 08:43:54', 3, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(17, 2, '2014-01-21 08:43:55', 3, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(18, 2, '2014-01-21 08:43:56', 3, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(20, 2, '2014-01-21 08:45:08', 4, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(22, 2, '2014-01-21 08:45:13', 4, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(23, 3, '2014-01-21 08:45:44', 4, '2014-01-20', '2014-03-11 23:49:23', '', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(24, 23, '2014-01-21 08:45:44', 4, '2014-01-20', '2014-03-11 23:49:23', '', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(25, 37, '2014-01-21 08:45:45', 4, '2014-01-20', '2014-03-11 23:49:23', '', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(26, 37, '2014-01-21 08:45:45', 4, '2014-01-20', '2014-03-11 23:49:23', '', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(27, 42, '2014-01-21 08:45:46', 4, '2014-01-20', '2014-03-11 23:49:23', '', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(28, 19, '2014-01-21 08:46:34', 5, '2014-01-20', '2014-03-11 23:49:23', '', 2, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(29, 16, '2014-01-21 08:46:35', 5, '2014-01-20', '2014-03-11 23:49:23', '', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(30, 2, '2014-01-21 08:46:35', 5, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(31, 2, '2014-01-21 08:46:36', 5, '2014-01-20', '2014-03-11 23:49:23', '', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(34, 37, '2014-01-21 17:20:42', 1, '2014-01-21', '2014-03-11 23:49:23', 'Criei a classe public function testRandomEticket() pra testar se o eticket tava mesmo sendo consumido randomicamente.', 4, 25, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(35, 14, '2014-01-21 17:21:09', 1, '2014-01-21', '2014-03-11 23:49:23', 'Troquei a bombona de água à tarde!', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(36, 52, '2014-01-22 07:09:49', 4, '2014-01-21', '2014-03-11 23:49:23', 'WS - User Story''s : Quitar Irregularidade e Cancelar Compra no WS', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(37, 2, '2014-01-22 07:10:42', 4, '2014-01-21', '2014-03-11 23:49:23', 'WS - Quitação Irregularidade', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(38, 2, '2014-01-22 07:11:05', 4, '2014-01-21', '2014-03-11 23:49:23', 'WS - Test Quitação Irregularidade', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(39, 37, '2014-01-22 07:11:27', 4, '2014-01-21', '2014-03-11 23:49:23', 'WS - Test Quitação Irregularidade', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(40, 37, '2014-01-22 07:11:40', 1, '2014-01-21', '2014-03-11 23:49:23', 'WS - Test Quitação Irregularidade', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(41, 37, '2014-01-22 07:19:23', 4, '2014-01-20', '2014-03-11 23:49:23', 'WS - Test Emissão Irregularidade', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(42, 52, '2014-01-22 07:27:07', 1, '2014-01-22', '2014-03-11 23:49:23', 'Estimativa de tarefas em 21/01/2014', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(43, 15, '2014-01-22 07:27:23', 1, '2014-01-22', '2014-03-11 23:49:23', 'Programação em par com Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(44, 23, '2014-01-22 07:30:19', 3, '2014-01-22', '2014-03-11 23:49:23', 'Criado um adapter para MainActivity.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(45, 17, '2014-01-22 16:54:39', 3, '2014-01-22', '2014-03-11 23:49:23', 'Feito um café muito saboroso, que foi aprovado por todos os colaboradores do setor de desenvolvimento.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(46, 23, '2014-01-22 16:54:51', 5, '2014-01-21', '2014-03-11 23:49:23', 'APIManager', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(47, 37, '2014-01-22 16:55:39', 5, '2014-01-21', '2014-03-11 23:49:23', 'VehicleListActivityUnitTest', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(48, 43, '2014-01-22 16:56:08', 5, '2014-01-21', '2014-03-11 23:49:23', 'André', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(49, 52, '2014-01-22 16:56:33', 5, '2014-01-21', '2014-03-11 23:49:23', '8', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(50, 52, '2014-01-22 16:57:06', 2, '2014-01-21', '2014-03-11 23:49:23', 'Participei da estimativa de duas tarefas.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(51, 2, '2014-01-22 16:57:24', 5, '2014-01-21', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(52, 23, '2014-01-22 16:58:41', 5, '2014-01-22', '2014-03-11 23:49:23', 'VehicleListActivity', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(53, 17, '2014-01-22 17:01:03', 5, '2014-01-21', '2014-03-11 23:49:23', 'aprovado', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(54, 15, '2014-01-23 06:55:45', 1, '2014-01-22', '2014-03-11 23:49:23', 'Passei o dia programando com o Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(55, 15, '2014-01-23 06:56:04', 2, '2014-01-22', '2014-03-11 23:49:23', 'Passei o dia programando com o André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(56, 2, '2014-01-23 06:59:30', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test Pagamento Quitação de Irregularidade', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(57, 15, '2014-01-23 06:59:49', 2, '2014-01-21', '2014-03-11 23:49:23', 'Passei o dia programando com o André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(58, 1, '2014-01-23 06:59:55', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test Classe de Pagamento', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(59, 1, '2014-01-23 07:00:27', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Cancelamento de Compra de Período', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(60, 37, '2014-01-23 07:00:51', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test Pagamento Quitação de Irregularidade', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(61, 37, '2014-01-23 07:01:24', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test da Classe de Pagamento', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(62, 37, '2014-01-23 07:02:02', 4, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test Pagamento Quitação de Irregularidade', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(63, 37, '2014-01-23 07:02:22', 1, '2014-01-22', '2014-03-11 23:49:23', 'WS - Test Classe de Pagamento ', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(64, 55, '2014-01-23 14:06:41', 5, '2014-01-23', '2014-03-11 23:49:23', 'Android services & content providers', 3, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(65, 56, '2014-01-23 16:55:14', 3, '2014-01-23', '2014-03-11 23:49:23', 'Criado annotation Field para automatizar e agilizar o desenvolvimento das activities.', 3, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(66, 15, '2014-01-23 16:59:22', 2, '2014-01-23', '2014-03-11 23:49:23', 'Pareei com o André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(67, 15, '2014-01-23 16:59:32', 1, '2014-01-23', '2014-03-11 23:49:23', 'Pareei com o Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(68, 14, '2014-01-23 17:00:36', 1, '2014-01-23', '2014-03-11 23:49:23', 'Troquei a água à tarde.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(69, 17, '2014-01-23 17:00:43', 5, '2014-01-23', '2014-03-11 23:49:23', 'foo', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(70, 2, '2014-01-24 06:55:43', 4, '2014-01-23', '2014-03-11 23:49:23', 'WS - Test Cancelamento de Periodo', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(71, 23, '2014-01-24 06:56:06', 4, '2014-01-23', '2014-03-11 23:49:23', 'WS - Todas as classes', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(72, 37, '2014-01-24 06:56:30', 4, '2014-01-23', '2014-03-11 23:49:23', 'WS - Test Cancelamento de Período', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(73, 37, '2014-01-24 06:56:53', 4, '2014-01-23', '2014-03-11 23:49:23', 'WS - Test Cancelamento de Período', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(74, 37, '2014-01-27 07:40:21', 1, '2014-01-27', '2014-03-11 23:49:23', 'Criei teste para verificar por que a emissão de irregularidade no WS não estava salvando id de marca, modelo e cor = test_ValidarDadosBanco().', 4, 25, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(75, 14, '2014-01-27 07:40:39', 1, '2014-01-27', '2014-03-11 23:49:23', 'Troquei a bombona de água hoje pela manhã!', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(76, 42, '2014-01-27 07:41:35', 1, '2014-01-27', '2014-03-11 23:49:23', 'Criei novo método para pegar bug em NotifyIrregularitiesControllerTest.php', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(77, 42, '2014-01-27 07:42:44', 2, '2014-01-27', '2014-03-11 23:49:23', 'Criei teste test_ValidarDadosBanco() junto com André.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(78, 37, '2014-01-27 07:43:06', 2, '2014-01-27', '2014-03-11 23:49:23', 'Criei teste para pegar bug antes de corrigir junto com André (test_ValidarDadosBanco())', 4, 25, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(79, 12, '2014-01-27 08:01:34', 4, '2014-01-24', '2014-03-11 23:49:23', 'Efetuado chimarrão na parte da tarde.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(80, 23, '2014-01-27 08:02:01', 4, '2014-01-24', '2014-03-11 23:49:23', 'Refatoração em algumas partes de testes.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(81, 37, '2014-01-27 08:02:42', 4, '2014-01-24', '2014-03-11 23:49:23', 'Melhorado testes pois foram feitas refatorações.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(82, 35, '2014-01-27 08:32:46', 5, '2014-01-27', '2014-03-11 23:49:23', 'https://github.com/vinik/loopmd5\r\n\r\nMódulo para o nodejs que faz md5 de uma palavra em um loop por x vezes conforme parâmetros da url', 3, 50, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(83, 52, '2014-01-27 12:58:25', 1, '2014-01-27', '2014-03-11 23:49:23', 'Participei de estimativa de user story hoje pela manhã.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(84, 15, '2014-01-28 06:57:13', 5, '2014-01-27', '2014-03-11 23:49:23', 'c/Diego', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(85, 37, '2014-01-28 06:59:04', 5, '2014-01-27', '2014-03-11 23:49:23', 'SectorListActivity', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(86, 37, '2014-01-28 06:59:34', 5, '2014-01-27', '2014-03-11 23:49:23', 'VehicleListActivity', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(87, 43, '2014-01-28 06:59:51', 5, '2014-01-27', '2014-03-11 23:49:23', 'Diego', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(88, 2, '2014-01-28 07:03:34', 4, '2014-01-27', '2014-03-11 23:49:23', 'Todas classes da API', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(89, 23, '2014-01-28 07:03:55', 4, '2014-01-27', '2014-03-11 23:49:23', 'Todas classes da API', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(90, 37, '2014-01-28 07:04:16', 4, '2014-01-27', '2014-03-11 23:49:23', 'Todas classes de teste da API', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(91, 37, '2014-01-28 07:04:28', 4, '2014-01-27', '2014-03-11 23:49:23', 'Todas classes de teste da API', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(92, 15, '2014-01-28 07:19:27', 1, '2014-01-27', '2014-03-11 23:49:23', 'Pareei com o Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(93, 15, '2014-01-28 07:19:46', 2, '2014-01-27', '2014-03-11 23:49:23', 'Pareei com o André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(94, 15, '2014-01-28 08:54:57', 3, '2014-01-27', '2014-03-11 23:49:23', 'Vinicius', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(95, 37, '2014-01-28 08:55:40', 3, '2014-01-27', '2014-03-11 23:49:23', 'Testes', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(96, 43, '2014-01-28 08:56:03', 3, '2014-01-27', '2014-03-11 23:49:23', 'Vinicius', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(97, 52, '2014-01-28 08:58:47', 3, '2014-01-27', '2014-03-11 23:49:23', 'Atualizar as configurações...', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(98, 52, '2014-01-28 08:59:34', 2, '2014-01-27', '2014-03-11 23:49:23', 'Estimativa de US com o grupo.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(99, 12, '2014-01-28 13:31:37', 5, '2014-01-27', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(100, 17, '2014-01-28 13:31:49', 5, '2014-01-28', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(101, 52, '2014-01-28 13:32:50', 5, '2014-01-27', '2014-03-11 23:49:23', 'Atualização marca modelo cor', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(102, 23, '2014-01-28 16:56:33', 5, '2014-01-28', '2014-03-11 23:49:23', 'Login App', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(103, 37, '2014-01-28 16:57:03', 5, '2014-01-28', '2014-03-11 23:49:23', 'VehicleOperation', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(104, 37, '2014-01-28 16:57:56', 5, '2014-01-28', '2014-03-11 23:49:23', 'VehicleList', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(105, 43, '2014-01-28 16:58:23', 1, '2014-01-28', '2014-03-11 23:49:23', 'Diego', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(106, 7, '2014-01-28 16:58:58', 5, '2014-01-28', '2014-03-11 23:49:23', 'Doc wordpress app', 1, 50, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(108, 15, '2014-01-29 06:49:46', 1, '2014-01-28', '2014-03-11 23:49:23', 'Pareei com o Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(109, 14, '2014-01-29 06:50:00', 1, '2014-01-28', '2014-03-11 23:49:23', 'Troquei a água hoje ao chegar.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(110, 56, '2014-01-29 06:53:57', 1, '2014-01-28', '2014-03-11 23:49:23', 'Criei os métodos tableize() e humanize() no Utils do App para converter linguagem humana em enum e vice-versa.', 3, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(111, 15, '2014-01-29 06:55:04', 3, '2014-01-28', '2014-03-11 23:49:23', 'Desenvolvimento junto com o Vinícius.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(112, 23, '2014-01-29 06:55:29', 1, '2014-01-28', '2014-03-11 23:49:23', 'Alteramos o código da emissão de notificação para usar o map "bidirecional" em lugar de iterar por todos os itens para buscar uma chave.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(113, 23, '2014-01-29 06:55:57', 1, '2014-01-28', '2014-03-11 23:49:23', 'Alteramos a notificação de irregularidade para usar o map bidirecional.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(114, 1, '2014-01-29 06:56:33', 3, '2014-01-28', '2014-03-11 23:49:23', 'Iniciado a documentação do projeto s2ParkingAndroid.\r\nlink: http://doc.prepagointeligente.com.br/?page_id=1254', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(115, 56, '2014-01-29 06:57:07', 1, '2014-01-28', '2014-03-11 23:49:23', 'Criada classe BiDiHashMap, que permite a busca de valores pela chave e chaves pelo valor.', 3, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(116, 37, '2014-01-29 07:04:22', 5, '2014-01-28', '2014-03-11 23:49:23', 'Vehicle Operation', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(117, 37, '2014-01-29 07:04:41', 5, '2014-01-28', '2014-03-11 23:49:23', 'VehicleList', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(118, 12, '2014-01-29 07:10:41', 4, '2014-01-28', '2014-03-11 23:49:23', 'Chimarrão feito na parte da tarde.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(119, 37, '2014-01-29 08:20:06', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado teste da compra de período.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(120, 37, '2014-01-29 08:20:19', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado teste da compra de período.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(121, 7, '2014-01-29 12:40:04', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado a documentação sobre como adicionar um veículo no app.\r\n\r\nhttp://doc.prepagointeligente.com.br/?page_id=1254', 1, 50, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(122, 1, '2014-01-29 12:45:20', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado documentação sobre adição do veículo.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(123, 17, '2014-01-29 13:00:00', 3, '2014-01-29', '2014-03-11 23:49:23', 'Feito café de manhã.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(125, 7, '2014-01-29 13:39:47', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado documentação da compra de período.\r\nhttp://doc.prepagointeligente.com.br/?page_id=1254', 1, 50, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(126, 1, '2014-01-29 13:40:37', 3, '2014-01-29', '2014-03-11 23:49:23', 'Criado documentação da compra de período.\r\nhttp://doc.prepagointeligente.com.br/?page_id=1254', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(127, 15, '2014-01-29 13:44:26', 2, '2014-01-28', '2014-03-11 23:49:23', 'All-day Pair com o André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(128, 43, '2014-01-29 13:44:50', 2, '2014-01-28', '2014-03-11 23:49:23', 'Pair Testing com o André.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(129, 23, '2014-01-29 13:45:35', 2, '2014-01-28', '2014-03-11 23:49:23', 'Refactor com o André.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(130, 23, '2014-01-29 13:46:15', 2, '2014-01-28', '2014-03-11 23:49:23', 'Pair Refactoring com o André.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(131, 37, '2014-01-29 17:27:44', 1, '2014-01-29', '2014-03-11 23:49:23', 'Criados testes para a classe ConfigurationsController da API.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(132, 40, '2014-01-29 17:28:16', 1, '2014-01-29', '2014-03-11 23:49:23', 'Os testes em ConfigurationsControllerTest foram criados usando TDD.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(133, 37, '2014-01-29 17:28:41', 1, '2014-01-29', '2014-03-11 23:49:23', 'Criados testes em ConfigurationsControllerTest.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(134, 2, '2014-01-29 17:29:25', 1, '2014-01-29', '2014-03-11 23:49:23', 'Código documentado em ConfigurationsController (API).', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(135, 4, '2014-01-30 10:07:15', 4, '2014-01-29', '2014-03-11 23:49:23', 'Página principal da API', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(136, 9, '2014-01-30 10:07:43', 4, '2014-01-29', '2014-03-11 23:49:23', 'Comando Autorização', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(137, 56, '2014-01-30 10:07:58', 4, '2014-01-29', '2014-03-11 23:49:23', 'Criado diversos métodos na ''PrivateApiAppController''', 3, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(138, 37, '2014-01-30 10:08:17', 4, '2014-01-29', '2014-03-11 23:49:23', 'WS - CancelPurchase - Atualização situação para cancelado', 4, 25, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(139, 37, '2014-01-30 10:08:33', 4, '2014-01-29', '2014-03-11 23:49:23', 'WS - Payment PeriodPurchase - A compra não estava inserindo os campos ''servico_id_origem'' e ''operador_id_origem''', 4, 25, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(140, 17, '2014-01-30 11:45:19', 5, '2014-01-29', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(141, 17, '2014-01-30 14:41:54', 3, '2014-01-30', '2014-03-11 23:49:23', 'Feito café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(142, 14, '2014-01-30 18:12:31', 2, '2014-01-30', '2014-03-11 23:49:23', 'Troca da bombona d''água.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(143, 1, '2014-01-31 09:07:32', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe Autorização', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(144, 1, '2014-01-31 09:07:52', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe Cancelamento de Compra', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(145, 1, '2014-01-31 09:09:13', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Compra de Período', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(146, 1, '2014-01-31 09:09:27', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Fechamento de Caixa', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(147, 1, '2014-01-31 09:09:47', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Notificação de Irregularidade', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(148, 1, '2014-01-31 09:10:27', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Quitação de Irregularidade', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(149, 1, '2014-01-31 09:10:41', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Vagas', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(150, 1, '2014-01-31 09:10:53', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Veiculos', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(151, 1, '2014-01-31 09:11:03', 4, '2014-01-30', '2014-03-11 23:49:23', 'Classe de Pagamentos', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(152, 9, '2014-01-31 09:11:34', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller Autorização', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(153, 9, '2014-01-31 09:11:50', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller Cancelamento de Compra', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(154, 9, '2014-01-31 09:12:07', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller Compra de Período', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(155, 9, '2014-01-31 09:12:22', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller Fechamento de Caixa', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(157, 9, '2014-01-31 09:12:53', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller de Notificação de Irregularidade', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(158, 9, '2014-01-31 09:13:06', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller De Quitação de Irregularidade', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(159, 9, '2014-01-31 09:13:20', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller de Vagas', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(160, 9, '2014-01-31 09:13:30', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller de Veículos', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(161, 9, '2014-01-31 09:13:40', 4, '2014-01-30', '2014-03-11 23:49:23', 'Controller de Pagamentos', 1, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(162, 12, '2014-01-31 09:14:33', 4, '2014-01-30', '2014-03-11 23:49:23', 'Feito chimarrão na parte da tarde', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(163, 42, '2014-01-31 09:14:59', 4, '2014-01-31', '2014-03-11 23:49:23', 'WS - Irregularidades em centavos', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(164, 37, '2014-01-31 09:15:17', 4, '2014-01-30', '2014-03-11 23:49:23', 'WS - Irregularidades em centavos', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(165, 52, '2014-01-31 13:55:10', 5, '2014-01-31', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(166, 11, '2014-01-31 13:58:50', 1, '2014-01-31', '2014-03-11 23:49:23', 'Participei de estimativa de USs.', 1, 40, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(167, 52, '2014-02-03 07:21:13', 1, '2014-01-31', '2014-03-11 23:49:23', 'Participei de estimativa de USs na sexta.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(168, 2, '2014-02-03 07:39:01', 2, '2014-02-03', '2014-03-11 23:49:23', 'Documentação do código fonte da activity ListIrregularitiesActivity.java.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(169, 2, '2014-02-03 07:39:43', 2, '2014-02-03', '2014-03-11 23:49:23', 'Documentação do código fonte da activity SettleIrregularityActivity.java', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(170, 42, '2014-02-03 12:44:16', 1, '2014-02-03', '2014-03-11 23:49:23', 'Adicionei o método testAddVehicleWithAutomaticDebit() na class VehiclesControllerTest.php para testar o retorno do débito automático que foi incluído na VechiclesController.php.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(171, 37, '2014-02-03 12:44:38', 1, '2014-02-03', '2014-03-11 23:49:23', 'Adicionei o método testAddVehicleWithAutomaticDebit() na class VehiclesControllerTest.php.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(172, 52, '2014-02-04 07:10:59', 2, '2014-02-04', '2014-03-11 23:49:23', 'Estimativa das User Stories do sprint 23.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(173, 1, '2014-02-04 14:01:27', 2, '2014-02-04', '2014-03-11 23:49:23', 'Documentação no WordPress da UserStory de Quitação de irregularidades APP do sprint 22.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(174, 1, '2014-02-04 14:02:33', 2, '2014-02-04', '2014-03-11 23:49:23', 'Documentação no WordPress da User Story Reimpressão APP Android do sprint 23.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(175, 14, '2014-02-04 14:27:14', 2, '2014-02-04', '2014-03-11 23:49:23', 'Troca da bombona d''água.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(176, 23, '2014-02-04 17:01:57', 1, '2014-02-04', '2014-03-11 23:49:23', 'Removi a concatenação do layout dos recibos para uma classe separada.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(177, 2, '2014-02-04 17:02:30', 1, '2014-02-04', '2014-03-11 23:49:23', 'Documentei o código da classe ParkingReceipts do App.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(178, 52, '2014-02-05 13:08:34', 4, '2014-02-03', '2014-03-11 23:49:23', 'Planning Poker do Spring 23', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(179, 2, '2014-02-05 13:09:10', 4, '2014-02-04', '2014-03-11 23:49:23', 'APP - ExternalTicketActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(180, 2, '2014-02-05 15:37:52', 4, '2014-02-05', '2014-03-11 23:49:23', 'DataBase Park_cash_closing', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(181, 37, '2014-02-05 15:38:05', 4, '2014-02-05', '2014-03-11 23:49:23', 'DataBase park_cash_closing\r\n', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(182, 37, '2014-02-05 15:38:23', 4, '2014-02-05', '2014-03-11 23:49:23', 'DataBase park_cash_closing', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(183, 23, '2014-02-05 15:38:46', 4, '2014-02-05', '2014-03-11 23:49:23', 'Recibo de fechamento de caixa para receber novos valores passado pela procedure', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(184, 42, '2014-02-06 14:56:41', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitorControllerTest.php', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(185, 2, '2014-02-06 14:57:18', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitorControllerTest.php', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(186, 37, '2014-02-06 15:04:19', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitorControllerTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(187, 4, '2014-02-06 15:12:14', 5, '2014-02-06', '2014-03-11 23:49:23', 'Monitoramento de vagas', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(188, 38, '2014-02-06 16:36:52', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitoramentoVagasControllerTest.php', 4, 15, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(189, 2, '2014-02-06 16:37:11', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitoramentoVagasControllerTest.php', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(190, 37, '2014-02-06 16:44:53', 5, '2014-02-06', '2014-03-11 23:49:23', 'MonitoramentoVagasControllerTest.php', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(191, 52, '2014-02-10 06:54:46', 5, '2014-02-07', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(192, 52, '2014-02-10 15:36:55', 5, '2014-02-10', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(193, 17, '2014-02-10 15:37:10', 5, '2014-02-10', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(194, 52, '2014-02-11 07:16:54', 2, '2014-02-07', '2014-03-11 23:49:23', 'Estimativa de sexta-feira.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(195, 52, '2014-02-11 07:17:05', 1, '2014-02-07', '2014-03-11 23:49:23', 'Participei de estimativa de USs.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(196, 52, '2014-02-11 07:17:15', 2, '2014-02-10', '2014-03-11 23:49:23', 'Estimativa de segunda-feira.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(197, 52, '2014-02-11 07:17:16', 1, '2014-02-10', '2014-03-11 23:49:23', 'Participei de estimativa de USs.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(198, 37, '2014-02-11 08:35:47', 3, '2014-02-11', '2014-03-11 23:49:23', 'Criado teste da inserção das metas de verificação.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(199, 37, '2014-02-11 08:36:28', 3, '2014-02-11', '2014-03-11 23:49:23', 'Criado teste das metas de verificação.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(200, 52, '2014-02-11 16:51:18', 3, '2014-02-10', '2014-03-11 23:49:23', 'Estimado as tarefas.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(201, 14, '2014-02-12 06:54:07', 1, '2014-02-12', '2014-03-11 23:49:23', 'Troquei a água hoje pela manhã.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(202, 23, '2014-02-12 06:56:12', 1, '2014-02-11', '2014-03-11 23:49:23', 'Refatoração da classe S2Print do App.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(203, 23, '2014-02-12 06:56:41', 1, '2014-02-11', '2014-03-11 23:49:23', 'Refatoração da classe DatecsPrinter do App.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(204, 23, '2014-02-12 06:57:14', 1, '2014-02-12', '2014-03-11 23:49:23', 'Refatoração da classe DatecsParkingReceipts do App.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(205, 2, '2014-02-12 06:57:45', 1, '2014-02-11', '2014-03-11 23:49:23', 'Documentação de código da classe ReceiptManager.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(206, 2, '2014-02-12 06:58:06', 1, '2014-02-11', '2014-03-11 23:49:23', 'Documentação de código da classe Receipt.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(207, 37, '2014-02-13 16:35:05', 5, '2014-02-13', '2014-03-11 23:49:23', 'Devolução Ticket / API', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(208, 37, '2014-02-13 16:35:20', 5, '2014-02-13', '2014-03-11 23:49:23', 'Devolução Ticket / API', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(209, 43, '2014-02-13 16:35:39', 5, '2014-02-13', '2014-03-11 23:49:23', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(210, 42, '2014-02-13 16:47:39', 5, '2014-02-13', '2014-03-11 23:49:23', 'Monitor', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(211, 52, '2014-02-14 16:05:59', 3, '2014-02-14', '2014-03-11 23:49:23', 'Estimado as tarefas do sprint atual e dos próximos.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(212, 43, '2014-02-14 16:07:08', 3, '2014-02-13', '2014-03-11 23:49:23', 'Criado teste da ativação do ticket na api.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(213, 37, '2014-02-14 16:07:20', 3, '2014-02-13', '2014-03-11 23:49:23', 'Criado teste da ativação do ticket na api.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(214, 37, '2014-02-14 16:07:43', 3, '2014-02-13', '2014-03-11 23:49:23', 'Criado teste da ativação do ticket na api.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(215, 37, '2014-02-14 16:08:14', 3, '2014-02-13', '2014-03-11 23:49:23', 'Criado teste da consulta de saldo do cliente, através da api.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(216, 37, '2014-02-14 16:08:41', 3, '2014-02-13', '2014-03-11 23:49:23', 'Criado teste da consulta de saldo do cliente, através da api.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(217, 15, '2014-02-14 16:11:06', 3, '2014-02-13', '2014-03-11 23:49:23', 'Vinícius.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(218, 52, '2014-02-14 16:43:08', 5, '2014-02-14', '2014-03-11 23:49:23', 'todas', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(219, 52, '2014-02-17 09:29:47', 5, '2014-02-14', '2014-03-11 23:49:23', 'Ok.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(220, 52, '2014-02-17 09:30:14', 2, '2014-02-14', '2014-03-11 23:49:23', 'OK.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(221, 37, '2014-02-17 18:14:16', 5, '2014-02-17', '2014-03-11 23:49:23', 'Foto na irregularidade, Modelo Comunicação', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(222, 37, '2014-02-17 18:14:57', 5, '2014-02-17', '2014-03-11 23:49:23', 'Foto na irregularidade', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(223, 37, '2014-02-17 18:15:31', 5, '2014-02-17', '2014-03-11 23:49:23', 'ComunicacaoTest.php', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(224, 40, '2014-02-17 18:17:32', 5, '2014-02-17', '2014-03-11 23:49:23', 'ComunicacaoTest.php', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(225, 17, '2014-02-18 08:56:14', 5, '2014-02-18', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(226, 37, '2014-02-18 18:02:27', 5, '2014-02-18', '2014-03-11 23:49:23', 'TransactionRestore', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(227, 43, '2014-02-18 18:02:43', 5, '2014-02-18', '2014-03-11 23:49:23', 'Eduardo', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(228, 40, '2014-02-18 18:03:12', 5, '2014-02-18', '2014-03-11 23:49:23', 'RestoreTransaction', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(229, 37, '2014-02-18 18:03:31', 5, '2014-02-18', '2014-03-11 23:49:23', 'TransactionRestore', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(230, 23, '2014-02-18 18:47:23', 5, '2014-02-18', '2014-03-11 23:49:23', 'Move Method\r\nisNetworkAvailable -> Utils->isNetworkAvailable', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(231, 15, '2014-02-18 18:50:21', 3, '2014-02-17', '2014-03-11 23:49:23', 'App do Cliente.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(232, 15, '2014-02-18 18:50:26', 1, '2014-02-17', '2014-03-11 23:49:23', 'Pareei com o Diego.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(233, 2, '2014-02-18 18:50:42', 3, '2014-02-17', '2014-03-11 23:49:23', 'App do cliente.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(234, 37, '2014-02-18 18:51:06', 3, '2014-02-17', '2014-03-11 23:49:23', 'App do cliente.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(235, 37, '2014-02-18 18:51:29', 3, '2014-02-17', '2014-03-11 23:49:23', 'App do cliente.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(236, 52, '2014-02-18 18:52:30', 1, '2014-02-18', '2014-03-11 23:49:23', 'Participei de estimativa de USs.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(237, 15, '2014-02-18 18:52:59', 3, '2014-02-18', '2014-03-11 23:49:23', 'Criação de testes no app do cliente.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(238, 10, '2014-02-18 18:53:18', 1, '2014-02-17', '2014-03-11 23:49:23', 'Documentação de código-fonte com o Diego.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(239, 52, '2014-02-18 18:53:24', 3, '2014-02-18', '2014-03-11 23:49:23', 'Estimado as user story.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(240, 10, '2014-02-18 18:53:26', 1, '2014-02-18', '2014-03-11 23:49:23', 'Documentação de código-fonte com o Diego.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(241, 37, '2014-02-18 18:54:11', 1, '2014-02-18', '2014-03-11 23:49:23', 'Criação de testes para métodos applogin e logout em EntidadesControllerTest.php.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(242, 43, '2014-02-18 18:54:29', 1, '2014-02-18', '2014-03-11 23:49:23', 'Criação de testes para métodos applogin e logout em EntidadesControllerTest.php com Diego.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(243, 43, '2014-02-18 18:54:39', 3, '2014-02-17', '2014-03-11 23:49:23', 'Testes junto com o André nas funcionalidades do cliente. (App)', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(244, 37, '2014-02-18 18:54:41', 1, '2014-02-18', '2014-03-11 23:49:23', 'Criação de testes para métodos applogin e logout em EntidadesControllerTest.php.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(245, 46, '2014-02-18 18:55:08', 1, '2014-02-18', '2014-03-11 23:49:23', 'Enviei tutorial sobre testes em Android.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(246, 15, '2014-02-18 18:55:54', 1, '2014-02-18', '2014-03-11 23:49:23', 'Pareei com Diego.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(247, 2, '2014-02-18 18:56:37', 1, '2014-02-18', '2014-03-11 23:49:23', 'Documentação de código-fonte class WebAppAlertMessages.java no app do cliente.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(249, 2, '2014-02-18 18:57:19', 1, '2014-02-18', '2014-03-11 23:49:23', 'Documentação de código-fonte class LoginActivity.java no app do cliente.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(250, 52, '2014-02-18 18:57:55', 2, '2014-02-18', '2014-03-11 23:49:23', 'Estimativa.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(251, 52, '2014-02-19 08:48:47', 5, '2014-02-18', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(252, 2, '2014-02-19 09:13:18', 4, '2014-02-18', '2014-03-11 23:49:23', 's2Batch - EmailObject', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(253, 2, '2014-02-19 09:13:35', 4, '2014-02-18', '2014-03-11 23:49:23', 's2Batch - EmailProcess', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(254, 22, '2014-02-19 09:13:52', 4, '2014-02-18', '2014-03-11 23:49:23', 'Planejamento diário\r\n', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(255, 37, '2014-02-19 09:14:11', 4, '2014-02-18', '2014-03-11 23:49:23', 's2Batch - EmailProcessTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(256, 37, '2014-02-19 09:14:23', 4, '2014-02-18', '2014-03-11 23:49:23', 's2Batch - EmailProcessTest', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(257, 23, '2014-02-19 10:36:09', 5, '2014-02-19', '2014-03-11 23:49:23', 'Extract method\r\n\r\nAPIRequest()\r\nbuildUr()\r\nqueryStringParams()', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(258, 37, '2014-02-19 10:36:53', 5, '2014-02-19', '2014-03-11 23:49:23', 'APIManager', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(259, 37, '2014-02-19 10:37:20', 5, '2014-02-19', '2014-03-11 23:49:23', 'APIManagerTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(260, 23, '2014-02-19 10:38:00', 5, '2014-02-19', '2014-03-11 23:49:23', 'c/Davi', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(261, 43, '2014-02-19 10:38:21', 5, '2014-02-19', '2014-03-11 23:49:23', 'c/Davi', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(262, 37, '2014-02-19 18:17:16', 5, '2014-02-19', '2014-03-11 23:49:23', 'API', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(263, 37, '2014-02-19 18:17:34', 5, '2014-02-19', '2014-03-11 23:49:23', 'Devolução de período API', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(264, 43, '2014-02-19 18:17:49', 5, '2014-02-19', '2014-03-11 23:49:23', 'Eduardo', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(265, 15, '2014-02-20 15:33:15', 1, '2014-02-19', '2014-03-11 23:49:23', 'Pareei com o Diego.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(266, 43, '2014-02-20 15:33:49', 1, '2014-02-19', '2014-03-11 23:49:23', 'Testes jUnit do aplicativo cliente em par.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(267, 37, '2014-02-20 15:34:12', 1, '2014-02-19', '2014-03-11 23:49:23', 'Classe LoginActivityTest do aplicativo cliente.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(268, 37, '2014-02-20 15:35:03', 1, '2014-02-19', '2014-03-11 23:49:23', 'Classe LoginActivityTest do aplicativo cliente.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(269, 14, '2014-02-20 15:35:24', 1, '2014-02-20', '2014-03-11 23:49:23', 'Troquei bombona d''água.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(270, 15, '2014-02-20 15:39:34', 3, '2014-02-19', '2014-03-11 23:49:23', 'All-day Pair com André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(271, 43, '2014-02-20 15:40:18', 3, '2014-02-19', '2014-03-11 23:49:23', 'Teste em par feito com o André.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(272, 37, '2014-02-20 15:41:15', 3, '2014-02-19', '2014-03-11 23:49:23', 'Teste na activity login.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(273, 37, '2014-02-20 15:41:44', 3, '2014-02-19', '2014-03-11 23:49:23', 'Teste na activity login. (App do cliente)', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(274, 42, '2014-02-20 15:59:09', 5, '2014-02-20', '2014-03-11 23:49:23', 'APIManagerTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(275, 37, '2014-02-20 17:51:57', 5, '2014-02-20', '2014-03-11 23:49:23', 'PeriodPurchaseComponentTest', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(276, 37, '2014-02-20 17:52:11', 5, '2014-02-20', '2014-03-11 23:49:23', 'PeriodPurchaseComponentTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(277, 40, '2014-02-20 17:52:32', 5, '2014-02-20', '2014-03-11 23:49:23', 'PeriodPurchaseComponent', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(278, 43, '2014-02-20 17:52:44', 5, '2014-02-20', '2014-03-11 23:49:23', 'Eduardo', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(279, 56, '2014-02-20 17:55:14', 5, '2014-02-20', '2014-03-11 23:49:23', 'Criei um mini projeto que calcula a chave que deve ser enviada para a api nos testes com o rest console\r\n\r\nhttp://192.168.2.161/ApiKeyCalc', 3, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(280, 17, '2014-02-20 18:22:28', 3, '2014-02-20', '2014-03-11 23:49:23', 'Feito café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(281, 15, '2014-02-20 18:22:40', 3, '2014-02-20', '2014-03-11 23:49:23', 'André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(282, 37, '2014-02-20 18:23:17', 3, '2014-02-20', '2014-03-11 23:49:23', 'Testes da MainActivity. (App cliente)', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(283, 37, '2014-02-20 18:23:29', 3, '2014-02-20', '2014-03-11 23:49:23', 'Testes da MainActivity. (App cliente)', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(284, 43, '2014-02-20 18:24:35', 3, '2014-02-20', '2014-03-11 23:49:23', 'Testes das funcionalidades do app do cliente.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(285, 10, '2014-02-20 18:25:13', 3, '2014-02-20', '2014-03-11 23:49:23', 'Criado documentação do app do cliente.\r\nhttp://doc.prepagointeligente.com.br/?page_id=1516', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(286, 1, '2014-02-20 18:26:13', 3, '2014-02-20', '2014-03-11 23:49:23', 'Documentação app cliente.\r\nhttp://doc.prepagointeligente.com.br/?page_id=1516', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(287, 15, '2014-02-21 08:50:29', 1, '2014-02-20', '2014-03-11 23:49:23', 'Pareei com o Diego.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(288, 1, '2014-02-21 08:51:00', 1, '2014-02-20', '2014-03-11 23:49:23', 'Criada documentação para o S2WayClientAndroid.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(289, 10, '2014-02-21 08:51:21', 1, '2014-02-20', '2014-03-11 23:49:23', 'Criada documentação para o S2WayClientAndroid com o Diego.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(290, 58, '2014-02-21 08:51:51', 1, '2014-02-21', '2014-03-11 23:49:23', 'DoD conferida para US aplicativo cliente android.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(291, 58, '2014-02-21 08:53:03', 1, '2014-02-20', '2014-03-11 23:49:23', 'DoD checked para bug "erro menu monitoramento"', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(292, 58, '2014-02-21 08:53:22', 1, '2014-02-20', '2014-03-11 23:49:23', 'DoD checked para bug "relatório faturamento associado".', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(293, 58, '2014-02-21 08:53:41', 1, '2014-02-20', '2014-03-11 23:49:23', 'DoD checked para bug "monitoramento postos".', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(294, 58, '2014-02-21 08:59:26', 3, '2014-02-20', '2014-03-11 23:49:23', 'App cliente.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(295, 37, '2014-02-21 11:33:50', 1, '2014-02-20', '2014-03-11 23:49:23', 'Testes da MainActivity. (App cliente)', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(296, 37, '2014-02-21 11:34:02', 1, '2014-02-20', '2014-03-11 23:49:23', 'Testes da MainActivity. (App cliente)', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(297, 43, '2014-02-21 11:34:25', 1, '2014-02-20', '2014-03-11 23:49:23', 'Testes da MainActivity com Diego (App cliente).', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(298, 58, '2014-02-24 17:46:55', 3, '2014-02-24', '2014-03-11 23:49:23', 'Veículo lançado com tolerância, assume a tolerância da área e não a informada.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL);
INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(299, 43, '2014-02-24 18:47:09', 3, '2014-02-24', '2014-03-11 23:49:23', 'Testes na lista de bugs. (André)', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(300, 58, '2014-02-24 18:49:01', 3, '2014-02-24', '2014-03-11 23:49:23', 'Área não bloqueia compra após irregularidade. Não sai recibo.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(301, 58, '2014-02-24 18:51:06', 3, '2014-02-24', '2014-03-11 23:49:23', 'Ao verificar um veículo com débito automático, apenas é mostrado "Veiculo verificado com sucesso". Mas não efetua o débito novamente.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(302, 23, '2014-02-24 18:57:07', 3, '2014-02-24', '2014-03-11 23:49:23', 'Criado classe VehicleController para melhor organização das chamadas do webservice. Feito isso para não precisar duplicar código.\r\n', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(303, 17, '2014-02-25 17:37:15', 3, '2014-02-25', '2014-03-11 23:49:23', 'Feito café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(304, 12, '2014-02-26 09:06:49', 4, '2014-02-25', '2014-03-11 23:49:23', 'Feito chimarrão na parte da tarde', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(305, 12, '2014-02-26 09:06:58', 4, '2014-02-24', '2014-03-11 23:49:23', 'Feito chimarrão na parte da tarde', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(306, 12, '2014-02-26 18:09:33', 5, '2014-02-26', '2014-03-11 23:49:23', 'ok', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(307, 37, '2014-02-26 18:12:21', 5, '2014-02-26', '2014-03-11 23:49:23', 'InspectionListActivity', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(308, 37, '2014-02-26 18:12:40', 5, '2014-02-26', '2014-03-11 23:49:23', 'InspectionListActivity', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(309, 43, '2014-02-26 18:13:01', 5, '2014-02-26', '2014-03-11 23:49:23', 'c/André', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(310, 15, '2014-02-26 18:50:06', 5, '2014-02-26', '2014-03-11 23:49:23', 'c/André', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(311, 15, '2014-02-27 15:24:07', 1, '2014-02-26', '2014-03-11 23:49:23', 'Pareei com o Vinícius.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(312, 43, '2014-02-27 15:24:24', 1, '2014-02-26', '2014-03-11 23:49:23', 'Pareei com o Vinícius.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(313, 1, '2014-02-27 15:25:32', 1, '2014-02-26', '2014-03-11 23:49:23', 'Criei documentação do menu Fiscalizar do app Parking.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(314, 37, '2014-02-27 15:26:25', 1, '2014-02-26', '2014-03-11 23:49:23', 'Testes da lista de fiscalização e inclusão do código de autuação no WS.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(315, 37, '2014-02-27 15:26:42', 1, '2014-02-26', '2014-03-11 23:49:23', 'Testes da lista de fiscalização e inclusão do código de autuação no WS.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(316, 40, '2014-02-27 15:27:07', 1, '2014-02-26', '2014-03-11 23:49:23', 'Testes da lista de fiscalização e inclusão do código de autuação no WS criados usando TDD.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(317, 37, '2014-02-27 15:27:58', 1, '2014-02-26', '2014-03-11 23:49:23', 'Testes da activity de fiscalização no app Parking.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(318, 37, '2014-02-27 15:28:08', 1, '2014-02-27', '2014-03-11 23:49:23', 'Testes da activity de fiscalização no app Parking.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(319, 58, '2014-02-27 15:29:09', 1, '2014-02-27', '2014-03-11 23:49:23', 'DoD checked - US Lista de Fiscalização.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(320, 2, '2014-02-27 15:30:06', 1, '2014-02-26', '2014-03-11 23:49:23', 'Documentação da activity lista de fiscalização do app parking.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(321, 17, '2014-02-27 15:53:53', 3, '2014-02-26', '2014-03-11 23:49:23', 'Feito café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(322, 17, '2014-02-27 18:30:34', 3, '2014-02-27', '2014-03-11 23:49:23', 'Feito café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(323, 58, '2014-02-27 18:31:31', 3, '2014-02-27', '2014-03-11 23:49:23', 'Concluído user story "Reimpressão de recibos".\r\n', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(324, 57, '2014-02-28 14:12:54', 1, '2014-02-28', '2014-03-11 23:49:23', 'Atividade desincumbida durante o sprint 24.', 4, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(325, 52, '2014-03-03 08:45:45', 1, '2014-02-28', '2014-03-11 23:49:23', 'Com o grupo.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(326, 14, '2014-03-03 08:45:58', 1, '2014-03-03', '2014-03-11 23:49:23', 'Agora pela manhã.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(327, 52, '2014-03-03 12:22:00', 2, '2014-02-28', '2014-03-11 23:49:23', 'Estimativa final sprint 24.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(328, 17, '2014-03-04 09:16:27', 1, '2014-03-04', '2014-03-11 23:49:23', 'Tipo cocaína.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(329, 37, '2014-03-04 09:16:56', 1, '2014-03-03', '2014-03-11 23:49:23', 'Atualizados testes da PrecosController', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(330, 37, '2014-03-04 09:17:07', 1, '2014-03-03', '2014-03-11 23:49:23', 'Atualizados testes da PrecosController', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(332, 2, '2014-03-04 10:11:46', 2, '2014-03-03', '2014-03-11 23:49:23', 'Activity InformationsActivity.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(333, 37, '2014-03-04 10:12:39', 2, '2014-03-03', '2014-03-11 23:49:23', 'Teste da activity InformationActivity.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(334, 37, '2014-03-04 10:12:54', 2, '2014-03-03', '2014-03-11 23:49:23', 'Teste da activity InformationActivity.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(335, 17, '2014-03-04 14:50:45', 2, '2014-03-04', '2014-03-11 23:49:23', 'Café.', 2, 2, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(336, 58, '2014-03-04 17:52:37', 3, '2014-03-04', '2014-03-11 23:49:23', 'Cadastro de clientes no POS.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(337, 58, '2014-03-04 17:53:18', 3, '2014-03-04', '2014-03-11 23:49:23', 'Adicionado opção para emitir o relatório de caixas de forma sintética.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(338, 42, '2014-03-04 17:54:43', 3, '2014-03-04', '2014-03-11 23:49:23', 'Relatório de caixas.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(339, 1, '2014-03-04 17:56:05', 3, '2014-03-04', '2014-03-11 23:49:23', 'Adicionado na documentação a opção de emitir o relatório de caixas de forma sintética.', 1, 0, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(340, 52, '2014-03-05 14:47:17', 2, '2014-03-05', '2014-03-11 23:49:23', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(341, 52, '2014-03-07 08:44:57', 5, '2014-03-05', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(342, 37, '2014-03-07 08:45:39', 5, '2014-03-06', '2014-03-11 23:49:23', 'SectorList', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(343, 37, '2014-03-07 08:46:03', 5, '2014-03-06', '2014-03-11 23:49:23', 'SectorListActivity', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(344, 37, '2014-03-07 08:46:47', 5, '2014-03-07', '2014-03-11 23:49:23', 'RechargeActivity', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(345, 43, '2014-03-07 08:47:09', 5, '2014-03-06', '2014-03-11 23:49:23', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(346, 58, '2014-03-07 09:26:44', 1, '2014-03-06', '2014-03-11 23:49:23', 'DoD checked - adicionar tempo decorrido na lista de vencidos do menu fiscalização.', 2, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(347, 23, '2014-03-07 09:27:30', 1, '2014-03-05', '2014-03-11 23:49:23', 'Com Eduardo - extract class, rename method, extract method.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(348, 23, '2014-03-07 09:27:50', 1, '2014-03-06', '2014-03-11 23:49:23', 'Com Eduardo - extract method.', 3, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(349, 43, '2014-03-07 09:28:35', 1, '2014-03-06', '2014-03-11 23:49:23', 'Pareei com Christian no teste da PeriodPurchase no app.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(350, 52, '2014-03-07 09:29:59', 1, '2014-03-05', '2014-03-11 23:49:23', 'Estimativa em grupo.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(351, 2, '2014-03-07 09:33:37', 2, '2014-03-05', '2014-03-11 23:49:23', 'Documentação do teste CancelPurchaseActivityTest.', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(352, 37, '2014-03-07 09:34:14', 2, '2014-03-05', '2014-03-11 23:49:23', 'CancelPurchaseActivityTest.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(353, 37, '2014-03-07 09:34:34', 2, '2014-03-05', '2014-03-11 23:49:23', 'CancelPurchaseActivityTest.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(354, 37, '2014-03-07 09:35:10', 1, '2014-03-06', '2014-03-11 23:49:23', 'PeriodPurchaseAcitivityUnitTest', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(355, 43, '2014-03-07 09:35:23', 2, '2014-03-05', '2014-03-11 23:49:23', 'Criação do teste CancelPurchaseActivityTest com o Diego.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(356, 37, '2014-03-07 09:35:24', 1, '2014-03-06', '2014-03-11 23:49:23', 'PeriodPurchaseAcitivityUnitTest', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(357, 15, '2014-03-07 09:35:55', 2, '2014-03-05', '2014-03-11 23:49:23', 'Diego.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(358, 15, '2014-03-07 09:36:17', 2, '2014-03-06', '2014-03-11 23:49:23', 'Diego e André.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(359, 37, '2014-03-07 09:36:36', 1, '2014-03-06', '2014-03-11 23:49:23', 'S2WayBatch - gerenciamento de SMS.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(360, 37, '2014-03-07 09:37:08', 1, '2014-03-06', '2014-03-11 23:49:23', 'S2WayBatch - gerenciador SMS.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(361, 43, '2014-03-07 09:37:24', 1, '2014-03-06', '2014-03-11 23:49:23', 'Pareei com o Eduardo.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(362, 15, '2014-03-07 10:49:10', 3, '2014-03-05', '2014-03-11 23:49:23', 'Criado teste da classe CancelPurchaseActivity junto com o Cristian.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(363, 37, '2014-03-07 10:49:37', 3, '2014-03-05', '2014-03-11 23:49:23', 'Criado teste da classe CancelPurchaseActivity junto com o Cristian.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(364, 15, '2014-03-07 10:51:18', 3, '2014-03-06', '2014-03-11 23:49:23', 'Criado teste na classe RechargeActivity junto com o Vinícius.', 2, 20, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(365, 37, '2014-03-07 10:51:34', 3, '2014-03-06', '2014-03-11 23:49:23', 'Criado teste na classe RechargeActivity junto com o Vinícius.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(366, 37, '2014-03-07 10:53:27', 3, '2014-03-05', '2014-03-11 23:49:23', 'CancelPurchaseActivity.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(367, 37, '2014-03-07 10:54:27', 3, '2014-03-06', '2014-03-11 23:49:23', 'RechargeActivity.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(368, 43, '2014-03-07 10:55:35', 3, '2014-03-05', '2014-03-11 23:49:23', 'Cristian.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(369, 43, '2014-03-07 10:55:58', 3, '2014-03-06', '2014-03-11 23:49:23', 'Vinícius.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(370, 52, '2014-03-10 10:00:21', 5, '2014-03-07', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(371, 52, '2014-03-10 10:07:10', 2, '2014-03-07', '2014-03-11 23:49:23', 'Estimativa final sprint 25.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(372, 62, '2014-03-10 10:10:19', 2, '2014-03-03', '2014-03-11 23:49:23', 'Sprint 26.', 2, 15, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(373, 52, '2014-03-10 19:05:59', 3, '2014-03-10', '2014-03-11 23:49:23', 'Estimado as user story junto com o time.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(374, 37, '2014-03-10 19:06:30', 3, '2014-03-10', '2014-03-11 23:49:23', 'Criado teste da activity NotifyIrregularityActivity.', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(375, 37, '2014-03-10 19:06:43', 3, '2014-03-10', '2014-03-11 23:49:23', 'Criado teste da activity NotifyIrregularityActivity.', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(376, 52, '2014-03-11 10:20:04', 2, '2014-03-10', '2014-03-11 23:49:23', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(377, 52, '2014-03-11 13:25:46', 4, '2014-03-10', '2014-03-11 23:49:23', 'Estimado no início da tarde', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(379, 52, '2014-03-11 13:26:14', 4, '2014-03-06', '2014-03-11 23:49:23', 'Estimado na parte da tarde', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(380, 52, '2014-03-11 13:27:12', 4, '2014-03-05', '2014-03-11 23:49:23', 'Estimado na parte da tarde', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(381, 37, '2014-03-11 15:06:52', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  EmailProcessTest.class', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(382, 37, '2014-03-11 15:07:08', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  S2WaySMSListenerTest.class', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(383, 37, '2014-03-11 15:07:19', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  TWWManagerTest.class', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(384, 37, '2014-03-11 15:07:33', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  S2WaySMSParserTest.class', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(385, 37, '2014-03-11 15:07:52', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  EmailProcessTest.class', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(386, 37, '2014-03-11 15:08:02', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  S2WaySMSListenerTest.class', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(387, 37, '2014-03-11 15:08:10', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  TWWManagerTest.class', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(388, 37, '2014-03-11 15:08:20', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  S2WaySMSParserTest.class', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(389, 2, '2014-03-11 15:08:39', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - APIMessage.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(390, 2, '2014-03-11 15:08:49', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - APIRequest.class\r\n', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(391, 2, '2014-03-11 15:08:59', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - CommandSMS.class\r\n', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(392, 2, '2014-03-11 15:09:08', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - Errors.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(393, 2, '2014-03-11 15:09:16', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - Fields.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(394, 2, '2014-03-11 15:09:28', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - HttpMethod.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(395, 2, '2014-03-11 15:09:41', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - TWWStatusMessage.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(396, 2, '2014-03-11 15:09:52', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - S2WaySMSListener', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(397, 2, '2014-03-11 15:10:04', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - SMSMessage.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(398, 2, '2014-03-11 15:10:13', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - SMSProcess.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(399, 2, '2014-03-11 15:10:26', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - Utils.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(400, 2, '2014-03-11 15:10:35', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - EmailObjectMock.class\r\n', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(401, 2, '2014-03-11 15:10:43', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - EmailProcessMock.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(402, 2, '2014-03-11 15:10:53', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - EmailProcessTest.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(403, 2, '2014-03-11 15:37:56', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - S2WaySMSListenerMock.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(404, 2, '2014-03-11 15:38:06', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - S2WaySMSListenerTest.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(405, 2, '2014-03-11 15:38:14', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - S2WaySMSParserTest.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(406, 2, '2014-03-11 15:38:24', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - TWWManagerMock.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(407, 2, '2014-03-11 15:38:38', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - TWWManagerTest.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(408, 2, '2014-03-11 15:38:46', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - APIMessageMock.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(409, 2, '2014-03-11 15:38:53', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch - APIRequestMock.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(410, 2, '2014-03-11 15:39:03', 4, '2014-03-11', '2014-03-11 23:49:23', 's2WayBatch -  UtilsTest.class', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(411, 2, '2014-03-11 17:07:52', 1, '2014-03-11', '2014-03-11 23:49:23', 'Documentação classe de teste FaturamentoAssociadoDetalhesTest.java', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(412, 2, '2014-03-11 17:08:05', 1, '2014-03-11', '2014-03-11 23:49:23', 'Documentação classe de teste FaturamentoAssociadoTest.java', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(413, 37, '2014-03-11 17:08:36', 1, '2014-03-11', '2014-03-11 23:49:23', 'Classe de teste FaturamentoAssociadoDetalhesTest.java', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(414, 37, '2014-03-11 17:08:50', 1, '2014-03-11', '2014-03-11 23:49:23', 'Classe de teste FaturamentoAssociadoTest.java', 4, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(415, 37, '2014-03-11 17:09:04', 1, '2014-03-11', '2014-03-11 23:49:23', 'Classe de teste FaturamentoAssociadoDetalhesTest.java', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(416, 37, '2014-03-11 17:09:19', 1, '2014-03-11', '2014-03-11 23:49:23', 'Classe de teste FaturamentoAssociadoTest.java', 4, 10, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(417, 52, '2014-03-11 17:10:29', 1, '2014-03-11', '2014-03-11 23:49:23', 'Hoje à tarde.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(418, 52, '2014-03-11 19:25:43', 2, '2014-03-11', '2014-03-11 23:49:23', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(419, 52, '2014-03-11 19:26:25', 5, '2014-03-11', '2014-03-11 23:49:23', 'ok', 2, 3, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(420, 2, '2014-03-11 19:30:21', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(421, 2, '2014-03-11 19:30:22', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(422, 2, '2014-03-11 19:30:30', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(423, 2, '2014-03-11 19:30:31', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(424, 2, '2014-03-11 19:30:31', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(425, 2, '2014-03-11 19:30:31', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(426, 2, '2014-03-11 19:30:32', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(427, 2, '2014-03-11 19:30:32', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(428, 2, '2014-03-11 19:30:33', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(429, 2, '2014-03-11 19:30:33', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(430, 2, '2014-03-11 19:30:33', 5, '2014-03-11', '2014-03-11 23:49:23', 'VehicleListActivity', 1, 5, NULL, 6, NULL, '2014-03-11 23:49:23', NULL, 1, 0, NULL),
(431, 17, '2014-03-12 09:54:45', 4, '2014-03-11', '2014-03-16 18:19:20', 'Feito café no meio da tarde', 2, 2, NULL, 6, NULL, '2014-03-16 18:19:20', NULL, 1, 0, NULL),
(447, 9, '2014-03-12 11:10:31', 5, '2014-03-12', '2014-03-16 18:19:28', 'http://doc.prepagointeligente.com.br/?page_id=1547', 1, 20, NULL, 6, NULL, '2014-03-16 18:19:28', NULL, 1, 0, NULL),
(448, 17, '2014-03-12 19:39:29', 3, '2014-03-12', '2014-03-16 18:19:30', 'Feito café', 2, 2, NULL, 6, NULL, '2014-03-16 18:19:30', NULL, 1, 0, NULL),
(449, 42, '2014-03-12 19:40:44', 3, '2014-03-12', '2014-03-16 18:19:38', 'Melhorias nos testes da NotifyIrregularityTest.', 4, 5, NULL, 6, NULL, '2014-03-16 18:19:38', NULL, 1, 0, NULL),
(450, 37, '2014-03-12 19:42:14', 3, '2014-03-12', '2014-03-16 18:19:42', 'Criado teste da trigger ParkTicketInsertTest, referente a configuração ignorar_tempo_max_periodo_compra.', 4, 10, NULL, 6, NULL, '2014-03-16 18:19:42', NULL, 1, 0, NULL),
(451, 37, '2014-03-12 19:43:06', 3, '2014-03-12', '2014-03-16 18:19:44', 'Criado teste da trigger ParkTicketInsertTest, referente a configuração ignorar_tempo_max_periodo_compra.', 4, 5, NULL, 6, NULL, '2014-03-16 18:19:44', NULL, 1, 0, NULL),
(452, 2, '2014-03-12 19:45:08', 3, '2014-03-12', '2014-03-16 18:19:49', 'Adicionado comentários nos métodos da classe ParkTicketInsertTest.', 1, 5, NULL, 6, NULL, '2014-03-16 18:19:49', NULL, 1, 0, NULL),
(453, 52, '2014-03-13 17:26:47', 2, '2014-03-13', '2014-03-16 18:19:52', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-03-16 18:19:52', NULL, 1, 0, NULL),
(454, 52, '2014-03-13 17:39:29', 3, '2014-03-13', '2014-03-16 18:19:55', 'Excutado planning poker.', 2, 3, NULL, 6, NULL, '2014-03-16 18:19:55', NULL, 1, 0, NULL),
(455, 2, '2014-03-13 17:41:57', 3, '2014-03-13', '2014-03-16 18:19:59', 'MonitoramentoVagasController', 1, 5, NULL, 6, NULL, '2014-03-16 18:19:59', NULL, 1, 0, NULL),
(456, 42, '2014-03-13 18:45:47', 3, '2014-03-13', '2014-03-16 18:20:02', 'CaixasControllerTest', 4, 5, NULL, 6, NULL, '2014-03-16 18:20:02', NULL, 1, 0, NULL),
(457, 37, '2014-03-14 12:35:23', 1, '2014-03-15', '2014-03-16 18:20:03', 'Novos testes da park_verifica_veiculo.', 4, 10, NULL, 6, NULL, '2014-03-16 18:20:03', NULL, 1, 0, NULL),
(458, 37, '2014-03-14 12:36:23', 1, '2014-03-13', '2014-03-16 18:20:04', 'Novos testes da park_verifica_veiculo.', 4, 5, NULL, 6, NULL, '2014-03-16 18:20:04', NULL, 1, 0, NULL),
(459, 14, '2014-03-14 12:38:45', 1, '2014-03-13', '2014-03-16 18:20:08', 'Troquei água.', 2, 2, NULL, 6, NULL, '2014-03-16 18:20:08', NULL, 1, 0, NULL),
(460, 61, '2014-03-17 09:58:27', 5, '2014-03-14', '2014-03-17 18:25:02', 'Api', 2, 10, NULL, 6, NULL, '2014-03-17 18:25:02', NULL, 1, 0, NULL),
(461, 62, '2014-03-17 16:42:37', 2, '2014-03-17', '2014-03-17 18:25:04', 'Planejamento do sprint 27.', 2, 15, NULL, 6, NULL, '2014-03-17 18:25:04', NULL, 1, 0, NULL),
(462, 52, '2014-03-17 16:43:21', 2, '2014-03-17', '2014-03-17 18:25:05', '\r\nEstimativa de tarefas do sprint 27.', 2, 3, NULL, 6, NULL, '2014-03-17 18:25:05', NULL, 1, 0, NULL),
(463, 62, '2014-03-17 18:31:10', 1, '2014-03-17', '2014-03-18 22:01:08', 'Planejamento de sprint hoje pela manhã.', 2, 15, NULL, 6, NULL, '2014-03-18 22:01:08', NULL, 1, 0, NULL),
(465, 15, '2014-03-18 10:44:11', 3, '2014-03-17', '2014-03-18 22:01:12', 'Vinícius', 2, 20, NULL, 6, NULL, '2014-03-18 22:01:12', NULL, 1, 0, NULL),
(466, 43, '2014-03-18 10:44:32', 3, '2014-03-17', '2014-03-18 22:01:14', 'Vinícius', 4, 10, NULL, 6, NULL, '2014-03-18 22:01:14', NULL, 1, 0, NULL),
(468, 37, '2014-03-18 10:45:10', 3, '2014-03-17', '2014-03-18 22:01:16', 'Testes da park_ticket_bi', 4, 10, NULL, 6, NULL, '2014-03-18 22:01:16', NULL, 1, 0, NULL),
(469, 37, '2014-03-18 10:45:38', 3, '2014-03-17', '2014-03-18 22:01:28', 'Testes da park_ticket_bi', 4, 5, NULL, 6, NULL, '2014-03-18 22:01:28', NULL, 1, 0, NULL),
(472, 17, '2014-03-18 12:10:56', 3, '2014-03-17', '2014-03-18 22:01:38', 'Feito café', 2, 2, NULL, 6, NULL, '2014-03-18 22:01:38', NULL, 1, 0, NULL),
(473, 15, '2014-03-18 14:38:42', 1, '2014-03-17', '2014-03-18 22:01:43', 'Pareei com Eduardo ontem.', 2, 20, NULL, 6, NULL, '2014-03-18 22:01:43', NULL, 1, 0, NULL),
(474, 46, '2014-03-18 14:39:00', 1, '2014-03-18', '2014-03-18 22:01:45', 'Artigo enviado ontem: the power of personas.', 2, 10, NULL, 6, NULL, '2014-03-18 22:01:45', NULL, 1, 0, NULL),
(475, 40, '2014-03-18 14:42:09', 1, '2014-03-18', '2014-03-18 22:01:52', 'Testes da park_transfere_veiculo_area criados antes da procedure.', 4, 10, NULL, 6, NULL, '2014-03-18 22:01:52', NULL, 1, 0, NULL),
(476, 37, '2014-03-18 14:42:47', 1, '2014-03-17', '2014-03-18 22:01:58', 'Testes da park_transfere_veiculo_area.', 4, 10, NULL, 6, NULL, '2014-03-18 22:01:58', NULL, 1, 0, NULL),
(477, 37, '2014-03-18 14:43:00', 1, '2014-03-17', '2014-03-18 22:01:59', 'Testes da park_transfere_veiculo_area.', 4, 5, NULL, 6, NULL, '2014-03-18 22:01:59', NULL, 1, 0, NULL),
(478, 14, '2014-03-18 14:43:24', 1, '2014-03-17', '2014-03-18 22:02:02', 'Troquei água à tarde.', 2, 2, NULL, 6, NULL, '2014-03-18 22:02:02', NULL, 1, 0, NULL),
(479, 43, '2014-03-18 14:44:07', 1, '2014-03-17', '2014-03-18 22:02:16', 'Pareei ontem com Eduardo.', 4, 10, NULL, 6, NULL, '2014-03-18 22:02:16', NULL, 1, 0, NULL),
(480, 37, '2014-03-18 19:56:14', 5, '2014-03-17', '2014-03-18 22:02:18', 'MaxPeriodos', 4, 10, NULL, 6, NULL, '2014-03-18 22:02:18', NULL, 1, 0, NULL),
(481, 37, '2014-03-18 19:56:39', 5, '2014-03-17', '2014-03-18 22:02:21', 'Trigger ticket_bi', 4, 5, NULL, 6, NULL, '2014-03-18 22:02:21', NULL, 1, 0, NULL),
(482, 43, '2014-03-18 19:57:03', 5, '2014-03-17', '2014-03-18 22:02:22', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-03-18 22:02:22', NULL, 1, 0, NULL),
(483, 52, '2014-03-18 19:57:16', 5, '2014-03-17', '2014-03-18 22:02:24', 'ok', 2, 3, NULL, 6, NULL, '2014-03-18 22:02:24', NULL, 1, 0, NULL),
(484, 62, '2014-03-18 19:58:03', 5, '2014-03-17', '2014-03-18 22:02:25', 'ok', 2, 15, NULL, 6, NULL, '2014-03-18 22:02:25', NULL, 1, 0, NULL),
(485, 8, '2014-03-19 09:54:25', 1, '2014-03-19', '2014-03-19 17:31:37', 'Persona unlocked: Jair.', 1, 50, NULL, 6, NULL, '2014-03-19 17:31:37', NULL, 1, 0, NULL),
(486, 8, '2014-03-19 09:54:37', 1, '2014-03-19', '2014-03-19 17:31:39', 'Persona unlocked: Paulinha.', 1, 50, NULL, 6, NULL, '2014-03-19 17:31:39', NULL, 1, 0, NULL),
(487, 8, '2014-03-19 09:54:54', 1, '2014-03-19', '2014-03-19 17:31:40', 'Persona unlocked: seu Arlindo.', 1, 50, NULL, 6, NULL, '2014-03-19 17:31:40', NULL, 1, 0, NULL),
(488, 8, '2014-03-19 09:55:13', 1, '2014-03-19', '2014-03-19 17:31:41', 'Persona unlocked: tio Juca.', 1, 50, NULL, 6, NULL, '2014-03-19 17:31:41', NULL, 1, 0, NULL),
(489, 8, '2014-03-19 09:55:24', 1, '2014-03-19', '2014-03-19 17:31:42', 'Persona unlocked: Geraldo.', 1, 50, NULL, 6, NULL, '2014-03-19 17:31:42', NULL, 1, 0, NULL),
(490, 52, '2014-03-19 11:36:55', 4, '2014-03-17', '2014-03-19 12:46:06', 'Estimativa', 2, 3, NULL, 6, NULL, '2014-03-19 12:46:06', NULL, 1, 0, NULL),
(491, 42, '2014-03-19 12:48:23', 3, '2014-03-18', '2014-03-19 12:48:31', 'Alteração no teste da park_ticket_bi', 4, 5, NULL, 6, NULL, '2014-03-19 12:48:31', NULL, 1, 0, NULL),
(492, 37, '2014-03-19 20:13:29', 5, '2014-03-08', '2014-03-19 23:36:44', 'API', 4, 10, NULL, 6, NULL, '2014-03-19 23:36:44', NULL, 1, 0, NULL),
(493, 37, '2014-03-19 20:13:52', 5, '2014-03-18', '2014-03-19 23:36:47', 'API', 4, 5, NULL, 6, NULL, '2014-03-19 23:36:47', NULL, 1, 0, NULL),
(494, 42, '2014-03-19 20:14:34', 5, '2014-03-18', '2014-03-19 23:36:49', 'API', 4, 5, NULL, 6, NULL, '2014-03-19 23:36:49', NULL, 1, 0, NULL),
(495, 23, '2014-03-19 20:15:20', 5, '2014-03-19', '2014-03-19 23:36:53', 'inline method -> getRequestField', 3, 10, NULL, 6, NULL, '2014-03-19 23:36:53', NULL, 1, 0, NULL),
(496, 23, '2014-03-19 20:15:48', 5, '2014-03-19', '2014-03-19 23:36:55', 'inline method validateEmptyObject', 3, 10, NULL, 6, NULL, '2014-03-19 23:36:55', NULL, 1, 0, NULL),
(497, 23, '2014-03-19 20:16:27', 5, '2014-03-19', '2014-03-19 23:36:58', 'substitute algorithm ApiException', 3, 10, NULL, 6, NULL, '2014-03-19 23:36:58', NULL, 1, 0, NULL),
(498, 37, '2014-03-19 20:17:09', 5, '2014-03-19', '2014-03-19 23:37:02', 'Api', 4, 10, NULL, 6, NULL, '2014-03-19 23:37:02', NULL, 1, 0, NULL),
(499, 40, '2014-03-19 20:17:28', 5, '2014-03-19', '2014-03-19 23:37:04', 'API', 4, 10, NULL, 6, NULL, '2014-03-19 23:37:04', NULL, 1, 0, NULL),
(500, 37, '2014-03-19 20:17:54', 5, '2014-03-19', '2014-03-19 23:37:06', 'API', 4, 5, NULL, 6, NULL, '2014-03-19 23:37:06', NULL, 1, 0, NULL),
(501, 23, '2014-03-19 20:18:31', 5, '2014-03-19', '2014-03-19 23:37:08', 'replace magic number ERROR_CODES', 3, 10, NULL, 6, NULL, '2014-03-19 23:37:08', NULL, 1, 0, NULL),
(502, 2, '2014-03-19 22:11:51', 2, '2014-03-19', '2014-03-19 23:37:10', 'Documentação do código da classe InspectionListActivityUnitTest.', 1, 5, NULL, 6, NULL, '2014-03-19 23:37:10', NULL, 1, 0, NULL),
(503, 42, '2014-03-19 22:18:42', 2, '2014-03-19', '2014-03-21 11:53:58', 'Atualizado testes da classe InspectionListActivityUnitTest em função da adição da lista de veículos excedidos na fiscalização do app.', 4, 5, NULL, 6, NULL, '2014-03-21 11:53:58', NULL, 1, 0, NULL),
(505, 23, '2014-03-20 11:48:35', 5, '2014-03-20', '2014-03-20 18:51:53', 'Replace magic number -> Status de veículos', 3, 10, NULL, 6, NULL, '2014-03-20 18:51:53', NULL, 1, 0, NULL),
(506, 2, '2014-03-20 15:28:50', 4, '2014-03-20', '2014-03-20 18:52:31', 's2DataBase - Procedure ''park_transfere_veiculo_area''', 1, 5, NULL, 6, NULL, '2014-03-20 18:52:31', NULL, 1, 0, NULL),
(507, 2, '2014-03-20 15:30:24', 4, '2014-03-20', '2014-03-20 18:52:33', 's2DataBaseTest - Teste da procedure ''park_transfere_veiculo_area''', 1, 5, NULL, 6, NULL, '2014-03-20 18:52:33', NULL, 1, 0, NULL),
(508, 37, '2014-03-20 15:31:05', 4, '2014-03-20', '2014-03-20 18:52:42', 's2DataBase - Teste procedure ''park_transfere_veiculo_area''', 4, 5, NULL, 6, NULL, '2014-03-20 18:52:42', NULL, 1, 0, NULL),
(509, 40, '2014-03-20 15:32:39', 4, '2014-03-20', '2014-03-20 18:52:40', 's2WayDataBaseTest - Procedure - ''park_transfere_veiculo_area''', 4, 10, NULL, 6, NULL, '2014-03-20 18:52:40', NULL, 1, 0, NULL),
(510, 14, '2014-03-20 17:03:32', 1, '2014-03-20', '2014-03-20 18:51:33', 'Agora à tarde.', 2, 2, NULL, 6, NULL, '2014-03-20 18:51:33', NULL, 1, 0, NULL),
(512, 37, '2014-03-20 19:28:31', 5, '2014-03-20', '2014-03-21 11:54:05', 'PaymentEc', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:05', NULL, 1, 0, NULL),
(513, 42, '2014-03-20 19:29:12', 5, '2014-03-20', '2014-03-21 11:54:14', 'PaymentEc\r\nteste pagamento sem qtde_periodos', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:14', NULL, 1, 0, NULL),
(514, 42, '2014-03-21 10:09:16', 3, '2014-03-20', '2014-03-21 11:54:23', 'Alteração/Correção na AuthorizationController.', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:23', NULL, 1, 0, NULL),
(515, 42, '2014-03-21 10:09:37', 3, '2014-03-20', '2014-03-21 11:54:26', 'Alteração/Correção na CashClosingController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:26', NULL, 1, 0, NULL),
(516, 42, '2014-03-21 10:10:08', 3, '2014-03-20', '2014-03-21 11:54:30', 'Alteração/Correção na ClientsController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:30', NULL, 1, 0, NULL),
(517, 42, '2014-03-21 10:10:28', 3, '2014-03-20', '2014-03-21 11:54:32', 'Alteração/Correção na ConfigurationsController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:32', NULL, 1, 0, NULL),
(518, 42, '2014-03-21 10:10:42', 3, '2014-03-20', '2014-03-21 11:54:34', 'IrregularitiesController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:34', NULL, 1, 0, NULL),
(519, 42, '2014-03-21 10:10:58', 3, '2014-03-20', '2014-03-21 11:54:37', 'NotifyIrregularities', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:37', NULL, 1, 0, NULL),
(520, 42, '2014-03-21 10:11:23', 3, '2014-03-20', '2014-03-21 11:54:40', 'Alteração/Correção na PaymentEcController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:40', NULL, 1, 0, NULL),
(521, 42, '2014-03-21 10:11:45', 3, '2014-03-20', '2014-03-21 11:54:41', 'Alteração/Correção na PrivateApiAppController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:41', NULL, 1, 0, NULL),
(522, 42, '2014-03-21 10:12:05', 3, '2014-03-20', '2014-03-21 11:54:43', 'Alteração/Correção na TaxiCustomerController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:43', NULL, 1, 0, NULL),
(523, 42, '2014-03-21 10:12:32', 3, '2014-03-20', '2014-03-21 11:54:44', 'Alteração/Correção na TicketsController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:44', NULL, 1, 0, NULL),
(524, 42, '2014-03-21 10:12:56', 3, '2014-03-20', '2014-03-21 11:54:45', 'Alteração/Correção na PaymentEcController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:45', NULL, 1, 0, NULL),
(525, 42, '2014-03-21 10:13:20', 3, '2014-03-20', '2014-03-21 11:54:46', 'Alteração/Correção na VehiclesController', 4, 5, NULL, 6, NULL, '2014-03-21 11:54:46', NULL, 1, 0, NULL),
(526, 23, '2014-03-21 10:28:10', 5, '2014-03-21', '2014-03-21 11:54:51', 'Replace magic string\r\nTipos de equipamentos', 3, 10, NULL, 6, NULL, '2014-03-21 11:54:51', NULL, 1, 0, NULL),
(527, 37, '2014-03-21 10:50:46', 5, '2014-03-20', '2014-03-21 11:55:01', 'PaymentEc Períodos proporcionais', 4, 10, NULL, 6, NULL, '2014-03-21 11:55:01', NULL, 1, 0, NULL),
(528, 42, '2014-03-21 10:51:39', 5, '2014-03-20', '2014-03-21 11:55:04', 'PaymentEcController Períodos proporcionais', 4, 5, NULL, 6, NULL, '2014-03-21 11:55:04', NULL, 1, 0, NULL),
(529, 40, '2014-03-21 10:51:58', 5, '2014-03-20', '2014-03-21 11:55:06', 'Períodos proporcionais', 4, 10, NULL, 6, NULL, '2014-03-21 11:55:06', NULL, 1, 0, NULL),
(530, 43, '2014-03-21 10:52:20', 5, '2014-03-20', '2014-03-21 11:55:08', 'Eduardo', 4, 10, NULL, 6, NULL, '2014-03-21 11:55:08', NULL, 1, 0, NULL),
(531, 23, '2014-03-21 11:05:32', 5, '2014-03-21', '2014-03-21 11:55:15', 'Decompose conditional\r\ncompraComCentavos()', 3, 10, NULL, 6, NULL, '2014-03-21 11:55:15', NULL, 1, 0, NULL),
(532, 23, '2014-03-21 11:07:44', 5, '2014-03-21', '2014-03-21 11:55:20', 'Remove middle man\r\nconvertPaymentCode', 3, 10, NULL, 6, NULL, '2014-03-21 11:55:20', NULL, 1, 0, NULL),
(533, 23, '2014-03-21 11:09:15', 5, '2014-03-21', '2014-03-21 11:55:22', 'replace magic number\r\npaymentCode', 3, 10, NULL, 6, NULL, '2014-03-21 11:55:22', NULL, 1, 0, NULL),
(534, 61, '2014-03-21 18:33:21', 1, '2014-03-21', '2014-03-22 19:09:36', 'Demonstrada funcionalidade recarregar cartão.', 2, 10, NULL, 6, NULL, '2014-03-22 19:09:36', NULL, 1, 0, NULL),
(535, 58, '2014-03-25 11:26:45', 3, '2014-03-25', '2014-03-25 17:42:44', 'Confirmação mensagem app.', 2, 10, NULL, 6, NULL, '2014-03-25 17:42:44', NULL, 1, 0, NULL),
(536, 42, '2014-03-25 11:27:56', 3, '2014-03-25', '2014-03-25 17:42:46', 'CancelPurchaseActivity', 4, 5, NULL, 6, NULL, '2014-03-25 17:42:46', NULL, 1, 0, NULL),
(537, 23, '2014-03-25 11:30:28', 3, '2014-03-25', '2014-03-25 17:42:48', 'Confirmação mensagem app.', 3, 10, NULL, 6, NULL, '2014-03-25 17:42:48', NULL, 1, 0, NULL),
(538, 37, '2014-03-25 11:45:31', 5, '2014-03-24', '2014-03-25 17:42:49', 'Movimenta conta', 4, 10, NULL, 6, NULL, '2014-03-25 17:42:49', NULL, 1, 0, NULL),
(539, 37, '2014-03-25 11:46:03', 5, '2014-03-24', '2014-03-25 17:42:51', 'movimenta_conta', 4, 5, NULL, 6, NULL, '2014-03-25 17:42:51', NULL, 1, 0, NULL),
(540, 43, '2014-03-25 11:46:26', 5, '2014-03-24', '2014-03-25 17:42:53', 'c/ eduardo', 4, 10, NULL, 6, NULL, '2014-03-25 17:42:53', NULL, 1, 0, NULL),
(541, 37, '2014-03-25 11:48:59', 5, '2014-03-25', '2014-03-25 17:42:56', 'API', 4, 10, NULL, 6, NULL, '2014-03-25 17:42:56', NULL, 1, 0, NULL),
(542, 42, '2014-03-25 11:49:59', 5, '2014-03-25', '2014-03-25 17:42:57', 'testBuscaCpf -> testa busca de clientes por cpf via api', 4, 5, NULL, 6, NULL, '2014-03-25 17:42:57', NULL, 1, 0, NULL),
(543, 40, '2014-03-25 11:50:10', 5, '2014-03-25', '2014-03-25 17:42:58', 'testBuscaCpf', 4, 10, NULL, 6, NULL, '2014-03-25 17:42:58', NULL, 1, 0, NULL),
(546, 40, '2014-03-25 15:12:46', 5, '2014-03-25', '2014-03-25 17:42:41', 'Clientes -> testAddSemArea', 4, 10, NULL, 6, NULL, '2014-03-25 17:42:41', NULL, 1, 0, NULL),
(547, 40, '2014-03-26 09:47:01', 1, '2014-03-25', '2014-03-26 11:09:38', 'Criado teste antes da funcionalidade de atualizar recibos na api.', 4, 10, NULL, 6, NULL, '2014-03-26 11:09:38', NULL, 1, 0, NULL),
(548, 37, '2014-03-26 09:47:13', 1, '2014-03-26', '2014-03-26 11:09:40', 'Criado teste da funcionalidade de atualizar recibos na api.', 4, 5, NULL, 6, NULL, '2014-03-26 11:09:40', NULL, 1, 0, NULL),
(549, 37, '2014-03-26 09:47:28', 1, '2014-03-25', '2014-03-26 11:09:43', 'Criado teste antes da funcionalidade de atualizar recibos na api.', 4, 10, NULL, 6, NULL, '2014-03-26 11:09:43', NULL, 1, 0, NULL),
(550, 7, '2014-03-26 17:33:00', 5, '2014-03-26', '2014-03-27 11:37:53', 'Documentação IMDT', 1, 50, NULL, 6, NULL, '2014-03-27 11:37:53', NULL, 1, 0, NULL),
(551, 42, '2014-03-26 17:54:48', 5, '2014-03-26', '2014-03-27 11:37:56', 'Busca de cliente por cartão de crédito', 4, 5, NULL, 6, NULL, '2014-03-27 11:37:56', NULL, 1, 0, NULL),
(552, 42, '2014-03-26 18:04:16', 5, '2014-03-26', '2014-03-27 11:37:59', 'teste busca cliente por telefone', 4, 5, NULL, 6, NULL, '2014-03-27 11:37:59', NULL, 1, 0, NULL),
(553, 37, '2014-03-26 18:55:11', 5, '2014-03-26', '2014-03-27 11:38:01', 'Ticket Model', 4, 10, NULL, 6, NULL, '2014-03-27 11:38:01', NULL, 1, 0, NULL),
(554, 37, '2014-03-26 18:55:27', 5, '2014-03-26', '2014-03-27 11:38:03', 'TicketTest.php', 4, 5, NULL, 6, NULL, '2014-03-27 11:38:03', NULL, 1, 0, NULL),
(555, 40, '2014-03-26 18:55:50', 5, '2014-03-26', '2014-03-27 11:38:04', 'Valor irregularidades', 4, 10, NULL, 6, NULL, '2014-03-27 11:38:04', NULL, 1, 0, NULL),
(556, 7, '2014-03-26 18:56:21', 5, '2014-03-26', '2014-03-27 11:38:09', 'Documentação Tendência', 1, 50, NULL, 6, NULL, '2014-03-27 11:38:09', NULL, 1, 0, NULL),
(557, 23, '2014-03-27 11:57:49', 5, '2014-03-27', '2014-03-27 12:33:09', 'Move method\r\nPrivateApiAppController->getValueTicketsIrregularities()   ====> Ticket->getValueTicketsIrregularities()', 3, 10, NULL, 6, NULL, '2014-03-27 12:33:09', NULL, 1, 0, NULL),
(558, 23, '2014-03-27 11:58:13', 5, '2014-03-27', '2014-03-27 12:33:11', 'c/|Eduardo', 3, 10, NULL, 6, NULL, '2014-03-27 12:33:11', NULL, 1, 0, NULL),
(559, 2, '2014-03-27 15:13:19', 4, '2014-03-26', '2014-03-27 17:43:48', 'EmailComponent -API', 1, 5, NULL, 6, NULL, '2014-03-27 17:43:48', NULL, 1, 0, NULL),
(560, 23, '2014-03-27 15:13:35', 4, '2014-03-27', '2014-03-27 17:43:57', 'Com Vinícius - Retirado método buscar informações dos tickets irregulares e colocado no model Ticket ', 3, 10, NULL, 6, NULL, '2014-03-27 17:43:57', NULL, 1, 0, NULL),
(561, 56, '2014-03-27 15:38:43', 1, '2014-03-27', '2014-03-27 17:44:02', 'Criado método para calcular tempo decorrido na PrivateApiAppController', 3, 5, NULL, 6, NULL, '2014-03-27 17:44:02', NULL, 1, 0, NULL),
(562, 14, '2014-03-27 15:39:32', 1, '2014-03-27', '2014-03-27 17:44:04', 'Troquei pela manhã.', 2, 2, NULL, 6, NULL, '2014-03-27 17:44:04', NULL, 1, 0, NULL),
(563, 42, '2014-03-27 18:14:29', 3, '2014-03-26', '2014-03-28 11:51:47', 'Melhorias nos testes existentes da procedure park_transfere_veiculo.', 4, 5, NULL, 6, NULL, '2014-03-28 11:51:47', NULL, 1, 0, NULL),
(564, 42, '2014-03-27 20:02:38', 3, '2014-03-27', '2014-03-28 11:51:49', 'Criado duas situações de testes da park_transfere_veiculo.', 4, 5, NULL, 6, NULL, '2014-03-28 11:51:49', NULL, 1, 0, NULL),
(565, 52, '2014-03-28 18:02:34', 3, '2014-03-28', '2014-03-30 20:32:41', 'User story', 2, 3, NULL, 6, NULL, '2014-03-30 20:32:41', NULL, 1, 0, NULL),
(566, 40, '2014-03-31 09:28:02', 1, '2014-03-27', '2014-03-31 14:56:42', 'Desenvolvido teste antes de implementar percentual de recarga (cadastro de tarifa).', 4, 10, NULL, 6, NULL, '2014-03-31 14:56:42', NULL, 1, 0, NULL),
(567, 37, '2014-03-31 09:28:17', 1, '2014-03-27', '2014-03-31 14:56:47', 'Desenvolvido teste de implementar percentual de recarga (cadastro de tarifa).', 4, 5, NULL, 6, NULL, '2014-03-31 14:56:47', NULL, 1, 0, NULL),
(568, 37, '2014-03-31 09:28:36', 1, '2014-03-27', '2014-03-31 14:56:50', 'Desenvolvido teste percentual de recarga (cadastro de tarifa).', 4, 10, NULL, 6, NULL, '2014-03-31 14:56:50', NULL, 1, 0, NULL),
(569, 43, '2014-03-31 09:29:17', 1, '2014-03-27', '2014-03-31 14:56:51', 'Testes percentual recarga desenvolvidos com Cristian.', 4, 10, NULL, 6, NULL, '2014-03-31 14:56:51', NULL, 1, 0, NULL),
(570, 42, '2014-03-31 09:30:53', 1, '2014-03-27', '2014-03-31 14:56:55', 'Testes do cadastro de tarifas (o teste "addPost" estava comentado por não estar passando).', 4, 5, NULL, 6, NULL, '2014-03-31 14:56:55', NULL, 1, 0, NULL),
(571, 15, '2014-03-31 09:36:04', 1, '2014-03-28', '2014-03-31 14:57:10', 'Pareei com Cristian.', 2, 20, NULL, 6, NULL, '2014-03-31 14:57:10', NULL, 1, 0, NULL),
(572, 52, '2014-03-31 09:51:25', 4, '2014-03-28', '2014-03-31 14:57:12', 'Planning Poker na tarde da tarde de 4 tarefas.', 2, 3, NULL, 6, NULL, '2014-03-31 14:57:12', NULL, 1, 0, NULL),
(573, 52, '2014-03-31 10:17:10', 5, '2014-03-28', '2014-03-31 14:57:14', 'ok', 2, 3, NULL, 6, NULL, '2014-03-31 14:57:14', NULL, 1, 0, NULL),
(574, 52, '2014-03-31 16:04:57', 1, '2014-03-31', '2014-04-01 10:52:18', 'Hoje.', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:18', NULL, 1, 0, NULL),
(575, 52, '2014-03-31 17:43:24', 3, '2014-03-31', '2014-04-01 10:52:20', 'User story', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:20', NULL, 1, 0, NULL),
(576, 52, '2014-03-31 17:43:31', 3, '2014-03-31', '2014-04-01 10:52:22', 'User story', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:22', NULL, 1, 0, NULL),
(577, 52, '2014-03-31 17:43:32', 1, '2014-03-31', '2014-04-01 10:52:24', 'Segunda estimativa do dia', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:24', NULL, 1, 0, NULL),
(578, 52, '2014-03-31 17:43:38', 3, '2014-03-31', '2014-04-01 10:52:27', 'User story', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:27', NULL, 1, 0, NULL),
(579, 52, '2014-03-31 17:43:41', 1, '2014-03-31', '2014-04-01 10:52:31', 'Terceira estimativa do dia.', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:31', NULL, 1, 0, NULL),
(580, 52, '2014-03-31 18:53:49', 5, '2014-03-31', '2014-04-01 10:52:32', 'ok', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:32', NULL, 1, 0, NULL),
(581, 37, '2014-03-31 18:54:21', 5, '2014-03-31', '2014-04-01 10:52:34', 'API sem área', 4, 10, NULL, 6, NULL, '2014-04-01 10:52:34', NULL, 1, 0, NULL),
(582, 42, '2014-03-31 18:55:26', 5, '2014-03-31', '2014-04-01 10:52:36', 'AuthorizationControllerTest.php', 4, 5, NULL, 6, NULL, '2014-04-01 10:52:36', NULL, 1, 0, NULL),
(583, 23, '2014-03-31 19:02:25', 5, '2014-03-31', '2014-04-01 10:52:40', 'replace algorythm -> Authorization controller não retorna mais a área vinculada ao equipamento,  nem cobrança', 3, 10, NULL, 6, NULL, '2014-04-01 10:52:40', NULL, 1, 0, NULL),
(584, 40, '2014-03-31 19:05:04', 5, '2014-03-31', '2014-04-01 10:52:41', 'Api / Authorization precisa retornar uma lista de áreas... teste ok', 4, 10, NULL, 6, NULL, '2014-04-01 10:52:41', NULL, 1, 0, NULL),
(585, 23, '2014-03-31 19:16:09', 5, '2014-03-31', '2014-04-01 10:52:43', 'Inline method AuthorizationController->getOperador(), só havia uma chamada para um método privado no controller', 3, 10, NULL, 6, NULL, '2014-04-01 10:52:43', NULL, 1, 0, NULL),
(586, 23, '2014-03-31 19:53:16', 5, '2014-03-31', '2014-04-01 10:52:46', 'inline method AuthorizationController->getParkSetores()\r\na lista de setores agora é por área', 3, 10, NULL, 6, NULL, '2014-04-01 10:52:46', NULL, 1, 0, NULL),
(587, 52, '2014-04-01 09:57:15', 2, '2014-03-31', '2014-04-01 10:52:51', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-04-01 10:52:51', NULL, 1, 0, NULL),
(588, 15, '2014-04-01 09:57:40', 2, '2014-03-31', '2014-04-01 10:52:53', 'Pareamento com o André.', 2, 20, NULL, 6, NULL, '2014-04-01 10:52:53', NULL, 1, 0, NULL),
(589, 4, '2014-04-01 11:33:22', 4, '2014-04-01', '2014-04-01 16:48:36', '(s2WayDataBaseTests) Corrigido/Melhorado teste no VerificaVeiculoTest', 1, 0, NULL, 6, NULL, '2014-04-01 16:48:36', NULL, 1, 0, NULL),
(590, 2, '2014-04-01 11:33:57', 4, '2014-04-01', '2014-04-01 16:48:42', '(s2WayDataBaseTests) - Documentação da classe ParkTransfereVeiculoArea.', 1, 5, NULL, 6, NULL, '2014-04-01 16:48:42', NULL, 1, 0, NULL),
(592, 37, '2014-04-01 11:34:45', 4, '2014-04-01', '2014-04-01 16:48:45', '(s2WayDataBaseTests) -  Concluido teste da park_transfere_veiculo_area.', 4, 5, NULL, 6, NULL, '2014-04-01 16:48:45', NULL, 1, 0, NULL),
(593, 37, '2014-04-01 11:35:22', 4, '2014-04-01', '2014-04-01 16:48:50', '(s2WayDataBaseTests)  - Criado teste completo da procedure park_transfere_veiculo_area', 4, 10, NULL, 6, NULL, '2014-04-01 16:48:50', NULL, 1, 0, NULL),
(594, 52, '2014-04-01 11:35:42', 4, '2014-03-31', '2014-04-01 16:48:53', 'Estimado tarefas.', 2, 3, NULL, 6, NULL, '2014-04-01 16:48:53', NULL, 1, 0, NULL),
(595, 52, '2014-04-01 11:35:49', 4, '2014-03-31', '2014-04-01 16:48:55', 'Estimado tarefas.', 2, 3, NULL, 6, NULL, '2014-04-01 16:48:55', NULL, 1, 0, NULL),
(596, 52, '2014-04-01 11:35:56', 4, '2014-03-20', '2014-04-01 16:48:57', 'Estimado tarefas.', 2, 3, NULL, 6, NULL, '2014-04-01 16:48:57', NULL, 1, 0, NULL),
(597, 2, '2014-04-01 14:19:19', 1, '2014-03-31', '2014-04-01 16:49:04', 'Documentação teste autorizacao_bu', 1, 5, NULL, 6, NULL, '2014-04-01 16:49:04', NULL, 1, 0, NULL),
(598, 15, '2014-04-01 14:19:50', 1, '2014-03-31', '2014-04-01 16:49:07', 'Pareado com Cristian.', 2, 20, NULL, 6, NULL, '2014-04-01 16:49:07', NULL, 1, 0, NULL),
(599, 16, '2014-04-01 14:20:27', 1, '2014-03-31', '2014-04-01 16:49:11', 'Coach de JOOQ para Cristian.', 2, 10, NULL, 6, NULL, '2014-04-01 16:49:11', NULL, 1, 0, NULL),
(600, 16, '2014-04-01 14:20:59', 1, '2014-03-31', '2014-04-01 16:49:13', 'Coach de mysql para Cristian.', 2, 10, NULL, 6, NULL, '2014-04-01 16:49:13', NULL, 1, 0, NULL),
(601, 37, '2014-04-01 14:22:36', 1, '2014-03-31', '2014-04-01 16:49:18', 'Testes da trigger autorizacao_bu com relação à tarifa de recarga.', 4, 10, NULL, 6, NULL, '2014-04-01 16:49:18', NULL, 1, 0, NULL),
(602, 37, '2014-04-01 14:23:00', 1, '2014-03-31', '2014-04-01 16:49:19', 'Testes da trigger autorizacao_bu com relação à tarifa de recarga.', 4, 5, NULL, 6, NULL, '2014-04-01 16:49:19', NULL, 1, 0, NULL),
(603, 43, '2014-04-01 14:23:19', 1, '2014-03-31', '2014-04-01 16:49:21', 'Testes da trigger autorizacao_bu com relação à tarifa de recarga.', 4, 10, NULL, 6, NULL, '2014-04-01 16:49:21', NULL, 1, 0, NULL),
(604, 37, '2014-04-01 14:23:58', 1, '2014-04-01', '2014-04-01 16:49:26', 'Testes da função calcula_tarifa_recarga', 4, 10, NULL, 6, NULL, '2014-04-01 16:49:26', NULL, 1, 0, NULL),
(605, 43, '2014-04-01 14:24:07', 1, '2014-04-01', '2014-04-01 16:49:29', 'Testes da função calcula_tarifa_recarga', 4, 10, NULL, 6, NULL, '2014-04-01 16:49:29', NULL, 1, 0, NULL),
(606, 37, '2014-04-01 14:24:16', 1, '2014-04-01', '2014-04-01 16:49:31', 'Testes da função calcula_tarifa_recarga', 4, 5, NULL, 6, NULL, '2014-04-01 16:49:31', NULL, 1, 0, NULL),
(607, 2, '2014-04-01 14:24:37', 1, '2014-04-01', '2014-04-01 16:49:33', 'Comentários da classe CalculaTarifaRecargaTest', 1, 5, NULL, 6, NULL, '2014-04-01 16:49:33', NULL, 1, 0, NULL),
(608, 2, '2014-04-01 15:26:20', 4, '2014-04-01', '2014-04-01 16:49:35', 'Classe de teste do model Posto do site prepago', 1, 5, NULL, 6, NULL, '2014-04-01 16:49:35', NULL, 1, 0, NULL),
(609, 37, '2014-04-01 15:26:40', 4, '2014-04-01', '2014-04-01 16:49:37', 'Criado teste do model Posto no site do prepago.', 4, 10, NULL, 6, NULL, '2014-04-01 16:49:37', NULL, 1, 0, NULL);
INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(610, 37, '2014-04-01 15:27:19', 4, '2014-04-01', '2014-04-01 16:49:39', 'Criado teste para model do Posto no site prepago', 4, 5, NULL, 6, NULL, '2014-04-01 16:49:39', NULL, 1, 0, NULL),
(611, 58, '2014-04-01 19:13:50', 3, '2014-04-01', '2014-04-02 10:54:54', 'Criar termos e condições de uso para operação de floripa.', 2, 10, NULL, 6, NULL, '2014-04-02 10:54:54', NULL, 1, 0, NULL),
(612, 58, '2014-04-01 19:14:47', 3, '2014-04-01', '2014-04-02 10:54:57', 'Vaga moto', 2, 10, NULL, 6, NULL, '2014-04-02 10:54:57', NULL, 1, 0, NULL),
(613, 37, '2014-04-01 19:16:48', 3, '2014-04-01', '2014-04-02 10:55:00', 'As placas estão sendo cadastradas sem máscara.', 4, 25, NULL, 6, NULL, '2014-04-02 10:55:00', NULL, 1, 0, NULL),
(614, 37, '2014-04-01 19:18:21', 3, '2014-04-01', '2014-04-02 10:55:17', 'As placas estão sendo cadastradas sem máscara.', 4, 5, NULL, 6, NULL, '2014-04-02 10:55:17', NULL, 1, 0, NULL),
(615, 58, '2014-04-01 19:21:25', 3, '2014-04-01', '2014-04-02 10:55:22', 'Criar comandos para rede tendência.', 2, 10, NULL, 6, NULL, '2014-04-02 10:55:22', NULL, 1, 0, NULL),
(616, 37, '2014-04-01 19:22:05', 3, '2014-04-01', '2014-04-02 10:55:24', 'Criado teste do comando de quitação de irregularidades no EC.', 4, 10, NULL, 6, NULL, '2014-04-02 10:55:24', NULL, 1, 0, NULL),
(617, 37, '2014-04-01 19:22:14', 3, '2014-04-01', '2014-04-02 10:55:29', 'Criado teste do comando de quitação de irregularidades no EC.', 4, 5, NULL, 6, NULL, '2014-04-02 10:55:29', NULL, 1, 0, NULL),
(618, 37, '2014-04-01 19:22:49', 3, '2014-04-01', '2014-04-02 10:55:31', 'Criado teste do comando de cancelamento de tickets no EC.', 4, 10, NULL, 6, NULL, '2014-04-02 10:55:31', NULL, 1, 0, NULL),
(619, 37, '2014-04-01 19:22:56', 3, '2014-04-01', '2014-04-02 10:55:38', 'Criado teste do comando de cancelamento de tickets no EC.', 4, 5, NULL, 6, NULL, '2014-04-02 10:55:38', NULL, 1, 0, NULL),
(620, 37, '2014-04-01 19:47:49', 3, '2014-04-01', '2014-04-02 10:55:49', 'As placas estão sendo cadastradas sem máscara.', 4, 10, NULL, 6, NULL, '2014-04-02 10:55:49', NULL, 1, 0, NULL),
(621, 37, '2014-04-01 19:47:56', 3, '2014-04-01', '2014-04-02 10:55:51', 'As placas estão sendo cadastradas sem máscara.', 4, 5, NULL, 6, NULL, '2014-04-02 10:55:51', NULL, 1, 0, NULL),
(622, 2, '2014-04-01 19:48:44', 3, '2014-04-01', '2014-04-02 10:55:54', 'VeiculosControllerTest', 1, 5, NULL, 6, NULL, '2014-04-02 10:55:54', NULL, 1, 0, NULL),
(623, 2, '2014-04-02 10:43:46', 4, '2014-04-02', '2014-04-02 10:56:00', 'PrePago  - Documentação da classe Monitoramento de Vagas na alteração das cores do operador no mapa.', 1, 5, NULL, 6, NULL, '2014-04-02 10:56:00', NULL, 1, 0, NULL),
(624, 2, '2014-04-02 10:44:00', 4, '2014-04-02', '2014-04-02 10:56:02', 'PrePago  - Documentação da classe  de teste da Monitoramento de Vagas na alteração das cores do operador no mapa.', 1, 5, NULL, 6, NULL, '2014-04-02 10:56:02', NULL, 1, 0, NULL),
(626, 37, '2014-04-02 10:45:13', 4, '2014-04-02', '2014-04-02 10:56:05', 'PrePago  - Criado teste na monitoramento de vagas para o status do operador.', 4, 5, NULL, 6, NULL, '2014-04-02 10:56:05', NULL, 1, 0, NULL),
(627, 2, '2014-04-02 12:55:43', 4, '2014-04-02', '2014-04-03 12:11:10', 'Classe de adição de veiculos no plugin cliente', 1, 5, NULL, 6, NULL, '2014-04-03 12:11:10', NULL, 1, 0, NULL),
(628, 37, '2014-04-02 12:56:10', 4, '2014-04-02', '2014-04-03 12:11:17', 'Feito classe de teste para classe que cadastra veículos no plugin do cliente.', 4, 5, NULL, 6, NULL, '2014-04-03 12:11:17', NULL, 1, 0, NULL),
(629, 37, '2014-04-02 12:56:56', 4, '2014-04-02', '2014-04-03 12:11:19', 'Criado classe de teste para classe que cadastra veículos no plugin do cliente.', 4, 10, NULL, 6, NULL, '2014-04-03 12:11:19', NULL, 1, 0, NULL),
(630, 52, '2014-04-02 19:44:25', 2, '2014-03-28', '2014-04-03 12:11:26', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-04-03 12:11:26', NULL, 1, 0, NULL),
(632, 52, '2014-04-02 19:45:36', 2, '2014-04-02', '2014-04-03 12:11:30', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-04-03 12:11:30', NULL, 1, 0, NULL),
(633, 15, '2014-04-02 19:47:58', 2, '2014-04-01', '2014-04-03 12:11:37', 'Pareamento com o André.', 2, 20, NULL, 6, NULL, '2014-04-03 12:11:37', NULL, 1, 0, NULL),
(634, 2, '2014-04-02 19:49:29', 1, '2014-04-02', '2014-04-03 12:12:03', 'Métodos e alterações das views de recarga comentados.', 1, 5, NULL, 6, NULL, '2014-04-03 12:12:03', NULL, 1, 0, NULL),
(635, 1, '2014-04-02 19:49:57', 1, '2014-04-02', '2014-04-03 12:12:12', 'Documentação do fluxo de dinheiro atualizada para contemplar os códigos de operações e a ordem dos movimentos.', 1, 0, NULL, 6, NULL, '2014-04-03 12:12:12', NULL, 1, 0, NULL),
(636, 40, '2014-04-02 19:50:36', 1, '2014-04-02', '2014-04-03 12:12:22', 'Teste de calculateRecharge criado antes do método.', 4, 10, NULL, 6, NULL, '2014-04-03 12:12:22', NULL, 1, 0, NULL),
(637, 37, '2014-04-02 19:50:58', 1, '2014-04-02', '2014-04-03 12:12:36', 'Testes calculateRecharge do RecargasController.', 4, 10, NULL, 6, NULL, '2014-04-03 12:12:36', NULL, 1, 0, NULL),
(638, 37, '2014-04-02 19:51:09', 1, '2014-04-02', '2014-04-03 12:12:38', 'Testes calculateRecharge do RecargasController.', 4, 5, NULL, 6, NULL, '2014-04-03 12:12:38', NULL, 1, 0, NULL),
(639, 43, '2014-04-02 19:51:19', 1, '2014-04-02', '2014-04-03 12:12:42', 'Testes calculateRecharge do RecargasController com Cristian.', 4, 10, NULL, 6, NULL, '2014-04-03 12:12:42', NULL, 1, 0, NULL),
(640, 42, '2014-04-02 19:51:57', 1, '2014-04-02', '2014-04-03 12:13:01', 'Adição dos testes calculateRecharge no RecargasController.', 4, 5, NULL, 6, NULL, '2014-04-03 12:13:01', NULL, 1, 0, NULL),
(641, 23, '2014-04-02 19:53:17', 1, '2014-04-02', '2014-04-03 12:13:14', 'Pull up method usado para generalizar o método validaRecarga tanto no pag seguro quanto no cielo.', 3, 10, NULL, 6, NULL, '2014-04-03 12:13:14', NULL, 1, 0, NULL),
(642, 15, '2014-04-02 19:54:24', 1, '2014-04-01', '2014-04-03 12:13:17', 'Com Cristian.', 2, 20, NULL, 6, NULL, '2014-04-03 12:13:17', NULL, 1, 0, NULL),
(643, 62, '2014-04-02 19:56:23', 1, '2014-04-02', '2014-04-03 12:13:40', 'Reunião de planejamento realizada hoje.', 2, 15, NULL, 6, NULL, '2014-04-03 12:13:40', NULL, 1, 0, NULL),
(644, 2, '2014-04-02 20:01:16', 2, '2014-04-01', '2014-04-03 12:13:47', 'Documentação do teste da function calcula_recarga.sql, CalculaRecargaTest.java.', 1, 5, NULL, 6, NULL, '2014-04-03 12:13:47', NULL, 1, 0, NULL),
(645, 2, '2014-04-02 20:01:45', 1, '2014-04-01', '2014-04-03 12:13:51', 'Comentários da função calcula_tarifa_recarga.', 1, 5, NULL, 6, NULL, '2014-04-03 12:13:51', NULL, 1, 0, NULL),
(646, 10, '2014-04-02 20:02:47', 1, '2014-04-01', '2014-04-03 12:13:54', 'Atualização da documentação do fluxo do dinheiro em par com Cristian.', 1, 0, NULL, 6, NULL, '2014-04-03 12:13:54', NULL, 1, 0, NULL),
(650, 62, '2014-04-02 20:08:32', 2, '2014-04-02', '2014-04-03 12:14:00', 'Sprint 28.', 2, 15, NULL, 6, NULL, '2014-04-03 12:14:00', NULL, 1, 0, NULL),
(651, 1, '2014-04-02 20:27:17', 2, '2014-04-02', '2014-04-03 12:14:18', 'Documentação do fluxo de dinheiro atualizada para contemplar os códigos de operações e a ordem dos movimentos.', 1, 0, NULL, 6, NULL, '2014-04-03 12:14:18', NULL, 1, 0, NULL),
(652, 2, '2014-04-02 20:28:05', 2, '2014-04-02', '2014-04-03 12:14:26', 'Métodos e alterações das views de recarga comentados.', 1, 5, NULL, 6, NULL, '2014-04-03 12:14:26', NULL, 1, 0, NULL),
(653, 40, '2014-04-02 20:28:18', 2, '2014-04-02', '2014-04-03 12:14:53', 'Teste de calculateRecharge criado antes do método.', 4, 10, NULL, 6, NULL, '2014-04-03 12:14:53', NULL, 1, 0, NULL),
(654, 37, '2014-04-02 20:28:34', 2, '2014-04-02', '2014-04-03 12:14:55', 'Testes calculateRecharge do RecargasController.', 4, 10, NULL, 6, NULL, '2014-04-03 12:14:55', NULL, 1, 0, NULL),
(655, 37, '2014-04-02 20:29:31', 2, '2014-04-02', '2014-04-03 12:14:57', 'Testes calculateRecharge do RecargasController.', 4, 5, NULL, 6, NULL, '2014-04-03 12:14:57', NULL, 1, 0, NULL),
(656, 43, '2014-04-02 20:31:31', 2, '2014-04-01', '2014-04-03 12:15:01', 'Teste da function calcula_recarga.sql, CalculaRecargaTest.java realizado juntamente com o André.', 4, 10, NULL, 6, NULL, '2014-04-03 12:15:01', NULL, 1, 0, NULL),
(658, 37, '2014-04-02 20:35:31', 2, '2014-04-01', '2014-04-03 12:15:04', 'Teste da function calcula_recarga.sql, CalculaRecargaTest.java.', 4, 10, NULL, 6, NULL, '2014-04-03 12:15:04', NULL, 1, 0, NULL),
(659, 10, '2014-04-02 20:37:54', 2, '2014-04-02', '2014-04-03 12:15:06', 'Atualização da documentação do fluxo do dinheiro em par com Cristian.', 1, 0, NULL, 6, NULL, '2014-04-03 12:15:06', NULL, 1, 0, NULL),
(660, 37, '2014-04-02 20:38:48', 2, '2014-04-01', '2014-04-03 12:15:08', 'Teste da function calcula_recarga.sql, CalculaRecargaTest.java.', 4, 5, NULL, 6, NULL, '2014-04-03 12:15:08', NULL, 1, 0, NULL),
(662, 43, '2014-04-02 20:47:06', 2, '2014-04-02', '2014-04-03 12:15:09', 'Testes calculateRecharge do RecargasController com André.', 4, 10, NULL, 6, NULL, '2014-04-03 12:15:09', NULL, 1, 0, NULL),
(663, 14, '2014-04-03 10:15:17', 2, '2014-04-03', '2014-04-03 12:15:12', 'Troca da bombona de água.', 2, 2, NULL, 6, NULL, '2014-04-03 12:15:12', NULL, 1, 0, NULL),
(664, 52, '2014-04-03 10:25:48', 1, '2014-04-02', '2014-04-03 12:15:14', 'Ontem no final da tarde.', 2, 3, NULL, 6, NULL, '2014-04-03 12:15:14', NULL, 1, 0, NULL),
(665, 52, '2014-04-03 12:46:40', 3, '2014-04-02', '2014-04-04 09:56:58', 'User story', 2, 3, NULL, 6, NULL, '2014-04-04 09:56:58', NULL, 1, 0, NULL),
(666, 58, '2014-04-03 12:47:07', 3, '2014-04-02', '2014-04-04 09:57:12', 'Acerto de Caixa.', 2, 10, NULL, 6, NULL, '2014-04-04 09:57:12', NULL, 1, 0, NULL),
(667, 42, '2014-04-03 12:47:54', 3, '2014-04-02', '2014-04-04 09:57:17', 'AcertoCaixasController', 4, 5, NULL, 6, NULL, '2014-04-04 09:57:17', NULL, 1, 0, NULL),
(668, 2, '2014-04-03 12:48:20', 3, '2014-04-02', '2014-04-04 09:57:20', 'AcertoCaixaControllerTest', 1, 5, NULL, 6, NULL, '2014-04-04 09:57:20', NULL, 1, 0, NULL),
(669, 37, '2014-04-03 12:48:37', 3, '2014-04-02', '2014-04-04 09:57:24', 'AcertoCaixaControllerTest', 4, 5, NULL, 6, NULL, '2014-04-04 09:57:24', NULL, 1, 0, NULL),
(670, 62, '2014-04-03 12:50:01', 3, '2014-04-02', '2014-04-04 09:57:32', 'Sprint 27', 2, 15, NULL, 6, NULL, '2014-04-04 09:57:32', NULL, 1, 0, NULL),
(671, 37, '2014-04-03 12:51:13', 3, '2014-04-02', '2014-04-04 09:57:37', 'AcertoCaixaControllerTest', 4, 10, NULL, 6, NULL, '2014-04-04 09:57:37', NULL, 1, 0, NULL),
(672, 52, '2014-04-03 15:25:02', 3, '2014-04-03', '2014-04-04 09:57:55', 'User story', 2, 3, NULL, 6, NULL, '2014-04-04 09:57:55', NULL, 1, 0, NULL),
(673, 42, '2014-04-03 16:05:14', 4, '2014-04-03', '2014-04-04 09:58:00', 'Melhorado teste do cadastro de áreas depois de adicionar um campo para cobrança.', 4, 5, NULL, 6, NULL, '2014-04-04 09:58:00', NULL, 1, 0, NULL),
(674, 23, '2014-04-03 17:41:50', 5, '2014-04-03', '2014-04-04 09:58:04', 'Remove middle man\r\nParkAreaCobranca', 3, 10, NULL, 6, NULL, '2014-04-04 09:58:04', NULL, 1, 0, NULL),
(675, 23, '2014-04-03 17:42:09', 5, '2014-04-03', '2014-04-04 09:58:08', 'c/Cristian e Eduardo', 3, 10, NULL, 6, NULL, '2014-04-04 09:58:08', NULL, 1, 0, NULL),
(676, 42, '2014-04-03 17:42:52', 5, '2014-04-03', '2014-04-04 09:58:11', 'Retirado ParkAreaCobranca dos testes', 4, 5, NULL, 6, NULL, '2014-04-04 09:58:11', NULL, 1, 0, NULL),
(677, 58, '2014-04-03 19:08:37', 3, '2014-04-03', '2014-04-04 09:58:13', 'Trocar veiculo app.', 2, 10, NULL, 6, NULL, '2014-04-04 09:58:13', NULL, 1, 0, NULL),
(678, 42, '2014-04-03 19:08:54', 3, '2014-04-03', '2014-04-04 09:58:17', 'VehiclesControllerTest', 4, 5, NULL, 6, NULL, '2014-04-04 09:58:17', NULL, 1, 0, NULL),
(679, 23, '2014-04-03 20:07:41', 2, '2014-04-03', '2014-04-04 09:58:20', 'Remove middle man ParkAreaCobranca', 3, 10, NULL, 6, NULL, '2014-04-04 09:58:20', NULL, 1, 0, NULL),
(680, 23, '2014-04-03 20:08:46', 2, '2014-04-03', '2014-04-04 09:58:21', 'Pair refactoring com o Vinícius.', 3, 10, NULL, 6, NULL, '2014-04-04 09:58:21', NULL, 1, 0, NULL),
(681, 42, '2014-04-03 20:09:17', 2, '2014-04-03', '2014-04-04 09:58:29', 'Retirado ParkAreaCobranca dos testes.', 4, 5, NULL, 6, NULL, '2014-04-04 09:58:29', NULL, 1, 0, NULL),
(682, 52, '2014-04-03 20:09:30', 2, '2014-04-03', '2014-04-04 09:58:31', 'Estimativa diária.', 2, 3, NULL, 6, NULL, '2014-04-04 09:58:31', NULL, 1, 0, NULL),
(683, 52, '2014-04-04 10:04:16', 5, '2014-04-03', '2014-04-04 17:48:18', 'ok', 2, 3, NULL, 6, NULL, '2014-04-04 17:48:18', NULL, 1, 0, NULL),
(684, 15, '2014-04-04 10:08:52', 5, '2014-04-03', '2014-04-04 17:48:22', 'c/Cristian', 2, 20, NULL, 6, NULL, '2014-04-04 17:48:22', NULL, 1, 0, NULL),
(685, 2, '2014-04-04 19:07:13', 3, '2014-04-04', '2014-04-08 10:11:45', 'VerificacoesControllerTest', 1, 5, NULL, 6, NULL, '2014-04-08 10:11:45', NULL, 1, 0, NULL),
(686, 37, '2014-04-04 19:07:25', 3, '2014-04-04', '2014-04-08 10:11:50', 'VerificacoesControllerTest', 4, 10, NULL, 6, NULL, '2014-04-08 10:11:50', NULL, 1, 0, NULL),
(687, 37, '2014-04-04 19:07:36', 3, '2014-04-04', '2014-04-08 10:11:53', 'VerificacoesControllerTest', 4, 5, NULL, 6, NULL, '2014-04-08 10:11:53', NULL, 1, 0, NULL),
(688, 58, '2014-04-04 19:08:13', 3, '2014-04-04', '2014-04-08 10:11:56', 'Relatório de verificações', 2, 10, NULL, 6, NULL, '2014-04-08 10:11:56', NULL, 1, 0, NULL),
(689, 23, '2014-04-07 13:23:31', 5, '2014-04-07', '2014-04-08 10:12:04', 'Inline method NotifyIrregularitiesController->getParkHistorico()', 3, 10, NULL, 6, NULL, '2014-04-08 10:12:04', NULL, 1, 0, NULL),
(690, 23, '2014-04-07 13:23:43', 5, '2014-04-07', '2014-04-08 10:12:06', 'c/Cristian', 3, 10, NULL, 6, NULL, '2014-04-08 10:12:06', NULL, 1, 0, NULL),
(691, 23, '2014-04-07 13:24:45', 2, '2014-04-07', '2014-04-08 10:12:09', 'Inline method NotifyIrregularitiesController->getParkHistorico()', 3, 10, NULL, 6, NULL, '2014-04-08 10:12:09', NULL, 1, 0, NULL),
(692, 23, '2014-04-07 13:25:03', 2, '2014-04-07', '2014-04-08 10:12:12', 'vinicius', 3, 10, NULL, 6, NULL, '2014-04-08 10:12:12', NULL, 1, 0, NULL),
(693, 14, '2014-04-07 17:29:20', 2, '2014-04-07', '2014-04-08 10:12:14', 'Troca da bombona d''água.', 2, 2, NULL, 6, NULL, '2014-04-08 10:12:14', NULL, 1, 0, NULL),
(695, 37, '2014-04-08 12:40:02', 4, '2014-04-08', '2014-04-08 15:37:15', 'Adicionado teste da procedure ''park_devolver_ticket'' para devoluções de compra feitos no parquímetro', 4, 5, NULL, 6, NULL, '2014-04-08 15:37:15', NULL, 1, 0, NULL),
(698, 2, '2014-04-08 13:20:32', 1, '2014-04-05', '2014-04-08 15:37:24', 'Documentação da classe de teste ParkDevolverTicketTest', 1, 5, NULL, 6, NULL, '2014-04-08 15:37:24', NULL, 1, 0, NULL),
(699, 2, '2014-04-08 13:21:01', 1, '2014-04-05', '2014-04-08 15:37:28', 'Documentação da procedure park_devolve_periodo', 1, 5, NULL, 6, NULL, '2014-04-08 15:37:28', NULL, 1, 0, NULL),
(700, 40, '2014-04-08 13:21:24', 1, '2014-04-05', '2014-04-08 15:37:35', 'TDD aplicano no teste ParkDevolverTicketTest', 4, 10, NULL, 6, NULL, '2014-04-08 15:37:35', NULL, 1, 0, NULL),
(701, 37, '2014-04-08 13:21:49', 1, '2014-04-05', '2014-04-08 15:37:40', 'Testes da ParkDevolverTicketTest', 4, 10, NULL, 6, NULL, '2014-04-08 15:37:40', NULL, 1, 0, NULL),
(702, 37, '2014-04-08 13:22:00', 1, '2014-04-05', '2014-04-08 15:37:42', 'Testes da ParkDevolverTicketTest', 4, 5, NULL, 6, NULL, '2014-04-08 15:37:42', NULL, 1, 0, NULL),
(703, 2, '2014-04-08 13:22:27', 1, '2014-04-08', '2014-04-08 15:37:44', 'Documentação da class de teste Tickets2Controller.', 1, 5, NULL, 6, NULL, '2014-04-08 15:37:44', NULL, 1, 0, NULL),
(704, 37, '2014-04-08 13:22:46', 1, '2014-04-08', '2014-04-08 15:37:46', 'Testes da classe de teste Tickets2Controller.', 4, 10, NULL, 6, NULL, '2014-04-08 15:37:46', NULL, 1, 0, NULL),
(705, 42, '2014-04-08 13:23:02', 1, '2014-04-08', '2014-04-08 15:37:48', 'Testes da  Tickets2Controller.', 4, 5, NULL, 6, NULL, '2014-04-08 15:37:48', NULL, 1, 0, NULL),
(706, 37, '2014-04-08 13:23:19', 1, '2014-04-08', '2014-04-08 15:37:50', 'Testes da Tickets2Controller.', 4, 5, NULL, 6, NULL, '2014-04-08 15:37:50', NULL, 1, 0, NULL),
(707, 42, '2014-04-09 10:02:34', 4, '2014-04-08', '2014-04-09 10:11:46', 'Alterado teste da procedure ''park_devolver_ticket'' para aceitar devolução das compras de período feitos no parquimetro', 4, 5, NULL, 6, NULL, '2014-04-09 10:11:46', NULL, 1, 0, NULL),
(708, 58, '2014-04-09 10:49:17', 3, '2014-04-09', '2014-04-09 15:35:46', 'Ranking dos operadores.', 2, 10, NULL, 6, NULL, '2014-04-09 15:35:46', NULL, 1, 0, NULL),
(709, 37, '2014-04-09 10:49:26', 3, '2014-04-09', '2014-04-09 15:36:01', 'Ranking dos operadores.', 4, 5, NULL, 6, NULL, '2014-04-09 15:36:01', NULL, 1, 0, NULL),
(710, 37, '2014-04-09 10:49:33', 3, '2014-04-09', '2014-04-09 15:36:03', 'Ranking dos operadores.', 4, 10, NULL, 6, NULL, '2014-04-09 15:36:03', NULL, 1, 0, NULL),
(711, 2, '2014-04-09 10:49:58', 3, '2014-04-09', '2014-04-09 15:36:44', 'Ranking dos operadores.', 1, 5, NULL, 6, NULL, '2014-04-09 15:36:44', NULL, 1, 0, NULL),
(713, 40, '2014-04-09 20:22:09', 1, '2014-04-09', '2014-04-10 19:45:04', 'Testes da troca de vaga/excedido no banco.', 4, 10, NULL, 6, NULL, '2014-04-10 19:45:04', NULL, 1, 0, NULL),
(714, 4, '2014-04-09 20:28:34', 1, '2014-04-09', '2014-04-10 19:45:10', 'Testes da troca de vaga/excedido no databasetests.', 1, 0, NULL, 6, NULL, '2014-04-10 19:45:10', NULL, 1, 0, NULL),
(715, 37, '2014-04-09 20:29:03', 1, '2014-04-09', '2014-04-10 19:45:13', 'Testes da troca de vaga/excedido no databasetests.', 4, 5, NULL, 6, NULL, '2014-04-10 19:45:13', NULL, 1, 0, NULL),
(716, 37, '2014-04-09 20:29:12', 1, '2014-04-09', '2014-04-10 19:45:18', 'Testes da troca de vaga/excedido no databasetests.', 4, 10, NULL, 6, NULL, '2014-04-10 19:45:18', NULL, 1, 0, NULL),
(717, 2, '2014-04-09 20:30:25', 1, '2014-04-09', '2014-04-10 19:45:28', 'Documentação dos testes vehiclelist da api.', 1, 5, NULL, 6, NULL, '2014-04-10 19:45:28', NULL, 1, 0, NULL),
(721, 42, '2014-04-09 20:33:06', 1, '2014-04-09', '2014-04-10 19:45:47', 'Testes vehiclelist da api.', 4, 5, NULL, 6, NULL, '2014-04-10 19:45:47', NULL, 1, 0, NULL),
(722, 38, '2014-04-09 20:33:27', 1, '2014-04-09', '2014-04-10 19:45:49', 'Criado teste para a lista de veículos por status na api.', 4, 15, NULL, 6, NULL, '2014-04-10 19:45:49', NULL, 1, 0, NULL),
(723, 37, '2014-04-09 20:34:05', 1, '2014-04-09', '2014-04-10 19:45:56', 'Testes vehiclelist da api.', 4, 5, NULL, 6, NULL, '2014-04-10 19:45:56', NULL, 1, 0, NULL),
(724, 37, '2014-04-09 20:34:14', 1, '2014-04-09', '2014-04-10 19:46:06', 'Testes vehiclelist da api.', 4, 10, NULL, 6, NULL, '2014-04-10 19:46:06', NULL, 1, 0, NULL),
(725, 1, '2014-04-10 10:12:25', 1, '2014-04-09', '2014-04-10 19:46:14', 'Comentários dos testes da procedure park_emitir_irregularidade.', 1, 0, NULL, 6, NULL, '2014-04-10 19:46:14', NULL, 1, 0, NULL),
(726, 40, '2014-04-10 10:12:43', 1, '2014-04-09', '2014-04-10 19:46:23', 'Nos testes da procedure park_emitir_irregularidade.', 4, 10, NULL, 6, NULL, '2014-04-10 19:46:23', NULL, 1, 0, NULL),
(727, 37, '2014-04-10 10:12:57', 1, '2014-04-09', '2014-04-10 19:46:24', 'Testes da procedure park_emitir_irregularidade.', 4, 5, NULL, 6, NULL, '2014-04-10 19:46:24', NULL, 1, 0, NULL),
(728, 37, '2014-04-10 10:13:10', 1, '2014-04-09', '2014-04-10 19:46:26', 'Testes da procedure park_emitir_irregularidade.', 4, 10, NULL, 6, NULL, '2014-04-10 19:46:26', NULL, 1, 0, NULL),
(729, 43, '2014-04-10 10:13:31', 1, '2014-04-09', '2014-04-10 19:45:44', 'Testes da procedure park_emitir_irregularidade com Davi.', 4, 10, NULL, 6, NULL, '2014-04-10 19:45:44', NULL, 1, 0, NULL),
(730, 23, '2014-04-10 12:50:53', 5, '2014-04-09', '2014-04-10 19:46:31', 'Remove middle man\r\nA API não precisa respeitar mais park_area_equipamento', 3, 10, NULL, 6, NULL, '2014-04-10 19:46:31', NULL, 1, 0, NULL),
(731, 37, '2014-04-10 12:51:42', 5, '2014-04-10', '2014-04-10 19:46:38', 'SpotsController', 4, 10, NULL, 6, NULL, '2014-04-10 19:46:38', NULL, 1, 0, NULL),
(732, 42, '2014-04-10 12:52:11', 5, '2014-04-10', '2014-04-10 19:46:58', 'SpotsControllerTest, testes nos campos das vagas', 4, 5, NULL, 6, NULL, '2014-04-10 19:46:58', NULL, 1, 0, NULL),
(733, 40, '2014-04-10 12:52:40', 5, '2014-04-10', '2014-04-10 19:47:06', 'SpotsControllerTest\r\nA API deve enviar o tipo da vaga. Testes ok', 4, 10, NULL, 6, NULL, '2014-04-10 19:47:06', NULL, 1, 0, NULL),
(734, 56, '2014-04-10 12:54:43', 5, '2014-04-10', '2014-04-10 19:47:08', 'API Multi Áreas', 3, 5, NULL, 6, NULL, '2014-04-10 19:47:08', NULL, 1, 0, NULL),
(735, 56, '2014-04-10 13:19:08', 5, '2014-04-10', '2014-04-11 10:58:24', 'S2Way API Client', 3, 5, NULL, 6, NULL, '2014-04-11 10:58:24', NULL, 1, 0, NULL),
(736, 15, '2014-04-10 19:28:18', 3, '2014-04-09', '2014-04-10 19:47:53', 'Eduardo Kanno', 2, 20, NULL, 6, NULL, '2014-04-10 19:47:53', NULL, 1, 0, NULL),
(737, 58, '2014-04-10 19:29:41', 3, '2014-04-10', '2014-04-10 19:48:02', 'Alterações no Ranking de Operadores.', 2, 10, NULL, 6, NULL, '2014-04-10 19:48:02', NULL, 1, 0, NULL),
(738, 58, '2014-04-10 19:30:01', 3, '2014-04-10', '2014-04-10 19:48:08', 'Rastreamento de monitores.', 2, 10, NULL, 6, NULL, '2014-04-10 19:48:08', NULL, 1, 0, NULL),
(739, 58, '2014-04-10 19:30:12', 3, '2014-04-10', '2014-04-10 19:48:09', 'Acerto de Caixa', 2, 10, NULL, 6, NULL, '2014-04-10 19:48:09', NULL, 1, 0, NULL),
(740, 58, '2014-04-10 19:33:22', 3, '2014-04-10', '2014-04-10 19:48:11', 'Adicionado um InfoWindow para cada operador, com as informações de quantidade de períodos e verificações na tela de monitoramento.', 2, 10, NULL, 6, NULL, '2014-04-10 19:48:11', NULL, 1, 0, NULL),
(741, 15, '2014-04-10 19:57:08', 4, '2014-04-09', '2014-04-11 10:58:29', 'Pareado durante o dia com Diego para Informações do operador no monitoramento de vagas.', 2, 20, NULL, 6, NULL, '2014-04-11 10:58:29', NULL, 1, 0, NULL),
(742, 15, '2014-04-10 19:57:13', 4, '2014-04-10', '2014-04-11 10:59:16', 'Pareado durante o dia com Diego para Informações do operador no monitoramento de vagas.', 2, 20, NULL, 6, NULL, '2014-04-11 10:59:16', NULL, 1, 0, NULL),
(743, 2, '2014-04-10 20:09:13', 1, '2014-04-10', '2014-04-11 10:58:33', 'Documentação da park_interromper_avisos.', 1, 5, NULL, 6, NULL, '2014-04-11 10:58:33', NULL, 1, 0, NULL),
(744, 15, '2014-04-10 20:09:45', 1, '2014-04-10', '2014-04-11 10:58:36', 'Com Davi', 2, 20, NULL, 6, NULL, '2014-04-11 10:58:36', NULL, 1, 0, NULL),
(745, 40, '2014-04-10 20:10:03', 1, '2014-04-10', '2014-04-11 10:58:38', 'Testes da park_interromper_avisos.', 4, 10, NULL, 6, NULL, '2014-04-11 10:58:38', NULL, 1, 0, NULL),
(746, 43, '2014-04-10 20:10:18', 1, '2014-04-10', '2014-04-11 10:58:40', 'Testes da park_interromper_avisos com Davi', 4, 10, NULL, 6, NULL, '2014-04-11 10:58:40', NULL, 1, 0, NULL),
(747, 37, '2014-04-10 20:10:27', 1, '2014-04-10', '2014-04-11 10:58:41', 'Testes da park_interromper_avisos ', 4, 10, NULL, 6, NULL, '2014-04-11 10:58:41', NULL, 1, 0, NULL),
(748, 37, '2014-04-10 20:10:33', 1, '2014-04-10', '2014-04-11 10:58:43', 'Testes da park_interromper_avisos ', 4, 5, NULL, 6, NULL, '2014-04-11 10:58:43', NULL, 1, 0, NULL),
(749, 2, '2014-04-10 20:10:51', 1, '2014-04-10', '2014-04-11 10:58:44', 'Documentação dos testes da park_interromper_avisos ', 1, 5, NULL, 6, NULL, '2014-04-11 10:58:44', NULL, 1, 0, NULL),
(750, 58, '2014-04-10 20:11:47', 1, '2014-04-10', '2014-04-11 10:58:46', 'Tarifa de recarga - todas as atividades revisadas.', 2, 10, NULL, 6, NULL, '2014-04-11 10:58:46', NULL, 1, 0, NULL),
(751, 58, '2014-04-10 20:12:07', 1, '2014-04-10', '2014-04-11 10:58:47', 'Atualização de recibos - todas as atividades revisadas.', 2, 10, NULL, 6, NULL, '2014-04-11 10:58:47', NULL, 1, 0, NULL),
(752, 58, '2014-04-10 20:12:23', 1, '2014-04-10', '2014-04-11 10:58:49', 'Bloqueio de débito automático - todas as atividades revisadas.', 2, 10, NULL, 6, NULL, '2014-04-11 10:58:49', NULL, 1, 0, NULL),
(753, 58, '2014-04-10 20:12:43', 1, '2014-04-10', '2014-04-11 10:58:51', 'Tempo excedido na troca de vaga - todas as atividades revisadas.', 2, 10, NULL, 6, NULL, '2014-04-11 10:58:51', NULL, 1, 0, NULL),
(754, 16, '2014-04-10 21:32:00', 4, '2014-04-10', '2014-04-11 10:58:55', 'Treinamento sobre o s2Batch para Vinicius.', 2, 10, NULL, 6, NULL, '2014-04-11 10:58:55', NULL, 1, 0, NULL),
(755, 3, '2014-04-11 10:40:09', 1, '2014-04-11', '2014-04-11 10:59:02', 'Adicionado termo Irregularidade.', 1, 20, NULL, 6, NULL, '2014-04-11 10:59:02', NULL, 1, 0, NULL),
(756, 3, '2014-04-11 10:40:23', 1, '2014-04-11', '2014-04-11 10:59:03', 'Adicionado termo Notificação.', 1, 20, NULL, 6, NULL, '2014-04-11 10:59:03', NULL, 1, 0, NULL),
(757, 3, '2014-04-11 10:40:32', 1, '2014-04-11', '2014-04-11 10:59:04', 'Adicionado termo Aviso.', 1, 20, NULL, 6, NULL, '2014-04-11 10:59:04', NULL, 1, 0, NULL),
(758, 5, '2014-04-11 10:40:58', 1, '2014-04-11', '2014-04-11 10:59:06', 'Adicionados comportamentos do aviso na FAQ.', 1, 50, NULL, 6, NULL, '2014-04-11 10:59:06', NULL, 1, 0, NULL),
(759, 61, '2014-04-11 17:59:13', 1, '2014-04-11', '2014-04-14 19:22:30', 'Apresentada tarifa de recarga.', 2, 10, NULL, 6, NULL, '2014-04-14 19:22:30', NULL, 1, 0, NULL),
(760, 61, '2014-04-11 17:59:25', 1, '2014-04-11', '2014-04-14 19:22:33', 'Apresentada atualização de recibos.', 2, 10, NULL, 6, NULL, '2014-04-14 19:22:33', NULL, 1, 0, NULL),
(761, 61, '2014-04-11 17:59:43', 1, '2014-04-11', '2014-04-14 19:22:35', 'Apresentado bloqueio débito automático.', 2, 10, NULL, 6, NULL, '2014-04-14 19:22:35', NULL, 1, 0, NULL),
(762, 61, '2014-04-11 18:00:02', 1, '2014-04-11', '2014-04-14 19:23:17', 'Demonstrado tempo excedido troca de vaga.', 2, 10, NULL, 6, NULL, '2014-04-14 19:23:17', NULL, 1, 0, NULL),
(763, 61, '2014-04-11 18:00:28', 1, '2014-04-11', '2014-04-14 19:23:20', 'Demonstrada vigência imediata da irregularidade.', 2, 10, NULL, 6, NULL, '2014-04-14 19:23:20', NULL, 1, 0, NULL),
(764, 61, '2014-04-11 18:03:05', 5, '2014-04-11', '2014-04-15 16:46:37', 'ok', 2, 10, NULL, 6, NULL, '2014-04-15 16:46:37', NULL, 1, 0, NULL),
(765, 37, '2014-04-14 12:03:24', 5, '2014-04-14', '2014-04-14 19:23:23', 'Máscara na placa', 4, 10, NULL, 6, NULL, '2014-04-14 19:23:23', NULL, 1, 0, NULL),
(766, 38, '2014-04-14 12:22:14', 5, '2014-04-14', '2014-04-14 19:23:30', 'ClientesControllerTest máscara na placa', 4, 15, NULL, 6, NULL, '2014-04-14 19:23:30', NULL, 1, 0, NULL),
(767, 42, '2014-04-14 12:22:50', 5, '2014-04-14', '2014-04-14 19:23:33', 'VeiculosControllerTest Máscara na placa', 4, 5, NULL, 6, NULL, '2014-04-14 19:23:33', NULL, 1, 0, NULL),
(768, 40, '2014-04-14 12:24:15', 5, '2014-04-14', '2014-04-14 19:23:34', 'máscara na placa', 4, 10, NULL, 6, NULL, '2014-04-14 19:23:34', NULL, 1, 0, NULL),
(769, 58, '2014-04-14 12:35:13', 5, '2014-04-14', '2014-04-14 19:23:39', 'máscara na placa', 2, 10, NULL, 6, NULL, '2014-04-14 19:23:39', NULL, 1, 0, NULL),
(770, 61, '2014-04-14 15:32:15', 4, '2014-04-11', '2014-04-14 19:23:43', 'Erro ao salvar posto utilizando um telefone de outro tipo de entidade.', 2, 10, NULL, 6, NULL, '2014-04-14 19:23:43', NULL, 1, 0, NULL),
(771, 61, '2014-04-14 15:32:51', 4, '2014-04-11', '2014-04-14 19:23:46', 'Adicionado checkbox para poder cadastrar placas estrangeiras no cadastro de veículo do cliente.', 2, 10, NULL, 6, NULL, '2014-04-14 19:23:46', NULL, 1, 0, NULL),
(772, 61, '2014-04-14 15:33:10', 4, '2014-04-11', '2014-04-14 19:24:13', 'Compra de Periodo chamar a park_transfere_veiculo_area', 2, 10, NULL, 6, NULL, '2014-04-14 19:24:13', NULL, 1, 0, NULL),
(773, 56, '2014-04-14 16:27:12', 5, '2014-04-14', '2014-04-15 16:48:19', 'AreasController', 3, 5, NULL, 6, NULL, '2014-04-15 16:48:19', NULL, 1, 0, NULL),
(774, 37, '2014-04-14 16:43:23', 5, '2014-04-14', '2014-04-14 19:24:30', 'MaskComponentTest', 4, 5, NULL, 6, NULL, '2014-04-14 19:24:30', NULL, 1, 0, NULL),
(775, 58, '2014-04-14 17:42:06', 3, '2014-04-14', '2014-04-14 19:24:32', 'Recuperar senha app cliente.', 2, 10, NULL, 6, NULL, '2014-04-14 19:24:32', NULL, 1, 0, NULL),
(776, 37, '2014-04-14 17:43:14', 4, '2014-04-14', '2014-04-14 19:24:36', 'Alterado teste para o campo ''ticket_id_vinculado'' da procedure ''park_transfere_veiculo_area'';', 4, 10, NULL, 6, NULL, '2014-04-14 19:24:36', NULL, 1, 0, NULL),
(777, 37, '2014-04-14 17:43:25', 4, '2014-04-14', '2014-04-14 19:24:38', 'Alterado teste para o campo ''ticket_id_vinculado'' da procedure ''park_transfere_veiculo_area'';', 4, 5, NULL, 6, NULL, '2014-04-14 19:24:38', NULL, 1, 0, NULL),
(778, 61, '2014-04-14 19:25:13', 3, '2014-04-11', '2014-04-14 19:28:33', 'Ranking dos operadores.', 2, 10, NULL, 6, NULL, '2014-04-14 19:28:33', NULL, 1, 0, NULL),
(779, 61, '2014-04-14 21:03:04', 5, '2014-04-11', '2014-04-15 16:46:41', 'tipo da vaga no app', 2, 10, NULL, 6, NULL, '2014-04-15 16:46:41', NULL, 1, 0, NULL),
(780, 63, '2014-04-15 13:22:20', 1, '2014-04-14', '2014-04-15 16:46:45', 'Databases selenium e local dropadas.', 2, 30, NULL, 6, NULL, '2014-04-15 16:46:45', NULL, 1, 0, NULL),
(781, 37, '2014-04-15 17:24:04', 5, '2014-04-15', '2014-04-16 17:53:59', 'Database test, devolução de múltiplos tickets', 4, 10, NULL, 6, NULL, '2014-04-16 17:53:59', NULL, 1, 0, NULL),
(782, 37, '2014-04-15 17:24:20', 5, '2014-04-15', '2014-04-16 17:54:02', 'Database test, devolução de múltiplos tickets', 4, 5, NULL, 6, NULL, '2014-04-16 17:54:02', NULL, 1, 0, NULL),
(783, 43, '2014-04-15 17:24:35', 5, '2014-04-15', '2014-04-16 17:54:03', 'c/Cristian', 4, 10, NULL, 6, NULL, '2014-04-16 17:54:03', NULL, 1, 0, NULL),
(784, 40, '2014-04-15 17:24:57', 5, '2014-04-15', '2014-04-16 17:54:05', 'Database test, devolução de múltiplos tickets', 4, 10, NULL, 6, NULL, '2014-04-16 17:54:05', NULL, 1, 0, NULL),
(785, 37, '2014-04-15 17:29:10', 2, '2014-04-15', '2014-04-16 17:54:07', 'Testes testDevolucaoMultiplosTickets e testDevolucaoMultiplosTickets2 em DevolverTicketTest.java.', 4, 5, NULL, 6, NULL, '2014-04-16 17:54:07', NULL, 1, 0, NULL),
(786, 37, '2014-04-15 17:29:20', 2, '2014-04-15', '2014-04-16 17:54:09', 'Testes testDevolucaoMultiplosTickets e testDevolucaoMultiplosTickets2 em DevolverTicketTest.java.', 4, 10, NULL, 6, NULL, '2014-04-16 17:54:09', NULL, 1, 0, NULL),
(787, 43, '2014-04-15 17:29:48', 2, '2014-04-15', '2014-04-16 17:54:11', 'Testes testDevolucaoMultiplosTickets e testDevolucaoMultiplosTickets2 em DevolverTicketTest.java com o Vinícius.', 4, 10, NULL, 6, NULL, '2014-04-16 17:54:11', NULL, 1, 0, NULL),
(788, 40, '2014-04-15 17:30:03', 2, '2014-04-15', '2014-04-16 17:54:14', 'Testes testDevolucaoMultiplosTickets e testDevolucaoMultiplosTickets2 em DevolverTicketTest.java.', 4, 10, NULL, 6, NULL, '2014-04-16 17:54:14', NULL, 1, 0, NULL),
(789, 15, '2014-04-16 17:26:57', 3, '2014-04-15', '2014-04-16 17:54:18', 'Eduardo', 2, 20, NULL, 6, NULL, '2014-04-16 17:54:18', NULL, 1, 0, NULL),
(790, 22, '2014-04-17 10:44:20', 1, '2014-04-17', '2014-04-17 17:22:07', 'planejamento:  	- finalizar ajustes javascritp do monitoramento de vagas  	- remover referências à view  	- remover a view  	- rodar/atualizar/melhorar testes do monitoramento e do ranking  	- rodar t', 2, 10, NULL, 6, NULL, '2014-04-17 17:22:07', NULL, 1, 0, NULL),
(791, 58, '2014-04-17 19:33:01', 1, '2014-04-17', '2014-04-22 10:53:07', 'Lentidão monitoramento vagas - todas as atividades conferidas.', 2, 10, NULL, 6, NULL, '2014-04-22 10:53:07', NULL, 1, 0, NULL),
(792, 58, '2014-04-17 19:33:40', 1, '2014-04-17', '2014-04-22 10:53:10', 'US interromper avisos - todas as atividades checadas.', 2, 10, NULL, 6, NULL, '2014-04-22 10:53:10', NULL, 1, 0, NULL),
(793, 15, '2014-04-17 19:34:20', 1, '2014-04-16', '2014-04-22 10:53:21', 'Parte do dia com Vinicius, parte do dia com Juliano', 2, 20, NULL, 6, NULL, '2014-04-22 10:53:21', NULL, 1, 0, NULL),
(794, 2, '2014-04-17 19:34:37', 1, '2014-04-17', '2014-04-22 10:53:24', 'Documentação do teste rankingoperadores.', 1, 5, NULL, 6, NULL, '2014-04-22 10:53:24', NULL, 1, 0, NULL),
(795, 2, '2014-04-17 19:34:56', 1, '2014-04-17', '2014-04-22 10:53:25', 'Documentação dos testes no monitoramentoVagas', 1, 5, NULL, 6, NULL, '2014-04-22 10:53:25', NULL, 1, 0, NULL),
(796, 37, '2014-04-17 19:35:09', 1, '2014-04-17', '2014-04-22 10:53:30', 'Testes rankingOperadores', 4, 5, NULL, 6, NULL, '2014-04-22 10:53:30', NULL, 1, 0, NULL),
(797, 37, '2014-04-17 19:35:19', 1, '2014-04-17', '2014-04-22 10:53:32', 'Testes monitoramentoVagas', 4, 5, NULL, 6, NULL, '2014-04-22 10:53:32', NULL, 1, 0, NULL),
(798, 37, '2014-04-17 19:35:30', 1, '2014-04-17', '2014-04-22 10:53:35', 'Testes monitoramentoVagas', 4, 10, NULL, 6, NULL, '2014-04-22 10:53:35', NULL, 1, 0, NULL),
(799, 37, '2014-04-17 19:35:40', 1, '2014-04-17', '2014-04-22 10:53:37', 'Testes rankingOperadores', 4, 10, NULL, 6, NULL, '2014-04-22 10:53:37', NULL, 1, 0, NULL),
(800, 42, '2014-04-17 19:35:59', 1, '2014-04-17', '2014-04-22 10:53:42', 'RankingOperadoresTest', 4, 5, NULL, 6, NULL, '2014-04-22 10:53:42', NULL, 1, 0, NULL),
(801, 42, '2014-04-17 19:36:13', 1, '2014-04-17', '2014-04-22 10:53:43', 'MonitoramentoVagasTest', 4, 5, NULL, 6, NULL, '2014-04-22 10:53:43', NULL, 1, 0, NULL),
(802, 52, '2014-04-23 10:04:40', 3, '2014-04-22', '2014-04-23 14:54:02', 'User story', 2, 3, NULL, 6, NULL, '2014-04-23 14:54:02', NULL, 1, 0, NULL),
(803, 52, '2014-04-23 10:09:10', 5, '2014-04-22', '2014-04-23 14:54:06', 'ok', 2, 3, NULL, 6, NULL, '2014-04-23 14:54:06', NULL, 1, 0, NULL),
(804, 52, '2014-04-23 10:54:17', 1, '2014-04-22', '2014-04-23 14:54:08', 'Ontem', 2, 3, NULL, 6, NULL, '2014-04-23 14:54:08', NULL, 1, 0, NULL),
(805, 37, '2014-04-23 10:55:54', 5, '2014-04-23', '2014-04-23 14:54:11', 'Reserva de Vagas', 4, 10, NULL, 6, NULL, '2014-04-23 14:54:11', NULL, 1, 0, NULL),
(806, 37, '2014-04-23 10:56:20', 5, '2014-04-23', '2014-04-23 14:54:13', 'ReservaVagasControllerTest.php', 4, 5, NULL, 6, NULL, '2014-04-23 14:54:13', NULL, 1, 0, NULL),
(807, 37, '2014-04-23 11:32:11', 4, '2014-04-22', '2014-04-23 14:54:16', 'Criado teste para relatório de clientes no SAC com busca por placa', 4, 5, NULL, 6, NULL, '2014-04-23 14:54:16', NULL, 1, 0, NULL),
(808, 40, '2014-04-23 12:30:56', 5, '2014-04-23', '2014-04-23 14:54:21', 'Reserva de Vagas', 4, 20, NULL, 6, NULL, '2014-04-23 14:54:21', NULL, 1, 0, NULL),
(809, 23, '2014-04-23 15:41:50', 5, '2014-04-23', '2014-04-24 11:09:07', 'Parameterize Method:  DatabaseUtils->getDate($modify = null)  -> DatabaseUtils->getDate($modify = null, $format = ''d/m/Y'')', 3, 10, NULL, 6, NULL, '2014-04-24 11:09:07', NULL, 1, 0, NULL),
(810, 23, '2014-04-23 15:43:00', 5, '2014-04-23', '2014-04-24 11:09:08', 'Parameterize Method:  DatabaseUtils->getDateTime($modify = null, $date = null)  -> DatabaseUtils->getDateTime($modify = null, $date = null, $format = ''Y-m-d H:i:s'')', 3, 10, NULL, 6, NULL, '2014-04-24 11:09:08', NULL, 1, 0, NULL),
(811, 42, '2014-04-23 18:02:42', 4, '2014-04-23', '2014-04-24 11:08:58', 'Teste dos campos novos no relatório de caixa. "Total Dinheiro, Acertado, Diferença Acerto."', 4, 5, NULL, 6, NULL, '2014-04-24 11:08:58', NULL, 1, 0, NULL),
(812, 37, '2014-04-23 18:02:48', 4, '2014-04-23', '2014-04-24 11:08:56', 'Teste dos campos novos no relatório de caixa. "Total Dinheiro, Acertado, Diferença Acerto."', 4, 5, NULL, 6, NULL, '2014-04-24 11:08:56', NULL, 1, 0, NULL),
(813, 52, '2014-04-23 20:05:12', 2, '2014-04-22', '2014-04-24 11:08:49', 'Estimativa reunião de planejamento Sprint 28.', 2, 3, NULL, 6, NULL, '2014-04-24 11:08:49', NULL, 1, 0, NULL),
(814, 14, '2014-04-24 10:02:40', 1, '2014-04-23', '2014-04-24 11:08:52', 'Pela tarde.', 2, 2, NULL, 6, NULL, '2014-04-24 11:08:52', NULL, 1, 0, NULL),
(815, 56, '2014-04-24 12:21:10', 5, '2014-04-24', '2014-04-28 10:44:24', 'Valor padrão nos parâmetros do s2wayApiClient', 3, 5, NULL, 6, NULL, '2014-04-28 10:44:24', NULL, 1, 0, NULL),
(816, 23, '2014-04-24 17:40:21', 5, '2014-04-24', '2014-04-28 10:44:29', 'extract method -  DataGenerator->getArea()', 3, 10, NULL, 6, NULL, '2014-04-28 10:44:29', NULL, 1, 0, NULL),
(817, 23, '2014-04-24 17:40:36', 5, '2014-04-24', '2014-04-28 10:44:34', 'extract method -  DataGenerator->getSetor()', 3, 10, NULL, 6, NULL, '2014-04-28 10:44:34', NULL, 1, 0, NULL),
(818, 23, '2014-04-24 17:41:17', 5, '2014-04-24', '2014-04-28 10:44:39', 'extract method -  DataGenerator->getAreaPonto()', 3, 10, NULL, 6, NULL, '2014-04-28 10:44:39', NULL, 1, 0, NULL),
(819, 70, '2014-04-24 19:40:19', 1, '2014-04-23', '2014-04-28 10:44:45', 'Com Cristian, com uma modificação: Cristian escreveu os testes, eu escrevi o código. ', 4, 50, NULL, 6, NULL, '2014-04-28 10:44:45', NULL, 1, 0, NULL),
(820, 70, '2014-04-24 19:42:20', 1, '2014-04-23', '2014-04-28 10:44:53', 'Com Cristian, com uma modificação: Cristian escreveu os testes, eu escrevi o código. ', 4, 50, NULL, 6, NULL, '2014-04-28 10:44:53', NULL, 1, 0, NULL),
(821, 15, '2014-04-24 19:42:49', 1, '2014-04-24', '2014-04-28 10:44:57', 'Com Cristian.', 2, 20, NULL, 6, NULL, '2014-04-28 10:44:57', NULL, 1, 0, NULL),
(822, 15, '2014-04-24 19:42:59', 1, '2014-04-23', '2014-04-28 10:45:03', 'Com Cristian.', 2, 20, NULL, 6, NULL, '2014-04-28 10:45:03', NULL, 1, 0, NULL),
(823, 58, '2014-04-24 19:44:26', 3, '2014-04-24', '2014-04-28 10:45:14', 'Adicionado opção para filtrar as vagas de todas as áreas na tela de monitoramento de vagas.', 2, 10, NULL, 6, NULL, '2014-04-28 10:45:14', NULL, 1, 0, NULL),
(824, 58, '2014-04-24 19:44:46', 3, '2014-04-24', '2014-04-28 10:45:18', 'Adicionado opção para filtrar por setor na tela de monitoramento de vagas.', 2, 10, NULL, 6, NULL, '2014-04-28 10:45:18', NULL, 1, 0, NULL),
(825, 69, '2014-04-25 12:24:18', 3, '2014-04-25', '2014-04-28 10:45:21', 'MonitoramentoVagasController', 4, 10, NULL, 6, NULL, '2014-04-28 10:45:21', NULL, 1, 0, NULL),
(826, 15, '2014-04-25 15:01:21', 2, '2014-04-24', '2014-04-28 10:45:29', 'User Story "Bônus na recarga" com o André.', 2, 20, NULL, 6, NULL, '2014-04-28 10:45:29', NULL, 1, 0, NULL),
(827, 15, '2014-04-25 15:01:35', 2, '2014-04-25', '2014-04-28 10:45:34', 'User Story "Bônus na recarga" com o André.', 2, 20, NULL, 6, NULL, '2014-04-28 10:45:34', NULL, 1, 0, NULL),
(828, 70, '2014-04-25 15:02:07', 2, '2014-04-24', '2014-04-28 10:45:40', 'User Story "Bônus na recarga" com o André.', 4, 50, NULL, 6, NULL, '2014-04-28 10:45:40', NULL, 1, 0, NULL),
(829, 15, '2014-04-28 10:18:42', 1, '2014-04-28', '2014-04-28 10:45:45', '25/04, com Cristian', 2, 20, NULL, 6, NULL, '2014-04-28 10:45:45', NULL, 1, 0, NULL),
(830, 22, '2014-04-28 10:19:32', 1, '2014-04-28', '2014-04-28 10:45:49', 'Apresentado do daily scrum de 25/04.', 2, 10, NULL, 6, NULL, '2014-04-28 10:45:49', NULL, 1, 0, NULL),
(831, 70, '2014-04-28 10:27:40', 1, '2014-04-28', '2014-04-28 10:45:54', 'Com Cristian em 25/04', 4, 50, NULL, 6, NULL, '2014-04-28 10:45:54', NULL, 1, 0, NULL),
(834, 42, '2014-04-28 10:35:38', 4, '2014-04-28', '2014-04-28 10:45:57', 'Criado testes no model Posto para simular os novos controles de índice ''cpf_cnpj/tipo'' na tabela entidade.', 4, 5, NULL, 6, NULL, '2014-04-28 10:45:57', NULL, 1, 0, NULL),
(835, 42, '2014-04-28 10:36:17', 4, '2014-04-28', '2014-04-28 10:46:13', 'Criado testes no model Entidade para simular a mensagem de erro para login Cliente e Posto com o mesmo cpf_cnpj.', 4, 5, NULL, 6, NULL, '2014-04-28 10:46:13', NULL, 1, 0, NULL),
(836, 37, '2014-04-28 10:37:06', 4, '2014-04-28', '2014-04-28 10:46:22', 'Criado classe de teste para model ''Cliente'' para simular os novos controles de índice ''cpf_cnpj/tipo''', 4, 5, NULL, 6, NULL, '2014-04-28 10:46:22', NULL, 1, 0, NULL),
(837, 37, '2014-04-28 10:38:06', 4, '2014-04-28', '2014-04-28 10:46:33', 'Criado classe de teste para model ''Cliente'' para simular os novos controles de índice ''cpf_cnpj/tipo''', 4, 10, NULL, 6, NULL, '2014-04-28 10:46:33', NULL, 1, 0, NULL),
(838, 2, '2014-04-28 10:42:31', 4, '2014-04-28', '2014-04-28 10:46:39', 'EntidadesController  -  Validação para quando existir um cpf_cnpj e seus tipos forem cliente e posto, mostrar mensagem.', 1, 5, NULL, 6, NULL, '2014-04-28 10:46:39', NULL, 1, 0, NULL),
(839, 70, '2014-04-28 10:48:53', 1, '2014-04-28', '2014-04-28 16:43:14', 'Com Cristian em 25/04', 4, 50, NULL, 6, NULL, '2014-04-28 16:43:14', NULL, 1, 0, NULL),
(840, 15, '2014-04-28 19:42:10', 5, '2014-04-28', '2014-04-29 16:55:33', 'c/Diego', 2, 20, NULL, 6, NULL, '2014-04-29 16:55:33', NULL, 1, 0, NULL),
(841, 37, '2014-04-28 19:42:58', 5, '2014-04-28', '2014-04-29 16:58:53', 'Comprar / Emitir Irregularidade / Trocar de Área', 4, 10, NULL, 6, NULL, '2014-04-29 16:58:53', NULL, 1, 0, NULL),
(842, 37, '2014-04-28 19:44:32', 5, '2014-04-28', '2014-04-29 16:59:31', 'IrregularidadeETrocaAreaTest.java', 4, 5, NULL, 6, NULL, '2014-04-29 16:59:31', NULL, 1, 0, NULL),
(843, 43, '2014-04-28 19:44:48', 5, '2014-04-28', '2014-04-29 16:59:44', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-04-29 16:59:44', NULL, 1, 0, NULL),
(844, 15, '2014-04-28 20:01:25', 1, '2014-04-28', '2014-04-29 16:59:48', 'Com Cristian.', 2, 20, NULL, 6, NULL, '2014-04-29 16:59:48', NULL, 1, 0, NULL),
(845, 70, '2014-04-28 20:01:39', 1, '2014-04-28', '2014-04-29 16:59:52', 'Com Cristian.', 4, 50, NULL, 6, NULL, '2014-04-29 16:59:52', NULL, 1, 0, NULL),
(846, 37, '2014-04-29 11:14:41', 5, '2014-04-29', '2014-04-29 16:59:58', 'Comprar Moto / Comprar Carro / Verificar em vaga de carro', 4, 10, NULL, 6, NULL, '2014-04-29 16:59:58', NULL, 1, 0, NULL),
(847, 43, '2014-04-29 11:14:55', 5, '2014-04-29', '2014-04-29 17:00:04', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-04-29 17:00:04', NULL, 1, 0, NULL),
(848, 37, '2014-04-29 11:17:19', 5, '2014-04-29', '2014-04-29 17:00:16', 'trocar de área com irregularidade', 4, 25, NULL, 6, NULL, '2014-04-29 17:00:16', NULL, 1, 0, NULL),
(849, 37, '2014-04-29 11:18:20', 5, '2014-04-29', '2014-04-29 17:00:46', 'CompraMotoCarroTest.java', 4, 5, NULL, 6, NULL, '2014-04-29 17:00:46', NULL, 1, 0, NULL),
(850, 23, '2014-04-29 11:21:05', 5, '2014-04-29', '2014-04-29 17:00:50', 'Extract method - DataGenerator.java parkPlaca()', 3, 10, NULL, 6, NULL, '2014-04-29 17:00:50', NULL, 1, 0, NULL),
(851, 23, '2014-04-29 11:21:26', 5, '2014-04-29', '2014-04-29 17:00:55', 'c/Diego', 3, 10, NULL, 6, NULL, '2014-04-29 17:00:55', NULL, 1, 0, NULL),
(852, 23, '2014-04-29 11:22:52', 5, '2014-04-29', '2014-04-29 17:01:05', 'Parameterize Method: DataGenerator.java compraPeriodoParquimetro()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:05', NULL, 1, 0, NULL),
(853, 23, '2014-04-29 11:23:11', 5, '2014-04-29', '2014-04-29 17:01:23', 'c/Diego: Parameterize Method: DataGenerator.java compraPeriodoParquimetro()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:23', NULL, 1, 0, NULL),
(854, 23, '2014-04-29 11:23:54', 5, '2014-04-29', '2014-04-29 17:01:28', 'Parameterize Method: DataGenerator.java insertIrregularidade()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:28', NULL, 1, 0, NULL),
(855, 23, '2014-04-29 11:24:15', 5, '2014-04-29', '2014-04-29 17:01:33', 'c/Diego: Parameterize Method: DataGenerator.java insertIrregularidade()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:33', NULL, 1, 0, NULL),
(856, 23, '2014-04-29 11:25:19', 5, '2014-04-29', '2014-04-29 17:01:39', 'Extract method - DataGenerator.java associadoParking()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:39', NULL, 1, 0, NULL),
(857, 23, '2014-04-29 11:25:35', 5, '2014-04-29', '2014-04-29 17:01:44', 'c/Diego: Extract method - DataGenerator.java associadoParking()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:44', NULL, 1, 0, NULL),
(858, 23, '2014-04-29 11:26:18', 5, '2014-04-29', '2014-04-29 17:01:47', 'Extract method - DataGenerator.java parkPrecoRotativo()', 3, 10, NULL, 6, NULL, '2014-04-29 17:01:47', NULL, 1, 0, NULL),
(859, 23, '2014-04-29 11:26:31', 5, '2014-04-29', '2014-04-29 17:02:29', 'c/Diego: Extract method - DataGenerator.java parkPrecoRotativo()', 3, 10, NULL, 6, NULL, '2014-04-29 17:02:29', NULL, 1, 0, NULL),
(860, 37, '2014-04-29 11:27:39', 4, '2014-04-29', '2014-04-29 17:02:34', 'Criado teste para trigger park_ticket_bu referente a opção ''IMEDIATO'' do inicio do período da área.', 4, 5, NULL, 6, NULL, '2014-04-29 17:02:34', NULL, 1, 0, NULL),
(861, 37, '2014-04-29 12:42:56', 5, '2014-04-29', '2014-04-29 17:02:42', 'Comprar Moto / Comprar Carro / Verificar em vaga de carro', 4, 25, NULL, 6, NULL, '2014-04-29 17:02:42', NULL, 1, 0, NULL),
(862, 15, '2014-04-29 12:47:19', 3, '2014-04-28', '2014-04-29 17:02:46', 'c/ Vinícius', 2, 20, NULL, 6, NULL, '2014-04-29 17:02:46', NULL, 1, 0, NULL),
(863, 37, '2014-04-29 12:47:48', 3, '2014-04-28', '2014-04-29 17:02:50', 'Comprar / Emitir Irregularidade / Trocar de Área', 4, 10, NULL, 6, NULL, '2014-04-29 17:02:50', NULL, 1, 0, NULL),
(864, 37, '2014-04-29 12:48:14', 3, '2014-04-28', '2014-04-29 17:02:54', 'IrregularidadeETrocaAreaTest.java', 4, 5, NULL, 6, NULL, '2014-04-29 17:02:54', NULL, 1, 0, NULL),
(865, 43, '2014-04-29 12:49:39', 3, '2014-04-28', '2014-04-29 17:02:57', 'c/Vinícius', 4, 10, NULL, 6, NULL, '2014-04-29 17:02:57', NULL, 1, 0, NULL),
(866, 37, '2014-04-29 12:50:14', 3, '2014-04-29', '2014-04-29 17:03:00', 'Comprar Moto / Comprar Carro / Verificar em vaga de carro', 4, 10, NULL, 6, NULL, '2014-04-29 17:03:00', NULL, 1, 0, NULL),
(868, 43, '2014-04-29 12:51:09', 3, '2014-04-29', '2014-04-29 17:03:05', 'c/ Vinícius', 4, 10, NULL, 6, NULL, '2014-04-29 17:03:05', NULL, 1, 0, NULL),
(869, 37, '2014-04-29 12:51:21', 3, '2014-04-29', '2014-04-29 17:03:09', 'trocar de área com irregularidade', 4, 25, NULL, 6, NULL, '2014-04-29 17:03:09', NULL, 1, 0, NULL),
(870, 37, '2014-04-29 12:51:33', 3, '2014-04-29', '2014-04-29 17:03:12', 'CompraMotoCarroTest.java', 4, 5, NULL, 6, NULL, '2014-04-29 17:03:12', NULL, 1, 0, NULL),
(871, 23, '2014-04-29 12:51:43', 3, '2014-04-29', '2014-04-29 17:03:16', 'Extract method - DataGenerator.java parkPlaca()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:16', NULL, 1, 0, NULL),
(872, 23, '2014-04-29 12:52:05', 3, '2014-04-29', '2014-04-29 17:03:20', 'c/Vinícius', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:20', NULL, 1, 0, NULL),
(873, 23, '2014-04-29 12:52:16', 3, '2014-04-29', '2014-04-29 17:03:23', 'Parameterize Method: DataGenerator.java compraPeriodoParquimetro()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:23', NULL, 1, 0, NULL),
(874, 23, '2014-04-29 12:52:35', 3, '2014-04-29', '2014-04-29 17:03:26', 'c/Vinícius: Parameterize Method: DataGenerator.java compraPeriodoParquimetro()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:26', NULL, 1, 0, NULL),
(875, 23, '2014-04-29 12:52:46', 3, '2014-04-29', '2014-04-29 17:03:28', 'Parameterize Method: DataGenerator.java insertIrregularidade()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:28', NULL, 1, 0, NULL),
(876, 23, '2014-04-29 12:53:20', 3, '2014-04-29', '2014-04-29 17:03:32', 'c/Vinícius: Parameterize Method: DataGenerator.java insertIrregularidade()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:32', NULL, 1, 0, NULL),
(877, 23, '2014-04-29 12:53:33', 3, '2014-04-29', '2014-04-29 17:03:34', 'Extract method - DataGenerator.java associadoParking()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:34', NULL, 1, 0, NULL),
(878, 23, '2014-04-29 12:54:02', 3, '2014-04-29', '2014-04-29 17:03:45', 'c/Vinícius: Extract method - DataGenerator.java associadoParking()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:45', NULL, 1, 0, NULL),
(879, 23, '2014-04-29 12:54:17', 3, '2014-04-29', '2014-04-29 17:03:49', 'Extract method - DataGenerator.java parkPrecoRotativo()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:49', NULL, 1, 0, NULL),
(880, 23, '2014-04-29 12:54:36', 3, '2014-04-29', '2014-04-29 17:03:54', 'c/Diego: Extract method - DataGenerator.java parkPrecoRotativo()', 3, 10, NULL, 6, NULL, '2014-04-29 17:03:54', NULL, 1, 0, NULL),
(881, 37, '2014-04-29 12:54:46', 3, '2014-04-29', '2014-04-29 17:03:57', 'Comprar Moto / Comprar Carro / Verificar em vaga de carro', 4, 25, NULL, 6, NULL, '2014-04-29 17:03:57', NULL, 1, 0, NULL),
(882, 15, '2014-04-30 10:30:41', 1, '2014-04-29', '2014-04-30 19:20:35', 'Com Cristian', 2, 20, NULL, 6, NULL, '2014-04-30 19:20:35', NULL, 1, 0, NULL),
(883, 70, '2014-04-30 10:31:00', 1, '2014-04-29', '2014-04-30 19:20:41', 'Com Cristian.', 4, 50, NULL, 6, NULL, '2014-04-30 19:20:41', NULL, 1, 0, NULL),
(884, 16, '2014-04-30 10:31:23', 1, '2014-04-29', '2014-04-30 19:20:46', 'Cake, para o Cristian.', 2, 10, NULL, 6, NULL, '2014-04-30 19:20:46', NULL, 1, 0, NULL),
(885, 37, '2014-04-30 17:45:10', 5, '2014-04-30', '2014-04-30 19:20:49', 'nsu_pagamento', 4, 10, NULL, 6, NULL, '2014-04-30 19:20:49', NULL, 1, 0, NULL),
(886, 42, '2014-04-30 17:45:35', 5, '2014-04-30', '2014-04-30 19:20:52', 'PaymentEcControllerTest.php (nsu_pagamento)', 4, 5, NULL, 6, NULL, '2014-04-30 19:20:52', NULL, 1, 0, NULL),
(887, 43, '2014-04-30 17:45:59', 5, '2014-04-30', '2014-04-30 19:20:55', 'c/Diego', 4, 10, NULL, 6, NULL, '2014-04-30 19:20:55', NULL, 1, 0, NULL),
(888, 37, '2014-04-30 17:46:21', 5, '2014-04-30', '2014-04-30 19:20:58', 'nsu_pagamento', 4, 25, NULL, 6, NULL, '2014-04-30 19:20:58', NULL, 1, 0, NULL),
(889, 15, '2014-04-30 20:31:19', 2, '2014-04-29', '2014-05-02 09:50:42', 'User Story "Bonus na recarga" com o André.', 2, 20, NULL, 6, NULL, '2014-05-02 09:50:42', NULL, 1, 0, NULL),
(890, 70, '2014-04-30 20:32:04', 2, '2014-04-29', '2014-05-02 09:50:52', 'User Story "Bonus na recarga" com o André.', 4, 50, NULL, 6, NULL, '2014-05-02 09:50:52', NULL, 1, 0, NULL),
(891, 15, '2014-04-30 20:32:43', 2, '2014-04-30', '2014-05-02 09:50:57', 'User Story "Bonus na recarga" com o André.', 2, 20, NULL, 6, NULL, '2014-05-02 09:50:57', NULL, 1, 0, NULL),
(892, 15, '2014-05-01 14:46:19', 1, '2014-04-30', '2014-05-02 09:51:01', 'Com Cristian', 2, 20, NULL, 6, NULL, '2014-05-02 09:51:01', NULL, 1, 0, NULL),
(893, 2, '2014-05-01 15:32:35', 1, '2014-04-30', '2014-05-02 09:51:08', 'Procedure concede_bonus_recarga', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:08', NULL, 1, 0, NULL),
(894, 40, '2014-05-01 15:33:47', 1, '2014-04-30', '2014-05-02 09:51:16', 'Procedure concede_bonus_recarga', 4, 20, NULL, 6, NULL, '2014-05-02 09:51:16', NULL, 1, 0, NULL),
(895, 2, '2014-05-01 15:34:14', 1, '2014-04-30', '2014-05-02 09:51:21', 'Teste procedure concede_bonus_recarga', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:21', NULL, 1, 0, NULL);
INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(896, 37, '2014-05-01 15:34:31', 1, '2014-04-30', '2014-05-02 09:51:25', 'Teste procedure concede_bonus_recarga', 4, 5, NULL, 6, NULL, '2014-05-02 09:51:25', NULL, 1, 0, NULL),
(897, 37, '2014-05-01 15:34:48', 1, '2014-04-30', '2014-05-02 09:51:28', 'Teste procedure concede_bonus_recarga', 4, 10, NULL, 6, NULL, '2014-05-02 09:51:28', NULL, 1, 0, NULL),
(898, 43, '2014-05-01 15:35:16', 1, '2014-04-30', '2014-05-02 09:51:31', 'Teste procedure concede_bonus_recarga, com Cristian.', 4, 10, NULL, 6, NULL, '2014-05-02 09:51:31', NULL, 1, 0, NULL),
(899, 2, '2014-05-01 15:35:39', 1, '2014-04-30', '2014-05-02 09:51:34', 'Evento processa_bonus_recarga.', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:34', NULL, 1, 0, NULL),
(900, 2, '2014-05-01 15:36:11', 1, '2014-04-30', '2014-05-02 09:51:37', 'Controller BonusRecarga', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:37', NULL, 1, 0, NULL),
(901, 2, '2014-05-01 15:36:28', 1, '2014-04-30', '2014-05-02 09:51:41', 'Model BonusRecarga.', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:41', NULL, 1, 0, NULL),
(902, 2, '2014-05-01 15:36:45', 1, '2014-04-30', '2014-05-02 09:51:47', 'Model Configuracao.', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:47', NULL, 1, 0, NULL),
(903, 40, '2014-05-01 15:37:09', 1, '2014-04-30', '2014-05-02 09:51:53', 'Testes cadastro bônus recarga.', 4, 20, NULL, 6, NULL, '2014-05-02 09:51:53', NULL, 1, 0, NULL),
(904, 2, '2014-05-01 15:37:18', 1, '2014-04-30', '2014-05-02 09:51:58', 'Testes cadastro bônus recarga.', 1, 5, NULL, 6, NULL, '2014-05-02 09:51:58', NULL, 1, 0, NULL),
(905, 37, '2014-05-01 15:37:32', 1, '2014-04-30', '2014-05-02 09:52:05', 'Testes cadastro bônus recarga.', 4, 5, NULL, 6, NULL, '2014-05-02 09:52:05', NULL, 1, 0, NULL),
(906, 37, '2014-05-01 15:37:45', 1, '2014-04-30', '2014-05-02 09:52:08', 'Testes cadastro bônus recarga.', 4, 10, NULL, 6, NULL, '2014-05-02 09:52:08', NULL, 1, 0, NULL),
(907, 43, '2014-05-01 15:38:02', 1, '2014-04-30', '2014-05-02 09:52:12', 'Testes cadastro bônus recarga, com Cristian.', 4, 10, NULL, 6, NULL, '2014-05-02 09:52:12', NULL, 1, 0, NULL),
(908, 2, '2014-05-01 15:38:26', 1, '2014-04-30', '2014-05-02 09:52:16', 'Testes autorizacao_bu.', 1, 5, NULL, 6, NULL, '2014-05-02 09:52:16', NULL, 1, 0, NULL),
(911, 37, '2014-05-01 15:39:28', 1, '2014-04-30', '2014-05-02 09:52:21', 'Testes autorizacao_bu.', 4, 10, NULL, 6, NULL, '2014-05-02 09:52:21', NULL, 1, 0, NULL),
(912, 37, '2014-05-01 15:39:39', 1, '2014-04-30', '2014-05-02 09:52:26', 'Testes autorizacao_bu.', 4, 5, NULL, 6, NULL, '2014-05-02 09:52:26', NULL, 1, 0, NULL),
(913, 43, '2014-05-01 15:39:55', 1, '2014-04-30', '2014-05-02 09:52:30', 'Testes autorizacao_bu, com Cristian.', 4, 10, NULL, 6, NULL, '2014-05-02 09:52:30', NULL, 1, 0, NULL),
(914, 42, '2014-05-01 15:40:46', 1, '2014-04-30', '2014-05-02 09:52:34', 'Testes autorizacao_bu, adicionados testes dos movimentos criados pelo bônus recarga.', 4, 5, NULL, 6, NULL, '2014-05-02 09:52:34', NULL, 1, 0, NULL),
(915, 37, '2014-05-02 09:51:57', 3, '2014-05-02', '2014-05-02 09:52:43', 'nsu_pagamento', 4, 10, NULL, 6, NULL, '2014-05-02 09:52:43', NULL, 1, 0, NULL),
(916, 42, '2014-05-02 09:52:34', 3, '2014-05-02', '2014-05-02 09:52:45', 'PaymentEcControllerTest(nsu_pagamento)', 4, 5, NULL, 6, NULL, '2014-05-02 09:52:45', NULL, 1, 0, NULL),
(917, 43, '2014-05-02 09:52:48', 3, '2014-05-02', '2014-05-02 09:53:13', 'c/Vinícius', 4, 10, NULL, 6, NULL, '2014-05-02 09:53:13', NULL, 1, 0, NULL),
(918, 37, '2014-05-02 09:53:01', 3, '2014-05-02', '2014-05-02 09:53:26', 'nsu_pagamento', 4, 25, NULL, 6, NULL, '2014-05-02 09:53:26', NULL, 1, 0, NULL),
(919, 37, '2014-05-02 12:25:17', 5, '2014-05-02', '2014-05-05 17:22:43', 'Cadastro automático do parquímetro', 4, 10, NULL, 6, NULL, '2014-05-05 17:22:43', NULL, 1, 0, NULL),
(920, 40, '2014-05-02 12:25:37', 5, '2014-05-02', '2014-05-05 17:22:57', 'Cadastro automático do parquímetro', 4, 20, NULL, 6, NULL, '2014-05-05 17:22:57', NULL, 1, 0, NULL),
(921, 43, '2014-05-02 12:26:53', 5, '2014-05-02', '2014-05-05 17:23:06', 'c/Diego - Cadastro automático de parquímetro', 4, 10, NULL, 6, NULL, '2014-05-05 17:23:06', NULL, 1, 0, NULL),
(922, 42, '2014-05-02 12:27:14', 5, '2014-05-02', '2014-05-05 17:23:11', 'PrivateApiAppControllerTest.php', 4, 5, NULL, 6, NULL, '2014-05-05 17:23:11', NULL, 1, 0, NULL),
(923, 2, '2014-05-02 13:31:51', 1, '2014-05-02', '2014-05-05 17:23:26', 'Testes view faturamentoPostoDetalhes', 1, 5, NULL, 6, NULL, '2014-05-05 17:23:26', NULL, 1, 0, NULL),
(924, 37, '2014-05-02 13:32:10', 1, '2014-05-02', '2014-05-05 17:23:32', 'Testes view faturamentoPostoDetalhes', 4, 10, NULL, 6, NULL, '2014-05-05 17:23:32', NULL, 1, 0, NULL),
(925, 37, '2014-05-02 13:32:17', 1, '2014-05-02', '2014-05-05 17:23:37', 'Testes view faturamentoPostoDetalhes', 4, 5, NULL, 6, NULL, '2014-05-05 17:23:37', NULL, 1, 0, NULL),
(926, 43, '2014-05-02 13:32:23', 1, '2014-05-02', '2014-05-05 17:23:40', 'Testes view faturamentoPostoDetalhes', 4, 10, NULL, 6, NULL, '2014-05-05 17:23:40', NULL, 1, 0, NULL),
(927, 69, '2014-05-02 13:35:02', 1, '2014-05-02', '2014-05-05 17:23:48', 'Teste interromper avisos - método testCarroNaoPagoVencido', 4, 10, NULL, 6, NULL, '2014-05-05 17:23:48', NULL, 1, 0, NULL),
(928, 69, '2014-05-02 15:22:41', 5, '2014-05-02', '2014-05-05 17:23:54', 'Testes do plugin cliente', 4, 10, NULL, 6, NULL, '2014-05-05 17:23:54', NULL, 1, 0, NULL),
(929, 37, '2014-05-02 15:38:16', 3, '2014-05-02', '2014-05-05 17:24:02', 'Cadastro automático do parquímetro', 4, 10, NULL, 6, NULL, '2014-05-05 17:24:02', NULL, 1, 0, NULL),
(930, 40, '2014-05-02 15:38:31', 3, '2014-05-02', '2014-05-05 17:24:07', 'Cadastro automático do parquímetro', 4, 20, NULL, 6, NULL, '2014-05-05 17:24:07', NULL, 1, 0, NULL),
(931, 43, '2014-05-02 15:39:01', 3, '2014-05-02', '2014-05-05 17:24:13', 'c/Vinícius - Cadastro automático do parquímetro', 4, 10, NULL, 6, NULL, '2014-05-05 17:24:13', NULL, 1, 0, NULL),
(932, 42, '2014-05-02 15:39:30', 3, '2014-05-02', '2014-05-05 17:24:27', 'PrivateApiAppControllerTest', 4, 5, NULL, 6, NULL, '2014-05-05 17:24:27', NULL, 1, 0, NULL),
(933, 69, '2014-05-02 16:00:42', 1, '2014-05-02', '2014-05-05 17:24:31', 'RelatorioTicketsExternosController - testFilterVaga()', 4, 10, NULL, 6, NULL, '2014-05-05 17:24:31', NULL, 1, 0, NULL),
(934, 61, '2014-05-02 17:47:25', 1, '2014-05-02', '2014-05-05 17:24:39', 'Bônus recarga', 2, 10, NULL, 6, NULL, '2014-05-05 17:24:39', NULL, 1, 0, NULL),
(935, 69, '2014-05-02 18:51:03', 2, '2014-05-02', '2014-05-05 17:24:50', 'Corrigido teste testLoginUpdateReceipts da classe de teste LoginActivityUnitTest. Foi incluido o array areasArray na resposta para a requisição de login.', 4, 10, NULL, 6, NULL, '2014-05-05 17:24:50', NULL, 1, 0, NULL),
(936, 5, '2014-05-02 19:27:38', 1, '2014-05-02', '2014-05-05 17:24:59', 'Nova entrada na FAQ: "Como funciona o bônus da recarga?"', 1, 50, NULL, 6, NULL, '2014-05-05 17:24:59', NULL, 1, 0, NULL),
(937, 61, '2014-05-05 09:47:29', 5, '2014-05-05', '2014-05-05 17:25:07', 'Cadastro automático do parquímetro', 2, 10, NULL, 6, NULL, '2014-05-05 17:25:07', NULL, 1, 0, NULL),
(938, 61, '2014-05-05 09:51:40', 5, '2014-05-05', '2014-05-05 17:25:30', 'Bug - troca de área após irregularidade', 2, 10, NULL, 6, NULL, '2014-05-05 17:25:30', NULL, 1, 0, NULL),
(939, 23, '2014-05-05 13:02:51', 5, '2014-05-05', '2014-05-05 17:25:34', 'extract method -  DataGenerator->getReserva()', 3, 10, NULL, 6, NULL, '2014-05-05 17:25:34', NULL, 1, 0, NULL),
(940, 23, '2014-05-05 13:03:14', 5, '2014-05-05', '2014-05-05 17:25:40', 'c/Eduardo - extract method -  DataGenerator->getReserva()', 3, 10, NULL, 6, NULL, '2014-05-05 17:25:40', NULL, 1, 0, NULL),
(941, 23, '2014-05-05 13:03:44', 5, '2014-05-05', '2014-05-05 17:25:54', 'extract method -  DataGenerator->getReservaVaga()', 3, 10, NULL, 6, NULL, '2014-05-05 17:25:54', NULL, 1, 0, NULL),
(942, 23, '2014-05-05 13:04:08', 5, '2014-05-05', '2014-05-05 17:26:21', 'c/Eduardo - extract method -  DataGenerator->getReservaVaga()', 3, 10, NULL, 6, NULL, '2014-05-05 17:26:21', NULL, 1, 0, NULL),
(943, 37, '2014-05-05 13:04:37', 5, '2014-05-05', '2014-05-05 17:26:29', 'Reserva de Vagas', 4, 10, NULL, 6, NULL, '2014-05-05 17:26:29', NULL, 1, 0, NULL),
(944, 42, '2014-05-05 13:09:27', 5, '2014-05-05', '2014-05-05 17:26:36', 'ReservaVagasControllerTest.php', 4, 5, NULL, 6, NULL, '2014-05-05 17:26:36', NULL, 1, 0, NULL),
(945, 42, '2014-05-05 13:09:33', 5, '2014-05-05', '2014-05-05 17:26:40', 'ReservaVagasControllerTest.php', 4, 5, NULL, 6, NULL, '2014-05-05 17:26:40', NULL, 1, 0, NULL),
(946, 43, '2014-05-05 13:10:25', 5, '2014-05-05', '2014-05-05 17:26:52', 'c/Eduardo = ReservaVagasControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-05 17:26:52', NULL, 1, 0, NULL),
(947, 37, '2014-05-05 13:10:54', 5, '2014-05-05', '2014-05-05 17:26:56', 'ReservaTest.php', 4, 5, NULL, 6, NULL, '2014-05-05 17:26:56', NULL, 1, 0, NULL),
(948, 43, '2014-05-05 13:11:19', 5, '2014-05-05', '2014-05-05 17:26:59', 'c/Eduardo - ReservaTest.php', 4, 10, NULL, 6, NULL, '2014-05-05 17:26:59', NULL, 1, 0, NULL),
(949, 37, '2014-05-05 13:11:48', 5, '2014-05-05', '2014-05-05 17:27:03', 'ReservaVagaTest.php', 4, 5, NULL, 6, NULL, '2014-05-05 17:27:03', NULL, 1, 0, NULL),
(950, 43, '2014-05-05 13:12:12', 5, '2014-05-05', '2014-05-05 17:27:06', 'c/Eduardo - ReservaVagaTest.php', 4, 10, NULL, 6, NULL, '2014-05-05 17:27:06', NULL, 1, 0, NULL),
(951, 56, '2014-05-05 13:26:21', 5, '2014-05-05', '2014-05-05 17:27:10', 'api client - grava na sessão a url da api utilizada', 3, 5, NULL, 6, NULL, '2014-05-05 17:27:10', NULL, 1, 0, NULL),
(952, 37, '2014-05-05 15:53:02', 3, '2014-05-05', '2014-05-05 17:27:17', 'Quitação de irregularidades em serviços diferentes.', 4, 25, NULL, 6, NULL, '2014-05-05 17:27:17', NULL, 1, 0, NULL),
(953, 37, '2014-05-05 15:53:08', 3, '2014-05-05', '2014-05-05 17:27:21', 'Quitação de irregularidades em serviços diferentes.', 4, 5, NULL, 6, NULL, '2014-05-05 17:27:21', NULL, 1, 0, NULL),
(954, 61, '2014-05-05 17:26:52', 3, '2014-05-05', '2014-05-05 17:27:25', 'Monitoramento de Vagas.', 2, 10, NULL, 6, NULL, '2014-05-05 17:27:25', NULL, 1, 0, NULL),
(955, 61, '2014-05-05 17:27:33', 3, '2014-05-05', '2014-05-05 17:27:41', 'Compra moto, compra carro e lança o veículo em uma vaga de carro.', 2, 10, NULL, 6, NULL, '2014-05-05 17:27:41', NULL, 1, 0, NULL),
(956, 58, '2014-05-05 19:44:55', 1, '2014-05-05', '2014-05-06 15:20:55', 'Bonus Recarga - todas as atividades concluídas.', 2, 10, NULL, 6, NULL, '2014-05-06 15:20:55', NULL, 1, 0, NULL),
(957, 58, '2014-05-05 19:45:45', 1, '2014-05-05', '2014-05-06 15:21:03', 'Bug - irregularidade VENCIDO em veículo com débito automático', 2, 10, NULL, 6, NULL, '2014-05-06 15:21:03', NULL, 1, 0, NULL),
(958, 58, '2014-05-05 19:46:12', 1, '2014-05-05', '2014-05-06 15:21:10', 'Bug - débito automático de placa inativa', 2, 10, NULL, 6, NULL, '2014-05-06 15:21:10', NULL, 1, 0, NULL),
(959, 58, '2014-05-05 19:46:34', 1, '2014-05-05', '2014-05-06 15:21:17', 'Bug - barra de períodos aparecendo para placas inativas', 2, 10, NULL, 6, NULL, '2014-05-06 15:21:17', NULL, 1, 0, NULL),
(960, 42, '2014-05-05 19:49:42', 1, '2014-05-05', '2014-05-06 15:21:25', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 4, 5, NULL, 6, NULL, '2014-05-06 15:21:25', NULL, 1, 0, NULL),
(961, 2, '2014-05-05 19:49:49', 1, '2014-05-05', '2014-05-06 15:21:33', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 1, 5, NULL, 6, NULL, '2014-05-06 15:21:33', NULL, 1, 0, NULL),
(962, 37, '2014-05-05 19:49:58', 1, '2014-05-05', '2014-05-06 15:21:39', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 4, 25, NULL, 6, NULL, '2014-05-06 15:21:39', NULL, 1, 0, NULL),
(963, 37, '2014-05-05 19:50:07', 1, '2014-05-05', '2014-05-06 15:21:50', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 4, 5, NULL, 6, NULL, '2014-05-06 15:21:50', NULL, 1, 0, NULL),
(964, 37, '2014-05-05 19:50:22', 1, '2014-05-05', '2014-05-06 15:22:05', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 4, 10, NULL, 6, NULL, '2014-05-06 15:22:05', NULL, 1, 0, NULL),
(965, 40, '2014-05-05 19:50:32', 1, '2014-05-05', '2014-05-06 15:22:19', 'Teste EmitirIrregularidadesTest - bug emitir irregularidade veículo com débito automático', 4, 20, NULL, 6, NULL, '2014-05-06 15:22:19', NULL, 1, 0, NULL),
(966, 2, '2014-05-05 19:51:07', 1, '2014-05-05', '2014-05-06 15:22:39', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 1, 5, NULL, 6, NULL, '2014-05-06 15:22:39', NULL, 1, 0, NULL),
(967, 42, '2014-05-05 19:51:56', 1, '2014-05-05', '2014-05-06 15:23:02', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 4, 5, NULL, 6, NULL, '2014-05-06 15:23:02', NULL, 1, 0, NULL),
(968, 37, '2014-05-05 19:52:05', 1, '2014-05-05', '2014-05-06 15:23:43', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 4, 5, NULL, 6, NULL, '2014-05-06 15:23:43', NULL, 1, 0, NULL),
(969, 37, '2014-05-05 19:52:13', 1, '2014-05-05', '2014-05-06 15:23:47', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 4, 10, NULL, 6, NULL, '2014-05-06 15:23:47', NULL, 1, 0, NULL),
(970, 40, '2014-05-05 19:52:20', 1, '2014-05-05', '2014-05-06 15:23:56', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 4, 20, NULL, 6, NULL, '2014-05-06 15:23:56', NULL, 1, 0, NULL),
(971, 37, '2014-05-05 19:52:28', 1, '2014-05-05', '2014-05-06 15:26:50', 'Teste VerificaVeiculoTest - bug débito automático de placa inativa', 4, 25, NULL, 6, NULL, '2014-05-06 15:26:50', NULL, 1, 0, NULL),
(972, 58, '2014-05-05 19:53:47', 1, '2014-05-05', '2014-05-06 15:26:55', 'Bug - verificação de veículo com débito automático no POS força emissão de irregularidade (Lajeado)', 2, 10, NULL, 6, NULL, '2014-05-06 15:26:55', NULL, 1, 0, NULL),
(973, 61, '2014-05-06 09:46:08', 4, '2014-05-06', '2014-05-06 15:26:59', 'Relatório de Caixa - Adição de campos : total valor dinheiro, total acertado e diferença. Adicionado nos campos de totais.', 2, 10, NULL, 6, NULL, '2014-05-06 15:26:59', NULL, 1, 0, NULL),
(974, 61, '2014-05-06 09:46:49', 4, '2014-05-06', '2014-05-06 15:27:07', 'Permitir cadastro de Cliente e Posto com o mesmo CPF e CPNJ.', 2, 10, NULL, 6, NULL, '2014-05-06 15:27:07', NULL, 1, 0, NULL),
(975, 61, '2014-05-06 09:47:45', 4, '2014-05-06', '2014-05-06 15:27:14', 'Compra de período imediato. Configuração no cadastro da área.', 2, 10, NULL, 6, NULL, '2014-05-06 15:27:14', NULL, 1, 0, NULL),
(976, 61, '2014-05-06 09:48:12', 4, '2014-05-06', '2014-05-06 15:27:20', 'Configuração de não imprimir recibos no app.', 2, 10, NULL, 6, NULL, '2014-05-06 15:27:20', NULL, 1, 0, NULL),
(977, 58, '2014-05-06 13:16:27', 1, '2014-05-06', '2014-05-06 15:27:28', 'Bug login app cliente desbloqueando a conta - todas as atividades concluídas.', 2, 10, NULL, 6, NULL, '2014-05-06 15:27:28', NULL, 1, 0, NULL),
(978, 37, '2014-05-06 13:17:15', 1, '2014-05-06', '2014-05-06 15:27:32', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro.', 4, 25, NULL, 6, NULL, '2014-05-06 15:27:32', NULL, 1, 0, NULL),
(979, 2, '2014-05-06 13:17:30', 1, '2014-05-06', '2014-05-06 15:28:41', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro - VeiculosControllerTest', 1, 5, NULL, 6, NULL, '2014-05-06 15:28:41', NULL, 1, 0, NULL),
(980, 40, '2014-05-06 13:17:38', 1, '2014-05-06', '2014-05-06 15:28:46', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro - VeiculosControllerTest', 4, 20, NULL, 6, NULL, '2014-05-06 15:28:46', NULL, 1, 0, NULL),
(981, 37, '2014-05-06 13:17:48', 1, '2014-05-06', '2014-05-06 15:28:57', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro - VeiculosControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 15:28:57', NULL, 1, 0, NULL),
(982, 37, '2014-05-06 13:17:54', 1, '2014-05-06', '2014-05-06 15:29:00', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro - VeiculosControllerTest', 4, 10, NULL, 6, NULL, '2014-05-06 15:29:00', NULL, 1, 0, NULL),
(983, 42, '2014-05-06 13:18:14', 1, '2014-05-06', '2014-05-06 15:29:55', 'Bug - placa sendo reativada no cliente A quando B efetua o cadastro - VeiculosControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 15:29:55', NULL, 1, 0, NULL),
(984, 42, '2014-05-06 13:19:08', 1, '2014-05-06', '2014-05-06 15:29:59', 'Bug - SQL ERROR quando tenta cadastrar placa já existente - VeiculosControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 15:29:59', NULL, 1, 0, NULL),
(985, 42, '2014-05-06 13:19:27', 1, '2014-05-06', '2014-05-06 15:30:03', 'VeiculosControllerTest - teste de reativação de placa.', 4, 5, NULL, 6, NULL, '2014-05-06 15:30:03', NULL, 1, 0, NULL),
(986, 2, '2014-05-06 14:54:24', 1, '2014-05-06', '2014-05-06 15:30:13', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:13', NULL, 1, 0, NULL),
(987, 37, '2014-05-06 14:54:34', 1, '2014-05-06', '2014-05-06 15:30:17', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest', 4, 10, NULL, 6, NULL, '2014-05-06 15:30:17', NULL, 1, 0, NULL),
(988, 37, '2014-05-06 14:54:41', 1, '2014-05-06', '2014-05-06 15:30:21', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 15:30:21', NULL, 1, 0, NULL),
(989, 40, '2014-05-06 14:54:47', 1, '2014-05-06', '2014-05-06 15:30:25', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest', 4, 20, NULL, 6, NULL, '2014-05-06 15:30:25', NULL, 1, 0, NULL),
(990, 37, '2014-05-06 14:54:58', 1, '2014-05-06', '2014-05-06 15:30:29', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest', 4, 25, NULL, 6, NULL, '2014-05-06 15:30:29', NULL, 1, 0, NULL),
(991, 42, '2014-05-06 14:55:11', 1, '2014-05-06', '2014-05-06 15:30:32', 'Bug - total geral no relatório de verificações - VerificacoesControllerTest - total geral', 4, 5, NULL, 6, NULL, '2014-05-06 15:30:32', NULL, 1, 0, NULL),
(992, 2, '2014-05-06 15:28:31', 4, '2014-05-06', '2014-05-06 15:30:36', 'Comentado código java script na view/add da reserva de vagas.', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:36', NULL, 1, 0, NULL),
(993, 2, '2014-05-06 15:28:56', 4, '2014-05-06', '2014-05-06 15:30:40', 'Comentado controller da classe de reserva (ReservasController).', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:40', NULL, 1, 0, NULL),
(994, 2, '2014-05-06 15:29:13', 4, '2014-05-06', '2014-05-06 15:30:43', 'Comentado classe de teste para model Reserva.', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:43', NULL, 1, 0, NULL),
(995, 2, '2014-05-06 15:29:26', 4, '2014-05-06', '2014-05-06 15:30:46', 'Comentado classe de teste para model ReservaVagas.', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:46', NULL, 1, 0, NULL),
(996, 2, '2014-05-06 15:29:46', 4, '2014-05-06', '2014-05-06 15:30:51', 'Comentado classe de teste para controller Reserva.', 1, 5, NULL, 6, NULL, '2014-05-06 15:30:51', NULL, 1, 0, NULL),
(997, 15, '2014-05-06 15:30:55', 4, '2014-05-06', '2014-05-06 15:33:16', 'Pareado com Vinícius referente ao desenvolvimento da Reserva de Vagas.', 2, 20, NULL, 6, NULL, '2014-05-06 15:33:16', NULL, 1, 0, NULL),
(998, 15, '2014-05-06 15:31:05', 4, '2014-05-05', '2014-05-06 15:33:19', 'Pareado com Vinícius referente ao desenvolvimento da Reserva de Vagas.', 2, 20, NULL, 6, NULL, '2014-05-06 15:33:19', NULL, 1, 0, NULL),
(999, 37, '2014-05-06 15:34:30', 4, '2014-05-06', '2014-05-06 15:52:29', 'Criado teste para model Reserva.', 4, 5, NULL, 6, NULL, '2014-05-06 15:52:29', NULL, 1, 0, NULL),
(1000, 37, '2014-05-06 15:34:59', 4, '2014-05-06', '2014-05-06 15:52:42', 'Criado teste para model ReservaVaga.', 4, 5, NULL, 6, NULL, '2014-05-06 15:52:42', NULL, 1, 0, NULL),
(1001, 37, '2014-05-06 15:35:14', 4, '2014-05-06', '2014-05-06 15:52:46', 'Criado teste para controller Reserva.', 4, 5, NULL, 6, NULL, '2014-05-06 15:52:46', NULL, 1, 0, NULL),
(1002, 37, '2014-05-06 15:35:48', 4, '2014-05-06', '2014-05-06 15:52:50', 'Criado teste para controller Reserva.', 4, 10, NULL, 6, NULL, '2014-05-06 15:52:50', NULL, 1, 0, NULL),
(1003, 37, '2014-05-06 15:36:04', 4, '2014-05-06', '2014-05-06 15:52:53', 'Criado teste para model Reserva.', 4, 10, NULL, 6, NULL, '2014-05-06 15:52:53', NULL, 1, 0, NULL),
(1004, 37, '2014-05-06 15:36:12', 4, '2014-05-06', '2014-05-06 15:52:58', 'Criado teste para model ReservaVaga.', 4, 10, NULL, 6, NULL, '2014-05-06 15:52:58', NULL, 1, 0, NULL),
(1005, 43, '2014-05-06 15:38:06', 4, '2014-05-06', '2014-05-06 15:53:01', 'Criado teste com Vinícius do model Reserva', 4, 10, NULL, 6, NULL, '2014-05-06 15:53:01', NULL, 1, 0, NULL),
(1006, 43, '2014-05-06 15:38:25', 4, '2014-05-06', '2014-05-06 15:53:04', 'Criado teste com Vinícius do model ReservaVaga', 4, 10, NULL, 6, NULL, '2014-05-06 15:53:04', NULL, 1, 0, NULL),
(1007, 43, '2014-05-06 15:38:46', 4, '2014-05-06', '2014-05-06 15:53:07', 'Criado teste com Vinícius do controller Reserva', 4, 10, NULL, 6, NULL, '2014-05-06 15:53:07', NULL, 1, 0, NULL),
(1008, 2, '2014-05-06 16:28:24', 1, '2014-05-06', '2014-05-06 16:59:58', 'Bug - transformar text operador em select - VerificacoesControllerTest', 1, 5, NULL, 6, NULL, '2014-05-06 16:59:58', NULL, 1, 0, NULL),
(1009, 2, '2014-05-06 16:28:32', 1, '2014-05-06', '2014-05-06 17:00:15', 'Bug - transformar text operador em select - VerificacoesController', 1, 5, NULL, 6, NULL, '2014-05-06 17:00:15', NULL, 1, 0, NULL),
(1010, 37, '2014-05-06 16:28:42', 1, '2014-05-06', '2014-05-06 17:00:26', 'Bug - transformar text operador em select - VerificacoesControllerTest', 4, 10, NULL, 6, NULL, '2014-05-06 17:00:26', NULL, 1, 0, NULL),
(1011, 37, '2014-05-06 16:28:52', 1, '2014-05-06', '2014-05-06 17:00:38', 'Bug - transformar text operador em select - VerificacoesControllerTest', 4, 25, NULL, 6, NULL, '2014-05-06 17:00:38', NULL, 1, 0, NULL),
(1012, 40, '2014-05-06 16:28:59', 1, '2014-05-06', '2014-05-06 17:00:51', 'Bug - transformar text operador em select - VerificacoesControllerTest', 4, 20, NULL, 6, NULL, '2014-05-06 17:00:51', NULL, 1, 0, NULL),
(1013, 37, '2014-05-06 16:29:10', 1, '2014-05-06', '2014-05-06 17:00:55', 'Bug - transformar text operador em select - VerificacoesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 17:00:55', NULL, 1, 0, NULL),
(1014, 42, '2014-05-06 16:29:27', 1, '2014-05-06', '2014-05-06 17:00:58', 'Bug - transformar text operador em select - VerificacoesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-06 17:00:58', NULL, 1, 0, NULL),
(1015, 72, '2014-05-06 17:01:16', 3, '2014-05-06', '2014-05-07 14:33:40', 'Adicionado código de barras no recibo de irregularidades.', 4, 10, NULL, 6, NULL, '2014-05-07 14:33:40', NULL, 1, 0, NULL),
(1016, 58, '2014-05-06 17:14:38', 1, '2014-05-06', '2014-05-07 14:33:49', 'Transformar text operadores em select - relatório de verificações. Todas as tarefas ok.', 2, 10, NULL, 6, NULL, '2014-05-07 14:33:49', NULL, 1, 0, NULL),
(1017, 72, '2014-05-06 17:15:11', 3, '2014-05-06', '2014-05-07 14:33:53', 'Conflito débito automático.', 4, 10, NULL, 6, NULL, '2014-05-07 14:33:53', NULL, 1, 0, NULL),
(1018, 43, '2014-05-06 17:16:10', 3, '2014-05-06', '2014-05-07 14:33:55', 'c/Maique conflito débito automático.', 4, 10, NULL, 6, NULL, '2014-05-07 14:33:55', NULL, 1, 0, NULL),
(1019, 72, '2014-05-07 12:46:38', 3, '2014-05-07', '2014-05-07 14:33:58', 'Monitoramento de vagas - situações não estavam carregando quando nenhuma área era selecionada.', 4, 10, NULL, 6, NULL, '2014-05-07 14:33:58', NULL, 1, 0, NULL),
(1020, 37, '2014-05-07 15:50:26', 5, '2014-05-07', '2014-05-07 19:54:29', 'erro debito automatico saldo insuficiente', 4, 10, NULL, 6, NULL, '2014-05-07 19:54:29', NULL, 1, 0, NULL),
(1021, 42, '2014-05-07 15:51:09', 5, '2014-05-07', '2014-05-07 19:54:49', 'VehiclesControllerTest - erro debito automatico saldo insuficiente', 4, 5, NULL, 6, NULL, '2014-05-07 19:54:49', NULL, 1, 0, NULL),
(1022, 43, '2014-05-07 15:51:56', 5, '2014-05-07', '2014-05-07 19:55:12', 'c/Eduardo - erro debito automatico saldo insuficiente', 4, 10, NULL, 6, NULL, '2014-05-07 19:55:12', NULL, 1, 0, NULL),
(1023, 58, '2014-05-07 17:21:53', 1, '2014-05-07', '2014-05-07 19:55:26', 'Bug total geral relatório verificações - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:55:26', NULL, 1, 0, NULL),
(1024, 58, '2014-05-07 17:23:43', 1, '2014-05-07', '2014-05-07 19:56:27', 'Bug reativação de placa em outro cliente - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:56:27', NULL, 1, 0, NULL),
(1025, 58, '2014-05-07 17:24:01', 1, '2014-05-07', '2014-05-07 19:56:32', 'Bug permissões do posto - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:56:32', NULL, 1, 0, NULL),
(1026, 58, '2014-05-07 17:24:26', 1, '2014-05-07', '2014-05-07 19:57:04', 'Bug trocar área monitoramento de veículos - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:57:04', NULL, 1, 0, NULL),
(1027, 58, '2014-05-07 17:24:42', 1, '2014-05-07', '2014-05-07 19:57:10', 'Bug notice contratos - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:57:10', NULL, 1, 0, NULL),
(1028, 58, '2014-05-07 17:25:00', 1, '2014-05-07', '2014-05-07 19:57:17', 'Bug erro ao salvar produto - todas as tarefas concluídas.', 2, 10, NULL, 6, NULL, '2014-05-07 19:57:17', NULL, 1, 0, NULL),
(1029, 37, '2014-05-07 17:32:35', 1, '2014-05-07', '2014-05-07 19:57:38', 'Bug - tratar mensagens de erro APP - CancelPurchaseControllerTest', 4, 25, NULL, 6, NULL, '2014-05-07 19:57:38', NULL, 1, 0, NULL),
(1030, 40, '2014-05-07 17:32:41', 1, '2014-05-07', '2014-05-07 19:57:49', 'Bug - tratar mensagens de erro APP - CancelPurchaseControllerTest', 4, 20, NULL, 6, NULL, '2014-05-07 19:57:49', NULL, 1, 0, NULL),
(1031, 72, '2014-05-07 17:47:33', 3, '2014-05-07', '2014-05-07 19:57:52', 'Remover polygon e polyline do monitoramento de vagas.', 4, 10, NULL, 6, NULL, '2014-05-07 19:57:52', NULL, 1, 0, NULL),
(1032, 43, '2014-05-07 17:48:02', 3, '2014-05-07', '2014-05-07 19:57:55', 'c/Eduardo - Monitoramento de vagas.', 4, 10, NULL, 6, NULL, '2014-05-07 19:57:55', NULL, 1, 0, NULL),
(1034, 71, '2014-05-07 17:50:33', 4, '2014-05-07', '2014-05-07 19:57:58', 'Com Diego. Resolvido monitoramento de vagas quanto a  busca das vagas quando selecionado apenas setores.', 2, 5, NULL, 6, NULL, '2014-05-07 19:57:58', NULL, 1, 0, NULL),
(1035, 37, '2014-05-08 11:17:50', 5, '2014-05-08', '2014-05-08 12:42:55', 'Permitir cliente trocar email', 4, 10, NULL, 6, NULL, '2014-05-08 12:42:55', NULL, 1, 0, NULL),
(1036, 43, '2014-05-08 11:18:18', 5, '2014-05-07', '2014-05-08 12:43:07', 'c/Eduardo - permitir cliente trocar email', 4, 10, NULL, 6, NULL, '2014-05-08 12:43:07', NULL, 1, 0, NULL),
(1037, 42, '2014-05-08 11:18:55', 5, '2014-05-08', '2014-05-08 12:43:14', 'EntidadesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-08 12:43:14', NULL, 1, 0, NULL),
(1038, 42, '2014-05-08 11:19:08', 5, '2014-05-08', '2014-05-08 12:43:18', 'ClienteTest', 4, 5, NULL, 6, NULL, '2014-05-08 12:43:18', NULL, 1, 0, NULL),
(1039, 37, '2014-05-08 11:19:22', 5, '2014-05-08', '2014-05-08 12:43:24', 'EntidadeTest', 4, 5, NULL, 6, NULL, '2014-05-08 12:43:24', NULL, 1, 0, NULL),
(1040, 40, '2014-05-08 11:20:03', 5, '2014-05-08', '2014-05-08 12:43:29', 'cliente trocar email', 4, 20, NULL, 6, NULL, '2014-05-08 12:43:29', NULL, 1, 0, NULL),
(1041, 72, '2014-05-08 11:33:35', 3, '2014-05-08', '2014-05-08 12:43:34', 'POS - Ao verificar um veículo com irregularidade, não é exibido até que horas o mesmo fica com essa situação.', 4, 10, NULL, 6, NULL, '2014-05-08 12:43:34', NULL, 1, 0, NULL),
(1042, 72, '2014-05-08 12:00:44', 3, '2014-05-08', '2014-05-08 12:43:41', 'Controle de caixa - exibir total geral.', 4, 10, NULL, 6, NULL, '2014-05-08 12:43:41', NULL, 1, 0, NULL),
(1043, 23, '2014-05-08 12:14:41', 1, '2014-05-08', '2014-05-08 12:43:44', 'PostosAssociadosController\\detalhes.ctp - introduce explaining variable.', 3, 10, NULL, 6, NULL, '2014-05-08 12:43:44', NULL, 1, 0, NULL),
(1044, 46, '2014-05-08 12:31:06', 4, '2014-05-08', '2014-05-08 12:42:43', 'Enviado artigo sobre a mudança de orientação na aplicação android.', 2, 10, NULL, 6, NULL, '2014-05-08 12:42:43', NULL, 1, 0, NULL),
(1045, 56, '2014-05-08 13:26:45', 5, '2014-05-08', '2014-05-08 17:54:57', 'enums no api client', 3, 5, NULL, 6, NULL, '2014-05-08 17:54:57', NULL, 1, 0, NULL),
(1046, 3, '2014-05-08 14:36:41', 1, '2014-05-08', '2014-05-08 17:55:03', 'Novo termo: Autorização', 1, 20, NULL, 6, NULL, '2014-05-08 17:55:03', NULL, 1, 0, NULL),
(1047, 37, '2014-05-08 17:06:12', 3, '2014-05-08', '2014-05-08 17:55:09', 'Erro na tela de associados.', 4, 25, NULL, 6, NULL, '2014-05-08 17:55:09', NULL, 1, 0, NULL),
(1048, 37, '2014-05-08 17:06:32', 3, '2014-05-08', '2014-05-08 17:55:17', 'AssociadosControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-08 17:55:17', NULL, 1, 0, NULL),
(1050, 37, '2014-05-08 17:07:20', 3, '2014-05-08', '2014-05-08 17:55:21', 'AssociadosControllerTest.php', 4, 5, NULL, 6, NULL, '2014-05-08 17:55:21', NULL, 1, 0, NULL),
(1051, 72, '2014-05-08 17:07:46', 3, '2014-05-08', '2014-05-08 17:55:25', 'Tela de associados.', 4, 10, NULL, 6, NULL, '2014-05-08 17:55:25', NULL, 1, 0, NULL),
(1052, 37, '2014-05-08 17:40:21', 4, '2014-05-08', '2014-05-08 17:55:30', 'Criado teste para identificar o bug de recarga para um cpf de SAC. O mesmo adicionava o valor da recarga normalmente.', 4, 25, NULL, 6, NULL, '2014-05-08 17:55:30', NULL, 1, 0, NULL),
(1053, 37, '2014-05-08 17:41:04', 4, '2014-05-08', '2014-05-08 17:55:40', 'Criado teste para recarga de cpf de SAC.', 4, 5, NULL, 6, NULL, '2014-05-08 17:55:40', NULL, 1, 0, NULL),
(1054, 38, '2014-05-08 17:41:45', 4, '2014-05-08', '2014-05-08 17:55:42', 'Criado teste para recarga de cpf de SAC.', 4, 15, NULL, 6, NULL, '2014-05-08 17:55:42', NULL, 1, 0, NULL),
(1055, 37, '2014-05-08 18:32:42', 1, '2014-05-08', '2014-05-09 10:25:11', 'Bug - excedidos não saem da lista de fiscalização - VehiclesControllerTest', 4, 25, NULL, 6, NULL, '2014-05-09 10:25:11', NULL, 1, 0, NULL),
(1056, 40, '2014-05-08 18:32:52', 1, '2014-05-08', '2014-05-09 10:25:16', 'Bug - excedidos não saem da lista de fiscalização - VehiclesControllerTest', 4, 20, NULL, 6, NULL, '2014-05-09 10:25:16', NULL, 1, 0, NULL),
(1057, 42, '2014-05-08 18:33:03', 1, '2014-05-08', '2014-05-09 10:25:20', 'Bug - excedidos não saem da lista de fiscalização - VehiclesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-09 10:25:20', NULL, 1, 0, NULL),
(1058, 37, '2014-05-08 18:33:08', 1, '2014-05-08', '2014-05-09 10:25:23', 'Bug - excedidos não saem da lista de fiscalização - VehiclesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-09 10:25:23', NULL, 1, 0, NULL),
(1059, 2, '2014-05-08 18:34:27', 1, '2014-05-08', '2014-05-09 10:25:28', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU', 1, 5, NULL, 6, NULL, '2014-05-09 10:25:28', NULL, 1, 0, NULL),
(1060, 37, '2014-05-08 18:34:55', 1, '2014-05-08', '2014-05-09 10:25:31', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU', 4, 5, NULL, 6, NULL, '2014-05-09 10:25:31', NULL, 1, 0, NULL),
(1061, 40, '2014-05-08 18:35:04', 1, '2014-05-08', '2014-05-09 10:25:34', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU', 4, 20, NULL, 6, NULL, '2014-05-09 10:25:34', NULL, 1, 0, NULL),
(1062, 37, '2014-05-08 18:35:17', 1, '2014-05-08', '2014-05-09 10:25:36', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU', 4, 25, NULL, 6, NULL, '2014-05-09 10:25:36', NULL, 1, 0, NULL),
(1063, 37, '2014-05-08 18:35:25', 1, '2014-05-08', '2014-05-09 10:25:39', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU', 4, 10, NULL, 6, NULL, '2014-05-09 10:25:39', NULL, 1, 0, NULL),
(1064, 58, '2014-05-08 18:39:09', 1, '2014-05-08', '2014-05-09 10:25:41', 'Bug - excedidos não saem da lista de fiscalização - VehiclesControllerTest', 2, 10, NULL, 6, NULL, '2014-05-09 10:25:41', NULL, 1, 0, NULL),
(1065, 2, '2014-05-09 15:13:20', 1, '2014-05-09', '2014-05-12 11:01:14', 'Bug - número histórico ativações cliente - TicketTest.php', 1, 5, NULL, 6, NULL, '2014-05-12 11:01:14', NULL, 1, 0, NULL),
(1066, 40, '2014-05-09 15:13:31', 1, '2014-05-09', '2014-05-12 11:01:21', 'Bug - número histórico ativações cliente - TicketTest.php', 4, 20, NULL, 6, NULL, '2014-05-12 11:01:21', NULL, 1, 0, NULL),
(1067, 37, '2014-05-09 15:13:36', 1, '2014-05-09', '2014-05-12 11:01:31', 'Bug - número histórico ativações cliente - TicketTest.php', 4, 25, NULL, 6, NULL, '2014-05-12 11:01:31', NULL, 1, 0, NULL),
(1068, 37, '2014-05-09 15:13:44', 1, '2014-05-09', '2014-05-12 11:01:56', 'Bug - número histórico ativações cliente - TicketTest.php', 4, 10, NULL, 6, NULL, '2014-05-12 11:01:56', NULL, 1, 0, NULL),
(1069, 37, '2014-05-09 15:13:52', 1, '2014-05-09', '2014-05-12 11:02:01', 'Bug - número histórico ativações cliente - TicketTest.php', 4, 5, NULL, 6, NULL, '2014-05-12 11:02:01', NULL, 1, 0, NULL),
(1070, 42, '2014-05-09 15:14:01', 1, '2014-05-09', '2014-05-12 11:02:13', 'Bug - número histórico ativações cliente - TicketTest.php', 4, 5, NULL, 6, NULL, '2014-05-12 11:02:13', NULL, 1, 0, NULL),
(1071, 58, '2014-05-09 15:17:15', 1, '2014-05-09', '2014-05-12 11:02:20', 'Bug - campo inserido_em do histórico não respeita horário de início da operação - AutorizacaoBU - Todas as tarefas ok.', 2, 10, NULL, 6, NULL, '2014-05-12 11:02:20', NULL, 1, 0, NULL),
(1072, 72, '2014-05-09 16:40:57', 3, '2014-05-09', '2014-05-12 11:02:30', 'Bug na paginação - Ao editar uma vaga não está mantendo a página atual.', 4, 10, NULL, 6, NULL, '2014-05-12 11:02:30', NULL, 1, 0, NULL),
(1073, 72, '2014-05-09 16:41:13', 3, '2014-05-09', '2014-05-12 11:02:35', 'Bug na paginação - Ao editar um setor não está mantendo a página atual.', 4, 10, NULL, 6, NULL, '2014-05-12 11:02:35', NULL, 1, 0, NULL),
(1074, 72, '2014-05-09 16:41:34', 3, '2014-05-09', '2014-05-12 11:02:40', 'Bug na paginação - Ao editar um operador não está mantendo a página atual.', 4, 10, NULL, 6, NULL, '2014-05-12 11:02:40', NULL, 1, 0, NULL),
(1075, 58, '2014-05-09 16:43:46', 3, '2014-05-09', '2014-05-12 11:02:45', 'Erro na paginação - VagasController', 2, 10, NULL, 6, NULL, '2014-05-12 11:02:45', NULL, 1, 0, NULL),
(1076, 58, '2014-05-09 16:43:57', 3, '2014-05-09', '2014-05-12 11:02:50', 'Erro na paginação - SetoresController', 2, 10, NULL, 6, NULL, '2014-05-12 11:02:50', NULL, 1, 0, NULL),
(1077, 58, '2014-05-09 16:44:13', 3, '2014-05-09', '2014-05-12 11:02:54', 'Erro na paginação - OperadoresController', 2, 10, NULL, 6, NULL, '2014-05-12 11:02:54', NULL, 1, 0, NULL),
(1078, 69, '2014-05-09 17:51:59', 1, '2014-05-09', '2014-05-12 11:02:59', 'AssociadosController', 4, 10, NULL, 6, NULL, '2014-05-12 11:02:59', NULL, 1, 0, NULL),
(1079, 69, '2014-05-09 17:56:05', 1, '2014-05-09', '2014-05-12 11:03:03', 'ClienteSacController', 4, 10, NULL, 6, NULL, '2014-05-12 11:03:03', NULL, 1, 0, NULL),
(1080, 69, '2014-05-09 17:56:24', 1, '2014-05-09', '2014-05-12 11:03:10', 'EntidadesController', 4, 10, NULL, 6, NULL, '2014-05-12 11:03:10', NULL, 1, 0, NULL),
(1081, 23, '2014-05-09 18:41:23', 1, '2014-05-09', '2014-05-12 11:03:13', 'Move method historico() from controller to model.', 3, 10, NULL, 6, NULL, '2014-05-12 11:03:13', NULL, 1, 0, NULL),
(1082, 69, '2014-05-09 19:05:46', 1, '2014-05-09', '2014-05-12 11:03:19', 'ClientesController', 4, 10, NULL, 6, NULL, '2014-05-12 11:03:19', NULL, 1, 0, NULL),
(1083, 69, '2014-05-09 19:06:01', 1, '2014-05-09', '2014-05-12 11:03:24', 'ModelosReciboController', 4, 10, NULL, 6, NULL, '2014-05-12 11:03:24', NULL, 1, 0, NULL),
(1084, 46, '2014-05-09 19:45:38', 1, '2014-05-09', '2014-05-12 11:03:34', 'What really speeds up your cakephp app', 2, 10, NULL, 6, NULL, '2014-05-12 11:03:34', NULL, 1, 0, NULL),
(1085, 69, '2014-05-12 10:57:52', 4, '2014-05-12', '2014-05-12 11:03:40', 'Corrigido teste do cleinte SAC Controller referente ao problema da confirmação de cadastro com mesmo CPF_CNPJ de um posto.', 4, 10, NULL, 6, NULL, '2014-05-12 11:03:40', NULL, 1, 0, NULL),
(1086, 69, '2014-05-12 11:08:08', 1, '2014-05-12', '2014-05-13 12:33:19', 'ParkPrecoCobrancaTest ', 4, 10, NULL, 6, NULL, '2014-05-13 12:33:19', NULL, 1, 0, NULL),
(1087, 58, '2014-05-12 11:52:18', 1, '2014-05-12', '2014-05-13 12:33:27', 'Bug - número histórico ativações cliente', 2, 10, NULL, 6, NULL, '2014-05-13 12:33:27', NULL, 1, 0, NULL),
(1088, 37, '2014-05-12 12:57:38', 1, '2014-05-12', '2014-05-13 12:33:35', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 4, 10, NULL, 6, NULL, '2014-05-13 12:33:35', NULL, 1, 0, NULL),
(1089, 37, '2014-05-12 12:57:47', 1, '2014-05-12', '2014-05-13 12:33:38', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 4, 25, NULL, 6, NULL, '2014-05-13 12:33:38', NULL, 1, 0, NULL),
(1090, 40, '2014-05-12 12:57:55', 1, '2014-05-12', '2014-05-13 12:33:41', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 4, 20, NULL, 6, NULL, '2014-05-13 12:33:41', NULL, 1, 0, NULL),
(1091, 37, '2014-05-12 12:58:02', 1, '2014-05-12', '2014-05-13 12:33:44', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 4, 5, NULL, 6, NULL, '2014-05-13 12:33:44', NULL, 1, 0, NULL),
(1092, 42, '2014-05-12 12:58:12', 1, '2014-05-12', '2014-05-13 12:33:47', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 4, 5, NULL, 6, NULL, '2014-05-13 12:33:47', NULL, 1, 0, NULL),
(1093, 2, '2014-05-12 12:58:28', 1, '2014-05-12', '2014-05-13 12:33:49', 'Bug - busca por placa retorna clientes com placa inativa no sac - ClientesSacControllerTest', 1, 5, NULL, 6, NULL, '2014-05-13 12:33:49', NULL, 1, 0, NULL),
(1094, 58, '2014-05-12 13:14:00', 1, '2014-05-12', '2014-05-13 12:33:54', 'Bug - busca por placa retorna clientes com placa inativa no sac', 2, 10, NULL, 6, NULL, '2014-05-13 12:33:54', NULL, 1, 0, NULL),
(1095, 52, '2014-05-13 10:21:24', 5, '2014-05-12', '2014-05-13 12:33:58', 'ok', 2, 3, NULL, 6, NULL, '2014-05-13 12:33:58', NULL, 1, 0, NULL),
(1096, 52, '2014-05-13 10:21:49', 3, '2014-05-12', '2014-05-13 12:34:01', 'User story', 2, 3, NULL, 6, NULL, '2014-05-13 12:34:01', NULL, 1, 0, NULL),
(1097, 2, '2014-05-13 15:31:58', 4, '2014-05-13', '2014-05-14 10:11:01', 'APP - Classe de teste do pagamento compra de periodo referente as tentivas de pagamento com cpf', 1, 5, NULL, 6, NULL, '2014-05-14 10:11:01', NULL, 1, 0, NULL),
(1098, 2, '2014-05-13 15:32:05', 4, '2014-05-13', '2014-05-14 10:11:08', 'APP - Classe Mock da classe do pagamento da compra de periodo referente as tentivas de pagamento com cpf', 1, 5, NULL, 6, NULL, '2014-05-14 10:11:08', NULL, 1, 0, NULL),
(1099, 37, '2014-05-13 15:32:12', 4, '2014-05-13', '2014-05-14 10:11:16', 'APP - Criar classe de pagamento pra compra de período referente as tentivas de pagamento com cpf', 4, 5, NULL, 6, NULL, '2014-05-14 10:11:16', NULL, 1, 0, NULL),
(1100, 37, '2014-05-13 15:32:22', 4, '2014-05-13', '2014-05-14 10:11:36', 'APP - Criar classe de pagamento pra compra de período referente as tentivas de pagamento com cpf', 4, 10, NULL, 6, NULL, '2014-05-14 10:11:36', NULL, 1, 0, NULL),
(1101, 37, '2014-05-14 09:53:53', 5, '2014-05-13', '2014-05-14 10:11:50', 'Irregularidade Avulsa', 4, 10, NULL, 6, NULL, '2014-05-14 10:11:50', NULL, 1, 0, NULL),
(1103, 37, '2014-05-14 09:55:22', 5, '2014-05-13', '2014-05-14 10:11:58', 'VehicleListActivityTest', 4, 5, NULL, 6, NULL, '2014-05-14 10:11:58', NULL, 1, 0, NULL),
(1104, 42, '2014-05-14 10:01:05', 5, '2014-05-13', '2014-05-14 10:12:15', 'NotifyIrregularitiesController.php', 4, 5, NULL, 6, NULL, '2014-05-14 10:12:15', NULL, 1, 0, NULL),
(1105, 43, '2014-05-14 10:01:46', 5, '2014-05-13', '2014-05-14 10:12:23', 'c/Diego - VehicleListActivityTest', 4, 10, NULL, 6, NULL, '2014-05-14 10:12:23', NULL, 1, 0, NULL),
(1106, 43, '2014-05-14 10:02:33', 5, '2014-05-13', '2014-05-14 10:12:29', 'c/Diego - NotifyIrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-14 10:12:29', NULL, 1, 0, NULL),
(1108, 23, '2014-05-14 10:04:13', 5, '2014-05-13', '2014-05-14 10:12:51', 'Inline method - NotifyIrregularitiesController->beforeFilter', 3, 10, NULL, 6, NULL, '2014-05-14 10:12:51', NULL, 1, 0, NULL),
(1110, 23, '2014-05-14 10:08:06', 5, '2014-05-13', '2014-05-14 10:12:58', 'Replace Magic Number with Symbolic Constant - Motivos de Irregularidades', 3, 10, NULL, 6, NULL, '2014-05-14 10:12:58', NULL, 1, 0, NULL),
(1111, 23, '2014-05-14 10:08:31', 5, '2014-05-13', '2014-05-14 10:13:04', 'c/Diego - Replace Magic Number with Symbolic Constant - Motivos de Irregularidades', 3, 10, NULL, 6, NULL, '2014-05-14 10:13:04', NULL, 1, 0, NULL),
(1112, 15, '2014-05-14 10:09:13', 5, '2014-05-13', '2014-05-14 10:13:10', 'c/Diego', 2, 20, NULL, 6, NULL, '2014-05-14 10:13:10', NULL, 1, 0, NULL),
(1113, 23, '2014-05-14 10:09:57', 5, '2014-05-13', '2014-05-14 10:13:13', 'c/Diego - Inline method - NotifyIrregularitiesController->beforeFilter', 3, 10, NULL, 6, NULL, '2014-05-14 10:13:13', NULL, 1, 0, NULL),
(1115, 40, '2014-05-14 10:10:53', 5, '2014-05-13', '2014-05-14 10:13:18', 'Irregularidade Avulsa', 4, 20, NULL, 6, NULL, '2014-05-14 10:13:18', NULL, 1, 0, NULL),
(1116, 37, '2014-05-14 10:14:37', 5, '2014-05-13', '2014-05-15 12:15:04', 'NotifyIrregularitiesController.php', 4, 5, NULL, 6, NULL, '2014-05-15 12:15:04', NULL, 1, 0, NULL),
(1117, 37, '2014-05-14 18:20:01', 3, '2014-05-13', '2014-05-15 12:15:12', 'Irregularidade Avulsa', 4, 10, NULL, 6, NULL, '2014-05-15 12:15:12', NULL, 1, 0, NULL),
(1118, 37, '2014-05-14 18:20:16', 3, '2014-05-13', '2014-05-15 12:15:17', 'VehicleListActivityTest', 4, 5, NULL, 6, NULL, '2014-05-15 12:15:17', NULL, 1, 0, NULL),
(1119, 42, '2014-05-14 18:20:45', 3, '2014-05-13', '2014-05-15 12:15:23', 'NotifyIrregularitiesController.php', 4, 5, NULL, 6, NULL, '2014-05-15 12:15:23', NULL, 1, 0, NULL),
(1120, 43, '2014-05-14 18:21:05', 3, '2014-05-13', '2014-05-15 12:15:27', 'c/Vinícius - VehicleListActivityTest', 4, 10, NULL, 6, NULL, '2014-05-15 12:15:27', NULL, 1, 0, NULL),
(1121, 43, '2014-05-14 18:21:28', 3, '2014-05-13', '2014-05-15 12:15:33', 'c/Vinícius - NotifyIrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-15 12:15:33', NULL, 1, 0, NULL),
(1122, 23, '2014-05-14 18:21:48', 3, '2014-05-13', '2014-05-15 12:15:42', 'Inline method - NotifyIrregularitiesController->beforeFilter', 3, 10, NULL, 6, NULL, '2014-05-15 12:15:42', NULL, 1, 0, NULL),
(1123, 23, '2014-05-14 18:21:57', 3, '2014-05-13', '2014-05-15 12:15:45', 'Replace Magic Number with Symbolic Constant - Motivos de Irregularidades', 3, 10, NULL, 6, NULL, '2014-05-15 12:15:45', NULL, 1, 0, NULL),
(1124, 23, '2014-05-14 18:22:14', 3, '2014-05-13', '2014-05-15 12:15:50', 'c/Vinícius - Replace Magic Number with Symbolic Constant - Motivos de Irregularidades', 3, 10, NULL, 6, NULL, '2014-05-15 12:15:50', NULL, 1, 0, NULL),
(1126, 15, '2014-05-14 18:23:22', 3, '2014-05-13', '2014-05-15 12:15:54', 'c/Vinícius', 2, 20, NULL, 6, NULL, '2014-05-15 12:15:54', NULL, 1, 0, NULL),
(1127, 23, '2014-05-14 18:23:43', 3, '2014-05-13', '2014-05-15 12:15:57', 'c/Vinícius - Inline method - NotifyIrregularitiesController->beforeFilter', 3, 10, NULL, 6, NULL, '2014-05-15 12:15:57', NULL, 1, 0, NULL),
(1128, 40, '2014-05-14 18:23:57', 3, '2014-05-13', '2014-05-15 12:16:02', 'Irregularidade Avulsa', 4, 20, NULL, 6, NULL, '2014-05-15 12:16:02', NULL, 1, 0, NULL),
(1129, 37, '2014-05-14 18:24:11', 3, '2014-05-13', '2014-05-15 12:16:07', 'NotifyIrregularitiesController.php', 4, 5, NULL, 6, NULL, '2014-05-15 12:16:07', NULL, 1, 0, NULL),
(1130, 37, '2014-05-14 18:25:45', 3, '2014-05-14', '2014-05-15 12:16:11', 'VehiclesControllerTest.php', 4, 25, NULL, 6, NULL, '2014-05-15 12:16:11', NULL, 1, 0, NULL),
(1131, 23, '2014-05-14 18:26:42', 3, '2014-05-14', '2014-05-15 12:16:14', 'park_transfere_veiculo_area', 3, 10, NULL, 6, NULL, '2014-05-15 12:16:14', NULL, 1, 0, NULL),
(1132, 23, '2014-05-14 18:26:53', 3, '2014-05-14', '2014-05-15 12:16:16', 'park_verifica_veiculo', 3, 10, NULL, 6, NULL, '2014-05-15 12:16:16', NULL, 1, 0, NULL),
(1133, 37, '2014-05-14 18:27:33', 3, '2014-05-14', '2014-05-15 12:16:20', 'VehiclesControllerTest.php', 4, 5, NULL, 6, NULL, '2014-05-15 12:16:20', NULL, 1, 0, NULL),
(1134, 40, '2014-05-14 18:28:59', 3, '2014-05-14', '2014-05-15 12:16:24', 'VehiclesControllerTest.php', 4, 20, NULL, 6, NULL, '2014-05-15 12:16:24', NULL, 1, 0, NULL),
(1135, 72, '2014-05-14 18:29:45', 3, '2014-05-14', '2014-05-15 12:16:27', 'Transferência de veículo com irregularidade.', 4, 10, NULL, 6, NULL, '2014-05-15 12:16:27', NULL, 1, 0, NULL),
(1136, 15, '2014-05-15 12:23:46', 5, '2014-05-14', '2014-05-16 11:43:47', 'c/Eduardo', 2, 20, NULL, 6, NULL, '2014-05-16 11:43:47', NULL, 1, 0, NULL),
(1137, 42, '2014-05-15 12:24:36', 5, '2014-05-14', '2014-05-16 11:43:56', 'PaymentParkingControllerTest', 4, 5, NULL, 6, NULL, '2014-05-16 11:43:56', NULL, 1, 0, NULL),
(1138, 43, '2014-05-15 12:24:54', 5, '2014-05-14', '2014-05-16 11:44:01', 'PaymentParkingControllerTest', 4, 10, NULL, 6, NULL, '2014-05-16 11:44:01', NULL, 1, 0, NULL),
(1139, 37, '2014-05-15 12:44:11', 5, '2014-05-14', '2014-05-16 11:46:45', 'PaymentParkingControllerTest', 4, 10, NULL, 6, NULL, '2014-05-16 11:46:45', NULL, 1, 0, NULL),
(1140, 23, '2014-05-15 15:44:15', 5, '2014-05-15', '2014-05-16 11:46:49', 'replace exception with test - Cliente.php -> isValidClient()', 3, 10, NULL, 6, NULL, '2014-05-16 11:46:49', NULL, 1, 0, NULL),
(1141, 37, '2014-05-15 18:56:44', 1, '2014-05-15', '2014-05-16 11:46:53', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 4, 10, NULL, 6, NULL, '2014-05-16 11:46:53', NULL, 1, 0, NULL),
(1142, 37, '2014-05-15 18:56:51', 1, '2014-05-15', '2014-05-16 11:46:57', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 4, 25, NULL, 6, NULL, '2014-05-16 11:46:57', NULL, 1, 0, NULL),
(1143, 40, '2014-05-15 18:56:58', 1, '2014-05-15', '2014-05-16 11:47:02', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 4, 20, NULL, 6, NULL, '2014-05-16 11:47:02', NULL, 1, 0, NULL),
(1144, 37, '2014-05-15 18:57:10', 1, '2014-05-15', '2014-05-16 11:47:06', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 4, 5, NULL, 6, NULL, '2014-05-16 11:47:06', NULL, 1, 0, NULL),
(1145, 42, '2014-05-15 18:57:18', 1, '2014-05-15', '2014-05-16 11:47:11', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 4, 5, NULL, 6, NULL, '2014-05-16 11:47:11', NULL, 1, 0, NULL),
(1146, 69, '2014-05-15 18:58:15', 1, '2014-05-15', '2014-05-16 11:47:15', 'Adicionado @Ignore ao método testVagaIncompativelComTipoDeVeiculo do teste ParkVerificaVeiculo, pois a validação foi comentada na procedure.', 4, 10, NULL, 6, NULL, '2014-05-16 11:47:15', NULL, 1, 0, NULL),
(1147, 2, '2014-05-15 18:58:47', 1, '2014-05-15', '2014-05-16 11:47:22', 'Correção bug trocou_vaga sendo setado quando veículo sai da vaga zero - VerificaVeiculoTest', 1, 5, NULL, 6, NULL, '2014-05-16 11:47:22', NULL, 1, 0, NULL),
(1148, 23, '2014-05-16 12:41:46', 5, '2014-05-15', '2014-05-19 10:10:50', 'Substitute Algorithm - IrregularitiesController->index()', 3, 10, NULL, 6, NULL, '2014-05-19 10:10:50', NULL, 1, 0, NULL),
(1149, 42, '2014-05-16 12:42:56', 5, '2014-05-15', '2014-05-19 10:10:59', 'IrregularitiesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-19 10:10:59', NULL, 1, 0, NULL),
(1150, 37, '2014-05-16 12:43:35', 5, '2014-05-16', '2014-05-19 10:11:07', 'Tickets comprados antes do início da operação', 4, 10, NULL, 6, NULL, '2014-05-19 10:11:07', NULL, 1, 0, NULL),
(1151, 37, '2014-05-16 12:44:04', 5, '2014-05-16', '2014-05-19 10:11:14', 'TicketBeforeUpdateTest - Tickets comprados antes do início da operação', 4, 5, NULL, 6, NULL, '2014-05-19 10:11:14', NULL, 1, 0, NULL),
(1152, 40, '2014-05-16 12:44:19', 5, '2014-05-16', '2014-05-19 10:11:24', 'TicketBeforeUpdateTest - Tickets comprados antes do início da operação', 4, 20, NULL, 6, NULL, '2014-05-19 10:11:24', NULL, 1, 0, NULL),
(1153, 37, '2014-05-16 12:44:34', 5, '2014-05-16', '2014-05-19 10:11:38', 'TicketBeforeUpdateTest - Tickets comprados antes do início da operação', 4, 25, NULL, 6, NULL, '2014-05-19 10:11:38', NULL, 1, 0, NULL),
(1154, 43, '2014-05-16 12:44:57', 5, '2014-05-16', '2014-05-19 10:11:46', 'c/André - TicketBeforeUpdateTest - Tickets comprados antes do início da operação', 4, 10, NULL, 6, NULL, '2014-05-19 10:11:46', NULL, 1, 0, NULL),
(1155, 42, '2014-05-16 12:45:40', 5, '2014-05-16', '2014-05-19 10:11:52', 'TicketBeforeUpdateTest', 4, 5, NULL, 6, NULL, '2014-05-19 10:11:52', NULL, 1, 0, NULL),
(1156, 37, '2014-05-16 12:47:25', 4, '2014-05-16', '2014-05-19 10:11:57', 'Criado teste para consulta de cliente no login do SAC quando não escolhido nenhum filtro.', 4, 5, NULL, 6, NULL, '2014-05-19 10:11:57', NULL, 1, 0, NULL),
(1157, 38, '2014-05-16 12:47:49', 4, '2014-05-16', '2014-05-19 10:12:01', 'Criado teste para consulta de cliente no login do SAC quando não escolhido nenhum filtro.', 4, 15, NULL, 6, NULL, '2014-05-19 10:12:01', NULL, 1, 0, NULL),
(1158, 37, '2014-05-16 12:51:59', 1, '2014-05-16', '2014-05-19 10:12:06', 'Bug - tickets empilhando quando comprados antes do início da operação.', 4, 10, NULL, 6, NULL, '2014-05-19 10:12:06', NULL, 1, 0, NULL),
(1159, 37, '2014-05-16 12:52:05', 1, '2014-05-16', '2014-05-19 10:12:12', 'Bug - tickets empilhando quando comprados antes do início da operação.', 4, 25, NULL, 6, NULL, '2014-05-19 10:12:12', NULL, 1, 0, NULL);
INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(1160, 40, '2014-05-16 12:52:12', 1, '2014-05-16', '2014-05-19 10:12:19', 'Bug - tickets empilhando quando comprados antes do início da operação.', 4, 20, NULL, 6, NULL, '2014-05-19 10:12:19', NULL, 1, 0, NULL),
(1161, 43, '2014-05-16 12:52:24', 1, '2014-05-16', '2014-05-19 10:12:28', 'Bug - tickets empilhando quando comprados antes do início da operação - com Vinícius.', 4, 10, NULL, 6, NULL, '2014-05-19 10:12:28', NULL, 1, 0, NULL),
(1162, 37, '2014-05-16 12:52:33', 1, '2014-05-16', '2014-05-19 10:12:32', 'Bug - tickets empilhando quando comprados antes do início da operação.', 4, 5, NULL, 6, NULL, '2014-05-19 10:12:32', NULL, 1, 0, NULL),
(1163, 42, '2014-05-16 12:52:49', 1, '2014-05-16', '2014-05-19 10:12:38', 'Bug - tickets empilhando quando comprados antes do início da operação - TicketBeforeUpdateTest', 4, 5, NULL, 6, NULL, '2014-05-19 10:12:38', NULL, 1, 0, NULL),
(1164, 72, '2014-05-16 12:54:40', 1, '2014-05-16', '2014-05-19 10:12:42', 'Bug - tickets empilhando quando comprados antes do início da operação.', 4, 10, NULL, 6, NULL, '2014-05-19 10:12:42', NULL, 1, 0, NULL),
(1165, 2, '2014-05-16 12:55:00', 1, '2014-05-16', '2014-05-19 10:12:53', 'Bug - tickets empilhando quando comprados antes do início da operação - TicketBeforeUpdateTest', 1, 5, NULL, 6, NULL, '2014-05-19 10:12:53', NULL, 1, 0, NULL),
(1166, 17, '2014-05-16 16:45:12', 5, '2014-05-15', '2014-05-19 10:13:01', 'ok', 2, 2, NULL, 6, NULL, '2014-05-19 10:13:01', NULL, 1, 0, NULL),
(1167, 23, '2014-05-16 19:44:59', 3, '2014-05-16', '2014-05-19 10:13:05', 'park_transfere_veiculo_area - removido parâmetro preco_id da procedure. Pois o preço é calculado a partir da cobrança.', 3, 10, NULL, 6, NULL, '2014-05-19 10:13:05', NULL, 1, 0, NULL),
(1168, 37, '2014-05-16 19:46:29', 3, '2014-05-16', '2014-05-19 10:13:12', 'Erro ao quitar irregularidades em áreas diferentes.', 4, 25, NULL, 6, NULL, '2014-05-19 10:13:12', NULL, 1, 0, NULL),
(1169, 72, '2014-05-16 19:47:03', 3, '2014-05-16', '2014-05-19 10:13:21', 'Quitar irregularidades em áreas diferentes.', 4, 10, NULL, 6, NULL, '2014-05-19 10:13:21', NULL, 1, 0, NULL),
(1170, 37, '2014-05-16 19:47:30', 3, '2014-05-16', '2014-05-19 10:13:26', 'Criado teste da activity Irregularities.', 4, 10, NULL, 6, NULL, '2014-05-19 10:13:26', NULL, 1, 0, NULL),
(1171, 37, '2014-05-16 19:47:44', 3, '2014-05-16', '2014-05-19 10:13:30', 'IrregularitiesActivityTest.', 4, 5, NULL, 6, NULL, '2014-05-19 10:13:30', NULL, 1, 0, NULL),
(1172, 40, '2014-05-16 19:48:02', 3, '2014-05-16', '2014-05-19 10:13:35', 'Quitação de irregularidades', 4, 20, NULL, 6, NULL, '2014-05-19 10:13:35', NULL, 1, 0, NULL),
(1173, 58, '2014-05-16 19:48:47', 3, '2014-05-16', '2014-05-19 10:13:39', 'Quitação de irregularidades com áreas diferentes.', 2, 10, NULL, 6, NULL, '2014-05-19 10:13:39', NULL, 1, 0, NULL),
(1174, 23, '2014-05-19 17:04:40', 5, '2014-05-19', '2014-05-20 11:02:18', 'Inline Class : NotifyIrregularityController', 3, 10, NULL, 6, NULL, '2014-05-20 11:02:18', NULL, 1, 0, NULL),
(1175, 42, '2014-05-19 17:05:29', 5, '2014-05-19', '2014-05-20 11:14:13', 'NotifyIrregularityControllerTest', 4, 5, NULL, 6, NULL, '2014-05-20 11:14:13', NULL, 1, 0, NULL),
(1176, 43, '2014-05-19 17:08:57', 5, '2014-05-19', '2014-05-20 11:14:53', 'c/Diego - NotifyIrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-20 11:14:53', NULL, 1, 0, NULL),
(1177, 23, '2014-05-19 17:09:25', 5, '2014-05-19', '2014-05-20 11:14:58', 'c/Diego - InlineClass : NotifyIOrregularityController', 3, 10, NULL, 6, NULL, '2014-05-20 11:14:58', NULL, 1, 0, NULL),
(1178, 23, '2014-05-19 17:11:37', 5, '2014-05-19', '2014-05-20 11:15:02', 'extract module : IrregularityComponent', 3, 10, NULL, 6, NULL, '2014-05-20 11:15:02', NULL, 1, 0, NULL),
(1179, 23, '2014-05-19 17:11:52', 5, '2014-05-19', '2014-05-20 11:15:07', 'c/Diego - extract module : IrregularityComponent', 3, 10, NULL, 6, NULL, '2014-05-20 11:15:07', NULL, 1, 0, NULL),
(1180, 42, '2014-05-19 17:12:16', 5, '2014-05-19', '2014-05-20 11:15:22', 'IrregularitiesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-20 11:15:22', NULL, 1, 0, NULL),
(1181, 43, '2014-05-19 17:13:05', 5, '2014-05-19', '2014-05-20 11:15:28', 'c/Diego - IrregularitiesControllerTest', 4, 10, NULL, 6, NULL, '2014-05-20 11:15:28', NULL, 1, 0, NULL),
(1182, 23, '2014-05-19 17:14:09', 5, '2014-05-19', '2014-05-20 11:15:36', 'extract module: AdvancedDBComponent', 3, 10, NULL, 6, NULL, '2014-05-20 11:15:36', NULL, 1, 0, NULL),
(1183, 23, '2014-05-19 17:14:36', 5, '2014-05-19', '2014-05-20 11:15:43', 'c/Diego: extract module: AdvancedDBComponent', 3, 10, NULL, 6, NULL, '2014-05-20 11:15:43', NULL, 1, 0, NULL),
(1184, 69, '2014-05-19 17:17:11', 1, '2014-05-19', '2014-05-20 11:16:25', 'MovimentaContaTest - métodos testCompraCPFSemSaldo() e testCompraCPFComSaldo()', 4, 10, NULL, 6, NULL, '2014-05-20 11:16:25', NULL, 1, 0, NULL),
(1186, 37, '2014-05-19 19:09:49', 1, '2014-05-19', '2014-05-20 11:16:32', 'FaturamentoPostoDetalhesTest', 4, 10, NULL, 6, NULL, '2014-05-20 11:16:32', NULL, 1, 0, NULL),
(1187, 37, '2014-05-19 19:10:04', 1, '2014-05-19', '2014-05-20 11:16:42', 'FaturamentoPostoDetalhesTest', 4, 5, NULL, 6, NULL, '2014-05-20 11:16:42', NULL, 1, 0, NULL),
(1189, 42, '2014-05-19 19:10:18', 1, '2014-05-19', '2014-05-20 11:17:24', 'FaturamentoPostoDetalhesTest', 4, 5, NULL, 6, NULL, '2014-05-20 11:17:24', NULL, 1, 0, NULL),
(1190, 72, '2014-05-19 19:10:27', 1, '2014-05-19', '2014-05-20 11:17:27', 'FaturamentoPostoDetalhesTest', 4, 10, NULL, 6, NULL, '2014-05-20 11:17:27', NULL, 1, 0, NULL),
(1191, 2, '2014-05-20 09:58:22', 4, '2014-05-19', '2014-05-20 11:17:32', 'PagSeguroProcess - Classe de processamento do pagSeguro no projeto s2Batch', 1, 5, NULL, 6, NULL, '2014-05-20 11:17:32', NULL, 1, 0, NULL),
(1192, 2, '2014-05-20 09:58:40', 4, '2014-05-19', '2014-05-20 11:17:36', 'PagSeguroProcessMock - Classe de processamento mockado para teste do pagSeguro no projeto s2Batch', 1, 5, NULL, 6, NULL, '2014-05-20 11:17:36', NULL, 1, 0, NULL),
(1193, 2, '2014-05-20 09:58:48', 4, '2014-05-19', '2014-05-20 11:17:39', 'PagSeguroProcessMock - Classe de processamento mockado para teste do pagSeguro no projeto s2Batch', 1, 5, NULL, 6, NULL, '2014-05-20 11:17:39', NULL, 1, 0, NULL),
(1194, 2, '2014-05-20 09:59:34', 4, '2014-05-19', '2014-05-20 11:17:43', 'PagSeguroProcessTest - Classe de teste para processamento do pagSeguro no projeto s2Batch', 1, 5, NULL, 6, NULL, '2014-05-20 11:17:43', NULL, 1, 0, NULL),
(1195, 37, '2014-05-20 09:59:48', 4, '2014-05-19', '2014-05-20 11:17:46', 'PagSeguroProcessTest - Classe de teste para processamento do pagSeguro no projeto s2Batch', 4, 5, NULL, 6, NULL, '2014-05-20 11:17:46', NULL, 1, 0, NULL),
(1196, 37, '2014-05-20 10:00:19', 4, '2014-05-19', '2014-05-20 11:17:50', 'PagSeguroProcessTest - Classe de teste para processamento do pagSeguro no projeto s2Batch', 4, 10, NULL, 6, NULL, '2014-05-20 11:17:50', NULL, 1, 0, NULL),
(1197, 2, '2014-05-20 11:22:57', 1, '2014-05-20', '2014-05-20 17:14:04', 'FaturamentoPostoDetalhesTest', 1, 5, NULL, 6, NULL, '2014-05-20 17:14:04', NULL, 1, 0, NULL),
(1198, 37, '2014-05-20 11:23:23', 1, '2014-05-20', '2014-05-20 16:55:41', 'FaturamentoAssociadoDetalhesTest', 4, 10, NULL, 6, NULL, '2014-05-20 16:55:41', NULL, 1, 0, NULL),
(1199, 37, '2014-05-20 11:23:39', 1, '2014-05-20', '2014-05-20 16:54:57', 'FaturamentoAssociadoDetalhesTest', 4, 5, NULL, 6, NULL, '2014-05-20 16:54:57', NULL, 1, 0, NULL),
(1200, 42, '2014-05-20 11:23:49', 1, '2014-05-20', '2014-05-20 16:54:25', 'FaturamentoAssociadoDetalhesTest', 4, 5, NULL, 6, NULL, '2014-05-20 16:54:25', NULL, 1, 0, NULL),
(1201, 72, '2014-05-20 11:23:58', 1, '2014-05-20', '2014-05-20 16:54:16', 'FaturamentoAssociadoDetalhesTest', 4, 10, NULL, 6, NULL, '2014-05-20 16:54:16', NULL, 1, 0, NULL),
(1202, 2, '2014-05-20 11:24:05', 1, '2014-05-20', '2014-05-20 16:54:06', 'FaturamentoAssociadoDetalhesTest', 1, 5, NULL, 6, NULL, '2014-05-20 16:54:06', NULL, 1, 0, NULL),
(1203, 23, '2014-05-20 12:28:24', 3, '2014-05-19', '2014-05-20 16:53:56', 'Inline Class: Inline Class : NotifyIrregularityController', 3, 10, NULL, 6, NULL, '2014-05-20 16:53:56', NULL, 1, 0, NULL),
(1204, 42, '2014-05-20 12:28:48', 3, '2014-05-19', '2014-05-20 16:53:49', 'NotifyIrregularityControllerTest', 4, 5, NULL, 6, NULL, '2014-05-20 16:53:49', NULL, 1, 0, NULL),
(1205, 43, '2014-05-20 12:29:05', 3, '2014-05-19', '2014-05-20 16:53:44', 'c/Vinícius - NotifyIrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-05-20 16:53:44', NULL, 1, 0, NULL),
(1206, 23, '2014-05-20 12:29:28', 3, '2014-05-19', '2014-05-20 16:52:55', 'c/Vinícius - InlineClass : NotifyIOrregularityController', 3, 10, NULL, 6, NULL, '2014-05-20 16:52:55', NULL, 1, 0, NULL),
(1207, 23, '2014-05-20 12:29:41', 3, '2014-05-19', '2014-05-20 16:52:43', 'extract module : IrregularityComponent', 3, 10, NULL, 6, NULL, '2014-05-20 16:52:43', NULL, 1, 0, NULL),
(1208, 23, '2014-05-20 12:29:58', 3, '2014-05-19', '2014-05-20 16:52:25', 'c/Vinícius - extract module : IrregularityComponent', 3, 10, NULL, 6, NULL, '2014-05-20 16:52:25', NULL, 1, 0, NULL),
(1209, 42, '2014-05-20 12:30:15', 3, '2014-05-19', '2014-05-20 16:52:03', 'IrregularitiesControllerTest', 4, 5, NULL, 6, NULL, '2014-05-20 16:52:03', NULL, 1, 0, NULL),
(1210, 43, '2014-05-20 12:30:36', 3, '2014-05-19', '2014-05-20 16:51:37', 'c/Vinícius - IrregularitiesControllerTest', 4, 10, NULL, 6, NULL, '2014-05-20 16:51:37', NULL, 1, 0, NULL),
(1211, 23, '2014-05-20 12:30:46', 3, '2014-05-19', '2014-05-20 16:51:33', 'extract module: AdvancedDBComponent', 3, 10, NULL, 6, NULL, '2014-05-20 16:51:33', NULL, 1, 0, NULL),
(1212, 23, '2014-05-20 12:31:10', 3, '2014-05-19', '2014-05-20 16:51:21', 'c/Vinícius: extract module: AdvancedDBComponent', 3, 10, NULL, 6, NULL, '2014-05-20 16:51:21', NULL, 1, 0, NULL),
(1213, 14, '2014-05-20 15:41:31', 4, '2014-05-20', '2014-05-20 16:51:07', 'Trocado garrafa de água no início da tarde.', 2, 2, NULL, 6, NULL, '2014-05-20 16:51:07', NULL, 1, 0, NULL),
(1214, 72, '2014-05-21 11:04:25', 3, '2014-05-20', '2014-05-22 10:27:47', 'Teste de impressão no APP.', 4, 10, NULL, 6, NULL, '2014-05-22 10:27:47', NULL, 1, 0, NULL),
(1215, 58, '2014-05-21 11:05:09', 3, '2014-05-20', '2014-05-22 10:27:51', 'Criado menu para testar a comunicação e impressão com a impressora.', 2, 10, NULL, 6, NULL, '2014-05-22 10:27:51', NULL, 1, 0, NULL),
(1216, 43, '2014-05-21 11:09:56', 3, '2014-05-21', '2014-05-22 10:27:54', 'c/Eduardo - POS cria mais de 1 recarga.', 4, 10, NULL, 6, NULL, '2014-05-22 10:27:54', NULL, 1, 0, NULL),
(1217, 72, '2014-05-21 11:10:46', 3, '2014-05-21', '2014-05-22 10:27:57', 'Testes de recargas no POS.', 4, 10, NULL, 6, NULL, '2014-05-22 10:27:57', NULL, 1, 0, NULL),
(1219, 37, '2014-05-22 10:54:49', 1, '2014-05-22', '2014-05-22 16:57:07', 'AutorizacaoBUTest', 4, 10, NULL, 6, NULL, '2014-05-22 16:57:07', NULL, 1, 0, NULL),
(1220, 37, '2014-05-22 10:55:16', 1, '2014-05-22', '2014-05-22 16:57:11', 'AutorizacaoBUTest - movimentos de comissão de posto e taxa adm produto não estavam sendo gerados na compra em dinheiro no posto', 4, 25, NULL, 6, NULL, '2014-05-22 16:57:11', NULL, 1, 0, NULL),
(1221, 40, '2014-05-22 10:55:28', 1, '2014-05-22', '2014-05-22 16:57:16', 'AutorizacaoBUTest - movimentos de comissão de posto e taxa adm produto não estavam sendo gerados na compra em dinheiro no posto', 4, 20, NULL, 6, NULL, '2014-05-22 16:57:16', NULL, 1, 0, NULL),
(1222, 37, '2014-05-22 10:55:41', 1, '2014-05-22', '2014-05-22 16:57:21', 'AutorizacaoBUTest', 4, 5, NULL, 6, NULL, '2014-05-22 16:57:21', NULL, 1, 0, NULL),
(1223, 42, '2014-05-22 10:55:49', 1, '2014-05-22', '2014-05-22 16:57:24', 'AutorizacaoBUTest', 4, 5, NULL, 6, NULL, '2014-05-22 16:57:24', NULL, 1, 0, NULL),
(1224, 2, '2014-05-22 10:56:07', 1, '2014-05-22', '2014-05-22 16:57:27', 'AutorizacaoBUTest', 1, 5, NULL, 6, NULL, '2014-05-22 16:57:27', NULL, 1, 0, NULL),
(1225, 72, '2014-05-22 16:57:36', 3, '2014-05-22', '2014-05-23 18:32:36', 'Teste de devolução do ticket.', 4, 10, NULL, 6, NULL, '2014-05-23 18:32:36', NULL, 1, 0, NULL),
(1226, 69, '2014-05-22 17:11:48', 4, '2014-05-22', '2014-05-23 18:32:41', 'Corrigido teste ''CompraMotoCarroTest'' referente a validação do registro da parkHistorico.', 4, 10, NULL, 6, NULL, '2014-05-23 18:32:41', NULL, 1, 0, NULL),
(1227, 37, '2014-05-22 17:12:17', 4, '2014-05-22', '2014-05-23 18:32:44', 'Criado teste para pagamento via pagSeguro com conta bloqueada.', 4, 5, NULL, 6, NULL, '2014-05-23 18:32:44', NULL, 1, 0, NULL),
(1228, 37, '2014-05-22 17:12:25', 4, '2014-05-22', '2014-05-23 18:32:47', 'Criado teste para pagamento via pagSeguro com conta bloqueada.', 4, 10, NULL, 6, NULL, '2014-05-23 18:32:47', NULL, 1, 0, NULL),
(1229, 37, '2014-05-22 17:12:32', 4, '2014-05-22', '2014-05-23 18:32:51', 'Criado teste para pagamento via pagSeguro com conta bloqueada.', 4, 25, NULL, 6, NULL, '2014-05-23 18:32:51', NULL, 1, 0, NULL),
(1230, 38, '2014-05-22 17:13:39', 4, '2014-05-22', '2014-05-23 18:32:54', 'Criado teste para pagamento via pagSeguro com conta bloqueada.', 4, 15, NULL, 6, NULL, '2014-05-23 18:32:54', NULL, 1, 0, NULL),
(1231, 37, '2014-05-26 12:53:03', 1, '2014-05-26', '2014-05-26 18:56:41', 'Bug - emitir irregularidade SEM TICKET sem verificação anterior.', 4, 10, NULL, 6, NULL, '2014-05-26 18:56:41', NULL, 1, 0, NULL),
(1232, 37, '2014-05-26 12:53:10', 1, '2014-05-26', '2014-05-26 18:56:44', 'Bug - emitir irregularidade SEM TICKET sem verificação anterior.', 4, 25, NULL, 6, NULL, '2014-05-26 18:56:44', NULL, 1, 0, NULL),
(1233, 40, '2014-05-26 12:53:17', 1, '2014-05-26', '2014-05-26 18:56:48', 'Bug - emitir irregularidade SEM TICKET sem verificação anterior.', 4, 20, NULL, 6, NULL, '2014-05-26 18:56:48', NULL, 1, 0, NULL),
(1234, 37, '2014-05-26 12:53:28', 1, '2014-05-26', '2014-05-26 18:56:53', 'Bug - emitir irregularidade SEM TICKET sem verificação anterior.', 4, 5, NULL, 6, NULL, '2014-05-26 18:56:53', NULL, 1, 0, NULL),
(1235, 42, '2014-05-26 12:53:34', 1, '2014-05-26', '2014-05-26 18:56:50', 'Bug - emitir irregularidade SEM TICKET sem verificação anterior.', 4, 5, NULL, 6, NULL, '2014-05-26 18:56:50', NULL, 1, 0, NULL),
(1236, 72, '2014-05-27 12:38:39', 3, '2014-05-26', '2014-05-27 21:35:31', 'Alterado voyagem p/ voyage no POS.', 4, 10, NULL, 6, NULL, '2014-05-27 21:35:31', NULL, 1, 0, NULL),
(1237, 2, '2014-05-27 12:49:48', 4, '2014-05-27', '2014-05-27 21:35:43', 'Activity da lista de vagas, mostrar ao operador situação "Incompatível" caso vaga comprada ou lançada seja diferente da vaga atual.', 1, 5, NULL, 6, NULL, '2014-05-27 21:35:43', NULL, 1, 0, NULL),
(1238, 2, '2014-05-27 12:49:56', 4, '2014-05-27', '2014-05-27 21:35:46', 'Activity Test da lista de vagas, mostrar ao operador situação "Incompatível" caso vaga comprada ou lançada seja diferente da vaga atual.', 1, 5, NULL, 6, NULL, '2014-05-27 21:35:46', NULL, 1, 0, NULL),
(1239, 71, '2014-05-27 12:50:03', 4, '2014-05-27', '2014-05-27 21:35:51', 'Ajuda do Diego para resolver situação "Incompatível" na lista de vagas', 2, 5, NULL, 6, NULL, '2014-05-27 21:35:51', NULL, 1, 0, NULL),
(1240, 37, '2014-05-27 12:50:13', 4, '2014-05-27', '2014-05-27 21:35:53', 'Activity Test da lista de vagas, mostrar ao operador situação "Incompatível" caso vaga comprada ou lançada seja diferente da vaga atual.', 4, 5, NULL, 6, NULL, '2014-05-27 21:35:53', NULL, 1, 0, NULL),
(1241, 37, '2014-05-27 12:50:20', 4, '2014-05-27', '2014-05-27 21:35:56', 'Activity Test da lista de vagas, mostrar ao operador situação "Incompatível" caso vaga comprada ou lançada seja diferente da vaga atual.', 4, 10, NULL, 6, NULL, '2014-05-27 21:35:56', NULL, 1, 0, NULL),
(1242, 43, '2014-05-28 12:51:53', 3, '2014-05-27', '2014-05-30 11:48:04', 'c/Eduardo - mostrar situação do tipo da vaga na lista de vagas.', 4, 10, NULL, 6, NULL, '2014-05-30 11:48:04', NULL, 1, 0, NULL),
(1243, 43, '2014-05-28 12:52:44', 3, '2014-05-28', '2014-05-30 11:48:08', 'c/Eduardo - ao emitir uma irregularidade deve ser feito uma verificação antes.', 4, 10, NULL, 6, NULL, '2014-05-30 11:48:08', NULL, 1, 0, NULL),
(1244, 42, '2014-05-28 12:54:46', 3, '2014-05-28', '2014-05-30 11:48:13', 'NotifyIrregularityControllerTest', 4, 5, NULL, 6, NULL, '2014-05-30 11:48:13', NULL, 1, 0, NULL),
(1245, 58, '2014-05-28 12:55:46', 3, '2014-05-28', '2014-05-30 11:48:18', 'Efetuar uma verificação antes de emitir uma irregularidade.', 2, 10, NULL, 6, NULL, '2014-05-30 11:48:18', NULL, 1, 0, NULL),
(1246, 2, '2014-05-30 11:25:04', 4, '2014-05-30', '2014-05-30 11:48:24', ' Batch - EmailProcess - Processamento dos emails de alterações no cadastro do cliente (configuração debito automatico / adicionar/remover placas)', 1, 5, NULL, 6, NULL, '2014-05-30 11:48:24', NULL, 1, 0, NULL),
(1247, 2, '2014-05-30 11:25:14', 4, '2014-05-30', '2014-05-30 11:48:28', 'PP - Criado model EmailBatch', 1, 5, NULL, 6, NULL, '2014-05-30 11:48:28', NULL, 1, 0, NULL),
(1248, 2, '2014-05-30 11:25:21', 4, '2014-05-30', '2014-05-30 11:48:34', 'PP - VeiculosController - para criação de email quando adicionar/remover placas do cliente;', 1, 5, NULL, 6, NULL, '2014-05-30 11:48:34', NULL, 1, 0, NULL),
(1249, 2, '2014-05-30 11:25:26', 4, '2014-05-30', '2014-05-30 11:48:39', 'PP - Model/Rede Criado função para retornar o email do SAC da rede atual;', 1, 5, NULL, 6, NULL, '2014-05-30 11:48:39', NULL, 1, 0, NULL),
(1250, 2, '2014-05-30 11:25:33', 4, '2014-05-30', '2014-05-30 11:48:42', 'PP - EntidadesController - Tratamento para gerar email caso cliente habilitar/desabilitar configuração de débito automático;', 1, 5, NULL, 6, NULL, '2014-05-30 11:48:42', NULL, 1, 0, NULL),
(1251, 37, '2014-05-30 11:25:47', 4, '2014-05-30', '2014-05-30 11:48:45', 'Criado teste para criação de email quando habilitar/desabilitar configuração de débito automático;', 4, 5, NULL, 6, NULL, '2014-05-30 11:48:45', NULL, 1, 0, NULL),
(1252, 37, '2014-05-30 11:25:54', 4, '2014-05-30', '2014-05-30 11:48:51', 'Criado teste para criação de email quando habilitar/desabilitar configuração de débito automático;', 4, 10, NULL, 6, NULL, '2014-05-30 11:48:51', NULL, 1, 0, NULL),
(1253, 37, '2014-05-30 11:26:07', 4, '2014-05-30', '2014-05-30 11:48:54', 'Criado teste para criação de email quando adicionar/remover placas no login do cliente;', 4, 5, NULL, 6, NULL, '2014-05-30 11:48:54', NULL, 1, 0, NULL),
(1254, 37, '2014-05-30 11:26:13', 4, '2014-05-30', '2014-05-30 11:48:59', 'Criado teste para criação de email quando adicionar/remover placas no login do cliente;', 4, 10, NULL, 6, NULL, '2014-05-30 11:48:59', NULL, 1, 0, NULL),
(1255, 40, '2014-05-30 11:26:41', 4, '2014-05-30', '2014-05-30 11:49:02', 'Criado teste para criação de email quando adicionar/remover placas no login do cliente;', 4, 20, NULL, 6, NULL, '2014-05-30 11:49:02', NULL, 1, 0, NULL),
(1256, 40, '2014-05-30 11:26:48', 4, '2014-05-30', '2014-05-30 11:49:05', 'Criado teste para criação de email quando habilitar/desabilitar configuração de débito automático;', 4, 20, NULL, 6, NULL, '2014-05-30 11:49:05', NULL, 1, 0, NULL),
(1257, 58, '2014-05-30 11:27:52', 4, '2014-05-30', '2014-05-30 11:49:08', 'Desenvolvimento da User Story para gerar email ao habilitar/desabilitar configuração de débito automático ou adicionar/remover placas no login do cliente.', 2, 10, NULL, 6, NULL, '2014-05-30 11:49:08', NULL, 1, 0, NULL),
(1258, 15, '2014-06-04 18:18:08', 3, '2014-06-03', '2014-06-05 17:44:47', 'c/ Felipe - Relatório de tickets.', 2, 20, NULL, 6, NULL, '2014-06-05 17:44:47', NULL, 1, 0, NULL),
(1259, 43, '2014-06-04 18:19:14', 3, '2014-06-04', '2014-06-05 17:44:55', 'c/Eduardo - Tipo de vaga incompatível.', 4, 10, NULL, 6, NULL, '2014-06-05 17:44:55', NULL, 1, 0, NULL),
(1260, 43, '2014-06-04 18:19:53', 3, '2014-06-04', '2014-06-05 17:45:01', 'c/Eduardo - Permitir recargas com conta bloqueada.', 4, 10, NULL, 6, NULL, '2014-06-05 17:45:01', NULL, 1, 0, NULL),
(1261, 42, '2014-06-04 18:26:06', 3, '2014-06-04', '2014-06-05 17:45:08', 'c/Eduardo - Permitir recargas com conta bloqueada.', 4, 5, NULL, 6, NULL, '2014-06-05 17:45:08', NULL, 1, 0, NULL),
(1262, 42, '2014-06-04 18:26:39', 3, '2014-06-04', '2014-06-05 17:45:14', 'c/Eduardo - Tipo de vaga incompatível.', 4, 5, NULL, 6, NULL, '2014-06-05 17:45:14', NULL, 1, 0, NULL),
(1263, 71, '2014-06-04 18:28:05', 3, '2014-06-04', '2014-06-05 17:45:17', 'c/Eduardo - Permitir recargas com conta bloqueada.', 2, 5, NULL, 6, NULL, '2014-06-05 17:45:17', NULL, 1, 0, NULL),
(1264, 71, '2014-06-04 18:28:23', 3, '2014-06-04', '2014-06-05 17:45:20', 'c/Eduardo - Tipo de vaga incompatível.', 2, 5, NULL, 6, NULL, '2014-06-05 17:45:20', NULL, 1, 0, NULL),
(1265, 71, '2014-06-04 18:28:53', 4, '2014-06-04', '2014-06-05 17:45:23', 'c/Diego - Permitir recargas com conta bloqueada.', 2, 5, NULL, 6, NULL, '2014-06-05 17:45:23', NULL, 1, 0, NULL),
(1268, 42, '2014-06-04 18:29:19', 4, '2014-06-04', '2014-06-05 17:45:27', 'c/Diego - Permitir recargas com conta bloqueada.', 4, 5, NULL, 6, NULL, '2014-06-05 17:45:27', NULL, 1, 0, NULL),
(1269, 43, '2014-06-04 18:29:29', 4, '2014-06-04', '2014-06-05 17:45:42', 'c/Diego - Permitir recargas com conta bloqueada.', 4, 10, NULL, 6, NULL, '2014-06-05 17:45:42', NULL, 1, 0, NULL),
(1270, 43, '2014-06-04 18:29:38', 4, '2014-06-04', '2014-06-05 17:45:45', 'c/Diego - Tipo de vaga incompatível.', 4, 10, NULL, 6, NULL, '2014-06-05 17:45:45', NULL, 1, 0, NULL),
(1271, 71, '2014-06-04 18:30:10', 4, '2014-06-04', '2014-06-05 17:45:47', 'c/DIego - Tipo de vaga incompatível.', 2, 5, NULL, 6, NULL, '2014-06-05 17:45:47', NULL, 1, 0, NULL),
(1272, 42, '2014-06-04 18:30:22', 4, '2014-06-04', '2014-06-05 17:45:51', 'c/Diego - Tipo de vaga incompatível.', 4, 5, NULL, 6, NULL, '2014-06-05 17:45:51', NULL, 1, 0, NULL),
(1273, 15, '2014-06-06 17:28:23', 3, '2014-06-05', '2014-06-08 14:28:07', 'c/ Felipe', 2, 20, NULL, 6, NULL, '2014-06-08 14:28:07', NULL, 1, 0, NULL),
(1274, 52, '2014-06-06 18:46:16', 3, '2014-06-06', '2014-06-08 14:27:57', 'User Story', 2, 3, NULL, 6, NULL, '2014-06-08 14:27:57', NULL, 1, 0, NULL),
(1275, 17, '2014-06-06 18:46:36', 3, '2014-06-06', '2014-06-08 14:30:52', 'Café', 2, 2, NULL, 6, NULL, '2014-06-08 14:30:52', NULL, 1, 0, NULL),
(1276, 52, '2014-06-06 19:18:03', 7, '2014-06-06', '2014-06-08 14:30:55', 'Foi feita a reunião para verificar os pontos para cada tarefa', 2, 3, NULL, 6, NULL, '2014-06-08 14:30:55', NULL, 1, 0, NULL),
(1277, 52, '2014-06-09 09:46:34', 4, '2014-06-09', '2014-06-09 18:07:26', '06/06/2014', 2, 3, NULL, 6, NULL, '2014-06-09 18:07:26', NULL, 1, 0, NULL),
(1279, 15, '2014-06-09 09:47:27', 4, '2014-06-09', '2014-06-09 18:07:30', '02/06/2014 com Vinícius na refatoração/centralização de erros da API e banco de dados.', 2, 20, NULL, 6, NULL, '2014-06-09 18:07:30', NULL, 1, 0, NULL),
(1280, 15, '2014-06-09 09:51:45', 4, '2014-06-09', '2014-06-09 18:07:35', '03/06/2014 com Vinícius na refatoração/centralização de erros da API e banco de dados.', 2, 20, NULL, 6, NULL, '2014-06-09 18:07:35', NULL, 1, 0, NULL),
(1281, 15, '2014-06-09 09:51:52', 4, '2014-06-09', '2014-06-09 18:07:38', '04/06/2014 com Vinícius na refatoração/centralização de erros da API e banco de dados.', 2, 20, NULL, 6, NULL, '2014-06-09 18:07:38', NULL, 1, 0, NULL),
(1282, 15, '2014-06-09 09:52:06', 4, '2014-06-09', '2014-06-09 18:07:41', '05/06/2014 com Vinícius na refatoração/centralização de erros da API e banco de dados.', 2, 20, NULL, 6, NULL, '2014-06-09 18:07:41', NULL, 1, 0, NULL),
(1283, 69, '2014-06-09 10:28:07', 4, '2014-06-09', '2014-06-09 18:07:44', 'Corrigido testes API que não estava funcionando : AreasControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:07:44', NULL, 1, 0, NULL),
(1284, 69, '2014-06-09 10:28:15', 4, '2014-06-09', '2014-06-09 18:07:51', 'Corrigido testes API que não estava funcionando : CancelPurchaseControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:07:51', NULL, 1, 0, NULL),
(1285, 69, '2014-06-09 10:28:21', 4, '2014-06-09', '2014-06-09 18:07:53', 'Corrigido testes API que não estava funcionando : CashClosingControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:07:53', NULL, 1, 0, NULL),
(1286, 69, '2014-06-09 10:28:29', 4, '2014-06-09', '2014-06-09 18:07:56', 'Corrigido testes API que não estava funcionando : ClientsControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:07:56', NULL, 1, 0, NULL),
(1287, 69, '2014-06-09 10:28:34', 4, '2014-06-09', '2014-06-09 18:07:59', 'Corrigido testes API que não estava funcionando : IrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:07:59', NULL, 1, 0, NULL),
(1288, 69, '2014-06-09 10:28:39', 4, '2014-06-09', '2014-06-09 18:08:09', 'Corrigido testes API que não estava funcionando : NotifyIrregularitiesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:09', NULL, 1, 0, NULL),
(1289, 69, '2014-06-09 10:28:44', 4, '2014-06-09', '2014-06-09 18:08:12', 'Corrigido testes API que não estava funcionando : PaymentControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:12', NULL, 1, 0, NULL),
(1290, 69, '2014-06-09 10:28:48', 4, '2014-06-09', '2014-06-09 18:08:15', 'Corrigido testes API que não estava funcionando : PaymentEcControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:15', NULL, 1, 0, NULL),
(1291, 69, '2014-06-09 10:28:53', 4, '2014-06-09', '2014-06-09 18:08:18', 'Corrigido testes API que não estava funcionando : PaymentParkingControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:18', NULL, 1, 0, NULL),
(1292, 69, '2014-06-09 10:28:58', 4, '2014-06-09', '2014-06-09 18:08:21', 'Corrigido testes API que não estava funcionando : PeriodPurchaseControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:21', NULL, 1, 0, NULL),
(1293, 69, '2014-06-09 10:29:05', 4, '2014-06-09', '2014-06-09 18:08:24', 'Corrigido testes API que não estava funcionando : PrivateApiAppControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:24', NULL, 1, 0, NULL),
(1294, 69, '2014-06-09 10:29:10', 4, '2014-06-09', '2014-06-09 18:08:27', 'Corrigido testes API que não estava funcionando : TicketsControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:27', NULL, 1, 0, NULL),
(1295, 69, '2014-06-09 10:29:16', 4, '2014-06-09', '2014-06-09 18:08:29', 'Corrigido testes API que não estava funcionando : VehiclesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:29', NULL, 1, 0, NULL),
(1296, 69, '2014-06-09 10:29:29', 4, '2014-06-09', '2014-06-09 18:08:31', 'Corrigido testes API que não estava funcionando : VehiclesControllerTest.php', 4, 10, NULL, 6, NULL, '2014-06-09 18:08:31', NULL, 1, 0, NULL),
(1297, 14, '2014-06-09 13:30:50', 1, '2014-06-06', '2014-06-09 18:08:36', 'Troquei na sexta', 2, 2, NULL, 6, NULL, '2014-06-09 18:08:36', NULL, 1, 0, NULL),
(1298, 17, '2014-06-09 18:10:39', 5, '2014-06-09', '2014-06-10 20:54:35', 'ok', 2, 2, NULL, 6, NULL, '2014-06-10 20:54:35', NULL, 1, 0, NULL),
(1299, 37, '2014-06-09 18:11:20', 5, '2014-06-09', '2014-06-10 20:54:41', 'LimpaClientesNaoConfirmadosTest.java', 4, 10, NULL, 6, NULL, '2014-06-10 20:54:41', NULL, 1, 0, NULL),
(1300, 37, '2014-06-09 18:11:35', 5, '2014-06-09', '2014-06-10 20:54:45', 'LimpaClientesNaoConfirmadosTest.java', 4, 5, NULL, 6, NULL, '2014-06-10 20:54:45', NULL, 1, 0, NULL),
(1301, 40, '2014-06-09 18:11:57', 5, '2014-06-09', '2014-06-10 20:54:50', 'LimpaClientesNaoConfirmadosTest.java', 4, 20, NULL, 6, NULL, '2014-06-10 20:54:50', NULL, 1, 0, NULL),
(1302, 37, '2014-06-09 18:12:31', 5, '2014-06-09', '2014-06-10 20:54:56', 'Remoção de clientes não confirmados não removia placas e limites', 4, 25, NULL, 6, NULL, '2014-06-10 20:54:56', NULL, 1, 0, NULL),
(1303, 17, '2014-06-09 18:13:40', 5, '2014-06-08', '2014-06-10 20:55:01', 'foi sexta', 2, 2, NULL, 6, NULL, '2014-06-10 20:55:01', NULL, 1, 0, NULL),
(1304, 23, '2014-06-09 18:17:36', 5, '2014-06-08', '2014-06-10 20:55:35', 'Move method - PrivateApiAppController->callProcedure() ==> AdvancedDBComponent->callProcedure();', 3, 10, NULL, 6, NULL, '2014-06-10 20:55:35', NULL, 1, 0, NULL),
(1305, 23, '2014-06-09 18:18:09', 5, '2014-06-09', '2014-06-10 20:55:50', 'Move method - PrivateApiAppController->callFunction() ==> AdvancedDBComponent->callFunction();', 3, 10, NULL, 6, NULL, '2014-06-10 20:55:50', NULL, 1, 0, NULL),
(1306, 23, '2014-06-09 18:18:29', 5, '2014-06-09', '2014-06-10 20:56:10', 'c/Eduardo - Move method - PrivateApiAppController->callProcedure() ==> AdvancedDBComponent->callProcedure();', 3, 10, NULL, 6, NULL, '2014-06-10 20:56:10', NULL, 1, 0, NULL),
(1307, 23, '2014-06-09 18:19:22', 5, '2014-06-09', '2014-06-10 20:56:21', 'c/Eduardo - Move method - PrivateApiAppController->callFunction() ==> AdvancedDBComponent->callFunction();', 3, 10, NULL, 6, NULL, '2014-06-10 20:56:21', NULL, 1, 0, NULL),
(1308, 23, '2014-06-09 18:22:31', 5, '2014-06-08', '2014-06-10 20:56:34', 'Substitute Algorithm - chamadas de exceções agora vindas do bd', 3, 10, NULL, 6, NULL, '2014-06-10 20:56:34', NULL, 1, 0, NULL),
(1309, 23, '2014-06-09 18:22:55', 5, '2014-06-08', '2014-06-10 20:56:44', 'c/Eduardo - Substitute Algorithm - chamadas de exceções agora vindas do bd', 3, 10, NULL, 6, NULL, '2014-06-10 20:56:44', NULL, 1, 0, NULL),
(1310, 56, '2014-06-09 18:24:38', 5, '2014-06-08', '2014-06-10 20:56:53', 'AdvancedDBComponent.php', 3, 5, NULL, 6, NULL, '2014-06-10 20:56:53', NULL, 1, 0, NULL),
(1311, 23, '2014-06-09 18:35:48', 5, '2014-06-09', '2014-06-10 20:56:57', 'extract method - db procedure limpa_clientes_nao_confirmados', 3, 10, NULL, 6, NULL, '2014-06-10 20:56:57', NULL, 1, 0, NULL),
(1312, 52, '2014-06-09 20:18:56', 1, '2014-06-09', '2014-06-10 20:57:06', 'Na sexa, 06/06/14', 2, 3, NULL, 6, NULL, '2014-06-10 20:57:06', NULL, 1, 0, NULL),
(1313, 2, '2014-06-09 20:28:07', 1, '2014-06-09', '2014-06-10 20:57:17', 'Trigger fechamento_ai', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:17', NULL, 1, 0, NULL),
(1314, 2, '2014-06-09 20:28:18', 1, '2014-06-09', '2014-06-10 20:57:25', 'Trigger pedido_bu', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:25', NULL, 1, 0, NULL),
(1315, 2, '2014-06-09 20:28:30', 1, '2014-06-09', '2014-06-10 20:57:30', 'Procedure baixa_pedido', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:30', NULL, 1, 0, NULL),
(1316, 2, '2014-06-09 20:28:41', 1, '2014-06-09', '2014-06-10 20:57:34', 'FechamentosController', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:34', NULL, 1, 0, NULL),
(1317, 2, '2014-06-09 20:28:56', 1, '2014-06-09', '2014-06-10 20:57:37', 'Procedure processa_fechamento', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:37', NULL, 1, 0, NULL),
(1318, 2, '2014-06-09 20:29:08', 1, '2014-06-09', '2014-06-10 20:57:40', 'Evento processa_fechamento', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:40', NULL, 1, 0, NULL),
(1319, 2, '2014-06-09 20:29:53', 1, '2014-06-09', '2014-06-10 20:57:43', 'ProcessaFechamentoTest', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:43', NULL, 1, 0, NULL),
(1320, 40, '2014-06-09 20:30:00', 1, '2014-06-09', '2014-06-10 20:57:46', 'ProcessaFechamentoTest', 4, 20, NULL, 6, NULL, '2014-06-10 20:57:46', NULL, 1, 0, NULL),
(1321, 72, '2014-06-09 20:30:16', 1, '2014-06-09', '2014-06-10 20:57:48', 'ProcessaFechamentoTest', 4, 10, NULL, 6, NULL, '2014-06-10 20:57:48', NULL, 1, 0, NULL),
(1323, 37, '2014-06-09 20:30:29', 1, '2014-06-09', '2014-06-10 20:57:50', 'ProcessaFechamentoTest', 4, 5, NULL, 6, NULL, '2014-06-10 20:57:50', NULL, 1, 0, NULL),
(1324, 37, '2014-06-09 20:30:36', 1, '2014-06-09', '2014-06-10 20:57:53', 'ProcessaFechamentoTest', 4, 10, NULL, 6, NULL, '2014-06-10 20:57:53', NULL, 1, 0, NULL),
(1325, 2, '2014-06-09 20:30:51', 1, '2014-06-09', '2014-06-10 20:57:59', 'BaixaPedidoTest', 1, 5, NULL, 6, NULL, '2014-06-10 20:57:59', NULL, 1, 0, NULL),
(1326, 40, '2014-06-09 20:30:59', 1, '2014-06-09', '2014-06-10 20:58:11', 'BaixaPedidoTest', 4, 20, NULL, 6, NULL, '2014-06-10 20:58:11', NULL, 1, 0, NULL),
(1327, 72, '2014-06-09 20:31:09', 1, '2014-06-09', '2014-06-10 20:58:13', 'BaixaPedidoTest', 4, 10, NULL, 6, NULL, '2014-06-10 20:58:13', NULL, 1, 0, NULL),
(1328, 37, '2014-06-09 20:31:19', 1, '2014-06-09', '2014-06-10 20:58:16', 'BaixaPedidoTest', 4, 5, NULL, 6, NULL, '2014-06-10 20:58:16', NULL, 1, 0, NULL),
(1329, 37, '2014-06-09 20:31:32', 1, '2014-06-09', '2014-06-10 20:58:19', 'BaixaPedidoTest', 4, 10, NULL, 6, NULL, '2014-06-10 20:58:19', NULL, 1, 0, NULL),
(1330, 69, '2014-06-10 11:22:52', 4, '2014-06-09', '2014-06-10 20:58:21', '- Corrigido teste do VehiclesController : Vaga inválida <> Vaga Inválida', 4, 10, NULL, 6, NULL, '2014-06-10 20:58:21', NULL, 1, 0, NULL),
(1331, 69, '2014-06-10 11:23:16', 4, '2014-06-09', '2014-06-10 20:58:23', '- Corrigido teste PaymentParkingController, no teste que espera erro de codigo pagamento inválido, lançava cliente inválido.', 4, 10, NULL, 6, NULL, '2014-06-10 20:58:23', NULL, 1, 0, NULL),
(1332, 71, '2014-06-11 17:50:12', 5, '2014-06-11', '2014-06-12 10:54:13', 'c/André / Excedido itabuna', 2, 5, NULL, 6, NULL, '2014-06-12 10:54:13', NULL, 1, 0, NULL),
(1333, 37, '2014-06-11 17:51:12', 5, '2014-06-11', '2014-06-12 10:54:18', 'DevolverTicketTest.java', 4, 10, NULL, 6, NULL, '2014-06-12 10:54:18', NULL, 1, 0, NULL),
(1334, 37, '2014-06-11 17:51:48', 5, '2014-06-11', '2014-06-12 10:54:21', 'DevolverTicketTest.java', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:21', NULL, 1, 0, NULL),
(1335, 42, '2014-06-11 17:52:19', 5, '2014-06-11', '2014-06-12 10:54:25', 'DevolverTicketTest.java - devolver ticket fora do horário', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:25', NULL, 1, 0, NULL),
(1336, 43, '2014-06-11 17:52:39', 5, '2014-06-11', '2014-06-12 10:54:27', 'c/André - DevolverTicketTest.java - devolver ticket fora do horário', 4, 10, NULL, 6, NULL, '2014-06-12 10:54:27', NULL, 1, 0, NULL),
(1337, 37, '2014-06-11 18:05:36', 5, '2014-06-11', '2014-06-12 10:54:30', 'ClienteSacControllerTest.php', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:30', NULL, 1, 0, NULL),
(1338, 42, '2014-06-11 18:06:17', 5, '2014-06-11', '2014-06-12 10:54:33', 'testRemoverCliente() testRemoverClienteConfirmado()', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:33', NULL, 1, 0, NULL),
(1339, 37, '2014-06-11 18:08:54', 5, '2014-06-11', '2014-06-12 10:54:43', 'Remover cliente não remove as placas e o limite do cliente', 4, 25, NULL, 6, NULL, '2014-06-12 10:54:43', NULL, 1, 0, NULL),
(1340, 37, '2014-06-11 18:13:00', 7, '2014-06-11', '2014-06-12 10:54:46', 'Foram Criados Testes para a Classe Relatorio Tickets Controller', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:46', NULL, 1, 0, NULL),
(1341, 37, '2014-06-12 10:33:43', 1, '2014-06-11', '2014-06-12 10:54:51', 'BUG - devolver ticket depois do término na operação', 4, 10, NULL, 6, NULL, '2014-06-12 10:54:51', NULL, 1, 0, NULL),
(1342, 37, '2014-06-12 10:33:53', 1, '2014-06-11', '2014-06-12 10:54:54', 'BUG - devolver ticket depois do término na operação', 4, 25, NULL, 6, NULL, '2014-06-12 10:54:54', NULL, 1, 0, NULL),
(1343, 43, '2014-06-12 10:34:17', 1, '2014-06-11', '2014-06-12 10:54:56', 'BUG - devolver ticket depois do término na operação - com Vinicius', 4, 10, NULL, 6, NULL, '2014-06-12 10:54:56', NULL, 1, 0, NULL),
(1344, 37, '2014-06-12 10:34:27', 1, '2014-06-11', '2014-06-12 10:54:59', 'BUG - devolver ticket depois do término na operação', 4, 5, NULL, 6, NULL, '2014-06-12 10:54:59', NULL, 1, 0, NULL),
(1345, 42, '2014-06-12 10:34:44', 1, '2014-06-12', '2014-06-12 10:55:13', 'BUG - devolver ticket depois do término na operação - DevolverTicketTest', 4, 5, NULL, 6, NULL, '2014-06-12 10:55:13', NULL, 1, 0, NULL),
(1346, 72, '2014-06-12 10:34:55', 1, '2014-06-12', '2014-06-12 10:55:19', 'BUG - devolver ticket depois do término na operação', 4, 10, NULL, 6, NULL, '2014-06-12 10:55:19', NULL, 1, 0, NULL),
(1347, 37, '2014-06-13 17:35:54', 7, '2014-06-13', '2014-06-16 19:06:09', 'Foi Criado os Testes Unitários Do GenericReports', 4, 5, NULL, 6, NULL, '2014-06-16 19:06:09', NULL, 1, 0, NULL),
(1348, 17, '2014-06-16 21:16:21', 5, '2014-06-16', '2014-06-18 19:47:53', 'ok', 2, 2, NULL, 6, NULL, '2014-06-18 19:47:53', NULL, 1, 0, NULL),
(1349, 56, '2014-06-16 23:33:08', 5, '2014-06-16', '2014-06-23 14:23:17', 'Lista de erros possíveis na API em ErrorsController.php', 3, 6, NULL, 6, NULL, '2014-06-23 14:23:17', NULL, 1, 0, NULL),
(1350, 15, '2014-06-18 16:24:52', 3, '2014-06-17', '2014-06-18 21:35:56', 'Auxiliando o felipe com o Cakephp.', 2, 24, NULL, 6, NULL, '2014-06-18 21:35:56', NULL, 2, 0, NULL),
(1351, 52, '2014-06-23 14:23:54', 1, '2014-06-20', '2014-06-23 14:32:45', 'Na sexta', 2, 3, NULL, 6, NULL, '2014-06-23 14:32:45', NULL, 1, 0, NULL),
(1352, 61, '2014-06-23 14:24:14', 1, '2014-06-20', '2014-06-23 16:45:26', 'Fechamento da fatura', 2, 12, NULL, 6, NULL, '2014-06-23 16:45:26', NULL, 2, 0, NULL),
(1353, 17, '2014-06-23 14:36:48', 5, '2014-06-20', '2014-06-23 16:38:15', 'ok', 2, 2, NULL, 6, NULL, '2014-06-23 16:38:15', NULL, 1, 0, NULL),
(1354, 52, '2014-06-23 14:37:07', 5, '2014-06-20', '2014-06-23 16:38:16', 'ok', 2, 3, NULL, 6, NULL, '2014-06-23 16:38:16', NULL, 1, 0, NULL),
(1355, 15, '2014-06-23 16:35:17', 7, '2014-06-17', '2014-06-25 20:27:05', 'Foi verificado a questão do Dynamic Reports', 2, 24, NULL, 6, 3, '2014-06-25 20:27:05', NULL, 2, 0, NULL),
(1356, 52, '2014-06-23 16:36:12', 7, '2014-06-20', '2014-06-23 16:39:06', 'ok', 2, 3, NULL, 6, NULL, '2014-06-23 16:39:06', NULL, 1, 0, NULL),
(1357, 38, '2014-06-23 22:13:30', 4, '2014-06-23', '2014-06-24 15:02:17', 'Criado teste para não lançar irregularidade quando for feito débito automático antes.', 4, 18, NULL, 6, NULL, '2014-06-24 15:02:17', NULL, 1, 0, NULL),
(1358, 38, '2014-06-25 14:52:10', 4, '2014-06-25', '2014-06-25 17:08:50', 'Criado teste para motivo de irregularidade ''Ticket Incompativel'' na procedure park_preco_cobranca.', 4, 18, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1359, 37, '2014-06-25 14:52:32', 4, '2014-06-25', '2014-06-25 17:08:50', 'Criado teste para motivo de irregularidade ''Ticket Incompativel'' na procedure park_preco_cobranca.', 4, 6, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1360, 17, '2014-06-25 14:54:25', 4, '2014-06-24', '2014-06-25 16:50:46', 'Período da tarde', 2, 2, NULL, 6, NULL, '2014-06-25 16:50:46', NULL, 1, 0, NULL),
(1361, 57, '2014-06-25 14:56:00', 4, '2014-06-25', '2014-06-25 17:08:50', 'Sprint 33', 4, 24, NULL, 6, NULL, NULL, '2014-06-25 17:08:50', 0, 1, NULL),
(1362, 69, '2014-06-25 14:59:54', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - Site - EntidadesControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1363, 69, '2014-06-25 15:00:13', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - Site - MonitoramentoControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1364, 69, '2014-06-25 15:00:31', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - Site - PostosControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1365, 69, '2014-06-25 15:00:57', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - API - PaymentEcControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1366, 69, '2014-06-25 15:01:25', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - Site  - Parking - RelatorioFaturamentosControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1367, 69, '2014-06-25 15:01:46', 4, '2014-06-24', '2014-06-25 17:08:50', 'Correção teste - Site  - Parking - DataBase - EmitirIrregularidadeControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:50', NULL, 1, 0, NULL),
(1368, 69, '2014-06-25 15:01:57', 4, '2014-06-24', '2014-06-25 17:08:51', 'Correção teste - Site  - Parking - DataBase - ParkCalculaPrecoControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:51', NULL, 1, 0, NULL),
(1369, 69, '2014-06-25 15:02:13', 4, '2014-06-25', '2014-06-25 17:08:51', 'Correção teste - Site  - Parking - DataBase - ParkPrecoCobrancaControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:51', NULL, 1, 0, NULL),
(1370, 69, '2014-06-25 15:02:37', 4, '2014-06-24', '2014-06-25 17:08:51', 'Correção teste - Site  - Parking - DataBase - ParkPrecoPlacaControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:51', NULL, 1, 0, NULL),
(1371, 69, '2014-06-25 15:02:50', 4, '2014-06-24', '2014-06-25 17:08:51', 'Correção teste - Site  - Parking - DataBase - ParkVerificaContratoControllerTest.', 4, 12, NULL, 6, NULL, '2014-06-25 17:08:51', NULL, 1, 0, NULL),
(1372, 37, '2014-06-25 17:10:00', 1, '2014-06-25', '2014-06-26 20:46:46', 'Testes movimentosPOSController', 4, 12, NULL, 6, NULL, '2014-06-26 20:46:46', NULL, 1, 0, NULL),
(1373, 40, '2014-06-25 17:10:12', 1, '2014-06-25', '2014-06-26 20:46:46', 'Testes movimentosPOSController', 4, 24, NULL, 6, NULL, '2014-06-26 20:46:46', NULL, 1, 0, NULL),
(1374, 37, '2014-06-25 17:10:23', 1, '2014-06-25', '2014-06-26 20:46:46', 'Testes movimentosPOSController', 4, 6, NULL, 6, NULL, '2014-06-26 20:46:46', NULL, 1, 0, NULL),
(1375, 72, '2014-06-25 17:10:51', 1, '2014-06-25', '2014-06-26 20:46:46', 'Testes extrato de movimento do POS', 4, 12, NULL, 6, NULL, '2014-06-26 20:46:46', NULL, 1, 0, NULL),
(1376, 71, '2014-06-25 17:11:58', 1, '2014-06-24', '2014-06-25 20:21:35', 'Problema paginação relatórios', 2, 6, NULL, 6, 7, '2014-06-25 20:21:35', NULL, 1, 0, NULL),
(1377, 62, '2014-06-25 17:12:25', 1, '2014-06-23', '2014-06-26 20:46:47', 'Sprint 34', 2, 18, NULL, 6, NULL, '2014-06-26 20:46:47', NULL, 1, 0, NULL),
(1378, 2, '2014-06-25 17:14:50', 1, '2014-06-25', '2014-06-26 20:46:47', 'Testes movimentosPOSController', 1, 6, NULL, 6, NULL, '2014-06-26 20:46:47', NULL, 1, 0, NULL),
(1380, 71, '2014-06-25 19:51:37', 7, '2014-06-24', '2014-06-25 20:29:49', 'Problema de Resolução do Problema da Paginação do Monitoramento dos Relatórios', 2, 6, NULL, 6, 1, '2014-06-25 20:29:49', NULL, 1, 0, NULL),
(1381, 37, '2014-06-25 20:21:06', 1, '2014-06-25', '2014-06-26 20:46:47', 'Procedure movimentos_pos (MovimentosPOSTest.php)', 4, 12, NULL, 6, NULL, '2014-06-26 20:46:47', NULL, 1, 0, NULL),
(1382, 37, '2014-06-25 20:21:21', 1, '2014-06-25', '2014-06-26 20:46:47', 'Procedure movimentos_pos (MovimentosPOSTest.php)', 4, 6, NULL, 6, NULL, '2014-06-26 20:46:47', NULL, 1, 0, NULL),
(1383, 2, '2014-06-25 20:22:15', 1, '2014-06-25', '2014-06-26 20:46:47', 'Procedure movimentos_pos (MovimentosPOSTest.php)', 1, 6, NULL, 6, NULL, '2014-06-26 20:46:47', NULL, 1, 0, NULL),
(1384, 37, '2014-06-26 16:40:05', 7, '2014-06-26', '2014-06-26 17:49:15', 'Foi Criado os testes unitários do MonitoramentorelatoriosController', 4, 6, NULL, 6, NULL, '2014-06-26 17:49:15', NULL, 1, 0, NULL),
(1385, 43, '2014-06-26 16:41:03', 7, '2014-06-26', '2014-06-26 17:49:16', 'Foi feito os testes do MonitoramentoRelatorioController', 4, 12, NULL, 6, 3, '2014-06-26 17:49:16', NULL, 1, 0, NULL),
(1386, 43, '2014-06-26 21:23:53', 3, '2014-06-26', '2014-06-26 23:51:11', 'c/ Felipe Gomes', 4, 12, NULL, 6, NULL, '2014-06-26 23:51:11', NULL, 1, 0, NULL),
(1387, 37, '2014-06-26 21:24:45', 3, '2014-06-26', '2014-06-26 23:51:11', 'Teste da tela de monitoramento dos relatórios que estão em processamento.', 4, 6, NULL, 6, NULL, '2014-06-26 23:51:11', NULL, 1, 0, NULL),
(1388, 37, '2014-06-26 21:24:59', 3, '2014-06-26', '2014-06-26 23:51:11', 'Teste da tela de monitoramento dos relatórios que estão em processamento.', 4, 12, NULL, 6, NULL, '2014-06-26 23:51:11', NULL, 1, 0, NULL),
(1389, 43, '2014-06-26 23:51:42', 7, '2014-06-26', '2014-06-27 13:49:44', 'Testes do Generic Reports', 4, 12, NULL, 6, 4, '2014-06-27 13:49:44', NULL, 1, 0, NULL),
(1390, 42, '2014-06-26 23:53:07', 7, '2014-06-26', '2014-06-30 17:16:16', 'melhorar Testes unitários do Generic Reports', 4, 6, NULL, 6, NULL, '2014-06-30 17:16:16', NULL, 1, 0, NULL),
(1391, 37, '2014-06-26 23:54:25', 7, '2014-06-26', '2014-06-27 13:49:45', 'Foram Criados Testes para a Classe Relatorio Tickets Controller', 4, 12, NULL, 6, NULL, '2014-06-27 13:49:45', NULL, 1, 0, NULL),
(1392, 37, '2014-06-26 23:54:53', 7, '2014-06-26', '2014-06-27 13:49:45', 'Foi Criado os Testes Unitários Do GenericReports', 4, 12, NULL, 6, NULL, '2014-06-27 13:49:45', NULL, 1, 0, NULL),
(1393, 43, '2014-06-27 14:23:36', 7, '2014-06-26', '2014-06-30 18:30:40', 'executar os teste do Generic Reports', 4, 12, NULL, 6, 4, '2014-06-30 18:30:40', NULL, 1, 0, NULL),
(1394, 69, '2014-06-30 15:30:21', 1, '2014-06-27', '2014-06-30 17:16:17', 'VehiclesControllerTest', 4, 12, NULL, 6, NULL, '2014-06-30 17:16:17', NULL, 1, 0, NULL),
(1395, 43, '2014-06-30 17:17:37', 4, '2014-06-27', '2014-06-30 18:30:40', 'c/ Felipe = Testes Projeto s2Reports', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:40', NULL, 1, 0, NULL),
(1396, 69, '2014-06-30 17:18:52', 4, '2014-06-27', '2014-06-30 18:30:41', 's2Batch - Corrigido testes após implementação do MultiThread - SMSProcessTest', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:41', NULL, 1, 0, NULL),
(1397, 69, '2014-06-30 17:19:06', 4, '2014-06-27', '2014-06-30 18:30:41', 's2Batch - Corrigido testes após implementação do MultiThread - EmailProcessTest', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:41', NULL, 1, 0, NULL),
(1398, 69, '2014-06-30 17:19:20', 4, '2014-06-27', '2014-06-30 18:30:41', 's2Batch - Corrigido testes após implementação do MultiThread - SMSListenerTest', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:41', NULL, 1, 0, NULL),
(1399, 69, '2014-06-30 17:19:35', 4, '2014-06-27', '2014-06-30 18:30:41', 's2Batch - Corrigido testes após implementação do MultiThread - TWWManagerTest', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:41', NULL, 1, 0, NULL),
(1400, 69, '2014-06-30 17:19:52', 4, '2014-06-27', '2014-06-30 18:30:41', 's2Batch - Corrigido testes após implementação do MultiThread - PagSeguroProcessTest', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:41', NULL, 1, 0, NULL),
(1401, 69, '2014-06-30 17:22:42', 4, '2014-06-27', '2014-06-30 18:30:42', 's2Reports - Corrigido  teste ''RelatorioTicketsTest''', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:42', NULL, 1, 0, NULL),
(1402, 69, '2014-06-30 17:24:58', 4, '2014-06-27', '2014-06-30 18:30:42', 's2Reports - Corrigido  teste ''RelatorioTicketsTest''', 4, 12, NULL, 6, NULL, '2014-06-30 18:30:42', NULL, 1, 0, NULL),
(1403, 69, '2014-06-30 19:54:08', 4, '2014-06-30', '2014-06-30 20:08:05', 's2WayDataBasesTests - Interromper Avisos - Corrigido incremento do campo ''irregularidades'' na park_historico, pois o ticket era inserido na mão.', 4, 12, NULL, 6, NULL, '2014-06-30 20:08:05', NULL, 1, 0, NULL),
(1404, 42, '2014-06-30 19:58:45', 5, '2014-06-30', '2014-06-30 22:57:52', 'MonitoramentoVagasControllerTest . última verificação', 4, 6, NULL, 6, NULL, '2014-06-30 22:57:52', NULL, 1, 0, NULL),
(1405, 37, '2014-06-30 19:59:54', 5, '2014-06-30', '2014-06-30 22:57:53', 'última verificação', 4, 30, NULL, 6, NULL, '2014-06-30 22:57:53', NULL, 1, 0, NULL),
(1406, 40, '2014-06-30 22:58:37', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA', 4, 24, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 1, 0, NULL),
(1407, 37, '2014-06-30 22:59:01', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA - VehiclesControllerTest', 4, 12, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 1, 0, NULL),
(1408, 37, '2014-06-30 22:59:15', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA - VehiclesControllerTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 1, 0, NULL),
(1409, 42, '2014-06-30 22:59:28', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA - VehiclesControllerTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 1, 0, NULL),
(1410, 72, '2014-06-30 22:59:46', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA', 4, 12, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 1, 0, NULL),
(1411, 2, '2014-06-30 23:00:18', 1, '2014-06-30', '2014-07-01 23:46:35', 'Tag e-ticket nos recibos de compra/DA - VehiclesControllerTest', 1, 6, NULL, 6, NULL, '2014-07-01 23:46:35', NULL, 2, 0, NULL),
(1412, 37, '2014-06-30 23:00:37', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - NotifyIrregularitiesTest', 4, 12, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1413, 37, '2014-06-30 23:00:51', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - NotifyIrregularitiesTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1414, 42, '2014-06-30 23:01:02', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - NotifyIrregularitiesTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1415, 2, '2014-06-30 23:01:14', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - NotifyIrregularitiesTest', 1, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 2, 0, NULL),
(1416, 37, '2014-06-30 23:01:36', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - PaymentParkingControllerTest', 4, 12, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1417, 37, '2014-06-30 23:01:48', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - PaymentParkingControllerTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1418, 42, '2014-06-30 23:01:59', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - PaymentParkingControllerTest', 4, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 1, 0, NULL),
(1419, 2, '2014-06-30 23:02:11', 1, '2014-06-30', '2014-07-01 23:46:36', 'Tag e-ticket nos recibos de compra/DA - PaymentParkingControllerTest', 1, 6, NULL, 6, NULL, '2014-07-01 23:46:36', NULL, 2, 0, NULL),
(1420, 2, '2014-06-30 23:07:33', 4, '2014-06-30', '2014-07-01 19:35:03', '- Bug da compra de períodos quando o mesmo ultrapassa o horário de funcionamento da área. Compra feita em mais de uma vez. Trigger ''park_ticket_bu.sql''', 1, 6, NULL, 6, NULL, '2014-07-01 19:35:03', NULL, 1, 0, NULL),
(1421, 37, '2014-06-30 23:07:43', 4, '2014-06-30', '2014-07-01 19:35:03', '- Bug da compra de períodos quando o mesmo ultrapassa o horário de funcionamento da área. Compra feita em mais de uma vez. Trigger ''park_ticket_bu.sql''', 4, 6, NULL, 6, NULL, '2014-07-01 19:35:03', NULL, 1, 0, NULL);
INSERT INTO `log` (`id`, `activity_id`, `created`, `player_id`, `acquired`, `reviewed`, `description`, `domain_id`, `xp`, `event_id`, `player_id_owner`, `player_id_pair`, `accepted`, `rejected`, `acceptance_votes`, `rejection_votes`, `hash`) VALUES
(1422, 38, '2014-06-30 23:08:30', 4, '2014-06-30', '2014-07-01 19:35:03', '- Bug da compra de períodos quando o mesmo ultrapassa o horário de funcionamento da área. Compra feita em mais de uma vez. Trigger ''park_ticket_bu.sql''', 4, 18, NULL, 6, NULL, '2014-07-01 19:35:03', NULL, 1, 0, NULL),
(1423, 43, '2014-06-30 23:08:53', 4, '2014-06-30', '2014-07-01 19:35:03', 'c/ Vinícius - Bug da compra de períodos quando o mesmo ultrapassa o horário de funcionamento da área. Compra feita em mais de uma vez. Trigger ''park_ticket_bu.sql''', 4, 12, NULL, 6, NULL, '2014-07-01 19:35:03', NULL, 1, 0, NULL),
(1424, 58, '2014-07-01 23:50:35', 1, '2014-07-01', '2014-07-01 23:51:05', 'Recibo de débito automático no app - todas as etapas concluídas.', 2, 12, NULL, 6, NULL, '2014-07-01 23:51:05', NULL, 1, 0, NULL),
(1426, 71, '2014-07-02 14:20:35', 1, '2014-07-01', '2014-07-02 22:09:15', 'Reclamação Floripa carro sendo removido da vaga quando compra ticket parquímetro outra área', 2, 6, NULL, 6, 4, '2014-07-02 22:09:15', NULL, 1, 0, NULL),
(1427, 2, '2014-07-02 15:08:17', 4, '2014-07-01', '2014-07-02 21:42:11', 'EntidadesController - Gerar email apenas para o SAC quando o cliente não possuir email (Cadastro POS, por exemplo);', 1, 6, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1429, 38, '2014-07-02 15:09:14', 4, '2014-07-01', '2014-07-02 21:42:11', 'EntidadesController - Gerar email apenas para o SAC quando o cliente não possuir email (Cadastro POS, por exemplo);', 4, 18, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1430, 37, '2014-07-02 15:09:43', 4, '2014-07-01', '2014-07-02 21:42:11', 'EntidadesController - Gerar email apenas para o SAC quando o cliente não possuir email (Cadastro POS, por exemplo);', 4, 30, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1431, 37, '2014-07-02 15:10:26', 4, '2014-07-01', '2014-07-02 21:42:11', 'EntidadesController - Gerar email apenas para o SAC quando o cliente não possuir email (Cadastro POS, por exemplo);', 4, 6, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1432, 71, '2014-07-02 15:12:32', 4, '2014-07-01', '2014-07-02 21:42:11', 'c/ Andre - ''Out of range irregularidades'' na procedure ''park_interromper_avisos''. Solução : adicionado validação para caso variável for menor que 0, o mesmo é setado para 0;', 2, 6, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1433, 72, '2014-07-02 15:14:57', 4, '2014-07-01', '2014-07-02 21:42:11', 'Teste exploratório da Tag do eticket no recibo de compra no POS;', 4, 12, NULL, 6, NULL, '2014-07-02 21:42:11', NULL, 1, 0, NULL),
(1434, 2, '2014-07-02 21:43:06', 1, '2014-07-02', '2014-07-02 22:08:11', 'MovimentosPOSControllerTest', 1, 6, NULL, 6, NULL, '2014-07-02 22:08:11', NULL, 2, 0, NULL),
(1435, 2, '2014-07-02 21:45:39', 1, '2014-07-02', '2014-07-02 22:08:11', 'DataGenerator', 1, 6, NULL, 6, NULL, '2014-07-02 22:08:11', NULL, 2, 0, NULL),
(1436, 37, '2014-07-02 21:46:27', 1, '2014-07-02', '2014-07-02 22:09:15', 'Bug ''movimentos estornados saindo no extrado do posto'' - MovimentosPOSControllerTest', 4, 12, NULL, 6, NULL, '2014-07-02 22:09:15', NULL, 1, 0, NULL),
(1437, 37, '2014-07-02 21:46:34', 1, '2014-07-02', '2014-07-02 22:09:15', 'Bug ''movimentos estornados saindo no extrado do posto'' - MovimentosPOSControllerTest', 4, 30, NULL, 6, NULL, '2014-07-02 22:09:15', NULL, 1, 0, NULL),
(1438, 40, '2014-07-02 21:46:44', 1, '2014-07-02', '2014-07-02 22:09:15', 'Bug ''movimentos estornados saindo no extrado do posto'' - MovimentosPOSControllerTest', 4, 24, NULL, 6, NULL, '2014-07-02 22:09:15', NULL, 1, 0, NULL),
(1439, 37, '2014-07-02 21:46:52', 1, '2014-07-02', '2014-07-02 22:09:16', 'Bug ''movimentos estornados saindo no extrado do posto'' - MovimentosPOSControllerTest', 4, 6, NULL, 6, NULL, '2014-07-02 22:09:16', NULL, 1, 0, NULL),
(1440, 42, '2014-07-02 21:47:03', 1, '2014-07-02', '2014-07-02 22:08:22', 'Bug ''movimentos estornados saindo no extrado do posto'' - MovimentosPOSControllerTest', 4, 6, NULL, 6, NULL, '2014-07-02 22:08:22', NULL, 2, 0, NULL),
(1441, 52, '2014-07-02 21:47:30', 1, '2014-07-02', '2014-07-02 22:09:16', 'Pela tarde', 2, 3, NULL, 6, NULL, '2014-07-02 22:09:16', NULL, 1, 0, NULL),
(1442, 42, '2014-07-02 22:39:27', 7, '2014-07-02', '2014-07-03 14:29:15', 'Foi Melhorado o Teste Unitário do Monitoramento de Relatórios', 4, 6, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1443, 37, '2014-07-02 22:40:11', 7, '2014-07-02', '2014-07-03 14:29:15', 'Foram Criados Novos Testes Unitários para o MonitoramentoRelatoriosController', 4, 12, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1444, 37, '2014-07-02 22:40:52', 7, '2014-07-02', '2014-07-03 14:29:15', 'Foram Criados Novos Testes Unitários para o MonitoramentoRelatoriosController', 4, 6, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1445, 2, '2014-07-02 22:41:25', 7, '2014-07-02', '2014-07-03 14:29:15', 'Foi Documentado os Testes do MonitoramentoRelatorioController', 1, 6, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1446, 2, '2014-07-02 23:10:59', 7, '2014-07-02', '2014-07-03 14:29:15', 'CaixasController', 1, 6, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1447, 2, '2014-07-02 23:17:19', 7, '2014-07-02', '2014-07-03 14:29:15', 'MonitoramentoRelatorioController', 1, 6, NULL, 6, NULL, '2014-07-03 14:29:15', NULL, 1, 0, NULL),
(1448, 69, '2014-07-03 14:30:10', 4, '2014-07-02', '2014-07-03 19:30:37', 'Corrigido testes da classe PostosController', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:37', NULL, 1, 0, NULL),
(1449, 69, '2014-07-03 14:30:24', 4, '2014-07-02', '2014-07-03 19:30:37', 'Corrigido testes da classe MovimentosPOSController.', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:37', NULL, 1, 0, NULL),
(1450, 69, '2014-07-03 14:30:47', 4, '2014-07-02', '2014-07-03 19:30:38', 'Corrigido testes da classe RelatorioFaturamentoTicketExternoController', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:38', NULL, 1, 0, NULL),
(1451, 69, '2014-07-03 14:31:07', 4, '2014-07-02', '2014-07-03 19:30:39', 'Corrigido testes da classe RelatorioFaturamentosController', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1452, 69, '2014-07-03 14:31:23', 4, '2014-07-02', '2014-07-03 19:30:39', 'Corrigido testes da classe PaymentEcController.', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1453, 52, '2014-07-03 14:40:33', 4, '2014-07-02', '2014-07-03 17:19:09', 'AS 13 hrs', 2, 3, NULL, 6, NULL, '2014-07-03 17:19:09', NULL, 1, 0, NULL),
(1454, 2, '2014-07-03 17:16:21', 7, '2014-07-03', '2014-07-03 20:48:49', 'CaixasControllerTest', 1, 6, NULL, 6, NULL, '2014-07-03 20:48:49', NULL, 1, 0, NULL),
(1455, 37, '2014-07-03 17:16:50', 7, '2014-07-03', '2014-07-03 20:48:49', 'Foram feitos os testes do CaixasController', 4, 6, NULL, 6, NULL, '2014-07-03 20:48:49', NULL, 1, 0, NULL),
(1456, 37, '2014-07-03 17:17:26', 7, '2014-07-03', '2014-07-03 20:48:49', 'Foram Adicionados Testes unitários para o CaixasControllerTest', 4, 12, NULL, 6, NULL, '2014-07-03 20:48:49', NULL, 1, 0, NULL),
(1457, 52, '2014-07-03 17:18:26', 7, '2014-07-02', '2014-07-03 20:48:49', 'Foi no início da Tarde', 2, 3, NULL, 6, NULL, '2014-07-03 20:48:49', NULL, 1, 0, NULL),
(1458, 2, '2014-07-03 19:19:13', 4, '2014-07-03', '2014-07-03 19:30:39', 's2DatabaseTests - Criado teste para procedure ''park_cash_closing'';', 1, 6, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1459, 37, '2014-07-03 19:19:19', 4, '2014-07-03', '2014-07-03 19:30:39', 's2DatabaseTests - Criado teste para procedure ''park_cash_closing'';', 4, 6, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1460, 37, '2014-07-03 19:19:55', 4, '2014-07-03', '2014-07-03 19:30:39', 's2DatabaseTests - Criado teste para procedure ''park_cash_closing'';', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1461, 37, '2014-07-03 19:20:19', 4, '2014-07-03', '2014-07-03 19:30:39', 's2DatabaseTests - Criado teste para procedure ''park_cash_closing'';', 4, 12, NULL, 6, NULL, '2014-07-03 19:30:39', NULL, 1, 0, NULL),
(1462, 42, '2014-07-03 19:45:55', 7, '2014-07-03', '2014-07-03 20:48:49', 'Foi melhorado os testes Unitários do RelatóriodeTicketsController ', 4, 6, NULL, 6, NULL, '2014-07-03 20:48:49', NULL, 1, 0, NULL),
(1463, 37, '2014-07-03 19:46:50', 7, '2014-07-03', '2014-07-03 20:48:50', 'Foi Criado testes Unitários do RelatoriodeTicketsController', 4, 6, NULL, 6, NULL, '2014-07-03 20:48:50', NULL, 1, 0, NULL),
(1464, 2, '2014-07-03 19:50:33', 7, '2014-07-03', '2014-07-03 20:48:50', 'Relat?oioTicketsController ', 1, 6, NULL, 6, NULL, '2014-07-03 20:48:50', NULL, 1, 0, NULL),
(1465, 61, '2014-07-04 21:27:50', 1, '2014-07-04', '2014-07-04 21:51:17', 'Movimentos pos.', 2, 12, NULL, 6, NULL, '2014-07-04 21:51:17', NULL, 2, 0, NULL),
(1466, 59, '2014-07-04 21:28:10', 1, '2014-07-04', '2014-07-04 21:31:35', 'Nome do time', 2, 24, NULL, 6, NULL, '2014-07-04 21:31:35', NULL, 1, 0, NULL),
(1467, 52, '2014-07-04 21:28:10', 4, '2014-07-04', '2014-07-04 21:28:58', 'Período da tarde', 2, 3, NULL, 6, NULL, '2014-07-04 21:28:58', NULL, 1, 0, NULL),
(1468, 52, '2014-07-04 21:28:23', 1, '2014-07-04', '2014-07-04 21:31:36', 'Hoje.', 2, 3, NULL, 6, NULL, '2014-07-04 21:31:36', NULL, 1, 0, NULL),
(1469, 61, '2014-07-04 21:28:49', 4, '2014-07-04', '2014-07-04 21:31:36', 'Demonstração da forma de pagamento no histórico de tickets no login do cliente.', 2, 12, NULL, 6, NULL, '2014-07-04 21:31:36', NULL, 2, 0, NULL),
(1470, 61, '2014-07-04 21:29:11', 4, '2014-07-04', '2014-07-04 21:31:36', 'Demonstração da retirada do relatório de extratos no login do associado.', 2, 12, NULL, 6, NULL, '2014-07-04 21:31:36', NULL, 2, 0, NULL),
(1471, 52, '2014-07-04 21:31:51', 7, '2014-07-04', '2014-07-04 21:49:19', 'Hoje', 2, 3, NULL, 6, NULL, '2014-07-04 21:49:19', NULL, 1, 0, NULL),
(1472, 57, '2014-07-04 21:44:11', 4, '2014-07-04', '2014-07-04 21:45:21', 'Test Inspection do sprint 33', 4, 60, NULL, 6, NULL, '2014-07-04 21:45:21', NULL, 1, 0, NULL),
(1473, 52, '2014-07-04 21:48:56', 3, '2014-07-04', '2014-07-04 21:49:03', 'User story', 2, 3, NULL, 6, NULL, '2014-07-04 21:49:03', NULL, 2, 0, NULL),
(1474, 72, '2014-07-04 21:49:21', 3, '2014-07-03', '2014-07-04 21:50:30', 'Extrato da placa POS', 4, 12, NULL, 6, NULL, '2014-07-04 21:50:30', NULL, 1, 0, NULL),
(1475, 72, '2014-07-04 21:49:38', 3, '2014-07-03', '2014-07-04 21:50:30', 'Extrato da placa App', 4, 12, NULL, 6, NULL, '2014-07-04 21:50:30', NULL, 1, 0, NULL),
(1478, 26, '2014-07-05 18:01:08', 5, '2014-07-05', NULL, 'asdfasdfasdf', 3, 120, NULL, 6, NULL, NULL, NULL, 2, 0, 'f476d7a2c23b9a24a10d777c8897b835b5176962cb6a428e067254db3817b06d'),
(1479, 9, '2014-07-06 15:20:17', 1, '2014-07-06', '2014-08-09 20:22:26', '1', 1, 24, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, 'dab92508887eebc399e3144626c7ea5cba1f41ccf18019729b65fa1a96981669'),
(1480, 9, '2014-07-06 15:20:17', 1, '2014-07-06', '2014-08-09 20:22:26', '2', 1, 24, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, 'aa321d17ca12342cdfe15b6f7b39238ac92c36a7974c54dc1024b227d4a872c9'),
(1481, 9, '2014-07-06 15:20:17', 1, '2014-07-06', '2014-08-09 20:22:26', '3', 1, 24, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, '0616438af5941e02984b9ddc671ffb74835695305c04d8cb7580edcb736acf86'),
(1482, 9, '2014-07-06 15:20:17', 1, '2014-07-06', '2014-08-09 20:22:26', '4', 1, 24, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, 'ab9f32ee15c443bbe093f8ae47ab65ce635d90580a55db866c5a62503711b611'),
(1483, 9, '2014-07-06 15:20:17', 1, '2014-07-06', '2014-08-09 20:22:26', '5', 1, 24, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, '408b7e4b5e0fd055404585ff54fa0451185399d6a1887de70b163f3c3d69dd9b'),
(1484, 74, '2014-07-06 22:20:07', 9, '2014-07-06', '2014-07-06 22:21:38', 'DONE', 5, 147, NULL, 8, NULL, '2014-07-06 22:21:38', NULL, 1, 0, '1fe6ed2396f56f80b1eb4991149b083b5f4227fe41bcf943a2822445341f717f'),
(1485, 74, '2014-07-06 22:20:07', 9, '2014-07-06', '2014-07-06 22:21:39', 'DONE2', 5, 147, NULL, 8, NULL, '2014-07-06 22:21:39', NULL, 1, 0, '0f3759a97d10466e07cd267b61826a3864e7ac20368813df30ea44fd1b260b56'),
(1486, 75, '2014-07-06 22:22:57', 9, '2014-07-06', '2014-07-06 22:24:40', 'adfasdf', 5, 38, NULL, 8, NULL, NULL, '2014-07-06 22:24:40', 0, 2, '4b4696b9ac9ac27890ea01f908a9dd2887f3d5074fd28ca75b48800f0107f308'),
(1487, 75, '2014-07-06 22:22:57', 9, '2014-07-06', '2014-07-06 22:24:40', 'fffffffffffffffffff', 5, 38, NULL, 8, NULL, NULL, '2014-07-06 22:24:40', 0, 2, 'a4899049017c62b6e51a61d4c291b50356015ca571d25a32c398975a7984cc8d'),
(1488, 75, '2014-07-06 22:23:05', 9, '2014-07-06', '2014-07-06 22:24:40', 'fffffffffasdf', 5, 38, NULL, 8, NULL, '2014-07-06 22:24:40', NULL, 2, 0, 'c76d8196df8ac15235d293228f9e89c1d481d2c662b55d1c5450e751bf6b9e0e'),
(1489, 75, '2014-07-06 22:23:05', 9, '2014-07-06', '2014-07-06 22:24:41', 'asdfasdfasdf', 5, 38, NULL, 8, NULL, '2014-07-06 22:24:41', NULL, 2, 0, 'ae482331a667b262b3c0e00d4bd80a8f5b2648d8dfd3c39d4ab16a0030fca3c7'),
(1490, 9, '2014-07-09 22:56:48', 1, '2014-07-09', '2014-08-09 20:22:26', 'asdfasdfasdfasdf', 1, 24, NULL, 6, 4, '2014-08-09 20:22:26', NULL, 1, 0, 'b4082bec8780fe8dd288a103a365e5a6ebb518eccc293d39327080d3c5b84349'),
(1491, 11, '2014-08-09 20:20:08', 1, '2014-08-09', '2014-08-09 20:22:26', 'asdfasdfasdfasdf', 1, 48, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, '8f906837512f02c740462845b2b7ad2524bdfa96212bfd0cc15029b4b62c778c'),
(1492, 11, '2014-08-09 20:20:08', 1, '2014-08-09', '2014-08-09 20:22:26', 'asdfasdfasdf', 1, 48, NULL, 6, NULL, '2014-08-09 20:22:26', NULL, 1, 0, '9ebb001f4a364fa71ad74e93da3115bb72e4018b97222d63331180865155fbef'),
(1495, 11, '2014-08-09 20:23:52', 5, '2014-08-09', '2014-08-09 20:24:08', 'asdfasdfasdf', 1, 40, NULL, 6, NULL, '2014-08-09 20:24:08', NULL, 1, 0, '441479ce11a1ad5053eb6117353cd37e801e7c3ef1e126efb486306279fef32e'),
(1496, 11, '2014-08-09 20:23:52', 5, '2014-08-09', '2014-08-09 20:24:08', 'asdfasfasdfasdfsaf', 1, 40, NULL, 6, NULL, '2014-08-09 20:24:08', NULL, 1, 0, '56c78b2e3b69ec47b042b46bb10c5ab7d78d3c3bb91c2f9561a8d38b868eb115'),
(1497, 11, '2014-08-09 20:23:52', 5, '2014-08-09', '2014-08-09 20:24:08', 'asdfasdfasdfasdfasdfas', 1, 40, NULL, 6, NULL, '2014-08-09 20:24:08', NULL, 1, 0, '0b635803720353da0afab17a02d0127e16c91217d9e8378053e45a5d0348cceb'),
(1498, 11, '2014-08-16 16:39:38', 1, '2014-08-15', NULL, 'asdfasdfasdf', 1, 40, NULL, 6, NULL, NULL, NULL, 0, 0, '8cb7a5a170092affb596fffc2cf733e4d775cecfd2d95afdc29a86b0de81b056'),
(1499, 9, '2014-08-23 12:25:45', 1, '2014-08-22', NULL, 'asdfasdfasdfasdfasdasdfasdfasdfasdf', 1, 20, NULL, 6, NULL, NULL, NULL, 0, 0, 'f9502841c33f86bf1056a32faa1dfaa9794016a05fbbbf9ecef5da0be8604646');

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_tag`
--

CREATE TABLE IF NOT EXISTS `log_tag` (
`id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=332 ;

--
-- Extraindo dados da tabela `log_tag`
--

INSERT INTO `log_tag` (`id`, `log_id`, `tag_id`) VALUES
(42, 3, 14),
(43, 11, 14),
(44, 26, 14),
(213, 34, 20),
(45, 41, 14),
(46, 62, 14),
(47, 63, 14),
(48, 73, 14),
(214, 74, 20),
(215, 78, 20),
(49, 91, 14),
(130, 95, 15),
(131, 103, 15),
(132, 104, 15),
(252, 113, 18),
(133, 120, 15),
(253, 130, 18),
(50, 131, 14),
(216, 138, 20),
(217, 139, 20),
(51, 164, 14),
(52, 171, 14),
(53, 182, 14),
(54, 186, 14),
(55, 190, 14),
(134, 198, 15),
(56, 208, 14),
(57, 213, 14),
(58, 215, 14),
(135, 222, 15),
(59, 223, 14),
(60, 229, 14),
(61, 235, 14),
(62, 244, 14),
(136, 255, 15),
(137, 259, 15),
(254, 260, 18),
(63, 263, 14),
(138, 267, 15),
(139, 272, 15),
(64, 276, 14),
(140, 282, 15),
(141, 295, 15),
(142, 308, 15),
(65, 315, 14),
(143, 317, 15),
(144, 318, 15),
(66, 330, 14),
(145, 334, 15),
(146, 343, 15),
(147, 344, 15),
(255, 347, 18),
(256, 348, 18),
(148, 353, 15),
(149, 354, 15),
(150, 359, 15),
(151, 363, 15),
(152, 365, 15),
(153, 375, 15),
(154, 385, 15),
(155, 386, 15),
(156, 387, 15),
(157, 388, 15),
(158, 413, 15),
(159, 414, 15),
(160, 451, 15),
(161, 458, 15),
(162, 469, 15),
(163, 477, 15),
(164, 481, 15),
(67, 493, 14),
(68, 500, 14),
(165, 508, 15),
(69, 512, 14),
(166, 539, 15),
(70, 548, 14),
(71, 554, 14),
(257, 558, 18),
(258, 560, 18),
(72, 567, 14),
(167, 592, 15),
(168, 602, 15),
(169, 606, 15),
(73, 610, 14),
(218, 613, 20),
(74, 614, 14),
(75, 617, 14),
(76, 619, 14),
(77, 621, 14),
(78, 626, 14),
(170, 628, 15),
(79, 638, 14),
(80, 655, 14),
(171, 660, 15),
(81, 669, 14),
(259, 675, 18),
(260, 680, 18),
(82, 687, 14),
(261, 690, 18),
(262, 692, 18),
(172, 695, 15),
(173, 702, 15),
(83, 706, 14),
(84, 709, 14),
(174, 715, 15),
(85, 723, 14),
(175, 727, 15),
(176, 748, 15),
(86, 774, 14),
(87, 777, 14),
(177, 782, 15),
(178, 785, 15),
(88, 796, 14),
(89, 797, 14),
(90, 806, 14),
(91, 807, 14),
(179, 812, 15),
(92, 836, 14),
(180, 842, 15),
(219, 848, 20),
(181, 849, 15),
(263, 851, 18),
(264, 853, 18),
(265, 855, 18),
(266, 857, 18),
(267, 859, 18),
(182, 860, 15),
(220, 861, 20),
(183, 864, 15),
(221, 869, 20),
(184, 870, 15),
(268, 872, 18),
(269, 874, 18),
(270, 876, 18),
(271, 878, 18),
(272, 880, 18),
(222, 881, 20),
(223, 888, 20),
(185, 896, 15),
(93, 905, 14),
(186, 912, 15),
(224, 918, 20),
(187, 925, 15),
(273, 940, 18),
(274, 942, 18),
(94, 947, 14),
(95, 949, 14),
(225, 952, 20),
(96, 953, 14),
(226, 962, 20),
(188, 963, 15),
(189, 968, 15),
(227, 971, 20),
(228, 978, 20),
(97, 981, 14),
(98, 988, 14),
(229, 990, 20),
(99, 999, 14),
(100, 1000, 14),
(101, 1001, 14),
(230, 1011, 20),
(102, 1013, 14),
(231, 1029, 20),
(103, 1039, 14),
(232, 1047, 20),
(104, 1050, 14),
(233, 1052, 20),
(105, 1053, 14),
(234, 1055, 20),
(106, 1058, 14),
(190, 1060, 15),
(235, 1062, 20),
(236, 1067, 20),
(107, 1069, 14),
(237, 1089, 20),
(108, 1091, 14),
(191, 1099, 15),
(192, 1103, 15),
(275, 1111, 18),
(276, 1113, 18),
(109, 1116, 14),
(193, 1118, 15),
(277, 1124, 18),
(278, 1127, 18),
(110, 1129, 14),
(238, 1130, 20),
(111, 1133, 14),
(239, 1142, 20),
(194, 1144, 15),
(195, 1151, 15),
(240, 1153, 20),
(112, 1156, 14),
(241, 1159, 20),
(196, 1162, 15),
(242, 1168, 20),
(197, 1171, 15),
(279, 1177, 18),
(280, 1179, 18),
(281, 1183, 18),
(198, 1187, 15),
(199, 1195, 15),
(200, 1199, 15),
(282, 1206, 18),
(283, 1208, 18),
(284, 1212, 18),
(243, 1220, 20),
(201, 1222, 15),
(202, 1227, 15),
(244, 1229, 20),
(245, 1232, 20),
(203, 1234, 15),
(204, 1240, 15),
(113, 1251, 14),
(114, 1253, 14),
(205, 1300, 15),
(246, 1302, 20),
(285, 1306, 18),
(286, 1307, 18),
(287, 1309, 18),
(206, 1323, 15),
(207, 1328, 15),
(208, 1334, 15),
(115, 1337, 14),
(247, 1339, 20),
(116, 1340, 14),
(248, 1342, 20),
(209, 1344, 15),
(210, 1347, 15),
(117, 1359, 14),
(118, 1374, 14),
(119, 1382, 14),
(120, 1384, 14),
(121, 1387, 14),
(249, 1405, 20),
(122, 1408, 14),
(123, 1413, 14),
(124, 1417, 14),
(211, 1421, 15),
(250, 1430, 20),
(125, 1431, 14),
(251, 1437, 20),
(126, 1439, 14),
(127, 1444, 14),
(128, 1455, 14),
(212, 1459, 15),
(129, 1463, 14),
(292, 1479, 14),
(289, 1479, 15),
(290, 1479, 16),
(294, 1479, 17),
(291, 1479, 18),
(293, 1479, 19),
(288, 1479, 20),
(299, 1480, 14),
(296, 1480, 15),
(297, 1480, 16),
(301, 1480, 17),
(298, 1480, 18),
(300, 1480, 19),
(295, 1480, 20),
(306, 1481, 14),
(303, 1481, 15),
(304, 1481, 16),
(308, 1481, 17),
(305, 1481, 18),
(307, 1481, 19),
(302, 1481, 20),
(313, 1482, 14),
(310, 1482, 15),
(311, 1482, 16),
(315, 1482, 17),
(312, 1482, 18),
(314, 1482, 19),
(309, 1482, 20),
(320, 1483, 14),
(317, 1483, 15),
(318, 1483, 16),
(322, 1483, 17),
(319, 1483, 18),
(321, 1483, 19),
(316, 1483, 20),
(323, 1484, 22),
(324, 1485, 22),
(325, 1488, 22),
(326, 1489, 22),
(329, 1490, 14),
(327, 1490, 15),
(331, 1490, 17),
(328, 1490, 18),
(330, 1490, 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_votes`
--

CREATE TABLE IF NOT EXISTS `log_votes` (
`id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `vote` smallint(5) NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `comment` varchar(250) NOT NULL DEFAULT '',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

--
-- Extraindo dados da tabela `log_votes`
--

INSERT INTO `log_votes` (`id`, `log_id`, `vote`, `player_id`, `comment`, `creation`) VALUES
(1, 1347, 1, 1, 'Um voto de crédito pro colega novo.', '2014-06-16 15:06:09'),
(2, 1348, 1, 7, 'Ok', '2014-06-18 15:47:53'),
(3, 1350, 1, 7, 'Fui Auxiliado com o CakePHP', '2014-06-18 15:49:24'),
(4, 1350, 1, 5, 'ok', '2014-06-18 17:35:56'),
(5, 1349, 1, 1, 'Ok', '2014-06-23 10:23:17'),
(6, 1351, 1, 5, 'ok', '2014-06-23 10:32:45'),
(7, 1352, 1, 5, 'ok', '2014-06-23 10:32:45'),
(8, 1353, 1, 7, 'Ok', '2014-06-23 12:38:15'),
(9, 1354, 1, 7, 'Ok', '2014-06-23 12:38:15'),
(10, 1355, 1, 5, 'ok', '2014-06-23 12:39:06'),
(11, 1356, 1, 5, 'ok', '2014-06-23 12:39:06'),
(12, 1352, 1, 7, 'Ok', '2014-06-23 12:45:26'),
(13, 1357, 1, 7, 'Ok', '2014-06-24 11:02:16'),
(14, 1360, 1, 7, 'Ok', '2014-06-25 12:50:46'),
(15, 1358, 1, 1, 'ok', '2014-06-25 13:08:50'),
(16, 1359, 1, 1, 'ok', '2014-06-25 13:08:50'),
(17, 1361, -1, 1, 'somente após concluída', '2014-06-25 13:08:50'),
(18, 1362, 1, 1, 'ok', '2014-06-25 13:08:50'),
(19, 1363, 1, 1, 'ok', '2014-06-25 13:08:50'),
(20, 1364, 1, 1, 'ok', '2014-06-25 13:08:50'),
(21, 1365, 1, 1, 'ok', '2014-06-25 13:08:50'),
(22, 1366, 1, 1, 'ok', '2014-06-25 13:08:50'),
(23, 1367, 1, 1, 'ok', '2014-06-25 13:08:50'),
(24, 1368, 1, 1, 'ok', '2014-06-25 13:08:50'),
(25, 1369, 1, 1, 'ok', '2014-06-25 13:08:50'),
(26, 1370, 1, 1, 'ok', '2014-06-25 13:08:50'),
(27, 1371, 1, 1, 'ok', '2014-06-25 13:08:50'),
(28, 1376, 1, 7, 'Ok', '2014-06-25 16:21:34'),
(29, 1355, 1, 1, 'ojk', '2014-06-25 16:27:05'),
(30, 1380, 1, 1, 'ok', '2014-06-25 16:29:49'),
(31, 1384, 1, 1, 'ok', '2014-06-26 13:49:15'),
(32, 1385, 1, 1, 'ok', '2014-06-26 13:49:15'),
(33, 1372, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(34, 1373, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(35, 1374, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(36, 1375, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(37, 1377, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(38, 1378, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(39, 1381, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(40, 1382, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(41, 1383, 1, 4, 'Revisado', '2014-06-26 16:46:46'),
(42, 1386, 1, 7, 'ok', '2014-06-26 19:51:11'),
(43, 1387, 1, 7, 'Ok', '2014-06-26 19:51:11'),
(44, 1388, 1, 7, 'Ok', '2014-06-26 19:51:11'),
(45, 1389, 1, 1, 'ok', '2014-06-27 09:49:44'),
(46, 1391, 1, 1, 'ok', '2014-06-27 09:49:44'),
(47, 1392, 1, 1, 'ok', '2014-06-27 09:49:44'),
(48, 1390, 1, 4, 'Verificado', '2014-06-30 13:16:16'),
(49, 1394, 1, 4, 'Verificado OK', '2014-06-30 13:16:16'),
(50, 1393, 1, 1, 'ok', '2014-06-30 14:30:40'),
(51, 1395, 1, 1, 'ok', '2014-06-30 14:30:40'),
(52, 1396, 1, 1, 'ok', '2014-06-30 14:30:40'),
(53, 1397, 1, 1, 'ok', '2014-06-30 14:30:40'),
(54, 1398, 1, 1, 'ok', '2014-06-30 14:30:40'),
(55, 1399, 1, 1, 'ok', '2014-06-30 14:30:40'),
(56, 1400, 1, 1, 'ok', '2014-06-30 14:30:40'),
(57, 1401, 1, 1, 'ok', '2014-06-30 14:30:40'),
(58, 1402, 1, 1, 'ok', '2014-06-30 14:30:40'),
(59, 1403, 1, 5, 'ok', '2014-06-30 16:08:05'),
(60, 1404, 1, 1, 'ok', '2014-06-30 18:57:52'),
(61, 1405, 1, 1, 'ok', '2014-06-30 18:57:52'),
(62, 1420, 1, 7, 'Ok', '2014-07-01 15:35:02'),
(63, 1421, 1, 7, 'Ok', '2014-07-01 15:35:03'),
(64, 1422, 1, 7, 'Ok', '2014-07-01 15:35:03'),
(65, 1423, 1, 7, 'Ok', '2014-07-01 15:35:03'),
(66, 1406, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(67, 1407, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(68, 1408, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(69, 1409, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(70, 1410, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(71, 1411, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(72, 1412, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(73, 1413, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(74, 1414, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(75, 1415, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(76, 1416, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(77, 1417, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(78, 1418, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(79, 1419, 1, 4, 'Verificado', '2014-07-01 19:46:35'),
(80, 1411, 1, 7, 'Ok', '2014-07-01 19:47:04'),
(81, 1415, 1, 7, 'OK', '2014-07-01 19:47:04'),
(82, 1419, 1, 7, 'OK', '2014-07-01 19:47:04'),
(83, 1424, 1, 4, 'Verificado', '2014-07-01 19:51:05'),
(84, 1427, 1, 1, 'ok', '2014-07-02 17:42:11'),
(85, 1429, 1, 1, 'ok', '2014-07-02 17:42:11'),
(86, 1430, 1, 1, 'ok', '2014-07-02 17:42:11'),
(87, 1431, 1, 1, 'ok', '2014-07-02 17:42:11'),
(88, 1432, 1, 1, 'ok', '2014-07-02 17:42:11'),
(89, 1433, 1, 1, 'ok', '2014-07-02 17:42:11'),
(90, 1434, 1, 7, 'ok', '2014-07-02 18:08:11'),
(91, 1435, 1, 7, 'ok', '2014-07-02 18:08:11'),
(92, 1440, 1, 7, 'Ok', '2014-07-02 18:08:22'),
(93, 1426, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(94, 1434, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(95, 1435, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(96, 1436, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(97, 1437, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(98, 1438, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(99, 1439, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(100, 1440, 1, 4, 'Verificado', '2014-07-02 18:09:15'),
(101, 1441, 1, 4, 'OK', '2014-07-02 18:09:15'),
(102, 1442, 1, 4, 'ok', '2014-07-03 10:29:15'),
(103, 1443, 1, 4, 'ok', '2014-07-03 10:29:15'),
(104, 1444, 1, 4, 'ok', '2014-07-03 10:29:15'),
(105, 1445, 1, 4, 'ok', '2014-07-03 10:29:15'),
(106, 1446, 1, 4, 'ok', '2014-07-03 10:29:15'),
(107, 1447, 1, 4, 'ok', '2014-07-03 10:29:15'),
(108, 1453, 1, 7, 'Ok', '2014-07-03 13:19:09'),
(109, 1448, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(110, 1449, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(111, 1450, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(112, 1451, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(113, 1452, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(114, 1458, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(115, 1459, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(116, 1460, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(117, 1461, 1, 7, 'Ok', '2014-07-03 15:30:37'),
(118, 1454, 1, 1, 'ok', '2014-07-03 16:48:49'),
(119, 1455, 1, 1, 'ok', '2014-07-03 16:48:49'),
(120, 1456, 1, 1, 'ok', '2014-07-03 16:48:49'),
(121, 1457, 1, 1, 'ok', '2014-07-03 16:48:49'),
(122, 1462, 1, 1, 'ok', '2014-07-03 16:48:49'),
(123, 1463, 1, 1, 'ok', '2014-07-03 16:48:49'),
(124, 1464, 1, 1, 'ok', '2014-07-03 16:48:49'),
(125, 1467, 1, 1, 'japãozinho safado', '2014-07-04 17:28:58'),
(126, 1469, 1, 1, 'tava mais ou menos, mas ok', '2014-07-04 17:29:12'),
(127, 1470, 1, 1, 'é, deu pro gasto', '2014-07-04 17:29:30'),
(128, 1465, 1, 7, 'Ok', '2014-07-04 17:31:35'),
(129, 1466, 1, 7, 'Ok', '2014-07-04 17:31:35'),
(130, 1468, 1, 7, 'Ok', '2014-07-04 17:31:35'),
(131, 1469, 1, 7, 'Ok', '2014-07-04 17:31:35'),
(132, 1470, 1, 7, 'Ok', '2014-07-04 17:31:35'),
(133, 1472, 1, 7, 'OK', '2014-07-04 17:45:20'),
(134, 1473, 1, 7, 'Ok', '2014-07-04 17:49:03'),
(135, 1471, 1, 1, 'ok', '2014-07-04 17:49:19'),
(136, 1473, 1, 1, 'ok', '2014-07-04 17:49:19'),
(137, 1474, 1, 7, 'Ok', '2014-07-04 17:50:29'),
(138, 1475, 1, 7, 'Ok', '2014-07-04 17:50:29'),
(139, 1465, 1, 4, 'ok', '2014-07-04 17:51:17'),
(140, 1478, 1, 4, 'Nice!', '2014-07-05 18:01:30'),
(141, 1478, 1, 1, 'Good work man!', '2014-07-05 18:14:12'),
(142, 1484, 1, 20, 'Fine!', '2014-07-06 22:21:38'),
(143, 1485, 1, 20, 'that''s it!', '2014-07-06 22:21:38'),
(144, 1486, -1, 20, 'not', '2014-07-06 22:23:28'),
(145, 1487, -1, 20, 'not', '2014-07-06 22:23:28'),
(146, 1489, 1, 20, 'fffff', '2014-07-06 22:23:35'),
(147, 1488, 1, 20, 'ffffffffff', '2014-07-06 22:23:35'),
(148, 1486, -1, 21, 'radfasdf', '2014-07-06 22:24:40'),
(149, 1487, -1, 21, 'asdfasdfasd', '2014-07-06 22:24:40'),
(150, 1488, 1, 21, 'asdfasdfas', '2014-07-06 22:24:40'),
(151, 1489, 1, 21, 'fasdfasdfas', '2014-07-06 22:24:40'),
(152, 1481, 1, 5, 'sadfas', '2014-08-09 20:22:26'),
(153, 1483, 1, 5, 'asdf', '2014-08-09 20:22:26'),
(154, 1479, 1, 5, 'asdfasdf', '2014-08-09 20:22:26'),
(155, 1480, 1, 5, 'dfasd', '2014-08-09 20:22:26'),
(156, 1482, 1, 5, 'dfadf', '2014-08-09 20:22:26'),
(157, 1490, 1, 5, 'asdf', '2014-08-09 20:22:26'),
(158, 1491, 1, 5, 'fasdf', '2014-08-09 20:22:26'),
(159, 1492, 1, 5, 'asdfasdfas', '2014-08-09 20:22:26'),
(160, 1495, 1, 1, 'aaaa', '2014-08-09 20:24:08'),
(161, 1497, 1, 1, 'aaaaaaaaaaaa', '2014-08-09 20:24:08'),
(162, 1496, 1, 1, 'aaaaaaaaaaaaaaaaaaa', '2014-08-09 20:24:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
`id` int(10) unsigned NOT NULL,
  `text` varchar(200) NOT NULL,
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `player_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(30) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'success',
  `action` varchar(10) DEFAULT NULL,
  `player_id_sender` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1381 ;

--
-- Extraindo dados da tabela `notification`
--

INSERT INTO `notification` (`id`, `text`, `read`, `player_id`, `created`, `title`, `type`, `action`, `player_id_sender`) VALUES
(1, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-03-19 17:31:56', 'Experience Points', 'success', NULL, NULL),
(2, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-03-19 17:31:56', 'Experience Points', 'success', NULL, NULL),
(3, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-03-19 17:31:56', 'Experience Points', 'success', NULL, NULL),
(4, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-03-19 17:31:56', 'Experience Points', 'success', NULL, NULL),
(5, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-03-19 17:31:56', 'Experience Points', 'success', NULL, NULL),
(6, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:24', 'Experience Points', 'success', NULL, NULL),
(7, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-20 11:46:24', 'Experience Points', 'success', NULL, NULL),
(8, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-20 11:46:24', 'Experience Points', 'success', NULL, NULL),
(9, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:24', 'Experience Points', 'success', NULL, NULL),
(10, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:24', 'Experience Points', 'success', NULL, NULL),
(11, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:37', 'Experience Points', 'success', NULL, NULL),
(12, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:37', 'Experience Points', 'success', NULL, NULL),
(13, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:37', 'Experience Points', 'success', NULL, NULL),
(14, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-20 11:46:37', 'Experience Points', 'success', NULL, NULL),
(15, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 11:46:37', 'Experience Points', 'success', NULL, NULL),
(16, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-03-20 18:51:56', 'Experience Points', 'success', NULL, NULL),
(17, 'Your activity was reviewed and you earned 2 XP.', 1, 1, '2014-03-21 09:20:26', 'Experience Points', 'success', NULL, NULL),
(18, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-20 18:53:00', 'Experience Points', 'success', NULL, NULL),
(19, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-03-20 18:54:04', 'Experience Points', 'success', NULL, NULL),
(20, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-03-20 18:54:04', 'Experience Points', 'success', NULL, NULL),
(21, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-03-20 18:54:04', 'Experience Points', 'success', NULL, NULL),
(22, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-03-20 18:54:04', 'Experience Points', 'success', NULL, NULL),
(23, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-03-31 12:44:10', 'Experience Points', 'success', NULL, NULL),
(24, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-21 14:33:13', 'Experience Points', 'success', NULL, NULL),
(25, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-21 14:33:13', 'Experience Points', 'success', NULL, NULL),
(26, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:20:39', 'Experience Points', 'success', NULL, NULL),
(27, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:20:39', 'Experience Points', 'success', NULL, NULL),
(28, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:20:39', 'Experience Points', 'success', NULL, NULL),
(29, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:20:39', 'Experience Points', 'success', NULL, NULL),
(30, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:20:39', 'Experience Points', 'success', NULL, NULL),
(31, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:21:08', 'Experience Points', 'success', NULL, NULL),
(32, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:21:08', 'Experience Points', 'success', NULL, NULL),
(33, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:21:08', 'Experience Points', 'success', NULL, NULL),
(34, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:21:08', 'Experience Points', 'success', NULL, NULL),
(35, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:21:08', 'Experience Points', 'success', NULL, NULL),
(36, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:22:59', 'Experience Points', 'success', NULL, NULL),
(37, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-21 19:22:59', 'Experience Points', 'success', NULL, NULL),
(38, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:13', 'Experience Points', 'success', NULL, NULL),
(39, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:13', 'Experience Points', 'success', NULL, NULL),
(40, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-21 14:33:13', 'Experience Points', 'success', NULL, NULL),
(41, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:33', 'Experience Points', 'success', NULL, NULL),
(42, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:33', 'Experience Points', 'success', NULL, NULL),
(43, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:33', 'Experience Points', 'success', NULL, NULL),
(44, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:33', 'Experience Points', 'success', NULL, NULL),
(45, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-21 14:33:33', 'Experience Points', 'success', NULL, NULL),
(46, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-24 11:14:43', 'Experience Points', 'success', NULL, NULL),
(47, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-25 17:42:49', 'Experience Points', 'success', NULL, NULL),
(48, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-03-26 10:58:35', 'Experience Points', 'success', NULL, NULL),
(49, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-26 10:58:35', 'Experience Points', 'success', NULL, NULL),
(50, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-03-26 10:58:35', 'Experience Points', 'success', NULL, NULL),
(51, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-25 17:42:54', 'Experience Points', 'success', NULL, NULL),
(52, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-25 17:42:54', 'Experience Points', 'success', NULL, NULL),
(53, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-25 17:42:54', 'Experience Points', 'success', NULL, NULL),
(54, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-25 17:43:12', 'Experience Points', 'success', NULL, NULL),
(55, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-25 17:43:12', 'Experience Points', 'success', NULL, NULL),
(56, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-25 17:43:12', 'Experience Points', 'success', NULL, NULL),
(57, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-27 15:36:15', 'Experience Points', 'success', NULL, NULL),
(58, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-03-27 15:36:15', 'Experience Points', 'success', NULL, NULL),
(59, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-27 15:36:15', 'Experience Points', 'success', NULL, NULL),
(60, 'Your activity was reviewed and you earned 50 XP.', 1, 5, '2014-03-27 11:43:48', 'Experience Points', 'success', NULL, NULL),
(61, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-27 11:43:48', 'Experience Points', 'success', NULL, NULL),
(62, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-27 11:43:48', 'Experience Points', 'success', NULL, NULL),
(63, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-27 11:43:48', 'Experience Points', 'success', NULL, NULL),
(64, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-03-27 11:43:48', 'Experience Points', 'success', NULL, NULL),
(65, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-27 11:44:05', 'Experience Points', 'success', NULL, NULL),
(66, 'Your activity was reviewed and you earned 50 XP.', 1, 5, '2014-03-27 11:44:05', 'Experience Points', 'success', NULL, NULL),
(67, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-27 15:15:48', 'Experience Points', 'success', NULL, NULL),
(68, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-03-27 15:15:48', 'Experience Points', 'success', NULL, NULL),
(69, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-03-31 09:50:26', 'Experience Points', 'success', NULL, NULL),
(70, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-03-31 09:50:26', 'Experience Points', 'success', NULL, NULL),
(71, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-03-31 09:25:32', 'Experience Points', 'success', NULL, NULL),
(72, 'Your activity was reviewed and you earned 2 XP.', 1, 1, '2014-03-31 09:25:32', 'Experience Points', 'success', NULL, NULL),
(73, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-28 18:02:01', 'Experience Points', 'success', NULL, NULL),
(74, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-03-28 18:02:01', 'Experience Points', 'success', NULL, NULL),
(75, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-03-31 10:15:59', 'Activity Reviewed', 'success', NULL, NULL),
(76, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-03-30 20:32:42', 'Activity Reviewed', 'success', NULL, NULL),
(77, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-31 16:04:36', 'Activity Reviewed', 'success', NULL, NULL),
(78, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-03-31 14:56:43', 'Activity Reviewed', 'success', NULL, NULL),
(79, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-03-31 16:04:36', 'Activity Reviewed', 'success', NULL, NULL),
(80, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-03-31 14:56:48', 'Activity Reviewed', 'success', NULL, NULL),
(81, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-31 16:04:36', 'Activity Reviewed', 'success', NULL, NULL),
(82, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-03-31 14:56:50', 'Activity Reviewed', 'success', NULL, NULL),
(83, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-03-31 16:04:36', 'Activity Reviewed', 'success', NULL, NULL),
(84, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-03-31 14:56:52', 'Activity Reviewed', 'success', NULL, NULL),
(85, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-03-31 16:04:36', 'Activity Reviewed', 'success', NULL, NULL),
(86, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-03-31 14:56:56', 'Activity Reviewed', 'success', NULL, NULL),
(87, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-03-31 16:04:42', 'Activity Reviewed', 'success', NULL, NULL),
(88, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-03-31 14:57:11', 'Activity Reviewed', 'success', NULL, NULL),
(89, 'Your activity was reviewed and you earned 3 XP.', 1, 4, '2014-03-31 16:04:03', 'Activity Reviewed', 'success', NULL, NULL),
(90, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-03-31 14:57:12', 'Activity Reviewed', 'success', NULL, NULL),
(91, 'Your activity was reviewed and you earned 3 XP.', 1, 5, '2014-03-31 18:52:21', 'Activity Reviewed', 'success', NULL, NULL),
(92, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-03-31 14:57:15', 'Activity Reviewed', 'success', NULL, NULL),
(93, 'Your activity was reviewed and you earned 3 XP.', 1, 1, '2014-04-01 14:17:58', 'Activity Reviewed', 'success', NULL, NULL),
(94, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:19', 'Activity Reviewed', 'success', NULL, NULL),
(95, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-04-01 16:22:54', 'Activity Reviewed', 'success', NULL, NULL),
(96, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:21', 'Activity Reviewed', 'success', NULL, NULL),
(97, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-04-01 16:22:54', 'Activity Reviewed', 'success', NULL, NULL),
(98, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:23', 'Activity Reviewed', 'success', NULL, NULL),
(99, 'Your activity was reviewed and you earned 3 XP.', 1, 1, '2014-04-01 14:17:58', 'Activity Reviewed', 'success', NULL, NULL),
(100, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:25', 'Activity Reviewed', 'success', NULL, NULL),
(101, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-04-01 16:22:54', 'Activity Reviewed', 'success', NULL, NULL),
(102, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:27', 'Activity Reviewed', 'success', NULL, NULL),
(103, 'Your activity was reviewed and you earned 3 XP.', 1, 1, '2014-04-01 14:17:58', 'Activity Reviewed', 'success', NULL, NULL),
(104, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:31', 'Activity Reviewed', 'success', NULL, NULL),
(105, 'Your activity was reviewed and you earned 3 XP.', 1, 5, '2014-04-02 10:06:15', 'Activity Reviewed', 'success', NULL, NULL),
(106, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:33', 'Activity Reviewed', 'success', NULL, NULL),
(107, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-02 10:06:15', 'Activity Reviewed', 'success', NULL, NULL),
(108, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 10:52:35', 'Activity Reviewed', 'success', NULL, NULL),
(109, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-02 10:06:15', 'Activity Reviewed', 'success', NULL, NULL),
(110, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 10:52:36', 'Activity Reviewed', 'success', NULL, NULL),
(111, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-02 10:06:15', 'Activity Reviewed', 'success', NULL, NULL),
(112, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 10:52:40', 'Activity Reviewed', 'success', NULL, NULL),
(113, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-02 10:06:15', 'Activity Reviewed', 'success', NULL, NULL),
(114, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 10:52:42', 'Activity Reviewed', 'success', NULL, NULL),
(115, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-02 15:30:29', 'Activity Reviewed', 'success', NULL, NULL),
(116, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 10:52:44', 'Activity Reviewed', 'success', NULL, NULL),
(117, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-02 15:30:29', 'Activity Reviewed', 'success', NULL, NULL),
(118, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 10:52:46', 'Activity Reviewed', 'success', NULL, NULL),
(119, 'Your activity was reviewed and you earned 3 XP.', 1, 2, '2014-04-02 19:42:47', 'Activity Reviewed', 'success', NULL, NULL),
(120, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 10:52:52', 'Activity Reviewed', 'success', NULL, NULL),
(121, 'Your activity was reviewed and you earned 20 XP.', 1, 2, '2014-04-02 19:42:47', 'Activity Reviewed', 'success', NULL, NULL),
(122, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-01 10:52:53', 'Activity Reviewed', 'success', NULL, NULL),
(123, 'Your activity was reviewed and you earned 0 XP.', 1, 4, '2014-04-02 10:41:10', 'Activity Reviewed', 'success', NULL, NULL),
(124, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-01 16:48:37', 'Activity Reviewed', 'success', NULL, NULL),
(125, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 10:41:10', 'Activity Reviewed', 'success', NULL, NULL),
(126, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:48:42', 'Activity Reviewed', 'success', NULL, NULL),
(127, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 10:41:10', 'Activity Reviewed', 'success', NULL, NULL),
(128, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:48:45', 'Activity Reviewed', 'success', NULL, NULL),
(129, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-02 10:41:10', 'Activity Reviewed', 'success', NULL, NULL),
(130, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:48:51', 'Activity Reviewed', 'success', NULL, NULL),
(131, 'Your activity was reviewed and you earned 3 XP.', 1, 4, '2014-04-02 10:41:10', 'Activity Reviewed', 'success', NULL, NULL),
(132, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 16:48:54', 'Activity Reviewed', 'success', NULL, NULL),
(133, 'Your activity was reviewed and you earned 3 XP.', 1, 4, '2014-04-02 10:41:12', 'Activity Reviewed', 'success', NULL, NULL),
(134, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 16:48:56', 'Activity Reviewed', 'success', NULL, NULL),
(135, 'Your activity was reviewed and you earned 3 XP.', 1, 4, '2014-04-02 10:41:12', 'Activity Reviewed', 'success', NULL, NULL),
(136, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-01 16:48:57', 'Activity Reviewed', 'success', NULL, NULL),
(137, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-02 18:50:47', 'Activity Reviewed', 'success', NULL, NULL),
(138, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:05', 'Activity Reviewed', 'success', NULL, NULL),
(139, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-02 18:50:47', 'Activity Reviewed', 'success', NULL, NULL),
(140, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-01 16:49:07', 'Activity Reviewed', 'success', NULL, NULL),
(141, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:50:47', 'Activity Reviewed', 'success', NULL, NULL),
(142, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:12', 'Activity Reviewed', 'success', NULL, NULL),
(143, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:50:47', 'Activity Reviewed', 'success', NULL, NULL),
(144, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:13', 'Activity Reviewed', 'success', NULL, NULL),
(145, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:50:47', 'Activity Reviewed', 'success', NULL, NULL),
(146, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:18', 'Activity Reviewed', 'success', NULL, NULL),
(147, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-02 18:51:03', 'Activity Reviewed', 'success', NULL, NULL),
(148, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:20', 'Activity Reviewed', 'success', NULL, NULL),
(149, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:51:03', 'Activity Reviewed', 'success', NULL, NULL),
(150, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:21', 'Activity Reviewed', 'success', NULL, NULL),
(151, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:51:03', 'Activity Reviewed', 'success', NULL, NULL),
(152, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:26', 'Activity Reviewed', 'success', NULL, NULL),
(153, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-02 18:51:03', 'Activity Reviewed', 'success', NULL, NULL),
(154, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:30', 'Activity Reviewed', 'success', NULL, NULL),
(155, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-02 18:51:03', 'Activity Reviewed', 'success', NULL, NULL),
(156, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:31', 'Activity Reviewed', 'success', NULL, NULL),
(157, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-02 18:51:25', 'Activity Reviewed', 'success', NULL, NULL),
(158, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:34', 'Activity Reviewed', 'success', NULL, NULL),
(159, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 10:41:12', 'Activity Reviewed', 'success', NULL, NULL),
(160, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:36', 'Activity Reviewed', 'success', NULL, NULL),
(161, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-02 10:41:12', 'Activity Reviewed', 'success', NULL, NULL),
(162, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-01 16:49:38', 'Activity Reviewed', 'success', NULL, NULL),
(163, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 10:41:12', 'Activity Reviewed', 'success', NULL, NULL),
(164, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-01 16:49:39', 'Activity Reviewed', 'success', NULL, NULL),
(165, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(166, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:54:54', 'Activity Reviewed', 'success', NULL, NULL),
(167, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(168, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:54:57', 'Activity Reviewed', 'success', NULL, NULL),
(169, 'Your activity was reviewed and you earned 25 XP.', 1, 3, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(170, 'You reviewed an activity and earned 25 XP.', 1, 6, '2014-04-02 10:55:01', 'Activity Reviewed', 'success', NULL, NULL),
(171, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(172, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:55:17', 'Activity Reviewed', 'success', NULL, NULL),
(173, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(174, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:55:23', 'Activity Reviewed', 'success', NULL, NULL),
(175, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:53', 'Activity Reviewed', 'success', NULL, NULL),
(176, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:55:25', 'Activity Reviewed', 'success', NULL, NULL),
(177, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-02 10:55:53', 'Activity Reviewed', 'success', NULL, NULL),
(178, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:55:29', 'Activity Reviewed', 'success', NULL, NULL),
(179, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:53', 'Activity Reviewed', 'success', NULL, NULL),
(180, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:55:31', 'Activity Reviewed', 'success', NULL, NULL),
(181, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-02 10:55:53', 'Activity Reviewed', 'success', NULL, NULL),
(182, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:55:38', 'Activity Reviewed', 'success', NULL, NULL),
(183, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-02 10:55:53', 'Activity Reviewed', 'success', NULL, NULL),
(184, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-02 10:55:50', 'Activity Reviewed', 'success', NULL, NULL),
(185, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-02 10:56:05', 'Activity Reviewed', 'success', NULL, NULL),
(186, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:55:52', 'Activity Reviewed', 'success', NULL, NULL),
(187, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-02 10:56:05', 'Activity Reviewed', 'success', NULL, NULL),
(188, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:55:54', 'Activity Reviewed', 'success', NULL, NULL),
(189, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 12:55:23', 'Activity Reviewed', 'success', NULL, NULL),
(190, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:56:00', 'Activity Reviewed', 'success', NULL, NULL),
(191, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 12:55:23', 'Activity Reviewed', 'success', NULL, NULL),
(192, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:56:02', 'Activity Reviewed', 'success', NULL, NULL),
(193, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-02 12:55:23', 'Activity Reviewed', 'success', NULL, NULL),
(194, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-02 10:56:05', 'Activity Reviewed', 'success', NULL, NULL),
(195, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-03 16:01:34', 'Activity Reviewed', 'success', NULL, NULL),
(196, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:11:11', 'Activity Reviewed', 'success', NULL, NULL),
(197, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-03 16:01:34', 'Activity Reviewed', 'success', NULL, NULL),
(198, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:11:17', 'Activity Reviewed', 'success', NULL, NULL),
(199, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-03 16:01:34', 'Activity Reviewed', 'success', NULL, NULL),
(200, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:11:20', 'Activity Reviewed', 'success', NULL, NULL),
(201, 'Your activity was reviewed and you earned 3 XP.', 1, 2, '2014-04-03 20:04:35', 'Activity Reviewed', 'success', NULL, NULL),
(202, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-03 12:11:27', 'Activity Reviewed', 'success', NULL, NULL),
(203, 'Your activity was reviewed and you earned 3 XP.', 1, 2, '2014-04-03 20:04:35', 'Activity Reviewed', 'success', NULL, NULL),
(204, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-03 12:11:30', 'Activity Reviewed', 'success', NULL, NULL),
(205, 'Your activity was reviewed and you earned 20 XP.', 1, 2, '2014-04-03 20:04:35', 'Activity Reviewed', 'success', NULL, NULL),
(206, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-03 12:11:37', 'Activity Reviewed', 'success', NULL, NULL),
(207, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-03 12:13:46', 'Activity Reviewed', 'success', NULL, NULL),
(208, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:12:04', 'Activity Reviewed', 'success', NULL, NULL),
(209, 'Your activity was reviewed and you earned 0 XP.', 1, 1, '2014-04-03 12:13:46', 'Activity Reviewed', 'success', NULL, NULL),
(210, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-03 12:12:12', 'Activity Reviewed', 'success', NULL, NULL),
(211, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-03 12:13:46', 'Activity Reviewed', 'success', NULL, NULL),
(212, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:12:22', 'Activity Reviewed', 'success', NULL, NULL),
(213, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-03 12:13:46', 'Activity Reviewed', 'success', NULL, NULL),
(214, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:12:36', 'Activity Reviewed', 'success', NULL, NULL),
(215, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-03 12:13:46', 'Activity Reviewed', 'success', NULL, NULL),
(216, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:12:39', 'Activity Reviewed', 'success', NULL, NULL),
(217, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-03 12:14:08', 'Activity Reviewed', 'success', NULL, NULL),
(218, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:12:43', 'Activity Reviewed', 'success', NULL, NULL),
(219, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-03 12:14:08', 'Activity Reviewed', 'success', NULL, NULL),
(220, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:13:02', 'Activity Reviewed', 'success', NULL, NULL),
(221, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-03 12:14:08', 'Activity Reviewed', 'success', NULL, NULL),
(222, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:13:15', 'Activity Reviewed', 'success', NULL, NULL),
(223, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-03 12:14:08', 'Activity Reviewed', 'success', NULL, NULL),
(224, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-03 12:13:17', 'Activity Reviewed', 'success', NULL, NULL),
(225, 'Your activity was reviewed and you earned 15 XP.', 1, 1, '2014-04-03 12:14:08', 'Activity Reviewed', 'success', NULL, NULL),
(226, 'You reviewed an activity and earned 15 XP.', 1, 6, '2014-04-03 12:13:41', 'Activity Reviewed', 'success', NULL, NULL),
(227, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-04-03 20:04:35', 'Activity Reviewed', 'success', NULL, NULL),
(228, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:13:48', 'Activity Reviewed', 'success', NULL, NULL),
(229, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-03 12:14:15', 'Activity Reviewed', 'success', NULL, NULL),
(230, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:13:52', 'Activity Reviewed', 'success', NULL, NULL),
(231, 'Your activity was reviewed and you earned 0 XP.', 1, 1, '2014-04-03 12:14:15', 'Activity Reviewed', 'success', NULL, NULL),
(232, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-03 12:13:55', 'Activity Reviewed', 'success', NULL, NULL),
(233, 'Your activity was reviewed and you earned 15 XP.', 1, 2, '2014-04-03 20:04:35', 'Activity Reviewed', 'success', NULL, NULL),
(234, 'You reviewed an activity and earned 15 XP.', 1, 6, '2014-04-03 12:14:01', 'Activity Reviewed', 'success', NULL, NULL),
(235, 'Your activity was reviewed and you earned 0 XP.', 1, 2, '2014-04-03 20:05:37', 'Activity Reviewed', 'success', NULL, NULL),
(236, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-03 12:14:19', 'Activity Reviewed', 'success', NULL, NULL),
(237, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-04-03 20:05:37', 'Activity Reviewed', 'success', NULL, NULL),
(238, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:14:27', 'Activity Reviewed', 'success', NULL, NULL),
(239, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-03 20:05:37', 'Activity Reviewed', 'success', NULL, NULL),
(240, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:14:54', 'Activity Reviewed', 'success', NULL, NULL),
(241, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-03 20:05:37', 'Activity Reviewed', 'success', NULL, NULL),
(242, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:14:56', 'Activity Reviewed', 'success', NULL, NULL),
(243, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-04-03 20:05:37', 'Activity Reviewed', 'success', NULL, NULL),
(244, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:14:58', 'Activity Reviewed', 'success', NULL, NULL),
(245, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-03 20:05:42', 'Activity Reviewed', 'success', NULL, NULL),
(246, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:15:01', 'Activity Reviewed', 'success', NULL, NULL),
(247, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-03 20:05:42', 'Activity Reviewed', 'success', NULL, NULL),
(248, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:15:04', 'Activity Reviewed', 'success', NULL, NULL),
(249, 'Your activity was reviewed and you earned 0 XP.', 1, 2, '2014-04-03 20:05:42', 'Activity Reviewed', 'success', NULL, NULL),
(250, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-03 12:15:06', 'Activity Reviewed', 'success', NULL, NULL),
(251, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-04-03 20:05:42', 'Activity Reviewed', 'success', NULL, NULL),
(252, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-03 12:15:08', 'Activity Reviewed', 'success', NULL, NULL),
(253, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-03 20:05:42', 'Activity Reviewed', 'success', NULL, NULL),
(254, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-03 12:15:09', 'Activity Reviewed', 'success', NULL, NULL),
(255, 'Your activity was reviewed and you earned 2 XP.', 1, 2, '2014-04-03 20:07:03', 'Activity Reviewed', 'success', NULL, NULL),
(256, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-03 12:15:12', 'Activity Reviewed', 'success', NULL, NULL),
(257, 'Your activity was reviewed and you earned 3 XP.', 1, 1, '2014-04-03 15:40:10', 'Activity Reviewed', 'success', NULL, NULL),
(258, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-03 12:15:14', 'Activity Reviewed', 'success', NULL, NULL),
(259, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-04-04 11:51:36', 'Activity Reviewed', 'success', NULL, NULL),
(260, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-04 09:56:59', 'Activity Reviewed', 'success', NULL, NULL),
(261, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-04 11:51:36', 'Activity Reviewed', 'success', NULL, NULL),
(262, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:57:12', 'Activity Reviewed', 'success', NULL, NULL),
(263, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-04 11:51:36', 'Activity Reviewed', 'success', NULL, NULL),
(264, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:57:18', 'Activity Reviewed', 'success', NULL, NULL),
(265, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-04 11:51:36', 'Activity Reviewed', 'success', NULL, NULL),
(266, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:57:20', 'Activity Reviewed', 'success', NULL, NULL),
(267, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-04 11:51:36', 'Activity Reviewed', 'success', NULL, NULL),
(268, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:57:24', 'Activity Reviewed', 'success', NULL, NULL),
(269, 'Your activity was reviewed and you earned 15 XP.', 1, 3, '2014-04-04 12:06:22', 'Activity Reviewed', 'success', NULL, NULL),
(270, 'You reviewed an activity and earned 15 XP.', 1, 6, '2014-04-04 09:57:33', 'Activity Reviewed', 'success', NULL, NULL),
(271, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-04 12:06:22', 'Activity Reviewed', 'success', NULL, NULL),
(272, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:57:38', 'Activity Reviewed', 'success', NULL, NULL),
(273, 'Your activity was reviewed and you earned 3 XP.', 1, 3, '2014-04-04 12:06:22', 'Activity Reviewed', 'success', NULL, NULL),
(274, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-04 09:57:55', 'Activity Reviewed', 'success', NULL, NULL),
(275, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-08 12:36:11', 'Activity Reviewed', 'success', NULL, NULL),
(276, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:58:01', 'Activity Reviewed', 'success', NULL, NULL),
(277, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-04 10:03:51', 'Activity Reviewed', 'success', NULL, NULL),
(278, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:58:04', 'Activity Reviewed', 'success', NULL, NULL),
(279, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-04 10:03:51', 'Activity Reviewed', 'success', NULL, NULL),
(280, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:58:09', 'Activity Reviewed', 'success', NULL, NULL),
(281, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-04 10:03:51', 'Activity Reviewed', 'success', NULL, NULL),
(282, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:58:11', 'Activity Reviewed', 'success', NULL, NULL),
(283, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-04 12:06:22', 'Activity Reviewed', 'success', NULL, NULL),
(284, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:58:13', 'Activity Reviewed', 'success', NULL, NULL),
(285, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-04 12:06:22', 'Activity Reviewed', 'success', NULL, NULL),
(286, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:58:18', 'Activity Reviewed', 'success', NULL, NULL),
(287, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-04 10:06:55', 'Activity Reviewed', 'success', NULL, NULL),
(288, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:58:20', 'Activity Reviewed', 'success', NULL, NULL),
(289, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-04 10:06:55', 'Activity Reviewed', 'success', NULL, NULL),
(290, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-04 09:58:22', 'Activity Reviewed', 'success', NULL, NULL),
(291, 'Your activity was reviewed and you earned 5 XP.', 1, 2, '2014-04-04 10:06:55', 'Activity Reviewed', 'success', NULL, NULL),
(292, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-04 09:58:29', 'Activity Reviewed', 'success', NULL, NULL),
(293, 'Your activity was reviewed and you earned 3 XP.', 1, 2, '2014-04-04 10:06:55', 'Activity Reviewed', 'success', NULL, NULL),
(294, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-04 09:58:31', 'Activity Reviewed', 'success', NULL, NULL),
(295, 'Your activity was reviewed and you earned 3 XP.', 1, 5, '2014-04-07 13:22:39', 'Activity Reviewed', 'success', NULL, NULL),
(296, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-04-04 17:48:19', 'Activity Reviewed', 'success', NULL, NULL),
(297, 'Your activity was reviewed and you earned 20 XP.', 1, 5, '2014-04-07 13:22:39', 'Activity Reviewed', 'success', NULL, NULL),
(298, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-04 17:48:22', 'Activity Reviewed', 'success', NULL, NULL),
(299, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-09 10:48:50', 'Activity Reviewed', 'success', NULL, NULL),
(300, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 10:11:46', 'Activity Reviewed', 'success', NULL, NULL),
(301, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-09 10:48:50', 'Activity Reviewed', 'success', NULL, NULL),
(302, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:11:50', 'Activity Reviewed', 'success', NULL, NULL),
(303, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-09 10:48:50', 'Activity Reviewed', 'success', NULL, NULL),
(304, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 10:11:54', 'Activity Reviewed', 'success', NULL, NULL),
(305, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-09 10:48:50', 'Activity Reviewed', 'success', NULL, NULL),
(306, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:11:57', 'Activity Reviewed', 'success', NULL, NULL),
(307, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-10 12:49:23', 'Activity Reviewed', 'success', NULL, NULL),
(308, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:12:04', 'Activity Reviewed', 'success', NULL, NULL),
(309, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-10 12:49:23', 'Activity Reviewed', 'success', NULL, NULL),
(310, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:12:06', 'Activity Reviewed', 'success', NULL, NULL),
(311, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-09 21:14:52', 'Activity Reviewed', 'success', NULL, NULL),
(312, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:12:09', 'Activity Reviewed', 'success', NULL, NULL),
(313, 'Your activity was reviewed and you earned 10 XP.', 1, 2, '2014-04-09 21:14:52', 'Activity Reviewed', 'success', NULL, NULL),
(314, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 10:12:13', 'Activity Reviewed', 'success', NULL, NULL),
(315, 'Your activity was reviewed and you earned 2 XP.', 1, 2, '2014-04-09 21:14:52', 'Activity Reviewed', 'success', NULL, NULL),
(316, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-08 10:12:14', 'Activity Reviewed', 'success', NULL, NULL),
(317, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-08 16:36:47', 'Activity Reviewed', 'success', NULL, NULL),
(318, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:15', 'Activity Reviewed', 'success', NULL, NULL),
(319, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:01', 'Activity Reviewed', 'success', NULL, NULL),
(320, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:25', 'Activity Reviewed', 'success', NULL, NULL),
(321, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:01', 'Activity Reviewed', 'success', NULL, NULL),
(322, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:29', 'Activity Reviewed', 'success', NULL, NULL),
(323, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-08 18:11:01', 'Activity Reviewed', 'success', NULL, NULL),
(324, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 15:37:36', 'Activity Reviewed', 'success', NULL, NULL),
(325, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-08 18:11:01', 'Activity Reviewed', 'success', NULL, NULL),
(326, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 15:37:40', 'Activity Reviewed', 'success', NULL, NULL),
(327, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:01', 'Activity Reviewed', 'success', NULL, NULL),
(328, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:42', 'Activity Reviewed', 'success', NULL, NULL),
(329, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:12', 'Activity Reviewed', 'success', NULL, NULL),
(330, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:44', 'Activity Reviewed', 'success', NULL, NULL),
(331, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-08 18:11:12', 'Activity Reviewed', 'success', NULL, NULL),
(332, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-08 15:37:46', 'Activity Reviewed', 'success', NULL, NULL),
(333, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:12', 'Activity Reviewed', 'success', NULL, NULL),
(334, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:48', 'Activity Reviewed', 'success', NULL, NULL),
(335, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-08 18:11:12', 'Activity Reviewed', 'success', NULL, NULL),
(336, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-08 15:37:50', 'Activity Reviewed', 'success', NULL, NULL),
(337, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-10 19:55:02', 'Activity Reviewed', 'success', NULL, NULL),
(338, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-09 10:11:46', 'Activity Reviewed', 'success', NULL, NULL),
(339, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-10 09:53:03', 'Activity Reviewed', 'success', NULL, NULL),
(340, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-09 15:35:47', 'Activity Reviewed', 'success', NULL, NULL),
(341, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-10 09:53:03', 'Activity Reviewed', 'success', NULL, NULL),
(342, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-09 15:36:01', 'Activity Reviewed', 'success', NULL, NULL),
(343, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-10 09:53:03', 'Activity Reviewed', 'success', NULL, NULL),
(344, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-09 15:36:03', 'Activity Reviewed', 'success', NULL, NULL),
(345, 'Your activity was reviewed and you earned 5 XP.', 1, 3, '2014-04-10 09:53:03', 'Activity Reviewed', 'success', NULL, NULL),
(346, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-09 15:36:44', 'Activity Reviewed', 'success', NULL, NULL),
(347, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:05:48', 'Activity Reviewed', 'success', NULL, NULL),
(348, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:45:05', 'Activity Reviewed', 'success', NULL, NULL),
(349, 'Your activity was reviewed and you earned 0 XP.', 1, 1, '2014-04-10 20:05:48', 'Activity Reviewed', 'success', NULL, NULL),
(350, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-10 19:45:11', 'Activity Reviewed', 'success', NULL, NULL),
(351, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-10 20:05:48', 'Activity Reviewed', 'success', NULL, NULL),
(352, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:45:14', 'Activity Reviewed', 'success', NULL, NULL),
(353, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:05:48', 'Activity Reviewed', 'success', NULL, NULL),
(354, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:45:18', 'Activity Reviewed', 'success', NULL, NULL),
(355, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-10 20:05:48', 'Activity Reviewed', 'success', NULL, NULL),
(356, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:45:28', 'Activity Reviewed', 'success', NULL, NULL),
(357, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:05:54', 'Activity Reviewed', 'success', NULL, NULL),
(358, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:45:44', 'Activity Reviewed', 'success', NULL, NULL),
(359, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-10 20:05:54', 'Activity Reviewed', 'success', NULL, NULL),
(360, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:45:47', 'Activity Reviewed', 'success', NULL, NULL),
(361, 'Your activity was reviewed and you earned 15 XP.', 1, 1, '2014-04-10 20:05:54', 'Activity Reviewed', 'success', NULL, NULL),
(362, 'You reviewed an activity and earned 15 XP.', 1, 6, '2014-04-10 19:45:50', 'Activity Reviewed', 'success', NULL, NULL),
(363, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-10 20:05:54', 'Activity Reviewed', 'success', NULL, NULL),
(364, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:45:57', 'Activity Reviewed', 'success', NULL, NULL),
(365, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:05:54', 'Activity Reviewed', 'success', NULL, NULL),
(366, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:46:07', 'Activity Reviewed', 'success', NULL, NULL),
(367, 'Your activity was reviewed and you earned 0 XP.', 1, 1, '2014-04-10 20:06:09', 'Activity Reviewed', 'success', NULL, NULL),
(368, 'You reviewed an activity and earned 0 XP.', 1, 6, '2014-04-10 19:46:15', 'Activity Reviewed', 'success', NULL, NULL),
(369, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:06:09', 'Activity Reviewed', 'success', NULL, NULL),
(370, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:46:23', 'Activity Reviewed', 'success', NULL, NULL),
(371, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-10 20:06:09', 'Activity Reviewed', 'success', NULL, NULL),
(372, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:46:25', 'Activity Reviewed', 'success', NULL, NULL),
(373, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-10 20:06:09', 'Activity Reviewed', 'success', NULL, NULL),
(374, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:46:26', 'Activity Reviewed', 'success', NULL, NULL),
(375, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-11 13:19:12', 'Activity Reviewed', 'success', NULL, NULL),
(376, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:46:31', 'Activity Reviewed', 'success', NULL, NULL),
(377, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-11 13:19:12', 'Activity Reviewed', 'success', NULL, NULL),
(378, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:46:39', 'Activity Reviewed', 'success', NULL, NULL),
(379, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-11 13:19:12', 'Activity Reviewed', 'success', NULL, NULL),
(380, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:46:58', 'Activity Reviewed', 'success', NULL, NULL),
(381, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-11 13:19:12', 'Activity Reviewed', 'success', NULL, NULL),
(382, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:47:06', 'Activity Reviewed', 'success', NULL, NULL),
(383, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-11 13:19:12', 'Activity Reviewed', 'success', NULL, NULL),
(384, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-10 19:47:08', 'Activity Reviewed', 'success', NULL, NULL),
(385, 'Your activity was reviewed and you earned 20 XP.', 1, 3, '2014-04-11 10:58:16', 'Activity Reviewed', 'success', NULL, NULL),
(386, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-10 19:47:53', 'Activity Reviewed', 'success', NULL, NULL),
(387, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-11 10:58:16', 'Activity Reviewed', 'success', NULL, NULL),
(388, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:48:02', 'Activity Reviewed', 'success', NULL, NULL),
(389, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-11 10:58:16', 'Activity Reviewed', 'success', NULL, NULL),
(390, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:48:08', 'Activity Reviewed', 'success', NULL, NULL),
(391, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-11 10:58:16', 'Activity Reviewed', 'success', NULL, NULL),
(392, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:48:09', 'Activity Reviewed', 'success', NULL, NULL),
(393, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-11 10:58:16', 'Activity Reviewed', 'success', NULL, NULL);
INSERT INTO `notification` (`id`, `text`, `read`, `player_id`, `created`, `title`, `type`, `action`, `player_id_sender`) VALUES
(394, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-10 19:48:11', 'Activity Reviewed', 'success', NULL, NULL),
(395, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-11 13:19:30', 'Activity Reviewed', 'success', NULL, NULL),
(396, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-11 10:58:24', 'Activity Reviewed', 'success', NULL, NULL),
(397, 'Your activity was reviewed and you earned 20 XP.', 1, 4, '2014-04-14 15:30:57', 'Activity Reviewed', 'success', NULL, NULL),
(398, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:58:29', 'Activity Reviewed', 'success', NULL, NULL),
(399, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-11 15:51:42', 'Activity Reviewed', 'success', NULL, NULL),
(400, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-11 10:58:33', 'Activity Reviewed', 'success', NULL, NULL),
(401, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-11 15:51:42', 'Activity Reviewed', 'success', NULL, NULL),
(402, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:58:36', 'Activity Reviewed', 'success', NULL, NULL),
(403, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:42', 'Activity Reviewed', 'success', NULL, NULL),
(404, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:39', 'Activity Reviewed', 'success', NULL, NULL),
(405, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:42', 'Activity Reviewed', 'success', NULL, NULL),
(406, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:40', 'Activity Reviewed', 'success', NULL, NULL),
(407, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:42', 'Activity Reviewed', 'success', NULL, NULL),
(408, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:42', 'Activity Reviewed', 'success', NULL, NULL),
(409, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-11 15:51:56', 'Activity Reviewed', 'success', NULL, NULL),
(410, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-11 10:58:43', 'Activity Reviewed', 'success', NULL, NULL),
(411, 'Your activity was reviewed and you earned 5 XP.', 1, 1, '2014-04-11 15:51:56', 'Activity Reviewed', 'success', NULL, NULL),
(412, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-11 10:58:45', 'Activity Reviewed', 'success', NULL, NULL),
(413, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:56', 'Activity Reviewed', 'success', NULL, NULL),
(414, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:46', 'Activity Reviewed', 'success', NULL, NULL),
(415, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:56', 'Activity Reviewed', 'success', NULL, NULL),
(416, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:48', 'Activity Reviewed', 'success', NULL, NULL),
(417, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:51:56', 'Activity Reviewed', 'success', NULL, NULL),
(418, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:49', 'Activity Reviewed', 'success', NULL, NULL),
(419, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-11 15:52:10', 'Activity Reviewed', 'success', NULL, NULL),
(420, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:51', 'Activity Reviewed', 'success', NULL, NULL),
(421, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-14 15:30:57', 'Activity Reviewed', 'success', NULL, NULL),
(422, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-11 10:58:55', 'Activity Reviewed', 'success', NULL, NULL),
(423, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-11 15:52:10', 'Activity Reviewed', 'success', NULL, NULL),
(424, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:59:02', 'Activity Reviewed', 'success', NULL, NULL),
(425, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-11 15:52:10', 'Activity Reviewed', 'success', NULL, NULL),
(426, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:59:03', 'Activity Reviewed', 'success', NULL, NULL),
(427, 'Your activity was reviewed and you earned 20 XP.', 1, 1, '2014-04-11 15:52:10', 'Activity Reviewed', 'success', NULL, NULL),
(428, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:59:04', 'Activity Reviewed', 'success', NULL, NULL),
(429, 'Your activity was reviewed and you earned 50 XP.', 1, 1, '2014-04-11 15:52:10', 'Activity Reviewed', 'success', NULL, NULL),
(430, 'You reviewed an activity and earned 50 XP.', 1, 6, '2014-04-11 10:59:06', 'Activity Reviewed', 'success', NULL, NULL),
(431, 'Your activity was reviewed and you earned 20 XP.', 1, 4, '2014-04-14 15:30:57', 'Activity Reviewed', 'success', NULL, NULL),
(432, 'You reviewed an activity and earned 20 XP.', 1, 6, '2014-04-11 10:59:16', 'Activity Reviewed', 'success', NULL, NULL),
(433, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-15 13:21:23', 'Activity Reviewed', 'success', NULL, NULL),
(434, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:22:30', 'Activity Reviewed', 'success', NULL, NULL),
(435, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-15 13:21:23', 'Activity Reviewed', 'success', NULL, NULL),
(436, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:22:34', 'Activity Reviewed', 'success', NULL, NULL),
(437, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-15 13:21:23', 'Activity Reviewed', 'success', NULL, NULL),
(438, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:22:36', 'Activity Reviewed', 'success', NULL, NULL),
(439, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-15 13:21:23', 'Activity Reviewed', 'success', NULL, NULL),
(440, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:18', 'Activity Reviewed', 'success', NULL, NULL),
(441, 'Your activity was reviewed and you earned 10 XP.', 1, 1, '2014-04-15 13:21:23', 'Activity Reviewed', 'success', NULL, NULL),
(442, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:20', 'Activity Reviewed', 'success', NULL, NULL),
(443, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-14 21:02:17', 'Activity Reviewed', 'success', NULL, NULL),
(444, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:24', 'Activity Reviewed', 'success', NULL, NULL),
(445, 'Your activity was reviewed and you earned 15 XP.', 1, 5, '2014-04-14 21:02:17', 'Activity Reviewed', 'success', NULL, NULL),
(446, 'You reviewed an activity and earned 15 XP.', 1, 6, '2014-04-14 19:23:31', 'Activity Reviewed', 'success', NULL, NULL),
(447, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-14 21:02:17', 'Activity Reviewed', 'success', NULL, NULL),
(448, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-14 19:23:33', 'Activity Reviewed', 'success', NULL, NULL),
(449, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-14 21:02:17', 'Activity Reviewed', 'success', NULL, NULL),
(450, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:35', 'Activity Reviewed', 'success', NULL, NULL),
(451, 'Your activity was reviewed and you earned 10 XP.', 1, 5, '2014-04-14 21:02:17', 'Activity Reviewed', 'success', NULL, NULL),
(452, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:39', 'Activity Reviewed', 'success', NULL, NULL),
(453, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-16 10:00:37', 'Activity Reviewed', 'success', NULL, NULL),
(454, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:43', 'Activity Reviewed', 'success', NULL, NULL),
(455, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-16 10:00:37', 'Activity Reviewed', 'success', NULL, NULL),
(456, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:23:46', 'Activity Reviewed', 'success', NULL, NULL),
(457, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-16 10:00:37', 'Activity Reviewed', 'success', NULL, NULL),
(458, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:24:14', 'Activity Reviewed', 'success', NULL, NULL),
(459, 'Your activity was reviewed and you earned 5 XP.', 1, 5, '2014-04-14 21:02:23', 'Activity Reviewed', 'success', NULL, NULL),
(460, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-14 19:24:30', 'Activity Reviewed', 'success', NULL, NULL),
(461, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-14 19:24:43', 'Activity Reviewed', 'success', NULL, NULL),
(462, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:24:33', 'Activity Reviewed', 'success', NULL, NULL),
(463, 'Your activity was reviewed and you earned 10 XP.', 1, 4, '2014-04-16 10:00:37', 'Activity Reviewed', 'success', NULL, NULL),
(464, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:24:37', 'Activity Reviewed', 'success', NULL, NULL),
(465, 'Your activity was reviewed and you earned 5 XP.', 1, 4, '2014-04-16 10:00:37', 'Activity Reviewed', 'success', NULL, NULL),
(466, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-14 19:24:38', 'Activity Reviewed', 'success', NULL, NULL),
(467, 'Your activity was reviewed and you earned 10 XP.', 1, 3, '2014-04-15 16:34:25', 'Activity Reviewed', 'success', NULL, NULL),
(468, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-14 19:28:34', 'Activity Reviewed', 'success', NULL, NULL),
(469, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-15 16:46:37', 'Activity Reviewed', 'success', NULL, NULL),
(470, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-15 16:46:41', 'Activity Reviewed', 'success', NULL, NULL),
(471, 'You reviewed an activity and earned 6 XP.', 1, 6, '2014-04-15 16:46:45', 'Activity Reviewed', 'success', NULL, NULL),
(472, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-15 16:48:19', 'Activity Reviewed', 'success', NULL, NULL),
(473, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:00', 'Activity Reviewed', 'success', NULL, NULL),
(474, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-16 17:54:02', 'Activity Reviewed', 'success', NULL, NULL),
(475, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:04', 'Activity Reviewed', 'success', NULL, NULL),
(476, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:05', 'Activity Reviewed', 'success', NULL, NULL),
(477, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-16 17:54:08', 'Activity Reviewed', 'success', NULL, NULL),
(478, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:09', 'Activity Reviewed', 'success', NULL, NULL),
(479, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:13', 'Activity Reviewed', 'success', NULL, NULL),
(480, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-16 17:54:15', 'Activity Reviewed', 'success', NULL, NULL),
(481, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-16 17:54:19', 'Activity Reviewed', 'success', NULL, NULL),
(482, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-17 17:22:08', 'Activity Reviewed', 'success', NULL, NULL),
(483, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-22 10:53:08', 'Activity Reviewed', 'success', NULL, NULL),
(484, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-22 10:53:10', 'Activity Reviewed', 'success', NULL, NULL),
(485, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-22 10:53:22', 'Activity Reviewed', 'success', NULL, NULL),
(486, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:24', 'Activity Reviewed', 'success', NULL, NULL),
(487, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:26', 'Activity Reviewed', 'success', NULL, NULL),
(488, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:30', 'Activity Reviewed', 'success', NULL, NULL),
(489, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:33', 'Activity Reviewed', 'success', NULL, NULL),
(490, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-22 10:53:35', 'Activity Reviewed', 'success', NULL, NULL),
(491, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-22 10:53:37', 'Activity Reviewed', 'success', NULL, NULL),
(492, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:42', 'Activity Reviewed', 'success', NULL, NULL),
(493, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-22 10:53:43', 'Activity Reviewed', 'success', NULL, NULL),
(494, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-23 14:54:03', 'Activity Reviewed', 'success', NULL, NULL),
(495, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-23 14:54:06', 'Activity Reviewed', 'success', NULL, NULL),
(496, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-23 14:54:09', 'Activity Reviewed', 'success', NULL, NULL),
(497, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-23 14:54:12', 'Activity Reviewed', 'success', NULL, NULL),
(498, 'Vinícius reached level 7!', 1, 1, '2014-04-24 09:59:42', 'Level Up', 'warning', NULL, NULL),
(499, 'Vinícius reached level 7!', 1, 2, '2014-04-23 20:04:13', 'Level Up', 'warning', NULL, NULL),
(500, 'Vinícius reached level 7!', 1, 3, '2014-04-24 19:43:15', 'Level Up', 'warning', NULL, NULL),
(501, 'Vinícius reached level 7!', 1, 4, '2014-04-23 17:58:45', 'Level Up', 'warning', NULL, NULL),
(502, 'Vinícius reached level 7!', 1, 5, '2014-04-23 15:40:20', 'Level Up', 'warning', NULL, NULL),
(503, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-23 14:54:14', 'Activity Reviewed', 'success', NULL, NULL),
(504, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-23 14:54:16', 'Activity Reviewed', 'success', NULL, NULL),
(505, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-23 14:54:21', 'Activity Reviewed', 'success', NULL, NULL),
(506, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-24 11:08:50', 'Activity Reviewed', 'success', NULL, NULL),
(507, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-24 11:08:52', 'Activity Reviewed', 'success', NULL, NULL),
(508, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-24 11:08:56', 'Activity Reviewed', 'success', NULL, NULL),
(509, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-24 11:08:59', 'Activity Reviewed', 'success', NULL, NULL),
(510, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-24 11:09:07', 'Activity Reviewed', 'success', NULL, NULL),
(511, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-24 11:09:08', 'Activity Reviewed', 'success', NULL, NULL),
(512, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-28 10:44:26', 'Activity Reviewed', 'success', NULL, NULL),
(513, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:44:31', 'Activity Reviewed', 'success', NULL, NULL),
(514, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:44:37', 'Activity Reviewed', 'success', NULL, NULL),
(515, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:44:40', 'Activity Reviewed', 'success', NULL, NULL),
(516, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-28 10:44:46', 'Activity Reviewed', 'success', NULL, NULL),
(517, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-28 10:44:54', 'Activity Reviewed', 'success', NULL, NULL),
(518, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-28 10:45:01', 'Activity Reviewed', 'success', NULL, NULL),
(519, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-28 10:45:11', 'Activity Reviewed', 'success', NULL, NULL),
(520, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:45:16', 'Activity Reviewed', 'success', NULL, NULL),
(521, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:45:19', 'Activity Reviewed', 'success', NULL, NULL),
(522, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:45:23', 'Activity Reviewed', 'success', NULL, NULL),
(523, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-28 10:45:31', 'Activity Reviewed', 'success', NULL, NULL),
(524, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-28 10:45:38', 'Activity Reviewed', 'success', NULL, NULL),
(525, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-28 10:45:43', 'Activity Reviewed', 'success', NULL, NULL),
(526, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-28 10:45:47', 'Activity Reviewed', 'success', NULL, NULL),
(527, 'André reached level 9!', 1, 1, '2014-04-28 10:48:46', 'Level Up', 'warning', NULL, NULL),
(528, 'André reached level 9!', 1, 2, '2014-04-30 20:27:31', 'Level Up', 'warning', NULL, NULL),
(529, 'André reached level 9!', 1, 3, '2014-04-29 11:17:16', 'Level Up', 'warning', NULL, NULL),
(530, 'André reached level 9!', 1, 4, '2014-04-29 11:25:44', 'Level Up', 'warning', NULL, NULL),
(531, 'André reached level 9!', 1, 5, '2014-04-28 15:17:20', 'Level Up', 'warning', NULL, NULL),
(532, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:45:50', 'Activity Reviewed', 'success', NULL, NULL),
(533, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-28 10:45:55', 'Activity Reviewed', 'success', NULL, NULL),
(534, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-28 10:45:58', 'Activity Reviewed', 'success', NULL, NULL),
(535, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-28 10:46:16', 'Activity Reviewed', 'success', NULL, NULL),
(536, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-28 10:46:23', 'Activity Reviewed', 'success', NULL, NULL),
(537, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-28 10:46:35', 'Activity Reviewed', 'success', NULL, NULL),
(538, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-28 10:46:40', 'Activity Reviewed', 'success', NULL, NULL),
(539, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-28 16:43:15', 'Activity Reviewed', 'success', NULL, NULL),
(540, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-29 16:55:36', 'Activity Reviewed', 'success', NULL, NULL),
(541, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 16:58:56', 'Activity Reviewed', 'success', NULL, NULL),
(542, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-29 16:59:34', 'Activity Reviewed', 'success', NULL, NULL),
(543, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 16:59:46', 'Activity Reviewed', 'success', NULL, NULL),
(544, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-29 16:59:50', 'Activity Reviewed', 'success', NULL, NULL),
(545, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-29 16:59:54', 'Activity Reviewed', 'success', NULL, NULL),
(546, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:00:02', 'Activity Reviewed', 'success', NULL, NULL),
(547, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:00:11', 'Activity Reviewed', 'success', NULL, NULL),
(548, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-29 17:00:20', 'Activity Reviewed', 'success', NULL, NULL),
(549, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-29 17:00:48', 'Activity Reviewed', 'success', NULL, NULL),
(550, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:00:53', 'Activity Reviewed', 'success', NULL, NULL),
(551, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:00:58', 'Activity Reviewed', 'success', NULL, NULL),
(552, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:07', 'Activity Reviewed', 'success', NULL, NULL),
(553, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:26', 'Activity Reviewed', 'success', NULL, NULL),
(554, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:31', 'Activity Reviewed', 'success', NULL, NULL),
(555, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:36', 'Activity Reviewed', 'success', NULL, NULL),
(556, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:42', 'Activity Reviewed', 'success', NULL, NULL),
(557, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:46', 'Activity Reviewed', 'success', NULL, NULL),
(558, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:01:50', 'Activity Reviewed', 'success', NULL, NULL),
(559, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:02:31', 'Activity Reviewed', 'success', NULL, NULL),
(560, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-29 17:02:38', 'Activity Reviewed', 'success', NULL, NULL),
(561, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-29 17:02:44', 'Activity Reviewed', 'success', NULL, NULL),
(562, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-29 17:02:48', 'Activity Reviewed', 'success', NULL, NULL),
(563, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:02:52', 'Activity Reviewed', 'success', NULL, NULL),
(564, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-29 17:02:56', 'Activity Reviewed', 'success', NULL, NULL),
(565, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:02:59', 'Activity Reviewed', 'success', NULL, NULL),
(566, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:02', 'Activity Reviewed', 'success', NULL, NULL),
(567, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:07', 'Activity Reviewed', 'success', NULL, NULL),
(568, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-29 17:03:11', 'Activity Reviewed', 'success', NULL, NULL),
(569, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-29 17:03:14', 'Activity Reviewed', 'success', NULL, NULL),
(570, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:17', 'Activity Reviewed', 'success', NULL, NULL),
(571, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:21', 'Activity Reviewed', 'success', NULL, NULL),
(572, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:24', 'Activity Reviewed', 'success', NULL, NULL),
(573, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:27', 'Activity Reviewed', 'success', NULL, NULL),
(574, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:30', 'Activity Reviewed', 'success', NULL, NULL),
(575, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:33', 'Activity Reviewed', 'success', NULL, NULL),
(576, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:35', 'Activity Reviewed', 'success', NULL, NULL),
(577, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:47', 'Activity Reviewed', 'success', NULL, NULL),
(578, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:50', 'Activity Reviewed', 'success', NULL, NULL),
(579, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-29 17:03:55', 'Activity Reviewed', 'success', NULL, NULL),
(580, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-29 17:03:57', 'Activity Reviewed', 'success', NULL, NULL),
(581, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 1, '2014-04-30 09:40:48', 'New Badge', 'warning', NULL, NULL),
(582, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 2, '2014-04-30 20:27:31', 'New Badge', 'warning', NULL, NULL),
(583, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 3, '2014-04-30 11:23:11', 'New Badge', 'warning', NULL, NULL),
(584, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 4, '2014-04-29 23:04:17', 'New Badge', 'warning', NULL, NULL),
(585, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 5, '2014-04-29 19:31:57', 'New Badge', 'warning', NULL, NULL),
(586, 'It seems someone has gotten the <strong>Refactor Apprentice</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 6, '2014-04-30 19:20:02', 'New Badge', 'warning', NULL, NULL),
(587, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-04-30 19:20:38', 'Activity Reviewed', 'success', NULL, NULL),
(588, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-04-30 19:20:45', 'Activity Reviewed', 'success', NULL, NULL),
(589, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-30 19:20:47', 'Activity Reviewed', 'success', NULL, NULL),
(590, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-30 19:20:51', 'Activity Reviewed', 'success', NULL, NULL),
(591, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-04-30 19:20:53', 'Activity Reviewed', 'success', NULL, NULL),
(592, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-04-30 19:20:56', 'Activity Reviewed', 'success', NULL, NULL),
(593, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-04-30 19:20:59', 'Activity Reviewed', 'success', NULL, NULL),
(594, 'We do not expect anything less than your BEST! \\m/', 1, 1, '2014-05-02 09:48:51', 'Hello, code wizards!', 'info', NULL, NULL),
(595, 'We do not expect anything less than your BEST! \\m/', 1, 2, '2014-05-02 18:45:11', 'Hello, code wizards!', 'info', NULL, NULL),
(596, 'We do not expect anything less than your BEST! \\m/', 1, 3, '2014-05-02 09:50:32', 'Hello, code wizards!', 'info', NULL, NULL),
(597, 'We do not expect anything less than your BEST! \\m/', 1, 4, '2014-05-05 18:16:21', 'Hello, code wizards!', 'info', NULL, NULL),
(598, 'We do not expect anything less than your BEST! \\m/', 1, 5, '2014-05-02 09:50:17', 'Hello, code wizards!', 'info', NULL, NULL),
(599, 'We do not expect anything less than your BEST! \\m/', 1, 6, '2014-05-01 17:03:58', 'Hello, code wizards!', 'info', NULL, NULL),
(600, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-02 09:50:46', 'Activity Reviewed', 'success', NULL, NULL),
(601, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-05-02 09:50:54', 'Activity Reviewed', 'success', NULL, NULL),
(602, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-02 09:50:58', 'Activity Reviewed', 'success', NULL, NULL),
(603, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-02 09:51:05', 'Activity Reviewed', 'success', NULL, NULL),
(604, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:13', 'Activity Reviewed', 'success', NULL, NULL),
(605, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-02 09:51:20', 'Activity Reviewed', 'success', NULL, NULL),
(606, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:23', 'Activity Reviewed', 'success', NULL, NULL),
(607, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:26', 'Activity Reviewed', 'success', NULL, NULL),
(608, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:51:29', 'Activity Reviewed', 'success', NULL, NULL),
(609, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:51:32', 'Activity Reviewed', 'success', NULL, NULL),
(610, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:35', 'Activity Reviewed', 'success', NULL, NULL),
(611, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:39', 'Activity Reviewed', 'success', NULL, NULL),
(612, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:43', 'Activity Reviewed', 'success', NULL, NULL),
(613, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:48', 'Activity Reviewed', 'success', NULL, NULL),
(614, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-02 09:51:54', 'Activity Reviewed', 'success', NULL, NULL),
(615, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:51:59', 'Activity Reviewed', 'success', NULL, NULL),
(616, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:52:06', 'Activity Reviewed', 'success', NULL, NULL),
(617, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:52:09', 'Activity Reviewed', 'success', NULL, NULL),
(618, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:52:13', 'Activity Reviewed', 'success', NULL, NULL),
(619, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:52:17', 'Activity Reviewed', 'success', NULL, NULL),
(620, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:52:24', 'Activity Reviewed', 'success', NULL, NULL),
(621, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:52:28', 'Activity Reviewed', 'success', NULL, NULL),
(622, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:52:31', 'Activity Reviewed', 'success', NULL, NULL),
(623, 'André reached level 10 and can now join Missions!', 1, 1, '2014-05-02 09:53:24', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(624, 'André reached level 10 and can now join Missions!', 1, 2, '2014-05-02 18:45:11', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(625, 'André reached level 10 and can now join Missions!', 1, 3, '2014-05-02 15:37:01', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(626, 'André reached level 10 and can now join Missions!', 1, 4, '2014-05-05 18:16:21', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(627, 'André reached level 10 and can now join Missions!', 1, 5, '2014-05-02 10:13:28', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(628, 'André reached level 10 and can now join Missions!', 1, 6, '2014-05-02 09:52:35', 'Level Up - Missions Unlocked', 'warning', NULL, NULL),
(629, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:52:35', 'Activity Reviewed', 'success', NULL, NULL),
(630, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:52:43', 'Activity Reviewed', 'success', NULL, NULL),
(631, 'Diego reached level 7!', 1, 1, '2014-05-02 09:53:24', 'Level Up', 'warning', NULL, NULL),
(632, 'Diego reached level 7!', 1, 2, '2014-05-02 18:45:11', 'Level Up', 'warning', NULL, NULL),
(633, 'Diego reached level 7!', 1, 3, '2014-05-02 15:37:01', 'Level Up', 'warning', NULL, NULL),
(634, 'Diego reached level 7!', 1, 4, '2014-05-05 18:15:46', 'Level Up', 'warning', NULL, NULL),
(635, 'Diego reached level 7!', 1, 5, '2014-05-02 10:13:28', 'Level Up', 'warning', NULL, NULL),
(636, 'Diego reached level 7!', 1, 6, '2014-05-02 09:52:47', 'Level Up', 'warning', NULL, NULL),
(637, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-02 09:52:47', 'Activity Reviewed', 'success', NULL, NULL),
(638, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-02 09:53:13', 'Activity Reviewed', 'success', NULL, NULL),
(639, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-02 09:53:26', 'Activity Reviewed', 'success', NULL, NULL),
(640, 'Eu tava numa classe muito difícil...', 1, 1, '2014-05-05 19:43:05', 'Lagreca says', 'error', NULL, NULL),
(641, 'Eu tava numa classe muito difícil...', 1, 2, '2014-05-06 20:06:06', 'Lagreca says', 'error', NULL, NULL),
(642, 'Eu tava numa classe muito difícil...', 1, 3, '2014-05-05 17:25:44', 'Lagreca says', 'error', NULL, NULL),
(643, 'Eu tava numa classe muito difícil...', 1, 4, '2014-05-05 18:15:46', 'Lagreca says', 'error', NULL, NULL),
(644, 'Eu tava numa classe muito difícil...', 1, 5, '2014-05-05 17:54:05', 'Lagreca says', 'error', NULL, NULL),
(645, 'Eu tava numa classe muito difícil...', 1, 6, '2014-05-05 17:22:18', 'Lagreca says', 'error', NULL, NULL),
(646, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:22:48', 'Activity Reviewed', 'success', NULL, NULL),
(647, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-05 17:23:02', 'Activity Reviewed', 'success', NULL, NULL),
(648, 'Vinícius reached level 8!', 1, 1, '2014-05-05 19:43:05', 'Level Up', 'warning', NULL, NULL),
(649, 'Vinícius reached level 8!', 1, 2, '2014-05-06 20:05:59', 'Level Up', 'warning', NULL, NULL),
(650, 'Vinícius reached level 8!', 1, 3, '2014-05-05 17:25:44', 'Level Up', 'warning', NULL, NULL),
(651, 'Vinícius reached level 8!', 1, 4, '2014-05-05 18:15:46', 'Level Up', 'warning', NULL, NULL),
(652, 'Vinícius reached level 8!', 1, 5, '2014-05-05 17:54:05', 'Level Up', 'warning', NULL, NULL),
(653, 'Vinícius reached level 8!', 1, 6, '2014-05-05 17:23:08', 'Level Up', 'warning', NULL, NULL),
(654, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:23:08', 'Activity Reviewed', 'success', NULL, NULL),
(655, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:23:17', 'Activity Reviewed', 'success', NULL, NULL),
(656, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:23:29', 'Activity Reviewed', 'success', NULL, NULL),
(657, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:23:35', 'Activity Reviewed', 'success', NULL, NULL),
(658, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:23:39', 'Activity Reviewed', 'success', NULL, NULL),
(659, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:23:42', 'Activity Reviewed', 'success', NULL, NULL),
(660, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:23:52', 'Activity Reviewed', 'success', NULL, NULL),
(661, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:23:59', 'Activity Reviewed', 'success', NULL, NULL),
(662, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:24:04', 'Activity Reviewed', 'success', NULL, NULL),
(663, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-05 17:24:10', 'Activity Reviewed', 'success', NULL, NULL),
(664, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:24:16', 'Activity Reviewed', 'success', NULL, NULL),
(665, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:24:28', 'Activity Reviewed', 'success', NULL, NULL),
(666, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:24:34', 'Activity Reviewed', 'success', NULL, NULL),
(667, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:24:40', 'Activity Reviewed', 'success', NULL, NULL),
(668, 'Cristian reached level 5!', 1, 1, '2014-05-05 19:43:05', 'Level Up', 'warning', NULL, NULL),
(669, 'Cristian reached level 5!', 1, 2, '2014-05-06 20:05:59', 'Level Up', 'warning', NULL, NULL),
(670, 'Cristian reached level 5!', 1, 3, '2014-05-05 17:25:44', 'Level Up', 'warning', NULL, NULL),
(671, 'Cristian reached level 5!', 1, 4, '2014-05-05 18:15:46', 'Level Up', 'warning', NULL, NULL),
(672, 'Cristian reached level 5!', 1, 5, '2014-05-05 17:54:05', 'Level Up', 'warning', NULL, NULL),
(673, 'Cristian reached level 5!', 1, 6, '2014-05-05 17:24:54', 'Level Up', 'warning', NULL, NULL),
(674, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:24:54', 'Activity Reviewed', 'success', NULL, NULL),
(675, 'You reviewed an activity and earned 10 XP.', 1, 6, '2014-05-05 17:25:01', 'Activity Reviewed', 'success', NULL, NULL),
(676, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:25:24', 'Activity Reviewed', 'success', NULL, NULL),
(677, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:25:32', 'Activity Reviewed', 'success', NULL, NULL),
(678, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:25:37', 'Activity Reviewed', 'success', NULL, NULL),
(679, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:25:50', 'Activity Reviewed', 'success', NULL, NULL),
(680, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:25:55', 'Activity Reviewed', 'success', NULL, NULL),
(681, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:26:23', 'Activity Reviewed', 'success', NULL, NULL),
(682, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:26:34', 'Activity Reviewed', 'success', NULL, NULL),
(683, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:26:37', 'Activity Reviewed', 'success', NULL, NULL),
(684, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:26:43', 'Activity Reviewed', 'success', NULL, NULL),
(685, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:26:53', 'Activity Reviewed', 'success', NULL, NULL),
(686, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:26:57', 'Activity Reviewed', 'success', NULL, NULL),
(687, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:27:00', 'Activity Reviewed', 'success', NULL, NULL),
(688, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:27:04', 'Activity Reviewed', 'success', NULL, NULL),
(689, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:27:09', 'Activity Reviewed', 'success', NULL, NULL),
(690, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:27:12', 'Activity Reviewed', 'success', NULL, NULL),
(691, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-05 17:27:18', 'Activity Reviewed', 'success', NULL, NULL),
(692, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-05 17:27:22', 'Activity Reviewed', 'success', NULL, NULL),
(693, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:27:26', 'Activity Reviewed', 'success', NULL, NULL),
(694, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-05 17:27:41', 'Activity Reviewed', 'success', NULL, NULL),
(695, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 1, '2014-05-05 19:43:05', 'New Badge', 'warning', NULL, NULL),
(696, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 2, '2014-05-06 20:05:59', 'New Badge', 'warning', NULL, NULL),
(697, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 3, '2014-05-05 18:49:31', 'New Badge', 'warning', NULL, NULL),
(698, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 4, '2014-05-05 18:15:46', 'New Badge', 'warning', NULL, NULL),
(699, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 5, '2014-05-05 18:02:29', 'New Badge', 'warning', NULL, NULL),
(700, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Vinícius</strong>!', 1, 6, '2014-05-05 18:45:55', 'New Badge', 'warning', NULL, NULL),
(701, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:21:00', 'Activity Reviewed', 'success', NULL, NULL),
(702, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:21:07', 'Activity Reviewed', 'success', NULL, NULL),
(703, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:21:14', 'Activity Reviewed', 'success', NULL, NULL),
(704, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:21:20', 'Activity Reviewed', 'success', NULL, NULL),
(705, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:21:28', 'Activity Reviewed', 'success', NULL, NULL),
(706, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:21:35', 'Activity Reviewed', 'success', NULL, NULL),
(707, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-06 15:21:42', 'Activity Reviewed', 'success', NULL, NULL),
(708, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:21:53', 'Activity Reviewed', 'success', NULL, NULL),
(709, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:22:09', 'Activity Reviewed', 'success', NULL, NULL),
(710, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:22:21', 'Activity Reviewed', 'success', NULL, NULL),
(711, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:22:41', 'Activity Reviewed', 'success', NULL, NULL),
(712, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:23:07', 'Activity Reviewed', 'success', NULL, NULL),
(713, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:23:45', 'Activity Reviewed', 'success', NULL, NULL),
(714, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:23:49', 'Activity Reviewed', 'success', NULL, NULL),
(715, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:23:58', 'Activity Reviewed', 'success', NULL, NULL),
(716, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-06 15:26:52', 'Activity Reviewed', 'success', NULL, NULL),
(717, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:26:57', 'Activity Reviewed', 'success', NULL, NULL),
(718, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:27:04', 'Activity Reviewed', 'success', NULL, NULL),
(719, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:27:11', 'Activity Reviewed', 'success', NULL, NULL),
(720, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:27:17', 'Activity Reviewed', 'success', NULL, NULL),
(721, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:27:25', 'Activity Reviewed', 'success', NULL, NULL),
(722, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:27:29', 'Activity Reviewed', 'success', NULL, NULL),
(723, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-06 15:27:33', 'Activity Reviewed', 'success', NULL, NULL),
(724, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:28:44', 'Activity Reviewed', 'success', NULL, NULL),
(725, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:28:48', 'Activity Reviewed', 'success', NULL, NULL),
(726, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:28:58', 'Activity Reviewed', 'success', NULL, NULL),
(727, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:29:02', 'Activity Reviewed', 'success', NULL, NULL),
(728, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:29:57', 'Activity Reviewed', 'success', NULL, NULL),
(729, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:01', 'Activity Reviewed', 'success', NULL, NULL),
(730, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:09', 'Activity Reviewed', 'success', NULL, NULL),
(731, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:15', 'Activity Reviewed', 'success', NULL, NULL),
(732, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:30:18', 'Activity Reviewed', 'success', NULL, NULL),
(733, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:23', 'Activity Reviewed', 'success', NULL, NULL),
(734, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:30:26', 'Activity Reviewed', 'success', NULL, NULL),
(735, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-06 15:30:30', 'Activity Reviewed', 'success', NULL, NULL),
(736, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:33', 'Activity Reviewed', 'success', NULL, NULL),
(737, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:38', 'Activity Reviewed', 'success', NULL, NULL),
(738, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:41', 'Activity Reviewed', 'success', NULL, NULL),
(739, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:44', 'Activity Reviewed', 'success', NULL, NULL),
(740, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:47', 'Activity Reviewed', 'success', NULL, NULL),
(741, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:30:52', 'Activity Reviewed', 'success', NULL, NULL),
(742, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:33:17', 'Activity Reviewed', 'success', NULL, NULL),
(743, 'Eduardo reached level 6!', 1, 1, '2014-05-06 15:40:13', 'Level Up', 'warning', NULL, NULL),
(744, 'Eduardo reached level 6!', 1, 2, '2014-05-06 20:05:59', 'Level Up', 'warning', NULL, NULL),
(745, 'Eduardo reached level 6!', 1, 3, '2014-05-06 16:34:26', 'Level Up', 'warning', NULL, NULL),
(746, 'Eduardo reached level 6!', 1, 4, '2014-05-06 15:37:02', 'Level Up', 'warning', NULL, NULL),
(747, 'Eduardo reached level 6!', 1, 5, '2014-05-07 11:20:15', 'Level Up', 'warning', NULL, NULL),
(748, 'Eduardo reached level 6!', 1, 6, '2014-05-06 15:33:19', 'Level Up', 'warning', NULL, NULL),
(749, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 15:33:19', 'Activity Reviewed', 'success', NULL, NULL),
(750, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:52:30', 'Activity Reviewed', 'success', NULL, NULL),
(751, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:52:44', 'Activity Reviewed', 'success', NULL, NULL),
(752, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 15:52:48', 'Activity Reviewed', 'success', NULL, NULL),
(753, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:52:51', 'Activity Reviewed', 'success', NULL, NULL),
(754, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:52:54', 'Activity Reviewed', 'success', NULL, NULL),
(755, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:52:59', 'Activity Reviewed', 'success', NULL, NULL),
(756, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:53:02', 'Activity Reviewed', 'success', NULL, NULL),
(757, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:53:05', 'Activity Reviewed', 'success', NULL, NULL),
(758, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 15:53:08', 'Activity Reviewed', 'success', NULL, NULL),
(759, 'André reached level 11!', 1, 1, '2014-05-06 17:12:43', 'Level Up', 'warning', NULL, NULL),
(760, 'André reached level 11!', 1, 2, '2014-05-06 20:05:59', 'Level Up', 'warning', NULL, NULL),
(761, 'André reached level 11!', 1, 3, '2014-05-06 17:00:04', 'Level Up', 'warning', NULL, NULL),
(762, 'André reached level 11!', 1, 4, '2014-05-07 17:45:01', 'Level Up', 'warning', NULL, NULL),
(763, 'André reached level 11!', 1, 5, '2014-05-07 11:20:15', 'Level Up', 'warning', NULL, NULL),
(764, 'André reached level 11!', 1, 6, '2014-05-06 16:59:59', 'Level Up', 'warning', NULL, NULL),
(765, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 16:59:59', 'Activity Reviewed', 'success', NULL, NULL),
(766, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 17:00:08', 'Activity Reviewed', 'success', NULL, NULL),
(767, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 17:00:32', 'Activity Reviewed', 'success', NULL, NULL),
(768, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-06 17:00:32', 'Activity Reviewed', 'success', NULL, NULL),
(769, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-06 17:00:40', 'Activity Reviewed', 'success', NULL, NULL),
(770, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-06 17:00:52', 'Activity Reviewed', 'success', NULL, NULL),
(771, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 17:00:56', 'Activity Reviewed', 'success', NULL, NULL),
(772, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-06 17:00:59', 'Activity Reviewed', 'success', NULL, NULL),
(773, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 14:33:41', 'Activity Reviewed', 'success', NULL, NULL),
(774, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 1, '2014-05-07 17:15:58', 'First Time Completion', 'success', NULL, NULL),
(775, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 2, '2014-05-21 15:46:48', 'First Time Completion', 'success', NULL, NULL),
(776, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 3, '2014-05-07 17:46:44', 'First Time Completion', 'success', NULL, NULL),
(777, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 4, '2014-05-07 17:45:01', 'First Time Completion', 'success', NULL, NULL),
(778, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 5, '2014-05-07 15:49:28', 'First Time Completion', 'success', NULL, NULL),
(779, 'The Exploratory Testing activity was completed for the first time in this game. Congratulations, Diego!', 1, 6, '2014-05-07 14:33:41', 'First Time Completion', 'success', NULL, NULL),
(780, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 14:33:50', 'Activity Reviewed', 'success', NULL, NULL),
(781, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 14:33:53', 'Activity Reviewed', 'success', NULL, NULL),
(782, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 14:33:56', 'Activity Reviewed', 'success', NULL, NULL),
(783, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 14:33:59', 'Activity Reviewed', 'success', NULL, NULL),
(784, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:54:33', 'Activity Reviewed', 'success', NULL, NULL),
(785, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-07 19:54:51', 'Activity Reviewed', 'success', NULL, NULL),
(786, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:55:14', 'Activity Reviewed', 'success', NULL, NULL),
(787, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:55:28', 'Activity Reviewed', 'success', NULL, NULL),
(788, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:56:28', 'Activity Reviewed', 'success', NULL, NULL),
(789, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:56:33', 'Activity Reviewed', 'success', NULL, NULL),
(790, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:57:06', 'Activity Reviewed', 'success', NULL, NULL),
(791, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:57:12', 'Activity Reviewed', 'success', NULL, NULL),
(792, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:57:21', 'Activity Reviewed', 'success', NULL, NULL),
(793, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-07 19:57:39', 'Activity Reviewed', 'success', NULL, NULL);
INSERT INTO `notification` (`id`, `text`, `read`, `player_id`, `created`, `title`, `type`, `action`, `player_id_sender`) VALUES
(794, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-07 19:57:50', 'Activity Reviewed', 'success', NULL, NULL),
(795, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:57:53', 'Activity Reviewed', 'success', NULL, NULL),
(796, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-07 19:57:56', 'Activity Reviewed', 'success', NULL, NULL),
(797, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-07 19:57:58', 'Activity Reviewed', 'success', NULL, NULL),
(798, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 1, '2014-05-08 12:13:29', 'First Time Completion', 'success', NULL, NULL),
(799, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 2, '2014-05-21 15:46:30', 'First Time Completion', 'success', NULL, NULL),
(800, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 3, '2014-05-08 11:32:38', 'First Time Completion', 'success', NULL, NULL),
(801, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 4, '2014-05-08 12:15:22', 'First Time Completion', 'success', NULL, NULL),
(802, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 5, '2014-05-08 11:16:12', 'First Time Completion', 'success', NULL, NULL),
(803, 'The Pair Problem Solving activity was completed for the first time in this game. Congratulations, Eduardo!', 1, 6, '2014-05-07 19:57:58', 'First Time Completion', 'success', NULL, NULL),
(804, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:42:45', 'Activity Reviewed', 'success', NULL, NULL),
(805, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:42:56', 'Activity Reviewed', 'success', NULL, NULL),
(806, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:43:12', 'Activity Reviewed', 'success', NULL, NULL),
(807, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 12:43:16', 'Activity Reviewed', 'success', NULL, NULL),
(808, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 12:43:22', 'Activity Reviewed', 'success', NULL, NULL),
(809, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 12:43:26', 'Activity Reviewed', 'success', NULL, NULL),
(810, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-08 12:43:30', 'Activity Reviewed', 'success', NULL, NULL),
(811, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:43:35', 'Activity Reviewed', 'success', NULL, NULL),
(812, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:43:42', 'Activity Reviewed', 'success', NULL, NULL),
(813, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 12:43:45', 'Activity Reviewed', 'success', NULL, NULL),
(814, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 17:54:58', 'Activity Reviewed', 'success', NULL, NULL),
(815, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 17:54:58', 'Activity Reviewed', 'success', NULL, NULL),
(816, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-08 17:55:06', 'Activity Reviewed', 'success', NULL, NULL),
(817, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-08 17:55:13', 'Activity Reviewed', 'success', NULL, NULL),
(818, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 17:55:18', 'Activity Reviewed', 'success', NULL, NULL),
(819, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 17:55:23', 'Activity Reviewed', 'success', NULL, NULL),
(820, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-08 17:55:26', 'Activity Reviewed', 'success', NULL, NULL),
(821, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-08 17:55:34', 'Activity Reviewed', 'success', NULL, NULL),
(822, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-08 17:55:41', 'Activity Reviewed', 'success', NULL, NULL),
(823, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-05-08 17:55:43', 'Activity Reviewed', 'success', NULL, NULL),
(824, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-09 10:25:14', 'Activity Reviewed', 'success', NULL, NULL),
(825, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-09 10:25:18', 'Activity Reviewed', 'success', NULL, NULL),
(826, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-09 10:25:21', 'Activity Reviewed', 'success', NULL, NULL),
(827, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-09 10:25:26', 'Activity Reviewed', 'success', NULL, NULL),
(828, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-09 10:25:29', 'Activity Reviewed', 'success', NULL, NULL),
(829, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-09 10:25:32', 'Activity Reviewed', 'success', NULL, NULL),
(830, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-09 10:25:35', 'Activity Reviewed', 'success', NULL, NULL),
(831, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-09 10:25:37', 'Activity Reviewed', 'success', NULL, NULL),
(832, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-09 10:25:39', 'Activity Reviewed', 'success', NULL, NULL),
(833, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-09 10:25:41', 'Activity Reviewed', 'success', NULL, NULL),
(834, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-12 11:01:18', 'Activity Reviewed', 'success', NULL, NULL),
(835, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-12 11:01:26', 'Activity Reviewed', 'success', NULL, NULL),
(836, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-12 11:01:36', 'Activity Reviewed', 'success', NULL, NULL),
(837, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:01:58', 'Activity Reviewed', 'success', NULL, NULL),
(838, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-12 11:02:04', 'Activity Reviewed', 'success', NULL, NULL),
(839, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-12 11:02:16', 'Activity Reviewed', 'success', NULL, NULL),
(840, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:27', 'Activity Reviewed', 'success', NULL, NULL),
(841, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:32', 'Activity Reviewed', 'success', NULL, NULL),
(842, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:37', 'Activity Reviewed', 'success', NULL, NULL),
(843, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:43', 'Activity Reviewed', 'success', NULL, NULL),
(844, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:46', 'Activity Reviewed', 'success', NULL, NULL),
(845, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:51', 'Activity Reviewed', 'success', NULL, NULL),
(846, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:02:55', 'Activity Reviewed', 'success', NULL, NULL),
(847, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:01', 'Activity Reviewed', 'success', NULL, NULL),
(848, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:07', 'Activity Reviewed', 'success', NULL, NULL),
(849, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:11', 'Activity Reviewed', 'success', NULL, NULL),
(850, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:15', 'Activity Reviewed', 'success', NULL, NULL),
(851, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:21', 'Activity Reviewed', 'success', NULL, NULL),
(852, 'André reached level 12!', 1, 1, '2014-05-12 11:04:44', 'Level Up', 'warning', NULL, NULL),
(853, 'André reached level 12!', 1, 2, '2014-05-21 15:46:30', 'Level Up', 'warning', NULL, NULL),
(854, 'André reached level 12!', 1, 3, '2014-05-13 10:21:18', 'Level Up', 'warning', NULL, NULL),
(855, 'André reached level 12!', 1, 4, '2014-05-12 20:29:12', 'Level Up', 'warning', NULL, NULL),
(856, 'André reached level 12!', 1, 5, '2014-05-13 10:19:28', 'Level Up', 'warning', NULL, NULL),
(857, 'André reached level 12!', 1, 6, '2014-05-12 11:03:25', 'Level Up', 'warning', NULL, NULL),
(858, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:25', 'Activity Reviewed', 'success', NULL, NULL),
(859, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:35', 'Activity Reviewed', 'success', NULL, NULL),
(860, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-12 11:03:41', 'Activity Reviewed', 'success', NULL, NULL),
(861, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-13 12:33:22', 'Activity Reviewed', 'success', NULL, NULL),
(862, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-13 12:33:31', 'Activity Reviewed', 'success', NULL, NULL),
(863, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-13 12:33:36', 'Activity Reviewed', 'success', NULL, NULL),
(864, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-13 12:33:39', 'Activity Reviewed', 'success', NULL, NULL),
(865, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-13 12:33:42', 'Activity Reviewed', 'success', NULL, NULL),
(866, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-13 12:33:44', 'Activity Reviewed', 'success', NULL, NULL),
(867, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-13 12:33:47', 'Activity Reviewed', 'success', NULL, NULL),
(868, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-13 12:33:50', 'Activity Reviewed', 'success', NULL, NULL),
(869, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-13 12:33:55', 'Activity Reviewed', 'success', NULL, NULL),
(870, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-13 12:33:59', 'Activity Reviewed', 'success', NULL, NULL),
(871, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-13 12:34:02', 'Activity Reviewed', 'success', NULL, NULL),
(872, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-14 10:11:03', 'Activity Reviewed', 'success', NULL, NULL),
(873, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-14 10:11:14', 'Activity Reviewed', 'success', NULL, NULL),
(874, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-14 10:11:26', 'Activity Reviewed', 'success', NULL, NULL),
(875, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:11:41', 'Activity Reviewed', 'success', NULL, NULL),
(876, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:11:53', 'Activity Reviewed', 'success', NULL, NULL),
(877, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-14 10:12:04', 'Activity Reviewed', 'success', NULL, NULL),
(878, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-14 10:12:20', 'Activity Reviewed', 'success', NULL, NULL),
(879, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:12:25', 'Activity Reviewed', 'success', NULL, NULL),
(880, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:12:39', 'Activity Reviewed', 'success', NULL, NULL),
(881, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:12:54', 'Activity Reviewed', 'success', NULL, NULL),
(882, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:12:59', 'Activity Reviewed', 'success', NULL, NULL),
(883, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:13:07', 'Activity Reviewed', 'success', NULL, NULL),
(884, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-14 10:13:11', 'Activity Reviewed', 'success', NULL, NULL),
(885, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-14 10:13:14', 'Activity Reviewed', 'success', NULL, NULL),
(886, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-14 10:13:20', 'Activity Reviewed', 'success', NULL, NULL),
(887, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-15 12:15:10', 'Activity Reviewed', 'success', NULL, NULL),
(888, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:15', 'Activity Reviewed', 'success', NULL, NULL),
(889, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-15 12:15:20', 'Activity Reviewed', 'success', NULL, NULL),
(890, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-15 12:15:25', 'Activity Reviewed', 'success', NULL, NULL),
(891, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:30', 'Activity Reviewed', 'success', NULL, NULL),
(892, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:35', 'Activity Reviewed', 'success', NULL, NULL),
(893, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:43', 'Activity Reviewed', 'success', NULL, NULL),
(894, 'Diego reached level 8!', 1, 1, '2014-05-15 18:55:26', 'Level Up', 'warning', NULL, NULL),
(895, 'Diego reached level 8!', 1, 2, '2014-05-21 15:46:30', 'Level Up', 'warning', NULL, NULL),
(896, 'Diego reached level 8!', 1, 3, '2014-05-16 10:29:28', 'Level Up', 'warning', NULL, NULL),
(897, 'Diego reached level 8!', 1, 4, '2014-05-16 12:46:06', 'Level Up', 'warning', NULL, NULL),
(898, 'Diego reached level 8!', 1, 5, '2014-05-15 12:23:17', 'Level Up', 'warning', NULL, NULL),
(899, 'Diego reached level 8!', 1, 6, '2014-05-15 12:15:46', 'Level Up', 'warning', NULL, NULL),
(900, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:46', 'Activity Reviewed', 'success', NULL, NULL),
(901, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:51', 'Activity Reviewed', 'success', NULL, NULL),
(902, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-15 12:15:55', 'Activity Reviewed', 'success', NULL, NULL),
(903, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:15:58', 'Activity Reviewed', 'success', NULL, NULL),
(904, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-15 12:16:04', 'Activity Reviewed', 'success', NULL, NULL),
(905, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-15 12:16:08', 'Activity Reviewed', 'success', NULL, NULL),
(906, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-15 12:16:12', 'Activity Reviewed', 'success', NULL, NULL),
(907, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:16:15', 'Activity Reviewed', 'success', NULL, NULL),
(908, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:16:18', 'Activity Reviewed', 'success', NULL, NULL),
(909, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-15 12:16:22', 'Activity Reviewed', 'success', NULL, NULL),
(910, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-15 12:16:25', 'Activity Reviewed', 'success', NULL, NULL),
(911, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-15 12:16:28', 'Activity Reviewed', 'success', NULL, NULL),
(912, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-16 11:43:48', 'Activity Reviewed', 'success', NULL, NULL),
(913, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-16 11:43:57', 'Activity Reviewed', 'success', NULL, NULL),
(914, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-16 11:44:02', 'Activity Reviewed', 'success', NULL, NULL),
(915, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-16 11:46:46', 'Activity Reviewed', 'success', NULL, NULL),
(916, 'Vinícius reached level 9!', 1, 1, '2014-05-16 12:51:31', 'Level Up', 'warning', NULL, NULL),
(917, 'Vinícius reached level 9!', 1, 2, '2014-05-21 15:46:30', 'Level Up', 'warning', NULL, NULL),
(918, 'Vinícius reached level 9!', 1, 3, '2014-05-16 18:48:38', 'Level Up', 'warning', NULL, NULL),
(919, 'Vinícius reached level 9!', 1, 4, '2014-05-16 12:46:06', 'Level Up', 'warning', NULL, NULL),
(920, 'Vinícius reached level 9!', 1, 5, '2014-05-16 12:40:20', 'Level Up', 'warning', NULL, NULL),
(921, 'Vinícius reached level 9!', 1, 6, '2014-05-16 11:46:51', 'Level Up', 'warning', NULL, NULL),
(922, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-16 11:46:51', 'Activity Reviewed', 'success', NULL, NULL),
(923, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-16 11:46:55', 'Activity Reviewed', 'success', NULL, NULL),
(924, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-16 11:47:00', 'Activity Reviewed', 'success', NULL, NULL),
(925, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-16 11:47:04', 'Activity Reviewed', 'success', NULL, NULL),
(926, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-16 11:47:07', 'Activity Reviewed', 'success', NULL, NULL),
(927, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-16 11:47:12', 'Activity Reviewed', 'success', NULL, NULL),
(928, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-16 11:47:18', 'Activity Reviewed', 'success', NULL, NULL),
(929, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-16 11:47:23', 'Activity Reviewed', 'success', NULL, NULL),
(930, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:10:54', 'Activity Reviewed', 'success', NULL, NULL),
(931, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:11:04', 'Activity Reviewed', 'success', NULL, NULL),
(932, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:11:09', 'Activity Reviewed', 'success', NULL, NULL),
(933, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:11:18', 'Activity Reviewed', 'success', NULL, NULL),
(934, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-19 10:11:27', 'Activity Reviewed', 'success', NULL, NULL),
(935, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-19 10:11:41', 'Activity Reviewed', 'success', NULL, NULL),
(936, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:11:49', 'Activity Reviewed', 'success', NULL, NULL),
(937, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:11:55', 'Activity Reviewed', 'success', NULL, NULL),
(938, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:11:59', 'Activity Reviewed', 'success', NULL, NULL),
(939, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-05-19 10:12:04', 'Activity Reviewed', 'success', NULL, NULL),
(940, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:12:09', 'Activity Reviewed', 'success', NULL, NULL),
(941, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-19 10:12:15', 'Activity Reviewed', 'success', NULL, NULL),
(942, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-19 10:12:24', 'Activity Reviewed', 'success', NULL, NULL),
(943, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:12:29', 'Activity Reviewed', 'success', NULL, NULL),
(944, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:12:35', 'Activity Reviewed', 'success', NULL, NULL),
(945, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:12:40', 'Activity Reviewed', 'success', NULL, NULL),
(946, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:12:46', 'Activity Reviewed', 'success', NULL, NULL),
(947, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:12:55', 'Activity Reviewed', 'success', NULL, NULL),
(948, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:13:02', 'Activity Reviewed', 'success', NULL, NULL),
(949, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:13:08', 'Activity Reviewed', 'success', NULL, NULL),
(950, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-19 10:13:13', 'Activity Reviewed', 'success', NULL, NULL),
(951, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:13:23', 'Activity Reviewed', 'success', NULL, NULL),
(952, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:13:27', 'Activity Reviewed', 'success', NULL, NULL),
(953, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-19 10:13:31', 'Activity Reviewed', 'success', NULL, NULL),
(954, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-19 10:13:36', 'Activity Reviewed', 'success', NULL, NULL),
(955, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-19 10:13:40', 'Activity Reviewed', 'success', NULL, NULL),
(956, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 1, 1, '2014-07-20 20:08:25', 'New Badge', 'warning', NULL, NULL),
(957, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 0, 2, '2014-07-20 20:00:18', 'New Badge', 'warning', NULL, NULL),
(958, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 0, 3, '2014-07-20 20:00:18', 'New Badge', 'warning', NULL, NULL),
(959, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 0, 4, '2014-07-20 20:00:21', 'New Badge', 'warning', NULL, NULL),
(960, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 1, 5, '2014-08-09 20:22:01', 'New Badge', 'warning', NULL, NULL),
(961, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>André</strong>!', 1, 6, '2014-07-20 20:00:45', 'New Badge', 'warning', NULL, NULL),
(962, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:02:25', 'Activity Reviewed', 'success', NULL, NULL),
(963, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:14:19', 'Activity Reviewed', 'success', NULL, NULL),
(964, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:14:55', 'Activity Reviewed', 'success', NULL, NULL),
(965, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:14:59', 'Activity Reviewed', 'success', NULL, NULL),
(966, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:15:04', 'Activity Reviewed', 'success', NULL, NULL),
(967, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:15:14', 'Activity Reviewed', 'success', NULL, NULL),
(968, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:15:26', 'Activity Reviewed', 'success', NULL, NULL),
(969, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:15:31', 'Activity Reviewed', 'success', NULL, NULL),
(970, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:15:39', 'Activity Reviewed', 'success', NULL, NULL),
(971, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:15:46', 'Activity Reviewed', 'success', NULL, NULL),
(972, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:16:29', 'Activity Reviewed', 'success', NULL, NULL),
(973, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:16:34', 'Activity Reviewed', 'success', NULL, NULL),
(974, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:16:45', 'Activity Reviewed', 'success', NULL, NULL),
(975, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:25', 'Activity Reviewed', 'success', NULL, NULL),
(976, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:17:29', 'Activity Reviewed', 'success', NULL, NULL),
(977, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:34', 'Activity Reviewed', 'success', NULL, NULL),
(978, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:38', 'Activity Reviewed', 'success', NULL, NULL),
(979, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:41', 'Activity Reviewed', 'success', NULL, NULL),
(980, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:44', 'Activity Reviewed', 'success', NULL, NULL),
(981, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 11:17:47', 'Activity Reviewed', 'success', NULL, NULL),
(982, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 11:17:51', 'Activity Reviewed', 'success', NULL, NULL),
(983, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:51:10', 'Activity Reviewed', 'success', NULL, NULL),
(984, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:51:23', 'Activity Reviewed', 'success', NULL, NULL),
(985, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:51:34', 'Activity Reviewed', 'success', NULL, NULL),
(986, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:51:39', 'Activity Reviewed', 'success', NULL, NULL),
(987, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:52:08', 'Activity Reviewed', 'success', NULL, NULL),
(988, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:52:30', 'Activity Reviewed', 'success', NULL, NULL),
(989, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:52:45', 'Activity Reviewed', 'success', NULL, NULL),
(990, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:52:56', 'Activity Reviewed', 'success', NULL, NULL),
(991, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:53:46', 'Activity Reviewed', 'success', NULL, NULL),
(992, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:53:50', 'Activity Reviewed', 'success', NULL, NULL),
(993, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:53:57', 'Activity Reviewed', 'success', NULL, NULL),
(994, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:54:08', 'Activity Reviewed', 'success', NULL, NULL),
(995, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:54:19', 'Activity Reviewed', 'success', NULL, NULL),
(996, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:54:29', 'Activity Reviewed', 'success', NULL, NULL),
(997, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:54:58', 'Activity Reviewed', 'success', NULL, NULL),
(998, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 16:55:39', 'Activity Reviewed', 'success', NULL, NULL),
(999, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-20 16:55:42', 'Activity Reviewed', 'success', NULL, NULL),
(1000, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-20 17:14:05', 'Activity Reviewed', 'success', NULL, NULL),
(1001, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-22 10:27:49', 'Activity Reviewed', 'success', NULL, NULL),
(1002, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-22 10:27:52', 'Activity Reviewed', 'success', NULL, NULL),
(1003, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-22 10:27:55', 'Activity Reviewed', 'success', NULL, NULL),
(1004, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-22 10:27:58', 'Activity Reviewed', 'success', NULL, NULL),
(1005, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 1, 1, '2014-05-22 15:32:39', 'New Badge', 'warning', NULL, NULL),
(1006, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 0, 2, '2014-05-22 17:16:57', 'New Badge', 'warning', NULL, NULL),
(1007, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 1, 3, '2014-05-22 13:16:58', 'New Badge', 'warning', NULL, NULL),
(1008, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 1, 4, '2014-05-22 17:08:26', 'New Badge', 'warning', NULL, NULL),
(1009, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 1, 5, '2014-06-09 18:09:58', 'New Badge', 'warning', NULL, NULL),
(1010, 'It seems someone has gotten the <strong>Pair Test Professional</strong> badge! Congratulations, <strong>Diego</strong>!', 1, 6, '2014-05-22 16:57:00', 'New Badge', 'warning', NULL, NULL),
(1011, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-22 16:57:09', 'Activity Reviewed', 'success', NULL, NULL),
(1012, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-22 16:57:13', 'Activity Reviewed', 'success', NULL, NULL),
(1013, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-22 16:57:18', 'Activity Reviewed', 'success', NULL, NULL),
(1014, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-22 16:57:23', 'Activity Reviewed', 'success', NULL, NULL),
(1015, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-22 16:57:25', 'Activity Reviewed', 'success', NULL, NULL),
(1016, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-22 16:57:28', 'Activity Reviewed', 'success', NULL, NULL),
(1017, 'Notification text...', 1, 6, '2014-05-22 21:49:39', 'Notification', 'info', NULL, NULL),
(1018, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-23 18:32:37', 'Activity Reviewed', 'success', NULL, NULL),
(1019, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-23 18:32:41', 'Activity Reviewed', 'success', NULL, NULL),
(1020, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-23 18:32:44', 'Activity Reviewed', 'success', NULL, NULL),
(1021, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-23 18:32:48', 'Activity Reviewed', 'success', NULL, NULL),
(1022, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-23 18:32:52', 'Activity Reviewed', 'success', NULL, NULL),
(1023, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-05-23 18:32:55', 'Activity Reviewed', 'success', NULL, NULL),
(1024, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-26 18:56:42', 'Activity Reviewed', 'success', NULL, NULL),
(1025, 'You reviewed an activity and earned 5 XP.', 1, 6, '2014-05-26 18:56:45', 'Activity Reviewed', 'success', NULL, NULL),
(1026, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-26 18:56:48', 'Activity Reviewed', 'success', NULL, NULL),
(1027, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-26 18:56:51', 'Activity Reviewed', 'success', NULL, NULL),
(1028, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-26 18:56:54', 'Activity Reviewed', 'success', NULL, NULL),
(1029, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-27 21:35:32', 'Activity Reviewed', 'success', NULL, NULL),
(1030, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-27 21:35:44', 'Activity Reviewed', 'success', NULL, NULL),
(1031, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-27 21:35:47', 'Activity Reviewed', 'success', NULL, NULL),
(1032, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-27 21:35:52', 'Activity Reviewed', 'success', NULL, NULL),
(1033, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-27 21:35:54', 'Activity Reviewed', 'success', NULL, NULL),
(1034, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-27 21:35:57', 'Activity Reviewed', 'success', NULL, NULL),
(1035, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:48:06', 'Activity Reviewed', 'success', NULL, NULL),
(1036, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:48:11', 'Activity Reviewed', 'success', NULL, NULL),
(1037, 'Diego reached level 9!', 1, 1, '2014-06-09 11:31:28', 'Level Up', 'warning', NULL, NULL),
(1038, 'Diego reached level 9!', 0, 2, '2014-05-30 15:48:13', 'Level Up', 'warning', NULL, NULL),
(1039, 'Diego reached level 9!', 1, 3, '2014-06-04 18:17:26', 'Level Up', 'warning', NULL, NULL),
(1040, 'Diego reached level 9!', 1, 4, '2014-06-02 09:56:08', 'Level Up', 'warning', NULL, NULL),
(1041, 'Diego reached level 9!', 1, 5, '2014-06-09 18:09:58', 'Level Up', 'warning', NULL, NULL),
(1042, 'Diego reached level 9!', 1, 6, '2014-05-30 11:48:16', 'Level Up', 'warning', NULL, NULL),
(1043, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:16', 'Activity Reviewed', 'success', NULL, NULL),
(1044, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:48:21', 'Activity Reviewed', 'success', NULL, NULL),
(1045, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:26', 'Activity Reviewed', 'success', NULL, NULL),
(1046, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:31', 'Activity Reviewed', 'success', NULL, NULL),
(1047, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:36', 'Activity Reviewed', 'success', NULL, NULL),
(1048, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:40', 'Activity Reviewed', 'success', NULL, NULL),
(1049, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:43', 'Activity Reviewed', 'success', NULL, NULL),
(1050, 'Eduardo reached level 7!', 1, 1, '2014-06-09 11:31:28', 'Level Up', 'warning', NULL, NULL),
(1051, 'Eduardo reached level 7!', 0, 2, '2014-05-30 15:48:45', 'Level Up', 'warning', NULL, NULL),
(1052, 'Eduardo reached level 7!', 1, 3, '2014-06-04 18:17:26', 'Level Up', 'warning', NULL, NULL),
(1053, 'Eduardo reached level 7!', 1, 4, '2014-06-02 09:56:08', 'Level Up', 'warning', NULL, NULL),
(1054, 'Eduardo reached level 7!', 1, 5, '2014-06-09 18:09:58', 'Level Up', 'warning', NULL, NULL),
(1055, 'Eduardo reached level 7!', 1, 6, '2014-05-30 11:48:47', 'Level Up', 'warning', NULL, NULL),
(1056, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:47', 'Activity Reviewed', 'success', NULL, NULL),
(1057, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:48:53', 'Activity Reviewed', 'success', NULL, NULL),
(1058, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-05-30 11:48:55', 'Activity Reviewed', 'success', NULL, NULL),
(1059, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:49:00', 'Activity Reviewed', 'success', NULL, NULL),
(1060, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-30 11:49:03', 'Activity Reviewed', 'success', NULL, NULL),
(1061, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-05-30 11:49:07', 'Activity Reviewed', 'success', NULL, NULL),
(1062, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-05-30 11:49:10', 'Activity Reviewed', 'success', NULL, NULL),
(1063, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-06-05 17:44:48', 'Activity Reviewed', 'success', NULL, NULL),
(1064, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-06-05 17:44:56', 'Activity Reviewed', 'success', NULL, NULL),
(1065, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-06-05 17:45:02', 'Activity Reviewed', 'success', NULL, NULL),
(1066, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:11', 'Activity Reviewed', 'success', NULL, NULL),
(1067, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:15', 'Activity Reviewed', 'success', NULL, NULL),
(1068, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:18', 'Activity Reviewed', 'success', NULL, NULL),
(1069, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:21', 'Activity Reviewed', 'success', NULL, NULL),
(1070, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:24', 'Activity Reviewed', 'success', NULL, NULL),
(1071, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:28', 'Activity Reviewed', 'success', NULL, NULL),
(1072, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-06-05 17:45:43', 'Activity Reviewed', 'success', NULL, NULL),
(1073, 'You reviewed an activity and earned 2 XP.', 1, 6, '2014-06-05 17:45:45', 'Activity Reviewed', 'success', NULL, NULL),
(1074, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:49', 'Activity Reviewed', 'success', NULL, NULL),
(1075, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-05 17:45:51', 'Activity Reviewed', 'success', NULL, NULL),
(1076, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-08 14:27:58', 'Activity Reviewed', 'success', NULL, NULL),
(1077, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-08 14:28:10', 'Activity Reviewed', 'success', NULL, NULL),
(1078, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-08 14:30:53', 'Activity Reviewed', 'success', NULL, NULL),
(1079, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-08 14:30:55', 'Activity Reviewed', 'success', NULL, NULL),
(1080, 'podicrê', 1, 4, '2014-06-10 11:18:56', 'faaala, masami!', 'info', NULL, 1),
(1081, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:07:27', 'Activity Reviewed', 'success', NULL, NULL),
(1082, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-09 18:07:31', 'Activity Reviewed', 'success', NULL, NULL),
(1083, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-09 18:07:36', 'Activity Reviewed', 'success', NULL, NULL),
(1084, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-09 18:07:39', 'Activity Reviewed', 'success', NULL, NULL),
(1085, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-09 18:07:42', 'Activity Reviewed', 'success', NULL, NULL),
(1086, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:07:46', 'Activity Reviewed', 'success', NULL, NULL),
(1087, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:07:52', 'Activity Reviewed', 'success', NULL, NULL),
(1088, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:07:55', 'Activity Reviewed', 'success', NULL, NULL),
(1089, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:07:57', 'Activity Reviewed', 'success', NULL, NULL),
(1090, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:06', 'Activity Reviewed', 'success', NULL, NULL),
(1091, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:10', 'Activity Reviewed', 'success', NULL, NULL),
(1092, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:13', 'Activity Reviewed', 'success', NULL, NULL),
(1093, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:16', 'Activity Reviewed', 'success', NULL, NULL),
(1094, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:19', 'Activity Reviewed', 'success', NULL, NULL),
(1095, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:22', 'Activity Reviewed', 'success', NULL, NULL),
(1096, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:25', 'Activity Reviewed', 'success', NULL, NULL),
(1097, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:27', 'Activity Reviewed', 'success', NULL, NULL),
(1098, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:29', 'Activity Reviewed', 'success', NULL, NULL),
(1099, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:31', 'Activity Reviewed', 'success', NULL, NULL),
(1100, 'André reached level 13!', 1, 1, '2014-06-09 20:17:16', 'Level Up', 'warning', NULL, 1),
(1101, 'André reached level 13!', 0, 2, '2014-06-09 22:08:36', 'Level Up', 'warning', NULL, 1),
(1102, 'André reached level 13!', 1, 3, '2014-06-17 10:14:31', 'Level Up', 'warning', NULL, 1),
(1103, 'André reached level 13!', 1, 4, '2014-06-10 11:18:56', 'Level Up', 'warning', NULL, 1),
(1104, 'André reached level 13!', 1, 7, '2014-06-09 18:08:57', 'Level Up', 'warning', NULL, 1),
(1105, 'André reached level 13!', 1, 5, '2014-06-09 18:09:58', 'Level Up', 'warning', NULL, 1),
(1106, 'André reached level 13!', 1, 6, '2014-06-09 18:08:37', 'Level Up', 'warning', NULL, 1),
(1107, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-09 18:08:37', 'Activity Reviewed', 'success', NULL, NULL),
(1108, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:54:38', 'Activity Reviewed', 'success', NULL, NULL),
(1109, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:54:43', 'Activity Reviewed', 'success', NULL, NULL),
(1110, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:54:48', 'Activity Reviewed', 'success', NULL, NULL),
(1111, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-10 20:54:52', 'Activity Reviewed', 'success', NULL, NULL),
(1112, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-06-10 20:54:58', 'Activity Reviewed', 'success', NULL, NULL),
(1113, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:55:30', 'Activity Reviewed', 'success', NULL, NULL),
(1114, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:55:45', 'Activity Reviewed', 'success', NULL, NULL),
(1115, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:55:56', 'Activity Reviewed', 'success', NULL, NULL),
(1116, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:56:18', 'Activity Reviewed', 'success', NULL, NULL),
(1117, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:56:30', 'Activity Reviewed', 'success', NULL, NULL),
(1118, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:56:39', 'Activity Reviewed', 'success', NULL, NULL),
(1119, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:56:49', 'Activity Reviewed', 'success', NULL, NULL),
(1120, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:56:55', 'Activity Reviewed', 'success', NULL, NULL),
(1121, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:00', 'Activity Reviewed', 'success', NULL, NULL),
(1122, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:12', 'Activity Reviewed', 'success', NULL, NULL),
(1123, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:22', 'Activity Reviewed', 'success', NULL, NULL),
(1124, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:28', 'Activity Reviewed', 'success', NULL, NULL),
(1125, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:32', 'Activity Reviewed', 'success', NULL, NULL),
(1126, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:35', 'Activity Reviewed', 'success', NULL, NULL),
(1127, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:38', 'Activity Reviewed', 'success', NULL, NULL),
(1128, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:42', 'Activity Reviewed', 'success', NULL, NULL),
(1129, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:44', 'Activity Reviewed', 'success', NULL, NULL),
(1130, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-10 20:57:47', 'Activity Reviewed', 'success', NULL, NULL),
(1131, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:49', 'Activity Reviewed', 'success', NULL, NULL),
(1132, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:51', 'Activity Reviewed', 'success', NULL, NULL),
(1133, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:57:54', 'Activity Reviewed', 'success', NULL, NULL),
(1134, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:00', 'Activity Reviewed', 'success', NULL, NULL),
(1135, 'You reviewed an activity and earned 3 XP.', 1, 6, '2014-06-10 20:58:12', 'Activity Reviewed', 'success', NULL, NULL),
(1136, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:15', 'Activity Reviewed', 'success', NULL, NULL),
(1137, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:17', 'Activity Reviewed', 'success', NULL, NULL),
(1138, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:20', 'Activity Reviewed', 'success', NULL, NULL),
(1139, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:22', 'Activity Reviewed', 'success', NULL, NULL),
(1140, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-10 20:58:24', 'Activity Reviewed', 'success', NULL, NULL),
(1141, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:15', 'Activity Reviewed', 'success', NULL, NULL),
(1142, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:19', 'Activity Reviewed', 'success', NULL, NULL),
(1143, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:22', 'Activity Reviewed', 'success', NULL, NULL),
(1144, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:26', 'Activity Reviewed', 'success', NULL, NULL),
(1145, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:28', 'Activity Reviewed', 'success', NULL, NULL),
(1146, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:31', 'Activity Reviewed', 'success', NULL, NULL),
(1147, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:33', 'Activity Reviewed', 'success', NULL, NULL),
(1148, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-06-12 10:54:44', 'Activity Reviewed', 'success', NULL, NULL),
(1149, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:46', 'Activity Reviewed', 'success', NULL, NULL),
(1150, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:52', 'Activity Reviewed', 'success', NULL, NULL),
(1151, 'You reviewed an activity and earned 4 XP.', 1, 6, '2014-06-12 10:54:55', 'Activity Reviewed', 'success', NULL, NULL),
(1152, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:54:57', 'Activity Reviewed', 'success', NULL, NULL),
(1153, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:55:00', 'Activity Reviewed', 'success', NULL, NULL),
(1154, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:55:16', 'Activity Reviewed', 'success', NULL, NULL),
(1155, 'You reviewed an activity and earned 1 XP.', 1, 6, '2014-06-12 10:55:20', 'Activity Reviewed', 'success', NULL, NULL),
(1156, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-16 15:06:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1157, 'BE READY', 1, 5, '2014-06-16 17:16:07', 'WINTER IS COMING', 'info', NULL, 1),
(1158, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-18 15:47:53', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1159, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-06-18 17:35:56', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1160, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-06-18 17:35:56', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1161, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-23 10:23:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1162, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 5, '2014-06-23 10:32:45', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1163, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-23 12:38:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1164, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-23 12:38:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1165, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 5, '2014-06-23 12:39:06', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1166, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-23 12:45:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1167, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-23 12:45:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1168, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-24 11:02:18', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1169, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-25 12:50:47', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1170, 'Eduardo reached level 8!', 1, 1, '2014-06-25 13:08:51', 'Level Up', 'warning', NULL, 4),
(1171, 'Eduardo reached level 8!', 0, 2, '2014-06-25 17:08:50', 'Level Up', 'warning', NULL, 4),
(1172, 'Eduardo reached level 8!', 1, 3, '2014-06-26 17:21:49', 'Level Up', 'warning', NULL, 4),
(1173, 'Eduardo reached level 8!', 1, 4, '2014-06-26 10:52:56', 'Level Up', 'warning', NULL, 4),
(1174, 'Eduardo reached level 8!', 1, 7, '2014-06-25 15:09:34', 'Level Up', 'warning', NULL, 4),
(1175, 'Eduardo reached level 8!', 1, 5, '2014-06-26 16:50:00', 'Level Up', 'warning', NULL, 4),
(1176, 'Eduardo reached level 8!', 1, 6, '2014-07-03 15:59:35', 'Level Up', 'warning', NULL, 4),
(1177, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:01', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1178, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:01', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1179, 'The activity you reviewed was rejected and you earned 1 XP.', 1, 1, '2014-06-25 13:09:01', 'Activity Reviewed - Rejected', 'success', NULL, NULL),
(1180, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:01', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1181, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:01', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1182, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:15', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1183, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:15', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1184, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:15', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1185, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:08:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1186, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:08:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1187, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:08:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1188, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:08:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1189, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 13:09:15', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1190, 'warning', 1, 6, '2014-07-03 15:59:35', 'It seems someone has gotten th', 'success', NULL, 0),
(1191, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-25 16:21:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL);
INSERT INTO `notification` (`id`, `text`, `read`, `player_id`, `created`, `title`, `type`, `action`, `player_id_sender`) VALUES
(1192, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 1, '2014-06-25 16:27:06', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1193, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 1, '2014-06-25 16:27:06', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1194, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-25 16:29:49', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1195, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-26 13:49:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1196, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-26 13:49:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1197, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:46:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1198, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 4, '2014-06-26 16:46:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1199, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:46:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1200, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:46:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1201, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:46:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1202, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:47:03', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1203, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:47:03', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1204, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:47:03', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1205, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-26 16:47:03', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1206, 'warning', 1, 6, '2014-07-03 15:59:35', 'It seems someone has gotten th', 'success', NULL, 0),
(1207, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-26 19:51:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1208, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-26 19:51:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1209, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-06-26 19:51:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1210, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-27 09:49:45', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1211, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-27 09:49:45', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1212, 'Felipe reached level 2!', 1, 1, '2014-06-27 09:49:45', 'Level Up', 'warning', NULL, 7),
(1213, 'Felipe reached level 2!', 0, 2, '2014-06-27 13:49:45', 'Level Up', 'warning', NULL, 7),
(1214, 'Felipe reached level 2!', 1, 3, '2014-07-04 17:48:41', 'Level Up', 'warning', NULL, 7),
(1215, 'Felipe reached level 2!', 1, 4, '2014-06-30 13:09:40', 'Level Up', 'warning', NULL, 7),
(1216, 'Felipe reached level 2!', 1, 7, '2014-06-27 10:04:07', 'Level Up', 'warning', NULL, 7),
(1217, 'Felipe reached level 2!', 1, 5, '2014-06-30 15:57:49', 'Level Up', 'warning', NULL, 7),
(1218, 'Felipe reached level 2!', 1, 6, '2014-07-03 15:59:35', 'Level Up', 'warning', NULL, 7),
(1219, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-27 09:49:45', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1220, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-30 13:16:20', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1221, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-06-30 13:16:20', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1222, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1223, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1224, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1225, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1226, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1227, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1228, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1229, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1230, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 14:30:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1231, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 5, '2014-06-30 16:08:05', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1232, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-06-30 18:57:53', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1233, 'Vinícius reached level 10 and can now join Missions!', 1, 1, '2014-06-30 18:57:53', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1234, 'Vinícius reached level 10 and can now join Missions!', 0, 2, '2014-06-30 22:57:53', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1235, 'Vinícius reached level 10 and can now join Missions!', 1, 3, '2014-07-04 17:48:41', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1236, 'Vinícius reached level 10 and can now join Missions!', 1, 4, '2014-06-30 19:03:59', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1237, 'Vinícius reached level 10 and can now join Missions!', 1, 7, '2014-06-30 19:56:58', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1238, 'Vinícius reached level 10 and can now join Missions!', 1, 5, '2014-07-05 18:00:55', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1239, 'Vinícius reached level 10 and can now join Missions!', 1, 6, '2014-07-03 15:59:35', 'Level Up - Missions Unlocked', 'warning', NULL, 5),
(1240, 'The activity you reviewed was accepted and you earned 3 XP.', 1, 1, '2014-06-30 18:57:53', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1241, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-01 15:35:04', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1242, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-01 15:35:04', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1243, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-01 15:35:04', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1244, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-01 15:35:04', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1245, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 4, '2014-07-01 19:46:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1246, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1247, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1248, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1249, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1250, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1251, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:47:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1252, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:47:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1253, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:47:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1254, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1255, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1256, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1257, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:46:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1258, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:47:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1259, 'japa safadinho', 1, 4, '2014-07-01 19:47:16', 'alo', 'info', NULL, 1),
(1260, 'Test Title', 1, 1, '2014-07-01 19:48:28', 'Test Title', 'error', NULL, 4),
(1261, 'warning', 1, 6, '2014-07-03 15:59:17', 'It seems someone has gotten th', 'success', NULL, 0),
(1262, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-01 19:51:06', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1263, 'warning', 1, 6, '2014-07-03 15:59:17', 'It seems someone has gotten th', 'success', NULL, 0),
(1264, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-02 17:42:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1265, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-02 17:42:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1266, 'The activity you reviewed was accepted and you earned 3 XP.', 1, 1, '2014-07-02 17:42:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1267, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-02 17:42:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1268, 'Eduardo reached level 9!', 1, 1, '2014-07-02 17:42:12', 'Level Up', 'warning', NULL, 4),
(1269, 'Eduardo reached level 9!', 0, 2, '2014-07-02 21:42:11', 'Level Up', 'warning', NULL, 4),
(1270, 'Eduardo reached level 9!', 1, 3, '2014-07-04 17:48:41', 'Level Up', 'warning', NULL, 4),
(1271, 'Eduardo reached level 9!', 1, 4, '2014-07-02 18:08:00', 'Level Up', 'warning', NULL, 4),
(1272, 'Eduardo reached level 9!', 1, 7, '2014-07-02 17:45:12', 'Level Up', 'warning', NULL, 4),
(1273, 'Eduardo reached level 9!', 1, 5, '2014-07-05 18:00:55', 'Level Up', 'warning', NULL, 4),
(1274, 'Eduardo reached level 9!', 1, 6, '2014-07-03 15:59:17', 'Level Up', 'warning', NULL, 4),
(1275, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-02 17:42:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1276, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-02 17:42:51', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1277, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-02 18:08:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1278, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-02 18:08:12', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1279, 'André reached level 14!', 1, 1, '2014-07-02 18:09:22', 'Level Up', 'warning', NULL, 1),
(1280, 'André reached level 14!', 0, 2, '2014-07-02 22:08:22', 'Level Up', 'warning', NULL, 1),
(1281, 'André reached level 14!', 1, 3, '2014-07-04 17:48:41', 'Level Up', 'warning', NULL, 1),
(1282, 'André reached level 14!', 1, 4, '2014-07-02 18:09:17', 'Level Up', 'warning', NULL, 1),
(1283, 'André reached level 14!', 1, 7, '2014-07-02 18:08:23', 'Level Up', 'warning', NULL, 1),
(1284, 'André reached level 14!', 1, 5, '2014-07-05 18:00:55', 'Level Up', 'warning', NULL, 1),
(1285, 'André reached level 14!', 1, 6, '2014-07-03 15:59:17', 'Level Up', 'warning', NULL, 1),
(1286, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-02 18:08:23', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1287, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-02 18:09:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1288, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-02 18:09:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1289, 'The activity you reviewed was accepted and you earned 3 XP.', 1, 4, '2014-07-02 18:09:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1290, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 4, '2014-07-02 18:09:17', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1291, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-02 18:09:33', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1292, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-02 18:09:33', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1293, 'warning', 1, 6, '2014-07-03 15:59:17', 'It seems someone has gotten th', 'success', NULL, 0),
(1294, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1295, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1296, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1297, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1298, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:16', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1299, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-03 10:29:22', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1300, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 13:19:10', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1301, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:30:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1302, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:30:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1303, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:30:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1304, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:30:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1305, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:30:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1306, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:39:24', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1307, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:39:24', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1308, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:39:24', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1309, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-03 15:39:24', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1310, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1311, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1312, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1313, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1314, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:50', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1315, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:58', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1316, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-03 16:48:58', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1317, 'warning', 1, 6, '2014-07-04 17:31:28', 'It seems someone has gotten th', 'success', NULL, 0),
(1318, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-04 17:28:58', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1319, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 7, '2014-07-04 17:31:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1320, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 1, '2014-07-04 17:49:01', 'First Time Completion', 'success', NULL, 1),
(1321, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 0, 2, '2014-07-04 21:31:35', 'First Time Completion', 'success', NULL, 1),
(1322, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 3, '2014-07-04 17:48:41', 'First Time Completion', 'success', NULL, 1),
(1323, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 4, '2014-07-04 17:43:36', 'First Time Completion', 'success', NULL, 1),
(1324, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 7, '2014-07-04 17:31:36', 'First Time Completion', 'success', NULL, 1),
(1325, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 5, '2014-07-05 18:00:55', 'First Time Completion', 'success', NULL, 1),
(1326, 'The Brainstorm activity was completed for the first time in this game. Congratulations, André!', 1, 6, '2014-07-04 17:31:47', 'First Time Completion', 'success', NULL, 1),
(1327, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:31:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1328, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:31:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1329, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:31:36', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1330, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:31:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1331, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:31:43', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1332, 'The activity you reviewed was accepted and you earned 6 XP.', 1, 7, '2014-07-04 17:45:21', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1333, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:49:04', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1334, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 1, '2014-07-04 17:49:20', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1335, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:50:31', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1336, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 7, '2014-07-04 17:50:31', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1337, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-04 17:51:18', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1338, 'The activity you reviewed was accepted and you earned 1 XP.', 1, 4, '2014-07-04 17:51:18', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1339, 'Shariath Dagon reached level 2!', 1, 20, '2014-07-06 22:21:39', 'Level Up', 'warning', NULL, 9),
(1340, 'Shariath Dagon reached level 2!', 1, 9, '2014-07-06 22:22:07', 'Level Up', 'warning', NULL, 9),
(1341, 'Shariath Dagon reached level 2!', 1, 8, '2014-07-06 22:44:49', 'Level Up', 'warning', NULL, 9),
(1342, 'The activity you reviewed was accepted and you earned 14 XP.', 1, 20, '2014-07-06 22:21:39', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1343, 'The A crazy aactivity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 20, '2014-07-06 22:21:39', 'First Time Completion', 'success', NULL, 9),
(1344, 'The A crazy aactivity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 9, '2014-07-06 22:22:07', 'First Time Completion', 'success', NULL, 9),
(1345, 'The A crazy aactivity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 8, '2014-07-06 22:44:49', 'First Time Completion', 'success', NULL, 9),
(1346, 'Shariath Dagon reached level 3!', 1, 20, '2014-07-06 22:21:39', 'Level Up', 'warning', NULL, 9),
(1347, 'Shariath Dagon reached level 3!', 1, 9, '2014-07-06 22:22:07', 'Level Up', 'warning', NULL, 9),
(1348, 'Shariath Dagon reached level 3!', 1, 8, '2014-07-06 22:44:49', 'Level Up', 'warning', NULL, 9),
(1349, 'The activity you reviewed was accepted and you earned 14 XP.', 1, 20, '2014-07-06 22:21:39', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1350, 'The activity you reviewed was rejected and you earned 1 XP.', 0, 20, '0000-00-00 00:00:00', 'Activity Reviewed - Rejected', 'success', NULL, NULL),
(1351, 'The activity you reviewed was rejected and you earned 1 XP.', 1, 21, '2014-07-06 22:24:41', 'Activity Reviewed - Rejected', 'success', NULL, NULL),
(1352, 'The Another crazy activity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 0, 20, '2014-07-06 22:24:40', 'First Time Completion', 'success', NULL, 9),
(1353, 'The Another crazy activity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 21, '2014-07-06 22:24:41', 'First Time Completion', 'success', NULL, 9),
(1354, 'The Another crazy activity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 9, '2014-07-06 22:25:05', 'First Time Completion', 'success', NULL, 9),
(1355, 'The Another crazy activity activity was completed for the first time in this game. Congratulations, Shariath Dagon!', 1, 8, '2014-07-06 22:44:42', 'First Time Completion', 'success', NULL, 9),
(1356, 'The activity you reviewed was rejected and you earned 1 XP.', 0, 20, '0000-00-00 00:00:00', 'Activity Reviewed - Rejected', 'success', NULL, NULL),
(1357, 'The activity you reviewed was rejected and you earned 1 XP.', 1, 21, '2014-07-06 22:24:41', 'Activity Reviewed - Rejected', 'success', NULL, NULL),
(1358, 'The activity you reviewed was accepted and you earned 3 XP.', 0, 20, '0000-00-00 00:00:00', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1359, 'The activity you reviewed was accepted and you earned 3 XP.', 1, 21, '2014-07-06 22:24:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1360, 'The activity you reviewed was accepted and you earned 3 XP.', 0, 20, '0000-00-00 00:00:00', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1361, 'The activity you reviewed was accepted and you earned 3 XP.', 1, 21, '2014-07-06 22:24:41', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1362, 'warning', 1, 6, '2014-07-10 23:21:37', 'It seems someone has gotten th', 'success', NULL, 0),
(1363, 'warning', 1, 8, '2014-07-06 22:44:42', 'It seems someone has gotten th', 'success', NULL, 0),
(1364, 'warning', 1, 6, '2014-07-10 23:21:37', 'It seems someone has gotten th', 'success', NULL, 0),
(1365, 'warning', 1, 8, '2014-07-06 22:44:42', 'It seems someone has gotten th', 'success', NULL, 0),
(1366, 'warning', 1, 6, '2014-07-10 23:21:37', 'It seems someone has gotten th', 'success', NULL, 0),
(1367, 'warning', 1, 8, '2014-07-06 22:44:42', 'It seems someone has gotten th', 'success', NULL, 0),
(1368, 'warning', 1, 6, '2014-07-10 23:21:37', 'It seems someone has gotten th', 'success', NULL, 0),
(1369, 'warning', 1, 8, '2014-07-06 22:44:42', 'It seems someone has gotten th', 'success', NULL, 0),
(1370, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:23:31', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1371, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:22:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1372, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:22:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1373, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:22:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1374, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:22:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1375, 'The activity you reviewed was accepted and you earned 2 XP.', 1, 5, '2014-08-09 20:23:31', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1376, 'The activity you reviewed was accepted and you earned 4 XP.', 1, 5, '2014-08-09 20:23:31', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1377, 'The activity you reviewed was accepted and you earned 4 XP.', 1, 5, '2014-08-09 20:22:27', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1378, 'The activity you reviewed was accepted and you earned 4 XP.', 1, 1, '2014-08-09 20:24:08', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1379, 'The activity you reviewed was accepted and you earned 4 XP.', 1, 1, '2014-08-09 20:24:08', 'Activity Reviewed - Accepted', 'success', NULL, NULL),
(1380, 'The activity you reviewed was accepted and you earned 4 XP.', 1, 1, '2014-08-09 20:24:08', 'Activity Reviewed - Accepted', 'success', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player`
--

CREATE TABLE IF NOT EXISTS `player` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `player_type_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(40) NOT NULL,
  `xp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hash` char(64) DEFAULT NULL,
  `verified_in` timestamp NULL DEFAULT NULL,
  `timezone` varchar(200) NOT NULL DEFAULT 'UTC',
  `credly_id` varchar(20) DEFAULT NULL,
  `credly_email` varchar(255) DEFAULT NULL,
  `credly_access_token` varchar(200) DEFAULT NULL,
  `credly_refresh_token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Extraindo dados da tabela `player`
--

INSERT INTO `player` (`id`, `name`, `player_type_id`, `email`, `password`, `xp`, `team_id`, `created`, `hash`, `verified_in`, `timezone`, `credly_id`, `credly_email`, `credly_access_token`, `credly_refresh_token`) VALUES
(1, 'André', 1, 'andre@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 5073, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', 'America/Sao_Paulo', '2026288', 'mighty.shariath@hotmail.com', NULL, NULL),
(2, 'Cristian', 1, 'cristian.dietrich@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 804, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', NULL, NULL, NULL, NULL),
(3, 'Diego', 1, 'diego.vargas@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 2441, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', NULL, NULL, NULL, NULL),
(4, 'Eduardo', 1, 'eduardok@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 2479, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', NULL, NULL, NULL, NULL),
(5, 'Vinícius', 1, 'vinicius@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 2859, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', NULL, NULL, NULL, NULL),
(6, 'Davi', 2, 'davi@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 1465, NULL, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', '2025643', 'davi.gbr@gmail.com', '2a9f7896bf1cd799a8c62c962226c85c9d763617547934d8951d92422494fab9b33f9e5339d26bcb2133fc0e634857691e4eea50e163f84340263055146ff73c', '77036606b90fa70206ed1b07608deb50df7e2600111be9d0afd171508bb104b48d57989390880b2a8b2145cafd49ee7524c6a7f65fa208539a6fc604aafdd7dd'),
(7, 'Felipe', 1, 'felipegomes@versul.com.br', 'afc829308edb4fd559f77df5d751638dc39de646', 252, 1, '2014-06-08 14:27:48', NULL, '2014-06-07 13:55:34', '178', NULL, NULL, NULL, NULL),
(8, 'Davi Gabriel', 2, 'davi.gbr@gmail.com2', '441aaf04b1981ae3bd750df8b0b17557da2359f8', 0, NULL, '2014-07-06 17:48:00', 'c61f4255b02039401b2edc6d544dfa0bc7ad8b7f42b1ea0fa0bd4a42663c7dd2', '2014-07-06 17:51:50', '178', NULL, NULL, NULL, NULL),
(9, 'Shariath Dagon', 1, 'mighty.shariath@hotmail.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 446, 5, '2014-07-06 22:09:59', 'd657135998e736fec85853ac788c80f4200a364d87b802b647321ac5b9998828', '2014-07-06 22:11:23', '178', NULL, NULL, NULL, NULL),
(20, 'Dagon Shariath', 1, 'dagon', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 36, 5, '2014-07-06 22:21:01', NULL, '2014-07-06 22:11:23', '178', NULL, NULL, NULL, NULL),
(21, 'Dagon Shariath 2', 1, 'dagon2', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 8, 5, '2014-07-06 22:24:13', NULL, '2014-07-06 22:11:23', '178', NULL, NULL, NULL, NULL),
(26, 'DGBR', 1, 'davi.gbr@gmail.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 0, 2, '2014-08-24 16:20:48', '463f0601b91556d5ab5eb48341475eac95487ae96201ed9f21806a6f4fd6de58', '2014-08-26 02:55:21', 'UTC', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_activity_summary`
--
CREATE TABLE IF NOT EXISTS `player_activity_summary` (
`player_id` int(10) unsigned
,`player_name` varchar(30)
,`count` bigint(21)
,`activity_id` int(10) unsigned
,`log_reviewed` timestamp
,`activity_name` varchar(30)
,`activity_description` varchar(200)
,`domain_id` int(10) unsigned
,`domain_name` varchar(30)
,`domain_abbr` char(3)
,`domain_color` char(7)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `player_type`
--

CREATE TABLE IF NOT EXISTS `player_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `player_type`
--

INSERT INTO `player_type` (`id`, `name`) VALUES
(1, 'Player'),
(2, 'Game Master');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `color` char(7) NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned NOT NULL,
  `bonus_type` char(1) NOT NULL DEFAULT '+',
  `bonus_value` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `tag`
--

INSERT INTO `tag` (`id`, `name`, `description`, `color`, `inactive`, `new`, `player_id_owner`, `bonus_type`, `bonus_value`) VALUES
(14, 'PHPUnit 3', 'PHPUnit 3.x', '#FF9900', 0, 1, 6, '+', 0),
(15, 'JUnit', 'JUnit', '#FF9900', 0, 1, 6, '+', 0),
(16, 'Mocha', 'Mocha', '#FF9900', 0, 1, 6, '+', 0),
(17, 'Travis', 'Travis', '#FF9900', 0, 1, 6, '+', 0),
(18, 'Pair', 'Pair Programming', '#ff0000', 0, 1, 6, '%', 50),
(19, 'TDD', 'Test Driven Development', '#008800', 0, 1, 6, '+', 0),
(20, 'Bug Trap', 'Bug Trap', '#22AAFF', 0, 1, 6, '+', 0),
(21, 'Tag', 'Tag description', '#ff8888', 1, 0, 8, '+', 0),
(22, 'Another tag', 'Another tag ggggg', '#FF9900', 0, 1, 8, '+', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `team`
--

CREATE TABLE IF NOT EXISTS `team` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `player_id_owner` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `team`
--

INSERT INTO `team` (`id`, `name`, `player_id_owner`) VALUES
(1, 'S2Way', 6),
(2, 'S2Support', 6),
(5, 'HAHA', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `what` varchar(30) NOT NULL,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `badge_id` int(10) unsigned DEFAULT NULL,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=771 ;

--
-- Extraindo dados da tabela `timeline`
--

INSERT INTO `timeline` (`id`, `player_id`, `what`, `when`, `badge_id`, `activity_id`, `domain_id`) VALUES
(1, 1, 'Activity', '2014-01-21 08:32:01', NULL, 2, 1),
(2, 1, 'Activity', '2014-01-21 08:32:01', NULL, 37, 4),
(3, 1, 'Activity', '2014-01-21 08:32:02', NULL, 45, 4),
(4, 1, 'Activity', '2014-01-21 08:32:03', NULL, 40, 4),
(5, 1, 'Activity', '2014-01-21 08:32:03', NULL, 43, 4),
(6, 1, 'Activity', '2014-01-21 08:42:47', NULL, 10, 1),
(7, 1, 'Activity', '2014-01-21 08:42:48', NULL, 17, 2),
(8, 2, 'Activity', '2014-01-21 08:43:03', NULL, 2, 1),
(9, 2, 'Activity', '2014-01-21 08:43:03', NULL, 37, 4),
(10, 2, 'Activity', '2014-01-21 08:43:04', NULL, 45, 4),
(11, 2, 'Activity', '2014-01-21 08:43:04', NULL, 40, 4),
(12, 2, 'Activity', '2014-01-21 08:43:04', NULL, 43, 4),
(13, 2, 'Activity', '2014-01-21 08:43:05', NULL, 10, 1),
(14, 2, 'Activity', '2014-01-21 08:43:13', NULL, 17, 2),
(15, 3, 'Activity', '2014-01-21 08:43:54', NULL, 2, 1),
(16, 3, 'Activity', '2014-01-21 08:43:55', NULL, 2, 1),
(17, 3, 'Activity', '2014-01-21 08:43:56', NULL, 2, 1),
(18, 4, 'Activity', '2014-01-21 08:45:08', NULL, 2, 1),
(19, 4, 'Activity', '2014-01-21 08:45:13', NULL, 2, 1),
(20, 4, 'Activity', '2014-01-21 08:45:44', NULL, 3, 1),
(21, 4, 'Activity', '2014-01-21 08:45:44', NULL, 23, 3),
(22, 4, 'Activity', '2014-01-21 08:45:45', NULL, 37, 4),
(23, 4, 'Activity', '2014-01-21 08:45:45', NULL, 45, 4),
(24, 4, 'Activity', '2014-01-21 08:45:46', NULL, 42, 4),
(25, 5, 'Activity', '2014-01-21 08:46:34', NULL, 19, 2),
(26, 5, 'Activity', '2014-01-21 08:46:35', NULL, 16, 2),
(27, 5, 'Activity', '2014-01-21 08:46:35', NULL, 2, 1),
(28, 5, 'Activity', '2014-01-21 08:46:36', NULL, 2, 1),
(29, 1, 'Activity', '2014-01-21 17:20:42', NULL, 39, 4),
(30, 1, 'Activity', '2014-01-21 17:21:09', NULL, 14, 2),
(31, 4, 'Activity', '2014-01-22 07:09:49', NULL, 52, 2),
(32, 4, 'Activity', '2014-01-22 07:10:42', NULL, 2, 1),
(33, 4, 'Activity', '2014-01-22 07:11:05', NULL, 2, 1),
(34, 4, 'Activity', '2014-01-22 07:11:27', NULL, 37, 4),
(35, 1, 'Activity', '2014-01-22 07:11:40', NULL, 37, 4),
(36, 4, 'Activity', '2014-01-22 07:19:23', NULL, 45, 4),
(37, 1, 'Activity', '2014-01-22 07:27:07', NULL, 52, 2),
(38, 1, 'Activity', '2014-01-22 07:27:23', NULL, 15, 2),
(39, 3, 'Activity', '2014-01-22 07:30:19', NULL, 23, 3),
(40, 3, 'Activity', '2014-01-22 16:54:39', NULL, 17, 2),
(41, 5, 'Activity', '2014-01-22 16:54:51', NULL, 23, 3),
(42, 5, 'Activity', '2014-01-22 16:55:39', NULL, 37, 4),
(43, 5, 'Activity', '2014-01-22 16:56:08', NULL, 43, 4),
(44, 5, 'Activity', '2014-01-22 16:56:33', NULL, 52, 2),
(45, 2, 'Activity', '2014-01-22 16:57:06', NULL, 52, 2),
(46, 5, 'Activity', '2014-01-22 16:57:24', NULL, 2, 1),
(47, 5, 'Activity', '2014-01-22 16:58:41', NULL, 23, 3),
(48, 5, 'Activity', '2014-01-22 17:01:03', NULL, 17, 2),
(49, 1, 'Activity', '2014-01-23 06:55:45', NULL, 15, 2),
(50, 2, 'Activity', '2014-01-23 06:56:04', NULL, 15, 2),
(51, 4, 'Activity', '2014-01-23 06:59:30', NULL, 2, 1),
(52, 2, 'Activity', '2014-01-23 06:59:49', NULL, 15, 2),
(53, 4, 'Activity', '2014-01-23 06:59:55', NULL, 1, 1),
(54, 4, 'Activity', '2014-01-23 07:00:27', NULL, 1, 1),
(55, 4, 'Activity', '2014-01-23 07:00:51', NULL, 37, 4),
(56, 4, 'Activity', '2014-01-23 07:01:24', NULL, 37, 4),
(57, 4, 'Activity', '2014-01-23 07:02:02', NULL, 45, 4),
(58, 1, 'Activity', '2014-01-23 07:02:22', NULL, 45, 4),
(59, 5, 'Activity', '2014-01-23 14:06:41', NULL, 55, 3),
(60, 3, 'Activity', '2014-01-23 16:55:14', NULL, 56, 3),
(61, 2, 'Activity', '2014-01-23 16:59:22', NULL, 15, 2),
(62, 1, 'Activity', '2014-01-23 16:59:32', NULL, 15, 2),
(63, 1, 'Activity', '2014-01-23 17:00:36', NULL, 14, 2),
(64, 5, 'Activity', '2014-01-23 17:00:43', NULL, 17, 2),
(65, 4, 'Activity', '2014-01-24 06:55:43', NULL, 2, 1),
(66, 4, 'Activity', '2014-01-24 06:56:06', NULL, 23, 3),
(67, 4, 'Activity', '2014-01-24 06:56:30', NULL, 37, 4),
(68, 4, 'Activity', '2014-01-24 06:56:53', NULL, 45, 4),
(69, 1, 'Activity', '2014-01-27 07:40:21', NULL, 39, 4),
(70, 1, 'Activity', '2014-01-27 07:40:39', NULL, 14, 2),
(71, 1, 'Activity', '2014-01-27 07:41:35', NULL, 42, 4),
(72, 2, 'Activity', '2014-01-27 07:42:44', NULL, 42, 4),
(73, 2, 'Activity', '2014-01-27 07:43:06', NULL, 39, 4),
(74, 4, 'Activity', '2014-01-27 08:01:34', NULL, 12, 2),
(75, 4, 'Activity', '2014-01-27 08:02:01', NULL, 23, 3),
(76, 4, 'Activity', '2014-01-27 08:02:42', NULL, 37, 4),
(77, 5, 'Activity', '2014-01-27 08:32:46', NULL, 35, 3),
(78, 1, 'Activity', '2014-01-27 12:58:25', NULL, 52, 2),
(79, 5, 'Activity', '2014-01-28 06:57:13', NULL, 15, 2),
(80, 5, 'Activity', '2014-01-28 06:59:04', NULL, 37, 4),
(81, 5, 'Activity', '2014-01-28 06:59:34', NULL, 37, 4),
(82, 5, 'Activity', '2014-01-28 06:59:51', NULL, 43, 4),
(83, 4, 'Activity', '2014-01-28 07:03:34', NULL, 2, 1),
(84, 4, 'Activity', '2014-01-28 07:03:55', NULL, 23, 3),
(85, 4, 'Activity', '2014-01-28 07:04:16', NULL, 37, 4),
(86, 4, 'Activity', '2014-01-28 07:04:28', NULL, 45, 4),
(87, 1, 'Activity', '2014-01-28 07:19:27', NULL, 15, 2),
(88, 2, 'Activity', '2014-01-28 07:19:46', NULL, 15, 2),
(89, 3, 'Activity', '2014-01-28 08:54:57', NULL, 15, 2),
(90, 3, 'Activity', '2014-01-28 08:55:40', NULL, 44, 4),
(91, 3, 'Activity', '2014-01-28 08:56:03', NULL, 43, 4),
(92, 3, 'Activity', '2014-01-28 08:58:47', NULL, 52, 2),
(93, 2, 'Activity', '2014-01-28 08:59:34', NULL, 52, 2),
(94, 5, 'Activity', '2014-01-28 13:31:37', NULL, 12, 2),
(95, 5, 'Activity', '2014-01-28 13:31:49', NULL, 17, 2),
(96, 5, 'Activity', '2014-01-28 13:32:50', NULL, 52, 2),
(97, 5, 'Activity', '2014-01-28 16:56:33', NULL, 23, 3),
(98, 5, 'Activity', '2014-01-28 16:57:03', NULL, 44, 4),
(99, 5, 'Activity', '2014-01-28 16:57:56', NULL, 44, 4),
(100, 1, 'Activity', '2014-01-28 16:58:23', NULL, 43, 4),
(101, 5, 'Activity', '2014-01-28 16:58:58', NULL, 7, 1),
(102, 1, 'Activity', '2014-01-29 06:49:46', NULL, 15, 2),
(103, 1, 'Activity', '2014-01-29 06:50:00', NULL, 14, 2),
(104, 1, 'Activity', '2014-01-29 06:53:57', NULL, 56, 3),
(105, 3, 'Activity', '2014-01-29 06:55:04', NULL, 15, 2),
(106, 1, 'Activity', '2014-01-29 06:55:29', NULL, 23, 3),
(107, 1, 'Activity', '2014-01-29 06:55:57', NULL, 36, 3),
(108, 3, 'Activity', '2014-01-29 06:56:33', NULL, 1, 1),
(109, 1, 'Activity', '2014-01-29 06:57:07', NULL, 56, 3),
(110, 5, 'Activity', '2014-01-29 07:04:22', NULL, 37, 4),
(111, 5, 'Activity', '2014-01-29 07:04:41', NULL, 37, 4),
(112, 4, 'Activity', '2014-01-29 07:10:41', NULL, 12, 2),
(113, 3, 'Activity', '2014-01-29 08:20:06', NULL, 37, 4),
(114, 3, 'Activity', '2014-01-29 08:20:19', NULL, 44, 4),
(115, 3, 'Activity', '2014-01-29 12:40:04', NULL, 7, 1),
(116, 3, 'Activity', '2014-01-29 12:45:20', NULL, 1, 1),
(117, 3, 'Activity', '2014-01-29 13:00:00', NULL, 17, 2),
(118, 3, 'Activity', '2014-01-29 13:39:47', NULL, 7, 1),
(119, 3, 'Activity', '2014-01-29 13:40:37', NULL, 1, 1),
(120, 2, 'Activity', '2014-01-29 13:44:26', NULL, 15, 2),
(121, 2, 'Activity', '2014-01-29 13:44:50', NULL, 43, 4),
(122, 2, 'Activity', '2014-01-29 13:45:35', NULL, 23, 3),
(123, 2, 'Activity', '2014-01-29 13:46:15', NULL, 36, 3),
(124, 1, 'Activity', '2014-01-29 17:27:44', NULL, 45, 4),
(125, 1, 'Activity', '2014-01-29 17:28:16', NULL, 40, 4),
(126, 1, 'Activity', '2014-01-29 17:28:41', NULL, 37, 4),
(127, 1, 'Activity', '2014-01-29 17:29:25', NULL, 2, 1),
(128, 4, 'Activity', '2014-01-30 10:07:15', NULL, 4, 1),
(129, 4, 'Activity', '2014-01-30 10:07:43', NULL, 9, 1),
(130, 4, 'Activity', '2014-01-30 10:07:58', NULL, 56, 3),
(131, 4, 'Activity', '2014-01-30 10:08:17', NULL, 39, 4),
(132, 4, 'Activity', '2014-01-30 10:08:33', NULL, 39, 4),
(133, 5, 'Activity', '2014-01-30 11:45:19', NULL, 17, 2),
(134, 3, 'Activity', '2014-01-30 14:41:54', NULL, 17, 2),
(135, 2, 'Activity', '2014-01-30 18:12:31', NULL, 14, 2),
(136, 4, 'Activity', '2014-01-31 09:07:32', NULL, 1, 1),
(137, 4, 'Activity', '2014-01-31 09:07:52', NULL, 1, 1),
(138, 4, 'Activity', '2014-01-31 09:09:13', NULL, 1, 1),
(139, 4, 'Activity', '2014-01-31 09:09:27', NULL, 1, 1),
(140, 4, 'Activity', '2014-01-31 09:09:47', NULL, 1, 1),
(141, 4, 'Activity', '2014-01-31 09:10:27', NULL, 1, 1),
(142, 4, 'Activity', '2014-01-31 09:10:41', NULL, 1, 1),
(143, 4, 'Activity', '2014-01-31 09:10:53', NULL, 1, 1),
(144, 4, 'Activity', '2014-01-31 09:11:03', NULL, 1, 1),
(145, 4, 'Activity', '2014-01-31 09:11:34', NULL, 9, 1),
(146, 4, 'Activity', '2014-01-31 09:11:50', NULL, 9, 1),
(147, 4, 'Activity', '2014-01-31 09:12:07', NULL, 9, 1),
(148, 4, 'Activity', '2014-01-31 09:12:22', NULL, 9, 1),
(149, 4, 'Activity', '2014-01-31 09:12:53', NULL, 9, 1),
(150, 4, 'Activity', '2014-01-31 09:13:06', NULL, 9, 1),
(151, 4, 'Activity', '2014-01-31 09:13:20', NULL, 9, 1),
(152, 4, 'Activity', '2014-01-31 09:13:30', NULL, 9, 1),
(153, 4, 'Activity', '2014-01-31 09:13:40', NULL, 9, 1),
(154, 4, 'Activity', '2014-01-31 09:14:33', NULL, 12, 2),
(155, 4, 'Activity', '2014-01-31 09:14:59', NULL, 42, 4),
(156, 4, 'Activity', '2014-01-31 09:15:17', NULL, 45, 4),
(157, 5, 'Activity', '2014-01-31 13:55:10', NULL, 52, 2),
(158, 1, 'Activity', '2014-01-31 13:58:50', NULL, 11, 1),
(159, 1, 'Activity', '2014-02-03 07:21:13', NULL, 52, 2),
(160, 2, 'Activity', '2014-02-03 07:39:01', NULL, 2, 1),
(161, 2, 'Activity', '2014-02-03 07:39:43', NULL, 2, 1),
(162, 1, 'Activity', '2014-02-03 12:44:16', NULL, 42, 4),
(163, 1, 'Activity', '2014-02-03 12:44:38', NULL, 45, 4),
(164, 2, 'Activity', '2014-02-04 07:10:59', NULL, 52, 2),
(165, 2, 'Activity', '2014-02-04 14:01:27', NULL, 1, 1),
(166, 2, 'Activity', '2014-02-04 14:02:33', NULL, 1, 1),
(167, 2, 'Activity', '2014-02-04 14:27:14', NULL, 14, 2),
(168, 1, 'Activity', '2014-02-04 17:01:57', NULL, 23, 3),
(169, 1, 'Activity', '2014-02-04 17:02:30', NULL, 2, 1),
(170, 4, 'Activity', '2014-02-05 13:08:34', NULL, 52, 2),
(171, 4, 'Activity', '2014-02-05 13:09:10', NULL, 2, 1),
(172, 4, 'Activity', '2014-02-05 15:37:52', NULL, 2, 1),
(173, 4, 'Activity', '2014-02-05 15:38:05', NULL, 37, 4),
(174, 4, 'Activity', '2014-02-05 15:38:23', NULL, 45, 4),
(175, 4, 'Activity', '2014-02-05 15:38:46', NULL, 23, 3),
(176, 5, 'Activity', '2014-02-06 14:56:41', NULL, 42, 4),
(177, 5, 'Activity', '2014-02-06 14:57:18', NULL, 2, 1),
(178, 5, 'Activity', '2014-02-06 15:04:19', NULL, 45, 4),
(179, 5, 'Activity', '2014-02-06 15:12:14', NULL, 4, 1),
(180, 5, 'Activity', '2014-02-06 16:36:52', NULL, 38, 4),
(181, 5, 'Activity', '2014-02-06 16:37:11', NULL, 2, 1),
(182, 5, 'Activity', '2014-02-06 16:44:53', NULL, 45, 4),
(183, 5, 'Activity', '2014-02-10 06:54:46', NULL, 52, 2),
(184, 5, 'Activity', '2014-02-10 15:36:55', NULL, 52, 2),
(185, 5, 'Activity', '2014-02-10 15:37:10', NULL, 17, 2),
(186, 2, 'Activity', '2014-02-11 07:16:54', NULL, 52, 2),
(187, 1, 'Activity', '2014-02-11 07:17:05', NULL, 52, 2),
(188, 2, 'Activity', '2014-02-11 07:17:15', NULL, 52, 2),
(189, 1, 'Activity', '2014-02-11 07:17:16', NULL, 52, 2),
(190, 3, 'Activity', '2014-02-11 08:35:47', NULL, 44, 4),
(191, 3, 'Activity', '2014-02-11 08:36:28', NULL, 37, 4),
(192, 3, 'Activity', '2014-02-11 16:51:18', NULL, 52, 2),
(193, 1, 'Activity', '2014-02-12 06:54:07', NULL, 14, 2),
(194, 1, 'Activity', '2014-02-12 06:56:12', NULL, 23, 3),
(195, 1, 'Activity', '2014-02-12 06:56:41', NULL, 23, 3),
(196, 1, 'Activity', '2014-02-12 06:57:14', NULL, 23, 3),
(197, 1, 'Activity', '2014-02-12 06:57:45', NULL, 2, 1),
(198, 1, 'Activity', '2014-02-12 06:58:06', NULL, 2, 1),
(199, 5, 'Activity', '2014-02-13 16:35:05', NULL, 37, 4),
(200, 5, 'Activity', '2014-02-13 16:35:20', NULL, 45, 4),
(201, 5, 'Activity', '2014-02-13 16:35:39', NULL, 43, 4),
(202, 5, 'Activity', '2014-02-13 16:47:39', NULL, 42, 4),
(203, 3, 'Activity', '2014-02-14 16:05:59', NULL, 52, 2),
(204, 3, 'Activity', '2014-02-14 16:07:08', NULL, 43, 4),
(205, 3, 'Activity', '2014-02-14 16:07:20', NULL, 45, 4),
(206, 3, 'Activity', '2014-02-14 16:07:43', NULL, 37, 4),
(207, 3, 'Activity', '2014-02-14 16:08:14', NULL, 45, 4),
(208, 3, 'Activity', '2014-02-14 16:08:41', NULL, 37, 4),
(209, 3, 'Activity', '2014-02-14 16:11:06', NULL, 15, 2),
(210, 5, 'Activity', '2014-02-14 16:43:08', NULL, 52, 2),
(211, 5, 'Activity', '2014-02-17 09:29:47', NULL, 52, 2),
(212, 2, 'Activity', '2014-02-17 09:30:14', NULL, 52, 2),
(213, 5, 'Activity', '2014-02-17 18:14:16', NULL, 37, 4),
(214, 5, 'Activity', '2014-02-17 18:14:57', NULL, 44, 4),
(215, 5, 'Activity', '2014-02-17 18:15:31', NULL, 45, 4),
(216, 5, 'Activity', '2014-02-17 18:17:32', NULL, 40, 4),
(217, 5, 'Activity', '2014-02-18 08:56:14', NULL, 17, 2),
(218, 5, 'Activity', '2014-02-18 18:02:27', NULL, 37, 4),
(219, 5, 'Activity', '2014-02-18 18:02:43', NULL, 43, 4),
(220, 5, 'Activity', '2014-02-18 18:03:12', NULL, 40, 4),
(221, 5, 'Activity', '2014-02-18 18:03:31', NULL, 45, 4),
(222, 5, 'Activity', '2014-02-18 18:47:23', NULL, 23, 3),
(223, 3, 'Activity', '2014-02-18 18:50:21', NULL, 15, 2),
(224, 1, 'Activity', '2014-02-18 18:50:26', NULL, 15, 2),
(225, 3, 'Activity', '2014-02-18 18:50:42', NULL, 2, 1),
(226, 3, 'Activity', '2014-02-18 18:51:06', NULL, 37, 4),
(227, 3, 'Activity', '2014-02-18 18:51:29', NULL, 45, 4),
(228, 1, 'Activity', '2014-02-18 18:52:30', NULL, 52, 2),
(229, 3, 'Activity', '2014-02-18 18:52:59', NULL, 15, 2),
(230, 1, 'Activity', '2014-02-18 18:53:18', NULL, 10, 1),
(231, 3, 'Activity', '2014-02-18 18:53:24', NULL, 52, 2),
(232, 1, 'Activity', '2014-02-18 18:53:26', NULL, 10, 1),
(233, 1, 'Activity', '2014-02-18 18:54:11', NULL, 37, 4),
(234, 1, 'Activity', '2014-02-18 18:54:29', NULL, 43, 4),
(235, 3, 'Activity', '2014-02-18 18:54:39', NULL, 43, 4),
(236, 1, 'Activity', '2014-02-18 18:54:41', NULL, 45, 4),
(237, 1, 'Activity', '2014-02-18 18:55:08', NULL, 46, 2),
(238, 1, 'Activity', '2014-02-18 18:55:54', NULL, 15, 2),
(239, 1, 'Activity', '2014-02-18 18:56:37', NULL, 2, 1),
(240, 1, 'Activity', '2014-02-18 18:57:19', NULL, 2, 1),
(241, 2, 'Activity', '2014-02-18 18:57:55', NULL, 52, 2),
(242, 5, 'Activity', '2014-02-19 08:48:47', NULL, 52, 2),
(243, 4, 'Activity', '2014-02-19 09:13:18', NULL, 2, 1),
(244, 4, 'Activity', '2014-02-19 09:13:35', NULL, 2, 1),
(245, 4, 'Activity', '2014-02-19 09:13:52', NULL, 22, 2),
(246, 4, 'Activity', '2014-02-19 09:14:11', NULL, 44, 4),
(247, 4, 'Activity', '2014-02-19 09:14:23', NULL, 37, 4),
(248, 5, 'Activity', '2014-02-19 10:36:09', NULL, 23, 3),
(249, 5, 'Activity', '2014-02-19 10:36:53', NULL, 37, 4),
(250, 5, 'Activity', '2014-02-19 10:37:20', NULL, 44, 4),
(251, 5, 'Activity', '2014-02-19 10:38:00', NULL, 36, 3),
(252, 5, 'Activity', '2014-02-19 10:38:21', NULL, 43, 4),
(253, 5, 'Activity', '2014-02-19 18:17:16', NULL, 37, 4),
(254, 5, 'Activity', '2014-02-19 18:17:34', NULL, 45, 4),
(255, 5, 'Activity', '2014-02-19 18:17:49', NULL, 43, 4),
(256, 1, 'Activity', '2014-02-20 15:33:15', NULL, 15, 2),
(257, 1, 'Activity', '2014-02-20 15:33:49', NULL, 43, 4),
(258, 1, 'Activity', '2014-02-20 15:34:12', NULL, 44, 4),
(259, 1, 'Activity', '2014-02-20 15:35:03', NULL, 37, 4),
(260, 1, 'Activity', '2014-02-20 15:35:24', NULL, 14, 2),
(261, 3, 'Activity', '2014-02-20 15:39:34', NULL, 15, 2),
(262, 3, 'Activity', '2014-02-20 15:40:18', NULL, 43, 4),
(263, 3, 'Activity', '2014-02-20 15:41:15', NULL, 44, 4),
(264, 3, 'Activity', '2014-02-20 15:41:44', NULL, 37, 4),
(265, 5, 'Activity', '2014-02-20 15:59:09', NULL, 42, 4),
(266, 5, 'Activity', '2014-02-20 17:51:57', NULL, 37, 4),
(267, 5, 'Activity', '2014-02-20 17:52:11', NULL, 45, 4),
(268, 5, 'Activity', '2014-02-20 17:52:32', NULL, 40, 4),
(269, 5, 'Activity', '2014-02-20 17:52:44', NULL, 43, 4),
(270, 5, 'Activity', '2014-02-20 17:55:14', NULL, 56, 3),
(271, 3, 'Activity', '2014-02-20 18:22:28', NULL, 17, 2),
(272, 3, 'Activity', '2014-02-20 18:22:40', NULL, 15, 2),
(273, 3, 'Activity', '2014-02-20 18:23:17', NULL, 44, 4),
(274, 3, 'Activity', '2014-02-20 18:23:29', NULL, 37, 4),
(275, 3, 'Activity', '2014-02-20 18:24:35', NULL, 43, 4),
(276, 3, 'Activity', '2014-02-20 18:25:13', NULL, 10, 1),
(277, 3, 'Activity', '2014-02-20 18:26:13', NULL, 1, 1),
(278, 1, 'Activity', '2014-02-21 08:50:29', NULL, 15, 2),
(279, 1, 'Activity', '2014-02-21 08:51:00', NULL, 1, 1),
(280, 1, 'Activity', '2014-02-21 08:51:21', NULL, 10, 1),
(281, 1, 'Activity', '2014-02-21 08:51:51', NULL, 58, 2),
(282, 1, 'Activity', '2014-02-21 08:53:03', NULL, 58, 2),
(283, 1, 'Activity', '2014-02-21 08:53:22', NULL, 58, 2),
(284, 1, 'Activity', '2014-02-21 08:53:41', NULL, 58, 2),
(285, 3, 'Activity', '2014-02-21 08:59:26', NULL, 58, 2),
(286, 1, 'Activity', '2014-02-21 11:33:50', NULL, 44, 4),
(287, 1, 'Activity', '2014-02-21 11:34:02', NULL, 37, 4),
(288, 1, 'Activity', '2014-02-21 11:34:25', NULL, 43, 4),
(289, 3, 'Activity', '2014-02-24 17:46:55', NULL, 58, 2),
(290, 3, 'Activity', '2014-02-24 18:47:09', NULL, 43, 4),
(291, 3, 'Activity', '2014-02-24 18:49:01', NULL, 58, 2),
(292, 3, 'Activity', '2014-02-24 18:51:06', NULL, 58, 2),
(293, 3, 'Activity', '2014-02-24 18:57:07', NULL, 23, 3),
(294, 3, 'Activity', '2014-02-25 17:37:15', NULL, 17, 2),
(295, 4, 'Activity', '2014-02-26 09:06:49', NULL, 12, 2),
(296, 4, 'Activity', '2014-02-26 09:06:58', NULL, 12, 2),
(297, 5, 'Activity', '2014-02-26 18:09:33', NULL, 12, 2),
(298, 5, 'Activity', '2014-02-26 18:12:21', NULL, 37, 4),
(299, 5, 'Activity', '2014-02-26 18:12:40', NULL, 44, 4),
(300, 5, 'Activity', '2014-02-26 18:13:01', NULL, 43, 4),
(301, 5, 'Activity', '2014-02-26 18:50:06', NULL, 15, 2),
(302, 1, 'Activity', '2014-02-27 15:24:07', NULL, 15, 2),
(303, 1, 'Activity', '2014-02-27 15:24:24', NULL, 43, 4),
(304, 1, 'Activity', '2014-02-27 15:25:32', NULL, 1, 1),
(305, 1, 'Activity', '2014-02-27 15:26:25', NULL, 37, 4),
(306, 1, 'Activity', '2014-02-27 15:26:42', NULL, 45, 4),
(307, 1, 'Activity', '2014-02-27 15:27:07', NULL, 40, 4),
(308, 1, 'Activity', '2014-02-27 15:27:58', NULL, 44, 4),
(309, 1, 'Activity', '2014-02-27 15:28:08', NULL, 44, 4),
(310, 1, 'Activity', '2014-02-27 15:29:09', NULL, 58, 2),
(311, 1, 'Activity', '2014-02-27 15:30:06', NULL, 2, 1),
(312, 3, 'Activity', '2014-02-27 15:53:53', NULL, 17, 2),
(313, 3, 'Activity', '2014-02-27 18:30:34', NULL, 17, 2),
(314, 3, 'Activity', '2014-02-27 18:31:31', NULL, 58, 2),
(315, 1, 'Activity', '2014-02-28 14:12:54', NULL, 57, 4),
(316, 1, 'Activity', '2014-03-03 08:45:45', NULL, 52, 2),
(317, 1, 'Activity', '2014-03-03 08:45:58', NULL, 14, 2),
(318, 2, 'Activity', '2014-03-03 12:22:00', NULL, 52, 2),
(319, 1, 'Activity', '2014-03-04 09:16:27', NULL, 17, 2),
(320, 1, 'Activity', '2014-03-04 09:16:56', NULL, 37, 4),
(321, 1, 'Activity', '2014-03-04 09:17:07', NULL, 45, 4),
(322, 2, 'Activity', '2014-03-04 10:11:46', NULL, 2, 1),
(323, 2, 'Activity', '2014-03-04 10:12:39', NULL, 37, 4),
(324, 2, 'Activity', '2014-03-04 10:12:54', NULL, 44, 4),
(325, 2, 'Activity', '2014-03-04 14:50:45', NULL, 17, 2),
(326, 3, 'Activity', '2014-03-04 17:52:37', NULL, 58, 2),
(327, 3, 'Activity', '2014-03-04 17:53:18', NULL, 58, 2),
(328, 3, 'Activity', '2014-03-04 17:54:43', NULL, 42, 4),
(329, 3, 'Activity', '2014-03-04 17:56:05', NULL, 1, 1),
(330, 2, 'Activity', '2014-03-05 14:47:17', NULL, 52, 2),
(331, 5, 'Activity', '2014-03-07 08:44:57', NULL, 52, 2),
(332, 5, 'Activity', '2014-03-07 08:45:39', NULL, 37, 4),
(333, 5, 'Activity', '2014-03-07 08:46:03', NULL, 44, 4),
(334, 5, 'Activity', '2014-03-07 08:46:47', NULL, 44, 4),
(335, 5, 'Activity', '2014-03-07 08:47:09', NULL, 43, 4),
(336, 1, 'Activity', '2014-03-07 09:26:44', NULL, 58, 2),
(337, 1, 'Activity', '2014-03-07 09:27:30', NULL, 36, 3),
(338, 1, 'Activity', '2014-03-07 09:27:50', NULL, 36, 3),
(339, 1, 'Activity', '2014-03-07 09:28:35', NULL, 43, 4),
(340, 1, 'Activity', '2014-03-07 09:29:59', NULL, 52, 2),
(341, 2, 'Activity', '2014-03-07 09:33:37', NULL, 2, 1),
(342, 2, 'Activity', '2014-03-07 09:34:14', NULL, 37, 4),
(343, 2, 'Activity', '2014-03-07 09:34:34', NULL, 44, 4),
(344, 1, 'Activity', '2014-03-07 09:35:10', NULL, 44, 4),
(345, 2, 'Activity', '2014-03-07 09:35:23', NULL, 43, 4),
(346, 1, 'Activity', '2014-03-07 09:35:24', NULL, 37, 4),
(347, 2, 'Activity', '2014-03-07 09:35:55', NULL, 15, 2),
(348, 2, 'Activity', '2014-03-07 09:36:17', NULL, 15, 2),
(349, 1, 'Activity', '2014-03-07 09:36:36', NULL, 44, 4),
(350, 1, 'Activity', '2014-03-07 09:37:08', NULL, 37, 4),
(351, 1, 'Activity', '2014-03-07 09:37:24', NULL, 43, 4),
(352, 3, 'Activity', '2014-03-07 10:49:10', NULL, 15, 2),
(353, 3, 'Activity', '2014-03-07 10:49:37', NULL, 44, 4),
(354, 3, 'Activity', '2014-03-07 10:51:18', NULL, 15, 2),
(355, 3, 'Activity', '2014-03-07 10:51:34', NULL, 44, 4),
(356, 3, 'Activity', '2014-03-07 10:53:27', NULL, 37, 4),
(357, 3, 'Activity', '2014-03-07 10:54:27', NULL, 37, 4),
(358, 3, 'Activity', '2014-03-07 10:55:35', NULL, 43, 4),
(359, 3, 'Activity', '2014-03-07 10:55:58', NULL, 43, 4),
(360, 5, 'Activity', '2014-03-10 10:00:21', NULL, 52, 2),
(361, 2, 'Activity', '2014-03-10 10:07:10', NULL, 52, 2),
(362, 2, 'Activity', '2014-03-10 10:10:19', NULL, 62, 2),
(363, 3, 'Activity', '2014-03-10 19:05:59', NULL, 52, 2),
(364, 3, 'Activity', '2014-03-10 19:06:30', NULL, 37, 4),
(365, 3, 'Activity', '2014-03-10 19:06:43', NULL, 44, 4),
(366, 2, 'Activity', '2014-03-11 10:20:04', NULL, 52, 2),
(367, 4, 'Activity', '2014-03-11 13:25:46', NULL, 52, 2),
(368, 4, 'Activity', '2014-03-11 13:26:05', NULL, 52, 2),
(369, 4, 'Activity', '2014-03-11 13:26:14', NULL, 52, 2),
(370, 4, 'Activity', '2014-03-11 13:27:12', NULL, 52, 2),
(371, 4, 'Activity', '2014-03-11 15:06:52', NULL, 37, 4),
(372, 4, 'Activity', '2014-03-11 15:07:08', NULL, 37, 4),
(373, 4, 'Activity', '2014-03-11 15:07:19', NULL, 37, 4),
(374, 4, 'Activity', '2014-03-11 15:07:33', NULL, 37, 4),
(375, 4, 'Activity', '2014-03-11 15:07:52', NULL, 44, 4),
(376, 4, 'Activity', '2014-03-11 15:08:02', NULL, 44, 4),
(377, 4, 'Activity', '2014-03-11 15:08:10', NULL, 44, 4),
(378, 4, 'Activity', '2014-03-11 15:08:20', NULL, 44, 4),
(379, 4, 'Activity', '2014-03-11 15:08:39', NULL, 2, 1),
(380, 4, 'Activity', '2014-03-11 15:08:49', NULL, 2, 1),
(381, 4, 'Activity', '2014-03-11 15:08:59', NULL, 2, 1),
(382, 4, 'Activity', '2014-03-11 15:09:08', NULL, 2, 1),
(383, 4, 'Activity', '2014-03-11 15:09:16', NULL, 2, 1),
(384, 4, 'Activity', '2014-03-11 15:09:28', NULL, 2, 1),
(385, 4, 'Activity', '2014-03-11 15:09:41', NULL, 2, 1),
(386, 4, 'Activity', '2014-03-11 15:09:52', NULL, 2, 1),
(387, 4, 'Activity', '2014-03-11 15:10:04', NULL, 2, 1),
(388, 4, 'Activity', '2014-03-11 15:10:13', NULL, 2, 1),
(389, 4, 'Activity', '2014-03-11 15:10:26', NULL, 2, 1),
(390, 4, 'Activity', '2014-03-11 15:10:35', NULL, 2, 1),
(391, 4, 'Activity', '2014-03-11 15:10:43', NULL, 2, 1),
(392, 4, 'Activity', '2014-03-11 15:10:53', NULL, 2, 1),
(393, 4, 'Activity', '2014-03-11 15:37:56', NULL, 2, 1),
(394, 4, 'Activity', '2014-03-11 15:38:06', NULL, 2, 1),
(395, 4, 'Activity', '2014-03-11 15:38:14', NULL, 2, 1),
(396, 4, 'Activity', '2014-03-11 15:38:24', NULL, 2, 1),
(397, 4, 'Activity', '2014-03-11 15:38:38', NULL, 2, 1),
(398, 4, 'Activity', '2014-03-11 15:38:46', NULL, 2, 1),
(399, 4, 'Activity', '2014-03-11 15:38:53', NULL, 2, 1),
(400, 4, 'Activity', '2014-03-11 15:39:03', NULL, 2, 1),
(401, 1, 'Activity', '2014-03-11 17:07:52', NULL, 2, 1),
(402, 1, 'Activity', '2014-03-11 17:08:05', NULL, 2, 1),
(403, 1, 'Activity', '2014-03-11 17:08:36', NULL, 44, 4),
(404, 1, 'Activity', '2014-03-11 17:08:50', NULL, 44, 4),
(405, 1, 'Activity', '2014-03-11 17:09:04', NULL, 37, 4),
(406, 1, 'Activity', '2014-03-11 17:09:19', NULL, 37, 4),
(407, 1, 'Activity', '2014-03-11 17:10:29', NULL, 52, 2),
(408, 2, 'Activity', '2014-03-11 19:25:43', NULL, 52, 2),
(409, 5, 'Activity', '2014-03-11 19:26:25', NULL, 52, 2),
(410, 5, 'Activity', '2014-03-11 19:30:21', NULL, 2, 1),
(411, 5, 'Activity', '2014-03-11 19:30:22', NULL, 2, 1),
(412, 5, 'Activity', '2014-03-11 19:30:30', NULL, 2, 1),
(413, 5, 'Activity', '2014-03-11 19:30:31', NULL, 2, 1),
(414, 5, 'Activity', '2014-03-11 19:30:31', NULL, 2, 1),
(415, 5, 'Activity', '2014-03-11 19:30:31', NULL, 2, 1),
(416, 5, 'Activity', '2014-03-11 19:30:32', NULL, 2, 1),
(417, 5, 'Activity', '2014-03-11 19:30:32', NULL, 2, 1),
(418, 5, 'Activity', '2014-03-11 19:30:33', NULL, 2, 1),
(419, 5, 'Activity', '2014-03-11 19:30:33', NULL, 2, 1),
(420, 5, 'Activity', '2014-03-11 19:30:33', NULL, 2, 1),
(421, 4, 'Activity', '2014-03-12 09:54:45', NULL, 17, 2),
(422, 5, 'Activity', '2014-03-12 11:10:13', NULL, 9, 1),
(423, 5, 'Activity', '2014-03-12 11:10:13', NULL, 9, 1),
(424, 5, 'Activity', '2014-03-12 11:10:14', NULL, 9, 1),
(425, 5, 'Activity', '2014-03-12 11:10:14', NULL, 9, 1),
(426, 5, 'Activity', '2014-03-12 11:10:15', NULL, 9, 1),
(427, 5, 'Activity', '2014-03-12 11:10:15', NULL, 9, 1),
(428, 5, 'Activity', '2014-03-12 11:10:24', NULL, 9, 1),
(429, 5, 'Activity', '2014-03-12 11:10:24', NULL, 9, 1),
(430, 5, 'Activity', '2014-03-12 11:10:25', NULL, 9, 1),
(431, 5, 'Activity', '2014-03-12 11:10:25', NULL, 9, 1),
(432, 5, 'Activity', '2014-03-12 11:10:26', NULL, 9, 1),
(433, 5, 'Activity', '2014-03-12 11:10:26', NULL, 9, 1),
(434, 5, 'Activity', '2014-03-12 11:10:27', NULL, 9, 1),
(435, 5, 'Activity', '2014-03-12 11:10:27', NULL, 9, 1),
(436, 5, 'Activity', '2014-03-12 11:10:28', NULL, 9, 1),
(437, 5, 'Activity', '2014-03-12 11:10:31', NULL, 9, 1),
(438, 3, 'Activity', '2014-03-12 19:39:29', NULL, 17, 2),
(439, 3, 'Activity', '2014-03-12 19:40:44', NULL, 42, 4),
(440, 3, 'Activity', '2014-03-12 19:42:14', NULL, 37, 4),
(441, 3, 'Activity', '2014-03-12 19:43:06', NULL, 44, 4),
(442, 3, 'Activity', '2014-03-12 19:45:08', NULL, 2, 1),
(443, 2, 'Activity', '2014-03-13 17:26:47', NULL, 52, 2),
(444, 3, 'Activity', '2014-03-13 17:39:29', NULL, 52, 2),
(445, 3, 'Activity', '2014-03-13 17:41:57', NULL, 2, 1),
(446, 3, 'Activity', '2014-03-13 18:45:47', NULL, 42, 4),
(447, 1, 'Activity', '2014-03-14 12:35:23', NULL, 37, 4),
(448, 1, 'Activity', '2014-03-14 12:36:23', NULL, 44, 4),
(449, 1, 'Activity', '2014-03-14 12:38:45', NULL, 14, 2),
(450, 5, 'Activity', '2014-03-17 09:58:27', NULL, 61, 2),
(451, 2, 'Activity', '2014-03-17 16:42:37', NULL, 62, 2),
(452, 2, 'Activity', '2014-03-17 16:43:21', NULL, 52, 2),
(453, 1, 'Activity', '2014-03-17 18:31:10', NULL, 62, 2),
(454, 3, 'Activity', '2014-03-18 10:43:42', NULL, 15, 2),
(455, 3, 'Activity', '2014-03-18 10:44:11', NULL, 15, 2),
(456, 3, 'Activity', '2014-03-18 10:44:32', NULL, 43, 4),
(457, 3, 'Activity', '2014-03-18 10:45:00', NULL, 44, 4),
(458, 3, 'Activity', '2014-03-18 10:45:10', NULL, 37, 4),
(459, 3, 'Activity', '2014-03-18 10:45:38', NULL, 44, 4),
(460, 3, 'Activity', '2014-03-18 11:51:01', NULL, 44, 4),
(461, 3, 'Activity', '2014-03-18 11:51:13', NULL, 37, 4),
(462, 3, 'Activity', '2014-03-18 12:10:56', NULL, 17, 2),
(463, 1, 'Activity', '2014-03-18 14:38:42', NULL, 15, 2),
(464, 1, 'Activity', '2014-03-18 14:39:00', NULL, 46, 2),
(465, 1, 'Activity', '2014-03-18 14:42:09', NULL, 40, 4),
(466, 1, 'Activity', '2014-03-18 14:42:47', NULL, 37, 4),
(467, 1, 'Activity', '2014-03-18 14:43:00', NULL, 44, 4),
(468, 1, 'Activity', '2014-03-18 14:43:24', NULL, 14, 2),
(469, 1, 'Activity', '2014-03-18 14:44:07', NULL, 43, 4),
(470, 5, 'Activity', '2014-03-18 19:56:14', NULL, 37, 4),
(471, 5, 'Activity', '2014-03-18 19:56:39', NULL, 44, 4),
(472, 5, 'Activity', '2014-03-18 19:57:03', NULL, 43, 4),
(473, 5, 'Activity', '2014-03-18 19:57:16', NULL, 52, 2),
(474, 5, 'Activity', '2014-03-18 19:58:03', NULL, 62, 2),
(475, 1, 'Activity', '2014-03-19 09:54:25', NULL, 8, 1),
(476, 1, 'Activity', '2014-03-19 09:54:37', NULL, 8, 1),
(477, 1, 'Activity', '2014-03-19 09:54:54', NULL, 8, 1),
(478, 1, 'Activity', '2014-03-19 09:55:13', NULL, 8, 1),
(479, 1, 'Activity', '2014-03-19 09:55:24', NULL, 8, 1),
(480, 4, 'Activity', '2014-03-19 11:36:55', NULL, 52, 2),
(481, 3, 'Activity', '2014-03-19 12:48:23', NULL, 42, 4),
(482, 5, 'Activity', '2014-03-19 20:13:29', NULL, 37, 4),
(483, 5, 'Activity', '2014-03-19 20:13:52', NULL, 45, 4),
(484, 5, 'Activity', '2014-03-19 20:14:34', NULL, 42, 4),
(485, 5, 'Activity', '2014-03-19 20:15:20', NULL, 23, 3),
(486, 5, 'Activity', '2014-03-19 20:15:48', NULL, 23, 3),
(487, 5, 'Activity', '2014-03-19 20:16:27', NULL, 23, 3),
(488, 5, 'Activity', '2014-03-19 20:17:09', NULL, 37, 4),
(489, 5, 'Activity', '2014-03-19 20:17:28', NULL, 40, 4),
(490, 5, 'Activity', '2014-03-19 20:17:54', NULL, 45, 4),
(491, 5, 'Activity', '2014-03-19 20:18:31', NULL, 23, 3),
(492, 2, 'Activity', '2014-03-19 22:11:51', NULL, 2, 1),
(493, 2, 'Activity', '2014-03-19 22:18:42', NULL, 42, 4),
(494, 2, 'Activity', '2014-03-19 22:38:51', NULL, 42, 4),
(495, 5, 'Activity', '2014-03-20 11:48:35', NULL, 23, 3),
(496, 4, 'Activity', '2014-03-20 15:28:50', NULL, 2, 1),
(497, 4, 'Activity', '2014-03-20 15:30:24', NULL, 2, 1),
(498, 4, 'Activity', '2014-03-20 15:31:05', NULL, 44, 4),
(499, 4, 'Activity', '2014-03-20 15:32:39', NULL, 40, 4),
(500, 1, 'Activity', '2014-03-20 17:03:32', NULL, 14, 2),
(501, 5, 'Activity', '2014-03-20 19:28:03', NULL, 37, 4),
(502, 5, 'Activity', '2014-03-20 19:28:31', NULL, 45, 4),
(503, 5, 'Activity', '2014-03-20 19:29:12', NULL, 42, 4),
(504, 3, 'Activity', '2014-03-21 10:09:16', NULL, 42, 4),
(505, 3, 'Activity', '2014-03-21 10:09:37', NULL, 42, 4),
(506, 3, 'Activity', '2014-03-21 10:10:08', NULL, 42, 4),
(507, 3, 'Activity', '2014-03-21 10:10:28', NULL, 42, 4),
(508, 3, 'Activity', '2014-03-21 10:10:42', NULL, 42, 4),
(509, 3, 'Activity', '2014-03-21 10:10:58', NULL, 42, 4),
(510, 3, 'Activity', '2014-03-21 10:11:23', NULL, 42, 4),
(511, 3, 'Activity', '2014-03-21 10:11:45', NULL, 42, 4),
(512, 3, 'Activity', '2014-03-21 10:12:05', NULL, 42, 4),
(513, 3, 'Activity', '2014-03-21 10:12:32', NULL, 42, 4),
(514, 3, 'Activity', '2014-03-21 10:12:56', NULL, 42, 4),
(515, 3, 'Activity', '2014-03-21 10:13:20', NULL, 42, 4),
(516, 5, 'Activity', '2014-03-21 10:28:10', NULL, 23, 3),
(517, 5, 'Activity', '2014-03-21 10:50:46', NULL, 37, 4),
(518, 5, 'Activity', '2014-03-21 10:51:39', NULL, 42, 4),
(519, 5, 'Activity', '2014-03-21 10:51:58', NULL, 40, 4),
(520, 5, 'Activity', '2014-03-21 10:52:20', NULL, 43, 4),
(521, 5, 'Activity', '2014-03-21 11:05:32', NULL, 23, 3),
(522, 5, 'Activity', '2014-03-21 11:07:44', NULL, 23, 3),
(523, 5, 'Activity', '2014-03-21 11:09:15', NULL, 23, 3),
(524, 1, 'Activity', '2014-03-21 18:33:21', NULL, 61, 2),
(525, 3, 'Activity', '2014-03-25 11:26:45', NULL, 58, 2),
(526, 3, 'Activity', '2014-03-25 11:27:56', NULL, 42, 4),
(527, 3, 'Activity', '2014-03-25 11:30:28', NULL, 23, 3),
(528, 5, 'Activity', '2014-03-25 11:45:31', NULL, 37, 4),
(529, 5, 'Activity', '2014-03-25 11:46:03', NULL, 44, 4),
(530, 5, 'Activity', '2014-03-25 11:46:26', NULL, 43, 4),
(531, 5, 'Activity', '2014-03-25 11:48:59', NULL, 37, 4),
(532, 5, 'Activity', '2014-03-25 11:49:59', NULL, 42, 4),
(533, 5, 'Activity', '2014-03-25 11:50:10', NULL, 40, 4),
(534, 5, 'Activity', '2014-03-25 11:52:45', NULL, 32, 3),
(535, 5, 'Activity', '2014-03-25 11:53:08', NULL, 26, 3),
(536, 5, 'Activity', '2014-03-25 15:12:46', NULL, 40, 4),
(537, 1, 'Activity', '2014-03-26 09:47:01', NULL, 40, 4),
(538, 1, 'Activity', '2014-03-26 09:47:13', NULL, 45, 4),
(539, 1, 'Activity', '2014-03-26 09:47:28', NULL, 37, 4),
(540, 5, 'Activity', '2014-03-26 17:33:00', NULL, 7, 1),
(541, 5, 'Activity', '2014-03-26 17:54:48', NULL, 42, 4),
(542, 5, 'Activity', '2014-03-26 18:04:16', NULL, 42, 4),
(543, 5, 'Activity', '2014-03-26 18:55:11', NULL, 37, 4),
(544, 5, 'Activity', '2014-03-26 18:55:27', NULL, 45, 4),
(545, 5, 'Activity', '2014-03-26 18:55:50', NULL, 40, 4),
(546, 5, 'Activity', '2014-03-26 18:56:21', NULL, 7, 1),
(547, 5, 'Activity', '2014-03-27 11:57:49', NULL, 23, 3),
(548, 5, 'Activity', '2014-03-27 11:58:13', NULL, 36, 3),
(549, 4, 'Activity', '2014-03-27 15:13:19', NULL, 2, 1),
(550, 4, 'Activity', '2014-03-27 15:13:35', NULL, 36, 3),
(551, 1, 'Activity', '2014-03-27 15:38:43', NULL, 56, 3),
(552, 1, 'Activity', '2014-03-27 15:39:32', NULL, 14, 2),
(553, 3, 'Activity', '2014-03-27 18:14:29', NULL, 42, 4),
(554, 3, 'Activity', '2014-03-27 20:02:38', NULL, 42, 4),
(555, 3, 'Activity', '2014-03-28 18:02:34', NULL, 52, 2),
(556, 1, 'Activity', '2014-03-31 09:28:02', NULL, 40, 4),
(557, 1, 'Activity', '2014-03-31 09:28:17', NULL, 45, 4),
(558, 1, 'Activity', '2014-03-31 09:28:36', NULL, 37, 4),
(559, 1, 'Activity', '2014-03-31 09:29:17', NULL, 43, 4),
(560, 1, 'Activity', '2014-03-31 09:30:53', NULL, 42, 4),
(561, 1, 'Activity', '2014-03-31 09:36:04', NULL, 15, 2),
(562, 4, 'Activity', '2014-03-31 09:51:25', NULL, 52, 2),
(563, 5, 'Activity', '2014-03-31 10:17:10', NULL, 52, 2),
(564, 1, 'Activity', '2014-03-31 16:04:57', NULL, 52, 2),
(565, 3, 'Activity', '2014-03-31 17:43:24', NULL, 52, 2),
(566, 3, 'Activity', '2014-03-31 17:43:31', NULL, 52, 2),
(567, 1, 'Activity', '2014-03-31 17:43:32', NULL, 52, 2),
(568, 3, 'Activity', '2014-03-31 17:43:38', NULL, 52, 2),
(569, 1, 'Activity', '2014-03-31 17:43:41', NULL, 52, 2),
(570, 5, 'Activity', '2014-03-31 18:53:49', NULL, 52, 2),
(571, 5, 'Activity', '2014-03-31 18:54:21', NULL, 37, 4),
(572, 5, 'Activity', '2014-03-31 18:55:26', NULL, 42, 4),
(573, 5, 'Activity', '2014-03-31 19:02:25', NULL, 23, 3),
(574, 5, 'Activity', '2014-03-31 19:05:04', NULL, 40, 4),
(575, 5, 'Activity', '2014-03-31 19:16:09', NULL, 23, 3),
(576, 5, 'Activity', '2014-03-31 19:53:16', NULL, 23, 3),
(577, 2, 'Activity', '2014-04-01 09:57:15', NULL, 52, 2),
(578, 2, 'Activity', '2014-04-01 09:57:40', NULL, 15, 2),
(579, 4, 'Activity', '2014-04-01 11:33:22', NULL, 4, 1),
(580, 4, 'Activity', '2014-04-01 11:33:57', NULL, 2, 1),
(581, 4, 'Activity', '2014-04-01 11:34:12', NULL, 37, 4),
(582, 4, 'Activity', '2014-04-01 11:34:45', NULL, 44, 4),
(583, 4, 'Activity', '2014-04-01 11:35:22', NULL, 37, 4),
(584, 4, 'Activity', '2014-04-01 11:35:42', NULL, 52, 2),
(585, 4, 'Activity', '2014-04-01 11:35:49', NULL, 52, 2),
(586, 4, 'Activity', '2014-04-01 11:35:56', NULL, 52, 2),
(587, 1, 'Activity', '2014-04-01 14:19:19', NULL, 2, 1),
(588, 1, 'Activity', '2014-04-01 14:19:50', NULL, 15, 2),
(589, 1, 'Activity', '2014-04-01 14:20:27', NULL, 16, 2),
(590, 1, 'Activity', '2014-04-01 14:20:59', NULL, 16, 2),
(591, 1, 'Activity', '2014-04-01 14:22:36', NULL, 37, 4),
(592, 1, 'Activity', '2014-04-01 14:23:00', NULL, 44, 4),
(593, 1, 'Activity', '2014-04-01 14:23:19', NULL, 43, 4),
(594, 1, 'Activity', '2014-04-01 14:23:58', NULL, 37, 4),
(595, 1, 'Activity', '2014-04-01 14:24:07', NULL, 43, 4),
(596, 1, 'Activity', '2014-04-01 14:24:16', NULL, 44, 4),
(597, 1, 'Activity', '2014-04-01 14:24:37', NULL, 2, 1),
(598, 4, 'Activity', '2014-04-01 15:26:20', NULL, 2, 1),
(599, 4, 'Activity', '2014-04-01 15:26:40', NULL, 37, 4),
(600, 4, 'Activity', '2014-04-01 15:27:19', NULL, 45, 4),
(601, 3, 'Activity', '2014-04-01 19:13:50', NULL, 58, 2),
(602, 3, 'Activity', '2014-04-01 19:14:47', NULL, 58, 2),
(603, 3, 'Activity', '2014-04-01 19:16:48', NULL, 39, 4),
(604, 3, 'Activity', '2014-04-01 19:18:21', NULL, 45, 4),
(605, 3, 'Activity', '2014-04-01 19:21:25', NULL, 58, 2),
(606, 3, 'Activity', '2014-04-01 19:22:05', NULL, 37, 4),
(607, 3, 'Activity', '2014-04-01 19:22:14', NULL, 45, 4),
(608, 3, 'Activity', '2014-04-01 19:22:49', NULL, 37, 4),
(609, 3, 'Activity', '2014-04-01 19:22:56', NULL, 45, 4),
(610, 3, 'Activity', '2014-04-01 19:47:49', NULL, 37, 4),
(611, 3, 'Activity', '2014-04-01 19:47:56', NULL, 45, 4),
(612, 3, 'Activity', '2014-04-01 19:48:44', NULL, 2, 1),
(613, 4, 'Activity', '2014-04-02 10:43:46', NULL, 2, 1),
(614, 4, 'Activity', '2014-04-02 10:44:00', NULL, 2, 1),
(615, 4, 'Activity', '2014-04-02 10:45:01', NULL, 44, 4),
(616, 4, 'Activity', '2014-04-02 10:45:13', NULL, 45, 4),
(617, 4, 'Activity', '2014-04-02 12:55:43', NULL, 2, 1),
(618, 4, 'Activity', '2014-04-02 12:56:10', NULL, 44, 4),
(619, 4, 'Activity', '2014-04-02 12:56:56', NULL, 37, 4),
(620, 2, 'Activity', '2014-04-02 19:44:25', NULL, 52, 2),
(621, 2, 'Activity', '2014-04-02 19:44:54', NULL, 52, 2),
(622, 2, 'Activity', '2014-04-02 19:45:36', NULL, 52, 2),
(623, 2, 'Activity', '2014-04-02 19:47:58', NULL, 15, 2),
(624, 1, 'Activity', '2014-04-02 19:49:29', NULL, 2, 1),
(625, 1, 'Activity', '2014-04-02 19:49:57', NULL, 1, 1),
(626, 1, 'Activity', '2014-04-02 19:50:36', NULL, 40, 4),
(627, 1, 'Activity', '2014-04-02 19:50:58', NULL, 37, 4),
(628, 1, 'Activity', '2014-04-02 19:51:09', NULL, 45, 4),
(629, 1, 'Activity', '2014-04-02 19:51:19', NULL, 43, 4),
(630, 1, 'Activity', '2014-04-02 19:51:57', NULL, 42, 4),
(631, 1, 'Activity', '2014-04-02 19:53:17', NULL, 23, 3),
(632, 1, 'Activity', '2014-04-02 19:54:24', NULL, 15, 2),
(633, 1, 'Activity', '2014-04-02 19:56:23', NULL, 62, 2),
(634, 2, 'Activity', '2014-04-02 20:01:16', NULL, 2, 1),
(635, 1, 'Activity', '2014-04-02 20:01:45', NULL, 2, 1),
(636, 1, 'Activity', '2014-04-02 20:02:47', NULL, 10, 1),
(637, 2, 'Activity', '2014-04-02 20:02:53', NULL, 44, 4),
(638, 2, 'Activity', '2014-04-02 20:03:01', NULL, 37, 4),
(639, 2, 'Activity', '2014-04-02 20:03:38', NULL, 43, 4),
(640, 2, 'Activity', '2014-04-02 20:08:32', NULL, 62, 2),
(641, 2, 'Activity', '2014-04-02 20:27:17', NULL, 1, 1),
(642, 2, 'Activity', '2014-04-02 20:28:05', NULL, 2, 1),
(643, 2, 'Activity', '2014-04-02 20:28:18', NULL, 40, 4),
(644, 2, 'Activity', '2014-04-02 20:28:34', NULL, 37, 4),
(645, 2, 'Activity', '2014-04-02 20:29:31', NULL, 45, 4),
(646, 2, 'Activity', '2014-04-02 20:31:31', NULL, 43, 4),
(647, 2, 'Activity', '2014-04-02 20:33:14', NULL, 43, 4),
(648, 2, 'Activity', '2014-04-02 20:35:31', NULL, 37, 4),
(649, 2, 'Activity', '2014-04-02 20:37:54', NULL, 10, 1),
(650, 2, 'Activity', '2014-04-02 20:38:48', NULL, 44, 4),
(651, 2, 'Activity', '2014-04-02 20:40:28', NULL, 43, 4),
(652, 2, 'Activity', '2014-04-02 20:47:06', NULL, 43, 4),
(653, 2, 'Activity', '2014-04-03 10:15:17', NULL, 14, 2),
(654, 1, 'Activity', '2014-04-03 10:25:48', NULL, 52, 2),
(655, 3, 'Activity', '2014-04-03 12:46:40', NULL, 52, 2),
(656, 3, 'Activity', '2014-04-03 12:47:07', NULL, 58, 2),
(657, 3, 'Activity', '2014-04-03 12:47:54', NULL, 42, 4),
(658, 3, 'Activity', '2014-04-03 12:48:20', NULL, 2, 1),
(659, 3, 'Activity', '2014-04-03 12:48:37', NULL, 45, 4),
(660, 3, 'Activity', '2014-04-03 12:50:01', NULL, 62, 2),
(661, 3, 'Activity', '2014-04-03 12:51:13', NULL, 37, 4),
(662, 3, 'Activity', '2014-04-03 15:25:02', NULL, 52, 2),
(663, 4, 'Activity', '2014-04-03 16:05:14', NULL, 42, 4),
(664, 5, 'Activity', '2014-04-03 17:41:50', NULL, 23, 3),
(665, 5, 'Activity', '2014-04-03 17:42:09', NULL, 36, 3),
(666, 5, 'Activity', '2014-04-03 17:42:52', NULL, 42, 4),
(667, 3, 'Activity', '2014-04-03 19:08:37', NULL, 58, 2),
(668, 3, 'Activity', '2014-04-03 19:08:54', NULL, 42, 4),
(669, 2, 'Activity', '2014-04-03 20:07:41', NULL, 23, 3),
(670, 2, 'Activity', '2014-04-03 20:08:46', NULL, 36, 3),
(671, 2, 'Activity', '2014-04-03 20:09:17', NULL, 42, 4),
(672, 2, 'Activity', '2014-04-03 20:09:30', NULL, 52, 2),
(673, 5, 'Activity', '2014-04-04 10:04:16', NULL, 52, 2),
(674, 5, 'Activity', '2014-04-04 10:08:52', NULL, 15, 2),
(675, 3, 'Activity', '2014-04-04 19:07:13', NULL, 2, 1),
(676, 3, 'Activity', '2014-04-04 19:07:25', NULL, 37, 4),
(677, 3, 'Activity', '2014-04-04 19:07:36', NULL, 45, 4),
(678, 3, 'Activity', '2014-04-04 19:08:13', NULL, 58, 2),
(679, 5, 'Activity', '2014-04-07 13:23:31', NULL, 23, 3),
(680, 5, 'Activity', '2014-04-07 13:23:43', NULL, 36, 3),
(681, 2, 'Activity', '2014-04-07 13:24:45', NULL, 23, 3),
(682, 2, 'Activity', '2014-04-07 13:25:03', NULL, 36, 3),
(683, 2, 'Activity', '2014-04-07 17:29:20', NULL, 14, 2),
(684, 4, 'Activity', '2014-04-08 12:39:17', NULL, 38, 4),
(685, 4, 'Activity', '2014-04-08 12:40:02', NULL, 44, 4),
(686, 1, 'Activity', '2014-04-08 13:19:06', NULL, 2, 1),
(687, 1, 'Activity', '2014-04-08 13:19:25', NULL, 37, 4),
(688, 1, 'Activity', '2014-04-08 13:20:32', NULL, 2, 1),
(689, 1, 'Activity', '2014-04-08 13:21:01', NULL, 2, 1),
(690, 1, 'Activity', '2014-04-08 13:21:24', NULL, 40, 4),
(691, 1, 'Activity', '2014-04-08 13:21:49', NULL, 37, 4),
(692, 1, 'Activity', '2014-04-08 13:22:00', NULL, 44, 4),
(693, 1, 'Activity', '2014-04-08 13:22:27', NULL, 2, 1),
(694, 1, 'Activity', '2014-04-08 13:22:46', NULL, 37, 4),
(695, 1, 'Activity', '2014-04-08 13:23:02', NULL, 42, 4),
(696, 1, 'Activity', '2014-04-08 13:23:19', NULL, 45, 4),
(697, 4, 'Activity', '2014-04-09 10:02:34', NULL, 42, 4),
(698, 3, 'Activity', '2014-04-09 10:49:17', NULL, 58, 2),
(699, 3, 'Activity', '2014-04-09 10:49:26', NULL, 45, 4),
(700, 3, 'Activity', '2014-04-09 10:49:33', NULL, 37, 4),
(701, 3, 'Activity', '2014-04-09 10:49:58', NULL, 2, 1),
(702, 3, 'Activity', '2014-04-09 10:50:19', NULL, 5, 1),
(703, 1, 'Activity', '2014-04-09 20:22:09', NULL, 40, 4),
(704, 1, 'Activity', '2014-04-09 20:28:34', NULL, 4, 1),
(705, 1, 'Activity', '2014-04-09 20:29:03', NULL, 44, 4),
(706, 1, 'Activity', '2014-04-09 20:29:12', NULL, 37, 4),
(707, 1, 'Activity', '2014-04-09 20:30:25', NULL, 2, 1),
(708, 1, 'Activity', '2014-04-09 20:30:26', NULL, 2, 1),
(709, 1, 'Activity', '2014-04-09 20:32:23', NULL, 45, 4),
(710, 1, 'Activity', '2014-04-09 20:32:36', NULL, 37, 4),
(711, 1, 'Activity', '2014-04-09 20:33:06', NULL, 42, 4),
(712, 1, 'Activity', '2014-04-09 20:33:27', NULL, 38, 4),
(713, 1, 'Activity', '2014-04-09 20:34:05', NULL, 45, 4),
(714, 1, 'Activity', '2014-04-09 20:34:14', NULL, 37, 4),
(715, 1, 'Activity', '2014-04-10 10:12:25', NULL, 1, 1),
(716, 1, 'Activity', '2014-04-10 10:12:43', NULL, 40, 4),
(717, 1, 'Activity', '2014-04-10 10:12:57', NULL, 44, 4),
(718, 1, 'Activity', '2014-04-10 10:13:10', NULL, 37, 4),
(719, 1, 'Activity', '2014-04-10 10:13:31', NULL, 43, 4),
(720, 5, 'Activity', '2014-04-10 12:50:53', NULL, 23, 3),
(721, 5, 'Activity', '2014-04-10 12:51:42', NULL, 37, 4),
(722, 5, 'Activity', '2014-04-10 12:52:11', NULL, 42, 4),
(723, 5, 'Activity', '2014-04-10 12:52:40', NULL, 40, 4),
(724, 5, 'Activity', '2014-04-10 12:54:43', NULL, 56, 3),
(725, 5, 'Activity', '2014-04-10 13:19:08', NULL, 56, 3),
(726, 3, 'Activity', '2014-04-10 19:28:18', NULL, 15, 2),
(727, 3, 'Activity', '2014-04-10 19:29:41', NULL, 58, 2),
(728, 3, 'Activity', '2014-04-10 19:30:01', NULL, 58, 2),
(729, 3, 'Activity', '2014-04-10 19:30:12', NULL, 58, 2),
(730, 3, 'Activity', '2014-04-10 19:33:22', NULL, 58, 2),
(731, 4, 'Activity', '2014-04-10 19:57:08', NULL, 15, 2),
(732, 4, 'Activity', '2014-04-10 19:57:13', NULL, 15, 2),
(733, 1, 'Activity', '2014-04-10 20:09:13', NULL, 2, 1),
(734, 1, 'Activity', '2014-04-10 20:09:45', NULL, 15, 2),
(735, 1, 'Activity', '2014-04-10 20:10:03', NULL, 40, 4),
(736, 1, 'Activity', '2014-04-10 20:10:18', NULL, 43, 4),
(737, 1, 'Activity', '2014-04-10 20:10:27', NULL, 37, 4),
(738, 1, 'Activity', '2014-04-10 20:10:33', NULL, 44, 4),
(739, 1, 'Activity', '2014-04-10 20:10:51', NULL, 2, 1),
(740, 1, 'Activity', '2014-04-10 20:11:47', NULL, 58, 2),
(741, 1, 'Activity', '2014-04-10 20:12:07', NULL, 58, 2),
(742, 1, 'Activity', '2014-04-10 20:12:23', NULL, 58, 2),
(743, 1, 'Activity', '2014-04-10 20:12:43', NULL, 58, 2),
(744, 4, 'Activity', '2014-04-10 21:32:00', NULL, 16, 2),
(745, 1, 'Activity', '2014-04-11 10:40:09', NULL, 3, 1),
(746, 1, 'Activity', '2014-04-11 10:40:23', NULL, 3, 1),
(747, 1, 'Activity', '2014-04-11 10:40:32', NULL, 3, 1),
(748, 1, 'Activity', '2014-04-11 10:40:58', NULL, 5, 1),
(749, 1, 'Activity', '2014-04-11 17:59:13', NULL, 61, 2),
(750, 1, 'Activity', '2014-04-11 17:59:25', NULL, 61, 2),
(751, 1, 'Activity', '2014-04-11 17:59:43', NULL, 61, 2),
(752, 1, 'Activity', '2014-04-11 18:00:02', NULL, 61, 2),
(753, 1, 'Activity', '2014-04-11 18:00:28', NULL, 61, 2),
(754, 5, 'Activity', '2014-04-11 18:03:05', NULL, 61, 2),
(755, 5, 'Activity', '2014-04-14 12:03:24', NULL, 37, 4),
(756, 5, 'Activity', '2014-04-14 12:22:14', NULL, 38, 4),
(757, 5, 'Activity', '2014-04-14 12:22:50', NULL, 42, 4),
(758, 5, 'Activity', '2014-04-14 12:24:15', NULL, 40, 4),
(759, 5, 'Activity', '2014-04-14 12:35:13', NULL, 58, 2),
(760, 4, 'Activity', '2014-04-14 15:32:15', NULL, 61, 2),
(761, 4, 'Activity', '2014-04-14 15:32:51', NULL, 61, 2),
(762, 4, 'Activity', '2014-04-14 15:33:10', NULL, 61, 2),
(763, 5, 'Activity', '2014-04-14 16:27:12', NULL, 56, 3),
(764, 5, 'Activity', '2014-04-14 16:43:23', NULL, 45, 4),
(765, 3, 'Activity', '2014-04-14 17:42:06', NULL, 58, 2),
(766, 4, 'Activity', '2014-04-14 17:43:14', NULL, 37, 4),
(767, 4, 'Activity', '2014-04-14 17:43:25', NULL, 45, 4),
(768, 3, 'Activity', '2014-04-14 19:25:13', NULL, 61, 2),
(769, 5, 'Activity', '2014-04-14 21:03:04', NULL, 61, 2),
(770, 1, 'Activity', '2014-04-15 13:22:20', NULL, 63, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `title`
--

CREATE TABLE IF NOT EXISTS `title` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `min_level` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `title`
--

INSERT INTO `title` (`id`, `title`, `min_level`) VALUES
(1, 'Unfleshed', 0),
(2, 'Novice', 5),
(3, 'Apprentice', 10),
(4, 'Sorcerer', 20),
(5, 'Wizard', 30),
(6, 'Magician', 40),
(7, 'Archmage', 50),
(8, 'Maester', 60),
(9, 'Archmaester', 70);

-- --------------------------------------------------------

--
-- Estrutura da tabela `xp_log`
--

CREATE TABLE IF NOT EXISTS `xp_log` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `xp` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `activity_id_reviewed` int(10) unsigned DEFAULT NULL,
  `event_id_joined` int(10) unsigned DEFAULT NULL,
  `event_id_completed` int(10) unsigned DEFAULT NULL,
  `event_task_id` int(10) unsigned DEFAULT NULL,
  `event_task_id_reviewed` int(10) unsigned DEFAULT NULL,
  `log_id` int(10) unsigned DEFAULT NULL,
  `log_id_reviewed` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1329 ;

--
-- Extraindo dados da tabela `xp_log`
--

INSERT INTO `xp_log` (`id`, `player_id`, `xp`, `created`, `activity_id`, `activity_id_reviewed`, `event_id_joined`, `event_id_completed`, `event_task_id`, `event_task_id_reviewed`, `log_id`, `log_id_reviewed`) VALUES
(1, 1, 1273, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 390, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 851, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 770, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 1167, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, 0, '2014-03-30 20:20:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 3, '2014-03-30 20:32:41', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 6, 0, '2014-03-30 20:32:41', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, 10, '2014-03-31 14:56:42', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 6, 2, '2014-03-31 14:56:42', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, 5, '2014-03-31 14:56:47', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 6, 1, '2014-03-31 14:56:47', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, 10, '2014-03-31 14:56:50', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 6, 2, '2014-03-31 14:56:50', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 10, '2014-03-31 14:56:51', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 6, 2, '2014-03-31 14:56:51', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 1, 5, '2014-03-31 14:56:55', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 6, 1, '2014-03-31 14:56:55', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 1, 20, '2014-03-31 14:57:10', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 6, 4, '2014-03-31 14:57:10', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 4, 3, '2014-03-31 14:57:12', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 6, 0, '2014-03-31 14:57:12', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 5, 3, '2014-03-31 14:57:14', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 6, 0, '2014-03-31 14:57:14', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1, 3, '2014-04-01 10:52:18', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 6, 0, '2014-04-01 10:52:18', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 3, 3, '2014-04-01 10:52:20', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 6, 0, '2014-04-01 10:52:20', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3, 3, '2014-04-01 10:52:22', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 6, 0, '2014-04-01 10:52:22', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1, 3, '2014-04-01 10:52:24', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 6, 0, '2014-04-01 10:52:24', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 3, 3, '2014-04-01 10:52:27', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 6, 0, '2014-04-01 10:52:27', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 1, 3, '2014-04-01 10:52:31', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 6, 0, '2014-04-01 10:52:31', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 5, 3, '2014-04-01 10:52:32', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 6, 0, '2014-04-01 10:52:32', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 5, 10, '2014-04-01 10:52:34', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 6, 2, '2014-04-01 10:52:34', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 5, 5, '2014-04-01 10:52:36', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 6, 1, '2014-04-01 10:52:36', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 5, 10, '2014-04-01 10:52:40', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 6, 2, '2014-04-01 10:52:40', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 5, 10, '2014-04-01 10:52:41', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 6, 2, '2014-04-01 10:52:41', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 5, 10, '2014-04-01 10:52:43', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 6, 2, '2014-04-01 10:52:43', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 5, 10, '2014-04-01 10:52:46', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 6, 2, '2014-04-01 10:52:46', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 2, 3, '2014-04-01 10:52:51', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 6, 0, '2014-04-01 10:52:51', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 2, 20, '2014-04-01 10:52:53', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 6, 4, '2014-04-01 10:52:53', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 4, 0, '2014-04-01 16:48:36', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 6, 0, '2014-04-01 16:48:36', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 4, 5, '2014-04-01 16:48:42', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 6, 1, '2014-04-01 16:48:42', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 4, 5, '2014-04-01 16:48:45', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 6, 1, '2014-04-01 16:48:45', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 4, 10, '2014-04-01 16:48:50', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 6, 2, '2014-04-01 16:48:50', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 4, 3, '2014-04-01 16:48:53', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 6, 0, '2014-04-01 16:48:53', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 4, 3, '2014-04-01 16:48:55', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 6, 0, '2014-04-01 16:48:55', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 4, 3, '2014-04-01 16:48:57', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 6, 0, '2014-04-01 16:48:57', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 1, 5, '2014-04-01 16:49:04', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 6, 1, '2014-04-01 16:49:04', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 1, 20, '2014-04-01 16:49:07', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 6, 4, '2014-04-01 16:49:07', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 1, 10, '2014-04-01 16:49:11', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 6, 2, '2014-04-01 16:49:11', NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 1, 10, '2014-04-01 16:49:13', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 6, 2, '2014-04-01 16:49:13', NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 1, 10, '2014-04-01 16:49:18', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 6, 2, '2014-04-01 16:49:18', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 1, 5, '2014-04-01 16:49:19', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 6, 1, '2014-04-01 16:49:19', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 1, 10, '2014-04-01 16:49:21', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 6, 2, '2014-04-01 16:49:21', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 1, 10, '2014-04-01 16:49:26', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 6, 2, '2014-04-01 16:49:26', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 1, 10, '2014-04-01 16:49:29', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 6, 2, '2014-04-01 16:49:29', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 1, 5, '2014-04-01 16:49:31', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 6, 1, '2014-04-01 16:49:31', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 1, 5, '2014-04-01 16:49:33', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 6, 1, '2014-04-01 16:49:33', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 4, 5, '2014-04-01 16:49:35', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 6, 1, '2014-04-01 16:49:35', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 4, 10, '2014-04-01 16:49:37', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 6, 2, '2014-04-01 16:49:37', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 4, 5, '2014-04-01 16:49:39', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 6, 1, '2014-04-01 16:49:39', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 3, 10, '2014-04-02 10:54:54', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 6, 2, '2014-04-02 10:54:54', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 3, 10, '2014-04-02 10:54:57', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 6, 2, '2014-04-02 10:54:57', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 3, 25, '2014-04-02 10:55:00', 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 6, 5, '2014-04-02 10:55:00', NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 3, 5, '2014-04-02 10:55:17', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 6, 1, '2014-04-02 10:55:17', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 3, 10, '2014-04-02 10:55:22', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 6, 2, '2014-04-02 10:55:22', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 3, 10, '2014-04-02 10:55:24', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 6, 2, '2014-04-02 10:55:24', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 3, 5, '2014-04-02 10:55:29', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 6, 1, '2014-04-02 10:55:29', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 3, 10, '2014-04-02 10:55:31', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 6, 2, '2014-04-02 10:55:31', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 3, 5, '2014-04-02 10:55:38', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 6, 1, '2014-04-02 10:55:38', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 3, 10, '2014-04-02 10:55:49', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 6, 2, '2014-04-02 10:55:49', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 3, 5, '2014-04-02 10:55:51', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 6, 1, '2014-04-02 10:55:51', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 3, 5, '2014-04-02 10:55:54', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 6, 1, '2014-04-02 10:55:54', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 4, 5, '2014-04-02 10:56:00', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 6, 1, '2014-04-02 10:56:00', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 4, 5, '2014-04-02 10:56:02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 6, 1, '2014-04-02 10:56:02', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 4, 5, '2014-04-02 10:56:05', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 6, 1, '2014-04-02 10:56:05', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 4, 5, '2014-04-03 12:11:10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 6, 1, '2014-04-03 12:11:10', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 4, 5, '2014-04-03 12:11:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 6, 1, '2014-04-03 12:11:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 4, 10, '2014-04-03 12:11:19', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 6, 2, '2014-04-03 12:11:19', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 2, 3, '2014-04-03 12:11:26', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 6, 0, '2014-04-03 12:11:26', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 2, 3, '2014-04-03 12:11:30', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 6, 0, '2014-04-03 12:11:30', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 2, 20, '2014-04-03 12:11:37', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 6, 4, '2014-04-03 12:11:37', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 1, 5, '2014-04-03 12:12:03', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 6, 1, '2014-04-03 12:12:03', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 1, 0, '2014-04-03 12:12:12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 6, 0, '2014-04-03 12:12:12', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 1, 10, '2014-04-03 12:12:22', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 6, 2, '2014-04-03 12:12:22', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 1, 10, '2014-04-03 12:12:36', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 6, 2, '2014-04-03 12:12:36', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 1, 5, '2014-04-03 12:12:38', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 6, 1, '2014-04-03 12:12:38', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 1, 10, '2014-04-03 12:12:42', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 6, 2, '2014-04-03 12:12:42', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 1, 5, '2014-04-03 12:13:01', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 6, 1, '2014-04-03 12:13:01', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 1, 10, '2014-04-03 12:13:14', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 6, 2, '2014-04-03 12:13:14', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 1, 20, '2014-04-03 12:13:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 6, 4, '2014-04-03 12:13:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 1, 15, '2014-04-03 12:13:40', 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 6, 3, '2014-04-03 12:13:40', NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 2, 5, '2014-04-03 12:13:47', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 6, 1, '2014-04-03 12:13:47', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 1, 5, '2014-04-03 12:13:51', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 6, 1, '2014-04-03 12:13:51', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 1, 0, '2014-04-03 12:13:54', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 6, 0, '2014-04-03 12:13:54', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 2, 15, '2014-04-03 12:14:00', 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 6, 3, '2014-04-03 12:14:00', NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 2, 0, '2014-04-03 12:14:18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 6, 0, '2014-04-03 12:14:18', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 2, 5, '2014-04-03 12:14:26', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 6, 1, '2014-04-03 12:14:26', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 2, 10, '2014-04-03 12:14:53', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 6, 2, '2014-04-03 12:14:53', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 2, 10, '2014-04-03 12:14:55', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 6, 2, '2014-04-03 12:14:55', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 2, 5, '2014-04-03 12:14:57', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 6, 1, '2014-04-03 12:14:57', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 2, 10, '2014-04-03 12:15:01', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 6, 2, '2014-04-03 12:15:01', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 2, 10, '2014-04-03 12:15:04', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 6, 2, '2014-04-03 12:15:04', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(181, 2, 0, '2014-04-03 12:15:06', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 6, 0, '2014-04-03 12:15:06', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 2, 5, '2014-04-03 12:15:08', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 6, 1, '2014-04-03 12:15:08', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 2, 10, '2014-04-03 12:15:09', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 6, 2, '2014-04-03 12:15:09', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 2, 2, '2014-04-03 12:15:12', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 6, 0, '2014-04-03 12:15:12', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 1, 3, '2014-04-03 12:15:14', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 6, 0, '2014-04-03 12:15:14', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 3, 3, '2014-04-04 09:56:58', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 6, 0, '2014-04-04 09:56:58', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 3, 10, '2014-04-04 09:57:12', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 6, 2, '2014-04-04 09:57:12', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 3, 5, '2014-04-04 09:57:17', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 6, 1, '2014-04-04 09:57:17', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 3, 5, '2014-04-04 09:57:20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 6, 1, '2014-04-04 09:57:20', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 3, 5, '2014-04-04 09:57:24', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 6, 1, '2014-04-04 09:57:24', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 3, 15, '2014-04-04 09:57:32', 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 6, 3, '2014-04-04 09:57:32', NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 3, 10, '2014-04-04 09:57:37', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 6, 2, '2014-04-04 09:57:37', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 3, 3, '2014-04-04 09:57:55', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 6, 0, '2014-04-04 09:57:55', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 4, 5, '2014-04-04 09:58:00', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 6, 1, '2014-04-04 09:58:00', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 5, 10, '2014-04-04 09:58:04', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 6, 2, '2014-04-04 09:58:04', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 5, 10, '2014-04-04 09:58:08', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 6, 2, '2014-04-04 09:58:08', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 5, 5, '2014-04-04 09:58:11', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 6, 1, '2014-04-04 09:58:11', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 3, 10, '2014-04-04 09:58:13', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 6, 2, '2014-04-04 09:58:13', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 3, 5, '2014-04-04 09:58:17', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 6, 1, '2014-04-04 09:58:17', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 2, 10, '2014-04-04 09:58:20', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 6, 2, '2014-04-04 09:58:20', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 2, 10, '2014-04-04 09:58:21', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 6, 2, '2014-04-04 09:58:21', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 2, 5, '2014-04-04 09:58:29', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 6, 1, '2014-04-04 09:58:29', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 2, 3, '2014-04-04 09:58:31', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 6, 0, '2014-04-04 09:58:31', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 5, 3, '2014-04-04 17:48:18', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 6, 0, '2014-04-04 17:48:18', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 5, 20, '2014-04-04 17:48:22', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 6, 4, '2014-04-04 17:48:22', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 3, 5, '2014-04-08 10:11:45', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 6, 1, '2014-04-08 10:11:45', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 3, 10, '2014-04-08 10:11:50', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 6, 2, '2014-04-08 10:11:50', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 3, 5, '2014-04-08 10:11:53', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 6, 1, '2014-04-08 10:11:53', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 3, 10, '2014-04-08 10:11:56', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 6, 2, '2014-04-08 10:11:56', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 5, 10, '2014-04-08 10:12:04', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 6, 2, '2014-04-08 10:12:04', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 5, 10, '2014-04-08 10:12:06', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 6, 2, '2014-04-08 10:12:06', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 2, 10, '2014-04-08 10:12:09', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 6, 2, '2014-04-08 10:12:09', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 2, 10, '2014-04-08 10:12:12', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 6, 2, '2014-04-08 10:12:12', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 2, 2, '2014-04-08 10:12:14', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 6, 0, '2014-04-08 10:12:14', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 4, 5, '2014-04-08 15:37:15', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 6, 1, '2014-04-08 15:37:15', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 1, 5, '2014-04-08 15:37:24', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 6, 1, '2014-04-08 15:37:24', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 1, 5, '2014-04-08 15:37:28', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 6, 1, '2014-04-08 15:37:28', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 1, 10, '2014-04-08 15:37:35', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 6, 2, '2014-04-08 15:37:35', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 1, 10, '2014-04-08 15:37:40', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 6, 2, '2014-04-08 15:37:40', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 1, 5, '2014-04-08 15:37:42', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 6, 1, '2014-04-08 15:37:42', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 1, 5, '2014-04-08 15:37:44', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 6, 1, '2014-04-08 15:37:44', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 1, 10, '2014-04-08 15:37:46', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 6, 2, '2014-04-08 15:37:46', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 1, 5, '2014-04-08 15:37:48', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 6, 1, '2014-04-08 15:37:48', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 1, 5, '2014-04-08 15:37:50', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 6, 1, '2014-04-08 15:37:50', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 4, 5, '2014-04-09 10:11:46', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 6, 1, '2014-04-09 10:11:46', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 3, 10, '2014-04-09 15:35:46', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 6, 2, '2014-04-09 15:35:46', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 3, 5, '2014-04-09 15:36:01', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 6, 1, '2014-04-09 15:36:01', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 3, 10, '2014-04-09 15:36:03', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 6, 2, '2014-04-09 15:36:03', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 3, 5, '2014-04-09 15:36:44', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 6, 1, '2014-04-09 15:36:44', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 1, 10, '2014-04-10 19:45:04', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 6, 2, '2014-04-10 19:45:04', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(281, 1, 0, '2014-04-10 19:45:10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 6, 0, '2014-04-10 19:45:10', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 1, 5, '2014-04-10 19:45:13', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 6, 1, '2014-04-10 19:45:13', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 1, 10, '2014-04-10 19:45:18', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 6, 2, '2014-04-10 19:45:18', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 1, 5, '2014-04-10 19:45:28', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 6, 1, '2014-04-10 19:45:28', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 1, 10, '2014-04-10 19:45:44', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 6, 2, '2014-04-10 19:45:44', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 1, 5, '2014-04-10 19:45:47', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 6, 1, '2014-04-10 19:45:47', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 1, 15, '2014-04-10 19:45:49', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 6, 3, '2014-04-10 19:45:49', NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 1, 5, '2014-04-10 19:45:56', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 6, 1, '2014-04-10 19:45:56', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 1, 10, '2014-04-10 19:46:06', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 6, 2, '2014-04-10 19:46:06', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 1, 0, '2014-04-10 19:46:14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 6, 0, '2014-04-10 19:46:14', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 1, 10, '2014-04-10 19:46:23', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 6, 2, '2014-04-10 19:46:23', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 1, 5, '2014-04-10 19:46:24', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 6, 1, '2014-04-10 19:46:24', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(305, 1, 10, '2014-04-10 19:46:26', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 6, 2, '2014-04-10 19:46:26', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(307, 5, 10, '2014-04-10 19:46:31', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 6, 2, '2014-04-10 19:46:31', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 5, 10, '2014-04-10 19:46:38', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 6, 2, '2014-04-10 19:46:38', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 5, 5, '2014-04-10 19:46:58', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 6, 1, '2014-04-10 19:46:58', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 5, 10, '2014-04-10 19:47:06', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 6, 2, '2014-04-10 19:47:06', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 5, 5, '2014-04-10 19:47:08', 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 6, 1, '2014-04-10 19:47:08', NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 3, 20, '2014-04-10 19:47:53', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 6, 4, '2014-04-10 19:47:53', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 3, 10, '2014-04-10 19:48:02', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 6, 2, '2014-04-10 19:48:02', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 3, 10, '2014-04-10 19:48:08', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 6, 2, '2014-04-10 19:48:08', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 3, 10, '2014-04-10 19:48:09', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 6, 2, '2014-04-10 19:48:09', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 3, 10, '2014-04-10 19:48:11', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 6, 2, '2014-04-10 19:48:11', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 5, 5, '2014-04-11 10:58:24', 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(328, 6, 1, '2014-04-11 10:58:24', NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 4, 20, '2014-04-11 10:58:29', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 6, 4, '2014-04-11 10:58:29', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 1, 5, '2014-04-11 10:58:33', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, 6, 1, '2014-04-11 10:58:33', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 1, 20, '2014-04-11 10:58:36', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 6, 4, '2014-04-11 10:58:36', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 1, 10, '2014-04-11 10:58:38', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(336, 6, 2, '2014-04-11 10:58:38', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(337, 1, 10, '2014-04-11 10:58:40', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 6, 2, '2014-04-11 10:58:40', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 1, 10, '2014-04-11 10:58:41', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 6, 2, '2014-04-11 10:58:41', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 1, 5, '2014-04-11 10:58:43', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(342, 6, 1, '2014-04-11 10:58:43', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 1, 5, '2014-04-11 10:58:44', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 6, 1, '2014-04-11 10:58:44', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 1, 10, '2014-04-11 10:58:46', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 6, 2, '2014-04-11 10:58:46', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 1, 10, '2014-04-11 10:58:47', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 6, 2, '2014-04-11 10:58:47', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 1, 10, '2014-04-11 10:58:49', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 6, 2, '2014-04-11 10:58:49', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 1, 10, '2014-04-11 10:58:51', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 6, 2, '2014-04-11 10:58:51', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 4, 10, '2014-04-11 10:58:55', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 6, 2, '2014-04-11 10:58:55', NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 1, 20, '2014-04-11 10:59:02', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 6, 4, '2014-04-11 10:59:02', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 1, 20, '2014-04-11 10:59:03', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 6, 4, '2014-04-11 10:59:03', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(359, 1, 20, '2014-04-11 10:59:04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 6, 4, '2014-04-11 10:59:04', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 1, 50, '2014-04-11 10:59:06', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 6, 10, '2014-04-11 10:59:06', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 4, 20, '2014-04-11 10:59:16', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 6, 4, '2014-04-11 10:59:16', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(365, 1, 10, '2014-04-14 19:22:30', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(366, 6, 2, '2014-04-14 19:22:30', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 1, 10, '2014-04-14 19:22:33', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 6, 2, '2014-04-14 19:22:33', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 1, 10, '2014-04-14 19:22:35', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(370, 6, 2, '2014-04-14 19:22:35', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(371, 1, 10, '2014-04-14 19:23:17', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 6, 2, '2014-04-14 19:23:17', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 1, 10, '2014-04-14 19:23:20', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 6, 2, '2014-04-14 19:23:20', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 5, 10, '2014-04-14 19:23:23', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 6, 2, '2014-04-14 19:23:23', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 5, 15, '2014-04-14 19:23:30', 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 6, 3, '2014-04-14 19:23:30', NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 5, 5, '2014-04-14 19:23:33', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 6, 1, '2014-04-14 19:23:33', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 5, 10, '2014-04-14 19:23:34', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 6, 2, '2014-04-14 19:23:34', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(383, 5, 10, '2014-04-14 19:23:39', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, 6, 2, '2014-04-14 19:23:39', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 4, 10, '2014-04-14 19:23:43', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 6, 2, '2014-04-14 19:23:43', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 4, 10, '2014-04-14 19:23:46', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(388, 6, 2, '2014-04-14 19:23:46', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 4, 10, '2014-04-14 19:24:13', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 6, 2, '2014-04-14 19:24:13', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 5, 5, '2014-04-14 19:24:30', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(392, 6, 1, '2014-04-14 19:24:30', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(393, 3, 10, '2014-04-14 19:24:32', 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(394, 6, 2, '2014-04-14 19:24:32', NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(395, 4, 10, '2014-04-14 19:24:36', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 6, 2, '2014-04-14 19:24:36', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 4, 5, '2014-04-14 19:24:38', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 6, 1, '2014-04-14 19:24:38', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 3, 10, '2014-04-14 19:28:33', 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 6, 2, '2014-04-14 19:28:33', NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 6, 2, '2014-04-15 16:46:37', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 6, 2, '2014-04-15 16:46:41', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 6, 6, '2014-04-15 16:46:45', 63, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 6, 1, '2014-04-15 16:48:19', 56, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 6, 2, '2014-04-16 17:54:00', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 6, 1, '2014-04-16 17:54:02', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 6, 2, '2014-04-16 17:54:03', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 6, 2, '2014-04-16 17:54:05', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 6, 1, '2014-04-16 17:54:07', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 6, 2, '2014-04-16 17:54:09', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 6, 2, '2014-04-16 17:54:11', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 6, 2, '2014-04-16 17:54:14', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 6, 4, '2014-04-16 17:54:18', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 6, 2, '2014-04-17 17:22:07', 22, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 6, 2, '2014-04-22 10:53:07', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(416, 6, 2, '2014-04-22 10:53:10', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 6, 4, '2014-04-22 10:53:21', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(418, 6, 1, '2014-04-22 10:53:24', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(419, 6, 1, '2014-04-22 10:53:25', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 6, 1, '2014-04-22 10:53:30', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 6, 1, '2014-04-22 10:53:32', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 6, 2, '2014-04-22 10:53:35', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 6, 2, '2014-04-22 10:53:37', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 6, 1, '2014-04-22 10:53:42', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 6, 1, '2014-04-22 10:53:43', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 6, 1, '2014-04-23 14:54:02', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 6, 1, '2014-04-23 14:54:06', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 6, 1, '2014-04-23 14:54:08', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 6, 2, '2014-04-23 14:54:11', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 6, 1, '2014-04-23 14:54:13', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 6, 1, '2014-04-23 14:54:16', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(432, 6, 4, '2014-04-23 14:54:21', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 6, 1, '2014-04-24 11:08:49', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 6, 1, '2014-04-24 11:08:52', 14, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 6, 1, '2014-04-24 11:08:56', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 6, 1, '2014-04-24 11:08:58', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 6, 2, '2014-04-24 11:09:07', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(438, 6, 2, '2014-04-24 11:09:08', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 6, 1, '2014-04-28 14:44:24', 56, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 6, 2, '2014-04-28 14:44:29', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 6, 2, '2014-04-28 14:44:35', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 6, 2, '2014-04-28 14:44:39', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 6, 10, '2014-04-28 14:44:45', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 6, 10, '2014-04-28 14:44:53', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 6, 4, '2014-04-28 14:44:57', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 6, 4, '2014-04-28 14:45:03', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 6, 2, '2014-04-28 14:45:14', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 6, 2, '2014-04-28 14:45:18', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 6, 2, '2014-04-28 14:45:21', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 6, 4, '2014-04-28 14:45:29', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 6, 4, '2014-04-28 14:45:34', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 6, 10, '2014-04-28 14:45:40', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 6, 4, '2014-04-28 14:45:45', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 6, 2, '2014-04-28 14:45:49', 22, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 6, 10, '2014-04-28 14:45:54', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 6, 1, '2014-04-28 14:45:57', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 6, 1, '2014-04-28 14:46:14', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 6, 1, '2014-04-28 14:46:22', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 6, 2, '2014-04-28 14:46:33', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 6, 1, '2014-04-28 14:46:39', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 6, 10, '2014-04-28 20:43:14', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 6, 4, '2014-04-29 20:55:33', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 6, 2, '2014-04-29 20:58:53', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 6, 1, '2014-04-29 20:59:31', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 6, 2, '2014-04-29 20:59:44', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 6, 4, '2014-04-29 20:59:48', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 6, 10, '2014-04-29 20:59:52', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 6, 2, '2014-04-29 20:59:58', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 6, 2, '2014-04-29 21:00:04', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 6, 5, '2014-04-29 21:00:16', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 6, 1, '2014-04-29 21:00:46', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 6, 2, '2014-04-29 21:00:50', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 6, 2, '2014-04-29 21:00:55', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 6, 2, '2014-04-29 21:01:05', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 6, 2, '2014-04-29 21:01:23', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 6, 2, '2014-04-29 21:01:28', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 6, 2, '2014-04-29 21:01:33', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 6, 2, '2014-04-29 21:01:39', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 6, 2, '2014-04-29 21:01:44', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 6, 2, '2014-04-29 21:01:47', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 6, 2, '2014-04-29 21:02:29', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 6, 1, '2014-04-29 21:02:34', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 6, 5, '2014-04-29 21:02:42', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 6, 4, '2014-04-29 21:02:46', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 6, 2, '2014-04-29 21:02:50', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 6, 1, '2014-04-29 21:02:54', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 6, 2, '2014-04-29 21:02:57', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 6, 2, '2014-04-29 21:03:01', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 6, 2, '2014-04-29 21:03:05', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 6, 5, '2014-04-29 21:03:09', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 6, 1, '2014-04-29 21:03:12', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 6, 2, '2014-04-29 21:03:16', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 6, 2, '2014-04-29 21:03:20', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 6, 2, '2014-04-29 21:03:23', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 6, 2, '2014-04-29 21:03:26', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 6, 2, '2014-04-29 21:03:28', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 6, 2, '2014-04-29 21:03:32', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 6, 2, '2014-04-29 21:03:34', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 6, 2, '2014-04-29 21:03:45', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 6, 2, '2014-04-29 21:03:49', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 6, 2, '2014-04-29 21:03:54', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 6, 5, '2014-04-29 21:03:57', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 6, 4, '2014-04-30 23:20:35', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 6, 10, '2014-04-30 23:20:41', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 6, 2, '2014-04-30 23:20:47', 16, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 6, 2, '2014-04-30 23:20:49', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 6, 1, '2014-04-30 23:20:52', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 6, 2, '2014-04-30 23:20:55', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 6, 5, '2014-04-30 23:20:58', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 6, 4, '2014-05-02 13:50:43', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 6, 10, '2014-05-02 13:50:52', 70, 70, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 6, 4, '2014-05-02 13:50:57', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 6, 4, '2014-05-02 13:51:01', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 6, 1, '2014-05-02 13:51:08', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 6, 4, '2014-05-02 13:51:16', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 6, 1, '2014-05-02 13:51:22', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 6, 1, '2014-05-02 13:51:25', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 6, 2, '2014-05-02 13:51:28', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 6, 2, '2014-05-02 13:51:31', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 6, 1, '2014-05-02 13:51:34', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 6, 1, '2014-05-02 13:51:37', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 6, 1, '2014-05-02 13:51:41', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 6, 1, '2014-05-02 13:51:47', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 6, 4, '2014-05-02 13:51:53', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 6, 1, '2014-05-02 13:51:58', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 6, 1, '2014-05-02 13:52:05', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 6, 2, '2014-05-02 13:52:08', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 6, 2, '2014-05-02 13:52:12', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 6, 1, '2014-05-02 13:52:16', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 6, 2, '2014-05-02 13:52:21', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(531, 6, 1, '2014-05-02 13:52:26', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 6, 2, '2014-05-02 13:52:30', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 6, 1, '2014-05-02 13:52:34', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 6, 2, '2014-05-02 13:52:43', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 6, 1, '2014-05-02 13:52:46', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 6, 2, '2014-05-02 13:53:13', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 6, 5, '2014-05-02 13:53:26', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 6, 2, '2014-05-05 21:22:43', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 6, 4, '2014-05-05 21:22:57', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 6, 2, '2014-05-05 21:23:06', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 6, 1, '2014-05-05 21:23:11', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 6, 1, '2014-05-05 21:23:26', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 6, 2, '2014-05-05 21:23:32', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 6, 1, '2014-05-05 21:23:37', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 6, 2, '2014-05-05 21:23:40', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 6, 2, '2014-05-05 21:23:48', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 6, 2, '2014-05-05 21:23:54', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 6, 2, '2014-05-05 21:24:03', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(549, 6, 4, '2014-05-05 21:24:07', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 6, 2, '2014-05-05 21:24:13', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(551, 6, 1, '2014-05-05 21:24:27', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(552, 6, 2, '2014-05-05 21:24:31', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 6, 2, '2014-05-05 21:24:39', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(554, 6, 2, '2014-05-05 21:24:51', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 6, 10, '2014-05-05 21:24:59', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 6, 2, '2014-05-05 21:25:07', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(557, 6, 2, '2014-05-05 21:25:30', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 6, 2, '2014-05-05 21:25:34', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 6, 2, '2014-05-05 21:25:44', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 6, 2, '2014-05-05 21:25:54', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(561, 6, 2, '2014-05-05 21:26:21', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 6, 2, '2014-05-05 21:26:30', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(563, 6, 1, '2014-05-05 21:26:36', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 6, 1, '2014-05-05 21:26:40', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(565, 6, 2, '2014-05-05 21:26:52', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(566, 6, 1, '2014-05-05 21:26:56', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(567, 6, 2, '2014-05-05 21:26:59', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(568, 6, 1, '2014-05-05 21:27:03', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(569, 6, 2, '2014-05-05 21:27:06', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(570, 6, 1, '2014-05-05 21:27:10', 56, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 6, 5, '2014-05-05 21:27:17', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(572, 6, 1, '2014-05-05 21:27:21', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(573, 6, 2, '2014-05-05 21:27:25', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(574, 6, 2, '2014-05-05 21:27:41', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(575, 6, 2, '2014-05-06 19:20:55', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(576, 6, 2, '2014-05-06 19:21:03', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(577, 6, 2, '2014-05-06 19:21:10', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(578, 6, 2, '2014-05-06 19:21:17', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(579, 6, 1, '2014-05-06 19:21:25', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(580, 6, 1, '2014-05-06 19:21:33', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(581, 6, 5, '2014-05-06 19:21:39', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(582, 6, 1, '2014-05-06 19:21:50', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(583, 6, 2, '2014-05-06 19:22:05', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(584, 6, 4, '2014-05-06 19:22:19', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(585, 6, 1, '2014-05-06 19:22:39', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(586, 6, 1, '2014-05-06 19:23:02', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(587, 6, 1, '2014-05-06 19:23:43', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(588, 6, 2, '2014-05-06 19:23:47', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 6, 4, '2014-05-06 19:23:56', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(590, 6, 5, '2014-05-06 19:26:50', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(591, 6, 2, '2014-05-06 19:26:55', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(592, 6, 2, '2014-05-06 19:26:59', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(593, 6, 2, '2014-05-06 19:27:07', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(594, 6, 2, '2014-05-06 19:27:14', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(595, 6, 2, '2014-05-06 19:27:20', 61, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 6, 2, '2014-05-06 19:27:28', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 6, 5, '2014-05-06 19:27:32', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 6, 1, '2014-05-06 19:28:42', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 6, 4, '2014-05-06 19:28:46', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 6, 1, '2014-05-06 19:28:57', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 6, 2, '2014-05-06 19:29:00', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 6, 1, '2014-05-06 19:29:55', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 6, 1, '2014-05-06 19:29:59', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 6, 1, '2014-05-06 19:30:03', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 6, 1, '2014-05-06 19:30:13', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 6, 2, '2014-05-06 19:30:17', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 6, 1, '2014-05-06 19:30:21', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 6, 4, '2014-05-06 19:30:25', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 6, 5, '2014-05-06 19:30:29', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 6, 1, '2014-05-06 19:30:32', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 6, 1, '2014-05-06 19:30:36', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 6, 1, '2014-05-06 19:30:40', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 6, 1, '2014-05-06 19:30:44', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 6, 1, '2014-05-06 19:30:46', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 6, 1, '2014-05-06 19:30:51', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(616, 6, 4, '2014-05-06 19:33:16', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 6, 4, '2014-05-06 19:33:19', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 6, 1, '2014-05-06 19:52:29', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 6, 1, '2014-05-06 19:52:42', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 6, 1, '2014-05-06 19:52:46', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 6, 2, '2014-05-06 19:52:50', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 6, 2, '2014-05-06 19:52:53', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 6, 2, '2014-05-06 19:52:58', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 6, 2, '2014-05-06 19:53:01', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 6, 2, '2014-05-06 19:53:04', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 6, 2, '2014-05-06 19:53:07', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 6, 1, '2014-05-06 20:59:58', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 6, 1, '2014-05-06 21:00:03', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 6, 1, '2014-05-06 21:00:21', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `xp_log` (`id`, `player_id`, `xp`, `created`, `activity_id`, `activity_id_reviewed`, `event_id_joined`, `event_id_completed`, `event_task_id`, `event_task_id_reviewed`, `log_id`, `log_id_reviewed`) VALUES
(630, 6, 2, '2014-05-06 21:00:26', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 6, 5, '2014-05-06 21:00:38', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 6, 4, '2014-05-06 21:00:51', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 6, 1, '2014-05-06 21:00:55', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 6, 1, '2014-05-06 21:00:58', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 6, 2, '2014-05-07 18:33:40', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 6, 2, '2014-05-07 18:33:49', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 6, 2, '2014-05-07 18:33:53', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 6, 2, '2014-05-07 18:33:55', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 6, 2, '2014-05-07 18:33:58', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 6, 2, '2014-05-07 23:54:30', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 6, 1, '2014-05-07 23:54:49', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 6, 2, '2014-05-07 23:55:12', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 6, 2, '2014-05-07 23:55:26', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 6, 2, '2014-05-07 23:56:27', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 6, 2, '2014-05-07 23:56:32', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 6, 2, '2014-05-07 23:57:04', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 6, 2, '2014-05-07 23:57:10', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 6, 2, '2014-05-07 23:57:17', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 6, 5, '2014-05-07 23:57:38', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 6, 4, '2014-05-07 23:57:49', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 6, 2, '2014-05-07 23:57:52', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 6, 2, '2014-05-07 23:57:55', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 6, 1, '2014-05-07 23:57:58', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 6, 2, '2014-05-08 16:42:43', 46, 46, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 6, 2, '2014-05-08 16:42:55', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 6, 2, '2014-05-08 16:43:08', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 6, 1, '2014-05-08 16:43:14', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 6, 1, '2014-05-08 16:43:18', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 6, 1, '2014-05-08 16:43:24', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 6, 4, '2014-05-08 16:43:29', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 6, 2, '2014-05-08 16:43:34', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 6, 2, '2014-05-08 16:43:41', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 6, 2, '2014-05-08 16:43:44', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 6, 1, '2014-05-08 21:54:56', 56, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 6, 1, '2014-05-08 21:54:57', 56, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 6, 4, '2014-05-08 21:55:03', 3, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 6, 5, '2014-05-08 21:55:09', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 6, 2, '2014-05-08 21:55:17', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 6, 1, '2014-05-08 21:55:21', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(670, 6, 2, '2014-05-08 21:55:25', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(671, 6, 5, '2014-05-08 21:55:30', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(672, 6, 1, '2014-05-08 21:55:40', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 6, 3, '2014-05-08 21:55:42', 38, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 6, 5, '2014-05-09 14:25:11', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 6, 4, '2014-05-09 14:25:16', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(676, 6, 1, '2014-05-09 14:25:20', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 6, 1, '2014-05-09 14:25:24', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(678, 6, 1, '2014-05-09 14:25:28', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(679, 6, 1, '2014-05-09 14:25:31', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(680, 6, 4, '2014-05-09 14:25:34', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 6, 5, '2014-05-09 14:25:36', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 6, 2, '2014-05-09 14:25:39', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 6, 2, '2014-05-09 14:25:41', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(684, 6, 1, '2014-05-12 15:01:14', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 6, 4, '2014-05-12 15:01:21', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(686, 6, 5, '2014-05-12 15:01:31', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(687, 6, 2, '2014-05-12 15:01:56', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(688, 6, 1, '2014-05-12 15:02:01', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 6, 1, '2014-05-12 15:02:13', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 6, 2, '2014-05-12 15:02:21', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 6, 2, '2014-05-12 15:02:30', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(692, 6, 2, '2014-05-12 15:02:35', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 6, 2, '2014-05-12 15:02:40', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 6, 2, '2014-05-12 15:02:45', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(695, 6, 2, '2014-05-12 15:02:50', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(696, 6, 2, '2014-05-12 15:02:54', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 6, 2, '2014-05-12 15:02:59', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 6, 2, '2014-05-12 15:03:04', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 6, 2, '2014-05-12 15:03:10', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(700, 6, 2, '2014-05-12 15:03:13', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(701, 6, 2, '2014-05-12 15:03:19', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(702, 6, 2, '2014-05-12 15:03:24', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(703, 6, 2, '2014-05-12 15:03:34', 46, 46, NULL, NULL, NULL, NULL, NULL, NULL),
(704, 6, 2, '2014-05-12 15:03:40', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 6, 2, '2014-05-13 16:33:20', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 6, 2, '2014-05-13 16:33:27', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(707, 6, 2, '2014-05-13 16:33:35', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(708, 6, 5, '2014-05-13 16:33:38', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(709, 6, 4, '2014-05-13 16:33:41', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(710, 6, 1, '2014-05-13 16:33:44', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(711, 6, 1, '2014-05-13 16:33:47', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 6, 1, '2014-05-13 16:33:49', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 6, 2, '2014-05-13 16:33:54', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 6, 1, '2014-05-13 16:33:58', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 6, 1, '2014-05-13 16:34:01', 52, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(716, 6, 1, '2014-05-14 14:11:01', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(717, 6, 1, '2014-05-14 14:11:08', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(718, 6, 1, '2014-05-14 14:11:17', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(719, 6, 2, '2014-05-14 14:11:36', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(720, 6, 2, '2014-05-14 14:11:50', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(721, 6, 1, '2014-05-14 14:11:58', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(722, 6, 1, '2014-05-14 14:12:15', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(723, 6, 2, '2014-05-14 14:12:23', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(724, 6, 2, '2014-05-14 14:12:29', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(725, 6, 2, '2014-05-14 14:12:52', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(726, 6, 2, '2014-05-14 14:12:58', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(727, 6, 2, '2014-05-14 14:13:06', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(728, 6, 4, '2014-05-14 14:13:10', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(729, 6, 2, '2014-05-14 14:13:13', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(730, 6, 4, '2014-05-14 14:13:18', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(731, 6, 1, '2014-05-15 16:15:04', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(732, 6, 2, '2014-05-15 16:15:12', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(733, 6, 1, '2014-05-15 16:15:18', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(734, 6, 1, '2014-05-15 16:15:23', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(735, 6, 2, '2014-05-15 16:15:27', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(736, 6, 2, '2014-05-15 16:15:33', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(737, 6, 2, '2014-05-15 16:15:42', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(738, 6, 2, '2014-05-15 16:15:45', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(739, 6, 2, '2014-05-15 16:15:50', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(740, 6, 4, '2014-05-15 16:15:54', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(741, 6, 2, '2014-05-15 16:15:57', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(742, 6, 4, '2014-05-15 16:16:02', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(743, 6, 1, '2014-05-15 16:16:07', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(744, 6, 5, '2014-05-15 16:16:11', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 6, 2, '2014-05-15 16:16:14', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(746, 6, 2, '2014-05-15 16:16:17', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(747, 6, 1, '2014-05-15 16:16:20', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(748, 6, 4, '2014-05-15 16:16:24', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(749, 6, 2, '2014-05-15 16:16:27', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(750, 6, 4, '2014-05-16 15:43:47', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(751, 6, 1, '2014-05-16 15:43:56', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(752, 6, 2, '2014-05-16 15:44:01', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 6, 2, '2014-05-16 15:46:45', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 6, 2, '2014-05-16 15:46:49', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 6, 2, '2014-05-16 15:46:53', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(756, 6, 5, '2014-05-16 15:46:57', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 6, 4, '2014-05-16 15:47:02', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(758, 6, 1, '2014-05-16 15:47:06', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(759, 6, 1, '2014-05-16 15:47:11', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(760, 6, 2, '2014-05-16 15:47:16', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 6, 1, '2014-05-16 15:47:23', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 6, 2, '2014-05-19 14:10:50', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(763, 6, 1, '2014-05-19 14:10:59', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(764, 6, 2, '2014-05-19 14:11:07', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(765, 6, 1, '2014-05-19 14:11:14', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(766, 6, 4, '2014-05-19 14:11:24', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(767, 6, 5, '2014-05-19 14:11:38', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(768, 6, 2, '2014-05-19 14:11:46', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 6, 1, '2014-05-19 14:11:52', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 6, 1, '2014-05-19 14:11:57', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 6, 3, '2014-05-19 14:12:01', 38, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(772, 6, 2, '2014-05-19 14:12:06', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(773, 6, 5, '2014-05-19 14:12:12', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(774, 6, 4, '2014-05-19 14:12:19', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(775, 6, 2, '2014-05-19 14:12:28', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 6, 1, '2014-05-19 14:12:32', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 6, 1, '2014-05-19 14:12:38', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 6, 2, '2014-05-19 14:12:42', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 6, 1, '2014-05-19 14:12:53', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(780, 6, 1, '2014-05-19 14:13:01', 17, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(781, 6, 2, '2014-05-19 14:13:05', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(782, 6, 5, '2014-05-19 14:13:12', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(783, 6, 2, '2014-05-19 14:13:22', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(784, 6, 2, '2014-05-19 14:13:26', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 6, 1, '2014-05-19 14:13:30', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 6, 4, '2014-05-19 14:13:35', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 6, 2, '2014-05-19 14:13:39', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(788, 6, 2, '2014-05-20 15:02:18', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(789, 6, 1, '2014-05-20 15:14:13', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(790, 6, 2, '2014-05-20 15:14:53', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(791, 6, 2, '2014-05-20 15:14:58', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(792, 6, 2, '2014-05-20 15:15:02', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(793, 6, 2, '2014-05-20 15:15:08', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(794, 6, 1, '2014-05-20 15:15:23', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(795, 6, 2, '2014-05-20 15:15:28', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(796, 6, 2, '2014-05-20 15:15:36', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(797, 6, 2, '2014-05-20 15:15:43', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(798, 6, 2, '2014-05-20 15:16:25', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(799, 6, 2, '2014-05-20 15:16:32', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(800, 6, 1, '2014-05-20 15:16:42', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(801, 6, 1, '2014-05-20 15:17:24', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(802, 6, 2, '2014-05-20 15:17:27', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(803, 6, 1, '2014-05-20 15:17:32', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(804, 6, 1, '2014-05-20 15:17:36', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(805, 6, 1, '2014-05-20 15:17:39', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(806, 6, 1, '2014-05-20 15:17:43', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(807, 6, 1, '2014-05-20 15:17:46', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(808, 6, 2, '2014-05-20 15:17:50', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 6, 1, '2014-05-20 20:51:08', 14, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 6, 2, '2014-05-20 20:51:21', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(811, 6, 2, '2014-05-20 20:51:33', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(812, 6, 2, '2014-05-20 20:51:37', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(813, 6, 1, '2014-05-20 20:52:03', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(814, 6, 2, '2014-05-20 20:52:25', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(815, 6, 2, '2014-05-20 20:52:43', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(816, 6, 2, '2014-05-20 20:52:55', 36, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 6, 2, '2014-05-20 20:53:44', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 6, 1, '2014-05-20 20:53:49', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(819, 6, 2, '2014-05-20 20:53:56', 23, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(820, 6, 1, '2014-05-20 20:54:06', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(821, 6, 2, '2014-05-20 20:54:16', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(822, 6, 1, '2014-05-20 20:54:26', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(823, 6, 1, '2014-05-20 20:54:57', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(824, 6, 1, '2014-05-20 20:55:38', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 6, 2, '2014-05-20 20:55:41', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 6, 1, '2014-05-20 21:14:04', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(827, 6, 2, '2014-05-22 14:27:47', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(828, 6, 2, '2014-05-22 14:27:51', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(829, 6, 2, '2014-05-22 14:27:54', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(830, 6, 2, '2014-05-22 14:27:57', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(831, 6, 2, '2014-05-22 20:57:08', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(832, 6, 5, '2014-05-22 20:57:11', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(833, 6, 4, '2014-05-22 20:57:16', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 6, 1, '2014-05-22 20:57:21', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(835, 6, 1, '2014-05-22 20:57:25', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(836, 6, 1, '2014-05-22 20:57:27', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(837, 6, 2, '2014-05-23 22:32:36', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(838, 6, 2, '2014-05-23 22:32:41', 69, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(839, 6, 1, '2014-05-23 22:32:44', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(840, 6, 2, '2014-05-23 22:32:47', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 6, 5, '2014-05-23 22:32:51', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 6, 3, '2014-05-23 22:32:54', 38, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(843, 6, 2, '2014-05-26 22:56:41', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(844, 6, 5, '2014-05-26 22:56:44', 39, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(845, 6, 4, '2014-05-26 22:56:48', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(846, 6, 1, '2014-05-26 22:56:50', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(847, 6, 1, '2014-05-26 22:56:53', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(848, 6, 2, '2014-05-28 01:35:31', 72, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(849, 6, 1, '2014-05-28 01:35:43', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 6, 1, '2014-05-28 01:35:46', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(851, 6, 1, '2014-05-28 01:35:51', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(852, 6, 1, '2014-05-28 01:35:53', 44, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(853, 6, 2, '2014-05-28 01:35:56', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(854, 6, 2, '2014-05-30 15:48:04', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(855, 6, 2, '2014-05-30 15:48:08', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(856, 6, 1, '2014-05-30 15:48:13', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 6, 2, '2014-05-30 15:48:18', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 6, 1, '2014-05-30 15:48:24', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(859, 6, 1, '2014-05-30 15:48:28', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(860, 6, 1, '2014-05-30 15:48:34', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(861, 6, 1, '2014-05-30 15:48:39', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(862, 6, 1, '2014-05-30 15:48:42', 2, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(863, 6, 1, '2014-05-30 15:48:45', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 6, 2, '2014-05-30 15:48:51', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 6, 1, '2014-05-30 15:48:54', 45, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 6, 2, '2014-05-30 15:48:59', 37, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(867, 6, 4, '2014-05-30 15:49:02', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(868, 6, 4, '2014-05-30 15:49:05', 40, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(869, 6, 2, '2014-05-30 15:49:09', 58, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(870, 6, 4, '2014-06-05 21:44:47', 15, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(871, 6, 2, '2014-06-05 21:44:55', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(872, 6, 2, '2014-06-05 21:45:01', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(873, 6, 1, '2014-06-05 21:45:08', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 6, 1, '2014-06-05 21:45:14', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(875, 6, 1, '2014-06-05 21:45:17', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(876, 6, 1, '2014-06-05 21:45:20', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(877, 6, 1, '2014-06-05 21:45:23', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(878, 6, 1, '2014-06-05 21:45:27', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(879, 6, 2, '2014-06-05 21:45:42', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(880, 6, 2, '2014-06-05 21:45:45', 43, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(881, 6, 1, '2014-06-05 21:45:47', 71, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 6, 1, '2014-06-05 21:45:51', 42, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(889, 3, 3, '2014-06-15 14:35:17', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(890, 6, 1, '2014-06-15 14:35:17', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(891, 3, 20, '2014-06-15 14:35:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(892, 6, 3, '2014-06-15 14:35:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(893, 3, 2, '2014-06-15 14:35:17', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(894, 6, 1, '2014-06-15 14:35:17', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(895, 7, 3, '2014-06-15 14:35:17', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, 6, 1, '2014-06-15 14:35:17', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(897, 4, 3, '2014-06-15 14:35:17', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 6, 1, '2014-06-15 14:35:17', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(899, 4, 20, '2014-06-15 14:35:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, 6, 3, '2014-06-15 14:35:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(901, 4, 20, '2014-06-15 14:35:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, 6, 3, '2014-06-15 14:35:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(903, 4, 20, '2014-06-15 14:35:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(904, 6, 3, '2014-06-15 14:35:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(905, 4, 20, '2014-06-15 14:35:17', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(906, 6, 3, '2014-06-15 14:35:17', NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(907, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(908, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(909, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(910, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(911, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(912, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(913, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(914, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(915, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(916, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(917, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(918, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(919, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(921, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(923, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(925, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(927, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(928, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(929, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(930, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(931, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(932, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(933, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(934, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(935, 1, 2, '2014-06-15 14:35:17', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(936, 6, 1, '2014-06-15 14:35:17', NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(937, 5, 2, '2014-06-15 14:35:17', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(938, 6, 1, '2014-06-15 14:35:17', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(939, 5, 10, '2014-06-15 14:35:17', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(940, 6, 1, '2014-06-15 14:35:17', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(941, 5, 5, '2014-06-15 14:35:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(942, 6, 1, '2014-06-15 14:35:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(943, 5, 20, '2014-06-15 14:35:17', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 6, 3, '2014-06-15 14:35:17', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(945, 5, 25, '2014-06-15 14:35:17', 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, 6, 4, '2014-06-15 14:35:17', NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(947, 5, 2, '2014-06-15 14:35:17', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, 6, 1, '2014-06-15 14:35:17', NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(949, 5, 10, '2014-06-15 14:35:17', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, 6, 1, '2014-06-15 14:35:17', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(951, 5, 10, '2014-06-15 14:35:17', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 6, 1, '2014-06-15 14:35:17', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(953, 5, 10, '2014-06-15 14:35:17', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, 6, 1, '2014-06-15 14:35:17', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(955, 5, 10, '2014-06-15 14:35:17', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, 6, 1, '2014-06-15 14:35:17', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(957, 5, 10, '2014-06-15 14:35:17', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, 6, 1, '2014-06-15 14:35:17', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(959, 5, 10, '2014-06-15 14:35:17', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, 6, 1, '2014-06-15 14:35:17', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(961, 5, 5, '2014-06-15 14:35:17', 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, 6, 1, '2014-06-15 14:35:17', NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(963, 5, 10, '2014-06-15 14:35:17', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, 6, 1, '2014-06-15 14:35:17', NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(965, 1, 3, '2014-06-15 14:35:17', 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, 6, 1, '2014-06-15 14:35:17', NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(967, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(969, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(971, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(973, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(975, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(977, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(979, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(981, 1, 20, '2014-06-15 14:35:17', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, 6, 3, '2014-06-15 14:35:17', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(983, 1, 10, '2014-06-15 14:35:17', 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, 6, 1, '2014-06-15 14:35:17', NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 1, 5, '2014-06-15 14:35:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 6, 1, '2014-06-15 14:35:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(987, 1, 10, '2014-06-15 14:35:17', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, 6, 1, '2014-06-15 14:35:17', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(989, 1, 5, '2014-06-15 14:35:17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, 6, 1, '2014-06-15 14:35:17', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(991, 1, 20, '2014-06-15 14:35:17', 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, 6, 3, '2014-06-15 14:35:17', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(993, 1, 10, '2014-06-15 14:35:17', 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, 6, 1, '2014-06-15 14:35:17', NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(995, 1, 5, '2014-06-15 14:35:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, 6, 1, '2014-06-15 14:35:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(997, 1, 10, '2014-06-15 14:35:17', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, 6, 1, '2014-06-15 14:35:17', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(999, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, 4, 10, '2014-06-15 14:35:17', 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, 6, 1, '2014-06-15 14:35:17', NULL, 69, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, 5, 5, '2014-06-15 14:35:17', 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, 6, 1, '2014-06-15 14:35:17', NULL, 71, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, 5, 10, '2014-06-15 14:35:17', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, 6, 1, '2014-06-15 14:35:17', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, 5, 5, '2014-06-15 14:35:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 6, 1, '2014-06-15 14:35:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, 5, 5, '2014-06-15 14:35:17', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, 6, 1, '2014-06-15 14:35:17', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, 5, 10, '2014-06-15 14:35:17', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, 6, 1, '2014-06-15 14:35:17', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, 5, 5, '2014-06-15 14:35:17', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, 6, 1, '2014-06-15 14:35:17', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(1015, 5, 5, '2014-06-15 14:35:17', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1016, 6, 1, '2014-06-15 14:35:17', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1017, 5, 25, '2014-06-15 14:35:17', 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1018, 6, 4, '2014-06-15 14:35:17', NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(1019, 7, 5, '2014-06-15 14:35:17', 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, 6, 1, '2014-06-15 14:35:17', NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(1021, 1, 10, '2014-06-15 14:35:17', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1022, 6, 1, '2014-06-15 14:35:17', NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(1023, 1, 25, '2014-06-15 14:35:17', 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1024, 6, 4, '2014-06-15 14:35:17', NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, 1, 10, '2014-06-15 14:35:17', 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1026, 6, 1, '2014-06-15 14:35:17', NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(1027, 1, 5, '2014-06-15 14:35:17', 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, 6, 1, '2014-06-15 14:35:17', NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, 1, 5, '2014-06-15 14:35:17', 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, 6, 1, '2014-06-15 14:35:17', NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, 1, 10, '2014-06-15 14:35:17', 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 6, 1, '2014-06-15 14:35:17', NULL, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 7, 5, '2014-06-16 19:06:09', NULL, NULL, NULL, NULL, NULL, NULL, 1347, NULL),
(1034, 1, 1, '2014-06-16 19:06:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1347),
(1035, 5, 2, '2014-06-18 19:47:53', NULL, NULL, NULL, NULL, NULL, NULL, 1348, NULL),
(1036, 7, 1, '2014-06-18 19:47:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1348),
(1037, 3, 24, '2014-06-18 21:35:56', NULL, NULL, NULL, NULL, NULL, NULL, 1350, NULL),
(1038, 5, 2, '2014-06-18 21:35:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1350),
(1039, 5, 2, '2014-06-18 21:35:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1350),
(1040, 5, 6, '2014-06-23 14:23:17', NULL, NULL, NULL, NULL, NULL, NULL, 1349, NULL),
(1041, 1, 1, '2014-06-23 14:23:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1349),
(1042, 1, 3, '2014-06-23 14:32:45', NULL, NULL, NULL, NULL, NULL, NULL, 1351, NULL),
(1043, 5, 1, '2014-06-23 14:32:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1351),
(1044, 5, 2, '2014-06-23 16:38:15', NULL, NULL, NULL, NULL, NULL, NULL, 1353, NULL),
(1045, 7, 1, '2014-06-23 16:38:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1353),
(1046, 5, 3, '2014-06-23 16:38:16', NULL, NULL, NULL, NULL, NULL, NULL, 1354, NULL),
(1047, 7, 1, '2014-06-23 16:38:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1354),
(1048, 7, 3, '2014-06-23 16:39:06', NULL, NULL, NULL, NULL, NULL, NULL, 1356, NULL),
(1049, 5, 1, '2014-06-23 16:39:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1356),
(1050, 1, 12, '2014-06-23 16:45:26', NULL, NULL, NULL, NULL, NULL, NULL, 1352, NULL),
(1051, 7, 1, '2014-06-23 16:45:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1352),
(1052, 7, 1, '2014-06-23 16:45:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1352),
(1053, 4, 18, '2014-06-24 15:02:17', NULL, NULL, NULL, NULL, NULL, NULL, 1357, NULL),
(1054, 7, 1, '2014-06-24 15:02:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1357),
(1055, 4, 2, '2014-06-25 16:50:46', NULL, NULL, NULL, NULL, NULL, NULL, 1360, NULL),
(1056, 7, 1, '2014-06-25 16:50:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1360),
(1057, 4, 18, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1358, NULL),
(1058, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1358),
(1059, 4, 6, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1359, NULL),
(1060, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1359),
(1061, 4, 24, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1361, NULL),
(1062, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1361),
(1063, 4, 12, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1362, NULL),
(1064, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1362),
(1065, 4, 12, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1363, NULL),
(1066, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1363),
(1067, 4, 12, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1364, NULL),
(1068, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1364),
(1069, 4, 12, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1365, NULL),
(1070, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1365),
(1071, 4, 12, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, 1366, NULL),
(1072, 1, 1, '2014-06-25 17:08:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1366),
(1073, 4, 12, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, 1367, NULL),
(1074, 1, 1, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1367),
(1075, 4, 12, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, 1368, NULL),
(1076, 1, 1, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1368),
(1077, 4, 12, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, 1369, NULL),
(1078, 1, 1, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1369),
(1079, 4, 12, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, 1370, NULL),
(1080, 1, 1, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1370),
(1081, 4, 12, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, 1371, NULL),
(1082, 1, 1, '2014-06-25 17:08:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1371),
(1083, 1, 6, '2014-06-25 20:21:35', NULL, NULL, NULL, NULL, NULL, NULL, 1376, NULL),
(1084, 7, 1, '2014-06-25 20:21:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1376),
(1085, 7, 24, '2014-06-25 20:27:05', NULL, NULL, NULL, NULL, NULL, NULL, 1355, NULL),
(1086, 1, 2, '2014-06-25 20:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1355),
(1087, 1, 2, '2014-06-25 20:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1355),
(1088, 7, 6, '2014-06-25 20:29:49', NULL, NULL, NULL, NULL, NULL, NULL, 1380, NULL),
(1089, 1, 1, '2014-06-25 20:29:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1380),
(1090, 7, 6, '2014-06-26 17:49:16', NULL, NULL, NULL, NULL, NULL, NULL, 1384, NULL),
(1091, 1, 1, '2014-06-26 17:49:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1384),
(1092, 7, 12, '2014-06-26 17:49:16', NULL, NULL, NULL, NULL, NULL, NULL, 1385, NULL),
(1093, 1, 1, '2014-06-26 17:49:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1385),
(1094, 1, 12, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, 1372, NULL),
(1095, 4, 1, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1372),
(1096, 1, 24, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, 1373, NULL),
(1097, 4, 2, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1373),
(1098, 1, 6, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, 1374, NULL),
(1099, 4, 1, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1374),
(1100, 1, 12, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, 1375, NULL),
(1101, 4, 1, '2014-06-26 20:46:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1375),
(1102, 1, 18, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 1377, NULL),
(1103, 4, 1, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1377),
(1104, 1, 6, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 1378, NULL),
(1105, 4, 1, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1378),
(1106, 1, 12, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 1381, NULL),
(1107, 4, 1, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1381),
(1108, 1, 6, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 1382, NULL),
(1109, 4, 1, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1382),
(1110, 1, 6, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, 1383, NULL),
(1111, 4, 1, '2014-06-26 20:46:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1383),
(1112, 3, 12, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, 1386, NULL),
(1113, 7, 1, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1386),
(1114, 3, 6, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, 1387, NULL),
(1115, 7, 1, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1387),
(1116, 3, 12, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, 1388, NULL),
(1117, 7, 1, '2014-06-26 23:51:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1388),
(1118, 7, 12, '2014-06-27 13:49:44', NULL, NULL, NULL, NULL, NULL, NULL, 1389, NULL),
(1119, 1, 1, '2014-06-27 13:49:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1389),
(1120, 7, 12, '2014-06-27 13:49:45', NULL, NULL, NULL, NULL, NULL, NULL, 1391, NULL),
(1121, 1, 1, '2014-06-27 13:49:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1391),
(1122, 7, 12, '2014-06-27 13:49:45', NULL, NULL, NULL, NULL, NULL, NULL, 1392, NULL),
(1123, 1, 1, '2014-06-27 13:49:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1392),
(1124, 7, 6, '2014-06-30 17:16:16', NULL, NULL, NULL, NULL, NULL, NULL, 1390, NULL),
(1125, 4, 1, '2014-06-30 17:16:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390),
(1126, 1, 12, '2014-06-30 17:16:17', NULL, NULL, NULL, NULL, NULL, NULL, 1394, NULL),
(1127, 4, 1, '2014-06-30 17:16:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1394),
(1128, 7, 12, '2014-06-30 18:30:40', NULL, NULL, NULL, NULL, NULL, NULL, 1393, NULL),
(1129, 1, 1, '2014-06-30 18:30:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1393),
(1130, 4, 12, '2014-06-30 18:30:40', NULL, NULL, NULL, NULL, NULL, NULL, 1395, NULL),
(1131, 1, 1, '2014-06-30 18:30:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1395),
(1132, 4, 12, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, 1396, NULL),
(1133, 1, 1, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1396),
(1134, 4, 12, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, 1397, NULL),
(1135, 1, 1, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1397),
(1136, 4, 12, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, 1398, NULL),
(1137, 1, 1, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1398),
(1138, 4, 12, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, 1399, NULL),
(1139, 1, 1, '2014-06-30 18:30:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1399),
(1140, 4, 12, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, 1400, NULL),
(1141, 1, 1, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1400),
(1142, 4, 12, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, 1401, NULL),
(1143, 1, 1, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1401),
(1144, 4, 12, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, 1402, NULL),
(1145, 1, 1, '2014-06-30 18:30:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1402),
(1146, 4, 12, '2014-06-30 20:08:05', NULL, NULL, NULL, NULL, NULL, NULL, 1403, NULL),
(1147, 5, 1, '2014-06-30 20:08:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1403),
(1148, 5, 6, '2014-06-30 22:57:52', NULL, NULL, NULL, NULL, NULL, NULL, 1404, NULL),
(1149, 1, 1, '2014-06-30 22:57:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1404),
(1150, 5, 30, '2014-06-30 22:57:53', NULL, NULL, NULL, NULL, NULL, NULL, 1405, NULL),
(1151, 1, 3, '2014-06-30 22:57:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1405),
(1152, 4, 6, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, 1420, NULL),
(1153, 7, 1, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1420),
(1154, 4, 6, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, 1421, NULL),
(1155, 7, 1, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1421),
(1156, 4, 18, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, 1422, NULL),
(1157, 7, 1, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1422),
(1158, 4, 12, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, 1423, NULL),
(1159, 7, 1, '2014-07-01 19:35:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1423),
(1160, 1, 24, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 1406, NULL),
(1161, 4, 2, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1406),
(1162, 1, 12, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 1407, NULL),
(1163, 4, 1, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1407),
(1164, 1, 6, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 1408, NULL),
(1165, 4, 1, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1408),
(1166, 1, 6, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 1409, NULL),
(1167, 4, 1, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1409),
(1168, 1, 12, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, 1410, NULL),
(1169, 4, 1, '2014-07-01 23:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1410),
(1170, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1411, NULL),
(1171, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1411),
(1172, 1, 12, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1412, NULL),
(1173, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1412),
(1174, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1413, NULL),
(1175, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1413),
(1176, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1414, NULL),
(1177, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1414),
(1178, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1415, NULL),
(1179, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1415),
(1180, 1, 12, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1416, NULL),
(1181, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1416),
(1182, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1417, NULL),
(1183, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1417),
(1184, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1418, NULL),
(1185, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1418),
(1186, 1, 6, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, 1419, NULL),
(1187, 4, 1, '2014-07-01 23:46:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1419),
(1188, 1, 12, '2014-07-01 23:51:05', NULL, NULL, NULL, NULL, NULL, NULL, 1424, NULL),
(1189, 4, 1, '2014-07-01 23:51:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1424),
(1190, 4, 6, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1427, NULL),
(1191, 1, 1, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1427),
(1192, 4, 18, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1429, NULL),
(1193, 1, 1, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1429),
(1194, 4, 30, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1430, NULL),
(1195, 1, 3, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1430),
(1196, 4, 6, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1431, NULL),
(1197, 1, 1, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1431),
(1198, 4, 6, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1432, NULL),
(1199, 1, 1, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1432),
(1200, 4, 12, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, 1433, NULL),
(1201, 1, 1, '2014-07-02 21:42:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1433),
(1202, 1, 6, '2014-07-02 22:08:11', NULL, NULL, NULL, NULL, NULL, NULL, 1434, NULL),
(1203, 7, 1, '2014-07-02 22:08:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1434),
(1204, 1, 6, '2014-07-02 22:08:11', NULL, NULL, NULL, NULL, NULL, NULL, 1435, NULL),
(1205, 7, 1, '2014-07-02 22:08:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1435),
(1206, 1, 6, '2014-07-02 22:08:22', NULL, NULL, NULL, NULL, NULL, NULL, 1440, NULL),
(1207, 7, 1, '2014-07-02 22:08:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1440),
(1208, 1, 6, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, 1426, NULL),
(1209, 4, 1, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1426),
(1210, 1, 12, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, 1436, NULL),
(1211, 4, 1, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1436),
(1212, 1, 30, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, 1437, NULL),
(1213, 4, 3, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1437),
(1214, 1, 24, '2014-07-02 22:09:15', NULL, NULL, NULL, NULL, NULL, NULL, 1438, NULL),
(1215, 4, 2, '2014-07-02 22:09:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1438),
(1216, 1, 6, '2014-07-02 22:09:16', NULL, NULL, NULL, NULL, NULL, NULL, 1439, NULL),
(1217, 4, 1, '2014-07-02 22:09:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1439),
(1218, 1, 3, '2014-07-02 22:09:16', NULL, NULL, NULL, NULL, NULL, NULL, 1441, NULL),
(1219, 4, 1, '2014-07-02 22:09:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1441),
(1220, 7, 6, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1442, NULL),
(1221, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1442),
(1222, 7, 12, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1443, NULL),
(1223, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1443),
(1224, 7, 6, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1444, NULL),
(1225, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1444),
(1226, 7, 6, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1445, NULL),
(1227, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1445),
(1228, 7, 6, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1446, NULL),
(1229, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1446),
(1230, 7, 6, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, 1447, NULL),
(1231, 4, 1, '2014-07-03 14:29:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1447),
(1232, 4, 3, '2014-07-03 17:19:09', NULL, NULL, NULL, NULL, NULL, NULL, 1453, NULL),
(1233, 7, 1, '2014-07-03 17:19:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1453),
(1234, 4, 12, '2014-07-03 19:30:37', NULL, NULL, NULL, NULL, NULL, NULL, 1448, NULL),
(1235, 7, 1, '2014-07-03 19:30:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1448),
(1236, 4, 12, '2014-07-03 19:30:38', NULL, NULL, NULL, NULL, NULL, NULL, 1449, NULL),
(1237, 7, 1, '2014-07-03 19:30:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1449),
(1238, 4, 12, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1450, NULL),
(1239, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1450),
(1240, 4, 12, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1451, NULL),
(1241, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1451),
(1242, 4, 12, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1452, NULL),
(1243, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1452),
(1244, 4, 6, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1458, NULL),
(1245, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1458),
(1246, 4, 6, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1459, NULL),
(1247, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1459),
(1248, 4, 12, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1460, NULL),
(1249, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1460),
(1250, 4, 12, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, 1461, NULL),
(1251, 7, 1, '2014-07-03 19:30:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1461),
(1252, 7, 6, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, 1454, NULL),
(1253, 1, 1, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1454),
(1254, 7, 6, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, 1455, NULL);
INSERT INTO `xp_log` (`id`, `player_id`, `xp`, `created`, `activity_id`, `activity_id_reviewed`, `event_id_joined`, `event_id_completed`, `event_task_id`, `event_task_id_reviewed`, `log_id`, `log_id_reviewed`) VALUES
(1255, 1, 1, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1455),
(1256, 7, 12, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, 1456, NULL),
(1257, 1, 1, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1456),
(1258, 7, 3, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, 1457, NULL),
(1259, 1, 1, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1457),
(1260, 7, 6, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, 1462, NULL),
(1261, 1, 1, '2014-07-03 20:48:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1462),
(1262, 7, 6, '2014-07-03 20:48:50', NULL, NULL, NULL, NULL, NULL, NULL, 1463, NULL),
(1263, 1, 1, '2014-07-03 20:48:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1463),
(1264, 7, 6, '2014-07-03 20:48:50', NULL, NULL, NULL, NULL, NULL, NULL, 1464, NULL),
(1265, 1, 1, '2014-07-03 20:48:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1464),
(1266, 4, 3, '2014-07-04 21:28:58', NULL, NULL, NULL, NULL, NULL, NULL, 1467, NULL),
(1267, 1, 1, '2014-07-04 21:28:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1467),
(1268, 1, 24, '2014-07-04 21:31:35', NULL, NULL, NULL, NULL, NULL, NULL, 1466, NULL),
(1269, 7, 2, '2014-07-04 21:31:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1466),
(1270, 1, 3, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, 1468, NULL),
(1271, 7, 1, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1468),
(1272, 4, 12, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, 1469, NULL),
(1273, 7, 1, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1469),
(1274, 7, 1, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1469),
(1275, 4, 12, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, 1470, NULL),
(1276, 7, 1, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1470),
(1277, 7, 1, '2014-07-04 21:31:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1470),
(1278, 4, 60, '2014-07-04 21:45:21', NULL, NULL, NULL, NULL, NULL, NULL, 1472, NULL),
(1279, 7, 6, '2014-07-04 21:45:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1472),
(1280, 3, 3, '2014-07-04 21:49:04', NULL, NULL, NULL, NULL, NULL, NULL, 1473, NULL),
(1281, 7, 1, '2014-07-04 21:49:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1473),
(1282, 7, 3, '2014-07-04 21:49:19', NULL, NULL, NULL, NULL, NULL, NULL, 1471, NULL),
(1283, 1, 1, '2014-07-04 21:49:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1471),
(1284, 3, 12, '2014-07-04 21:50:30', NULL, NULL, NULL, NULL, NULL, NULL, 1474, NULL),
(1285, 7, 1, '2014-07-04 21:50:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1474),
(1286, 3, 12, '2014-07-04 21:50:30', NULL, NULL, NULL, NULL, NULL, NULL, 1475, NULL),
(1287, 7, 1, '2014-07-04 21:50:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1475),
(1288, 1, 12, '2014-07-04 21:51:17', NULL, NULL, NULL, NULL, NULL, NULL, 1465, NULL),
(1289, 4, 1, '2014-07-04 21:51:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1465),
(1290, 4, 1, '2014-07-04 21:51:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1465),
(1291, 9, 147, '2014-07-06 22:21:38', NULL, NULL, NULL, NULL, NULL, NULL, 1484, NULL),
(1292, 20, 14, '2014-07-06 22:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1484),
(1293, 9, 147, '2014-07-06 22:21:39', NULL, NULL, NULL, NULL, NULL, NULL, 1485, NULL),
(1294, 20, 14, '2014-07-06 22:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1485),
(1295, 9, 38, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, 1486, NULL),
(1296, 20, 1, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1486),
(1297, 21, 1, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1486),
(1298, 9, 38, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, 1487, NULL),
(1299, 20, 1, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1487),
(1300, 21, 1, '2014-07-06 22:24:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1487),
(1301, 9, 38, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, 1488, NULL),
(1302, 20, 3, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1488),
(1303, 21, 3, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1488),
(1304, 9, 38, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, 1489, NULL),
(1305, 20, 3, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1489),
(1306, 21, 3, '2014-07-06 22:24:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1489),
(1307, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1481, NULL),
(1308, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1481),
(1309, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1483, NULL),
(1310, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1483),
(1311, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1479, NULL),
(1312, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1479),
(1313, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1480, NULL),
(1314, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1480),
(1315, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1482, NULL),
(1316, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1482),
(1317, 1, 24, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1490, NULL),
(1318, 5, 2, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1490),
(1319, 1, 48, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1491, NULL),
(1320, 5, 4, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1491),
(1321, 1, 48, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, 1492, NULL),
(1322, 5, 4, '2014-08-09 20:22:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1492),
(1323, 5, 40, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, 1495, NULL),
(1324, 1, 4, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1495),
(1325, 5, 40, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, 1497, NULL),
(1326, 1, 4, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1497),
(1327, 5, 40, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, 1496, NULL),
(1328, 1, 4, '2014-08-09 20:24:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1496);

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards`
--
DROP TABLE IF EXISTS `activity_leaderboards`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards` AS select count(0) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name` from (`log` join `player` on((`player`.`id` = `log`.`player_id`))) where (`log`.`accepted` is not null) group by `log`.`player_id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_last_month`
--
DROP TABLE IF EXISTS `activity_leaderboards_last_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_last_month` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval ((dayofmonth(curdate()) + dayofmonth(last_day(curdate()))) - 1) day)) and (`log`.`acquired` < (curdate() - interval (dayofmonth(curdate()) - 1) day)) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_last_week`
--
DROP TABLE IF EXISTS `activity_leaderboards_last_week`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_last_week` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofweek(curdate()) + 6) day)) and (`log`.`acquired` < (curdate() - interval (dayofweek(curdate()) - 1) day)) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_this_month`
--
DROP TABLE IF EXISTS `activity_leaderboards_this_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_this_month` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofmonth(curdate()) - 1) day)) and (`log`.`acquired` <= curdate()) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_this_week`
--
DROP TABLE IF EXISTS `activity_leaderboards_this_week`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_this_week` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofweek(curdate()) - 1) day)) and (`log`.`acquired` <= curdate()) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_ranking`
--
DROP TABLE IF EXISTS `activity_ranking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_ranking` AS select count(0) AS `count`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name` from (`log` join `player` on((`player`.`id` = `log`.`player_id`))) group by `log`.`player_id` order by count(0) desc;

-- --------------------------------------------------------

--
-- Structure for view `badge_activity_progress`
--
DROP TABLE IF EXISTS `badge_activity_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_activity_progress` AS select `player`.`id` AS `player_id`,`badge`.`id` AS `badge_id`,`ar`.`id` AS `activity_requisite_id`,`ar`.`activity_id` AS `activity_id`,coalesce((select sum(`ars`.`times`) from `activity_requisite_summary` `ars` where ((`ars`.`activity_requisite_id` = `ar`.`id`) and (`ars`.`player_id` = `player`.`id`))),0) AS `activities_completed`,coalesce(`ar`.`count`,0) AS `activities_required` from ((`player` join `badge`) left join `activity_requisite` `ar` on((`ar`.`badge_id` = `badge`.`id`))) group by `player`.`id`,`ar`.`badge_id`,`activity_requisite_id` order by `player`.`id`,`badge_id`,`activity_requisite_id`;

-- --------------------------------------------------------

--
-- Structure for view `badge_claimed`
--
DROP TABLE IF EXISTS `badge_claimed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_claimed` AS select `player`.`id` AS `player_id`,`badge`.`id` AS `badge_id`,(`badge_log`.`id` is not null) AS `claimed` from ((`player` join `badge`) left join `badge_log` on(((`badge_log`.`player_id` = `player`.`id`) and (`badge_log`.`badge_id` = `badge`.`id`))));

-- --------------------------------------------------------

--
-- Structure for view `calendar_log`
--
DROP TABLE IF EXISTS `calendar_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calendar_log` AS select count(0) AS `coins`,`log`.`player_id` AS `player_id`,`log`.`acquired` AS `acquired`,`log`.`domain_id` AS `domain_id`,`log`.`activity_id` AS `activity_id` from `log` group by `log`.`activity_id`,`log`.`player_id`,`log`.`acquired` order by `log`.`acquired`,`log`.`player_id`;

-- --------------------------------------------------------

--
-- Structure for view `different_activities_completed`
--
DROP TABLE IF EXISTS `different_activities_completed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `different_activities_completed` AS select count(distinct `log`.`activity_id`) AS `different_activities_completed`,`log`.`domain_id` AS `domain_id`,`domain`.`name` AS `domain_name`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name`,`log`.`player_id_owner` AS `player_id_owner` from (((`log` join `player` on((`player`.`id` = `log`.`player_id`))) join `activity` on((`activity`.`id` = `log`.`activity_id`))) join `domain` on((`domain`.`id` = `activity`.`domain_id`))) where ((`log`.`reviewed` is not null) and (`activity`.`inactive` = 0)) group by `log`.`player_id`,`log`.`domain_id` order by `log`.`player_id`,`log`.`domain_id`;

-- --------------------------------------------------------

--
-- Structure for view `domain_activities_count`
--
DROP TABLE IF EXISTS `domain_activities_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `domain_activities_count` AS select `activity`.`domain_id` AS `domain_id`,`activity`.`player_id_owner` AS `player_id_owner`,count(0) AS `count` from `activity` where (`activity`.`inactive` = 0) group by `activity`.`domain_id`,`activity`.`player_id_owner` order by `activity`.`domain_id`;

-- --------------------------------------------------------

--
-- Structure for view `event_activity_progress`
--
DROP TABLE IF EXISTS `event_activity_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_activity_progress` AS select `log`.`player_id` AS `player_id`,`log`.`event_id` AS `event_id`,`log`.`activity_id` AS `activity_id`,count(0) AS `times_obtained`,`event_activity`.`count` AS `times_required`,floor(((count(0) / `event_activity`.`count`) * 100)) AS `progress` from (`log` left join `event_activity` on(((`event_activity`.`event_id` = `log`.`event_id`) and (`event_activity`.`activity_id` = `log`.`activity_id`)))) where ((`log`.`reviewed` is not null) and (`log`.`event_id` is not null)) group by `log`.`player_id`,`log`.`event_id`,`log`.`activity_id`;

-- --------------------------------------------------------

--
-- Structure for view `last_week_logs`
--
DROP TABLE IF EXISTS `last_week_logs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_week_logs` AS select `activity`.`id` AS `activity_id`,concat((select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 1 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 2 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 3 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 4 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 5 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 6 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 7 day))))) AS `logs` from `activity` where (`activity`.`inactive` = 0) order by `activity`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `player_activity_summary`
--
DROP TABLE IF EXISTS `player_activity_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_activity_summary` AS select `log`.`player_id` AS `player_id`,`player`.`name` AS `player_name`,count(0) AS `count`,`log`.`activity_id` AS `activity_id`,`log`.`reviewed` AS `log_reviewed`,`activity`.`name` AS `activity_name`,`activity`.`description` AS `activity_description`,`domain`.`id` AS `domain_id`,`domain`.`name` AS `domain_name`,`domain`.`abbr` AS `domain_abbr`,`domain`.`color` AS `domain_color` from (((`log` join `activity` on((`activity`.`id` = `log`.`activity_id`))) join `player` on((`player`.`id` = `log`.`player_id`))) join `domain` on((`domain`.`id` = `activity`.`domain_id`))) where ((`activity`.`inactive` = 0) and (`log`.`accepted` is not null)) group by `log`.`activity_id`,`log`.`player_id` order by `log`.`player_id`,`activity`.`domain_id`,`activity`.`name`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_log`
--
ALTER TABLE `access_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
 ADD PRIMARY KEY (`id`), ADD KEY `activity_domain_id` (`domain_id`), ADD KEY `activity_reported` (`reported`) USING BTREE, ADD KEY `fk_activity_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `activity_requisite`
--
ALTER TABLE `activity_requisite`
 ADD PRIMARY KEY (`id`), ADD KEY `prerequisite_badge_id` (`badge_id`), ADD KEY `prerequisite_activity_id` (`activity_id`);

--
-- Indexes for table `activity_requisite_summary`
--
ALTER TABLE `activity_requisite_summary`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`badge_id`,`player_id`,`activity_requisite_id`), ADD KEY `fk_activity_requisite_summary_activity_requisite_id` (`activity_requisite_id`), ADD KEY `fk_activity_requisite_summary_player_id` (`player_id`);

--
-- Indexes for table `activity_requisite_tag`
--
ALTER TABLE `activity_requisite_tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_activity_requisite_tag_tag_id` (`tag_id`), ADD KEY `fk_activity_requisite_tag_activity_requisite_id` (`activity_requisite_id`);

--
-- Indexes for table `badge`
--
ALTER TABLE `badge`
 ADD PRIMARY KEY (`id`), ADD KEY `badge_domain_id` (`domain_id`), ADD KEY `badge_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `badge_log`
--
ALTER TABLE `badge_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`badge_id`,`player_id`) USING HASH, ADD KEY `fk_badge_log_player_id` (`player_id`), ADD KEY `fk_badge_log_domain_id` (`domain_id`);

--
-- Indexes for table `badge_requisite`
--
ALTER TABLE `badge_requisite`
 ADD PRIMARY KEY (`id`), ADD KEY `badge_requisite_badge_id` (`badge_id`), ADD KEY `badge_requisite_badge_id_requisite` (`badge_id_requisite`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key_idx` (`key`) USING HASH;

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_domain_player_type_id` (`player_type_id`), ADD KEY `fk_domain_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_event_type_id` (`event_type_id`), ADD KEY `event_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `event_activity`
--
ALTER TABLE `event_activity`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_activity_event_id` (`event_id`), ADD KEY `fk_event_activity_activity_id` (`activity_id`);

--
-- Indexes for table `event_complete_log`
--
ALTER TABLE `event_complete_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_id`,`player_id`), ADD KEY `fk_event_completed_log_player_id` (`player_id`);

--
-- Indexes for table `event_join_log`
--
ALTER TABLE `event_join_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_id`,`player_id`), ADD KEY `fk_event_join_log_player_id` (`player_id`);

--
-- Indexes for table `event_task`
--
ALTER TABLE `event_task`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_task_event_id` (`event_id`);

--
-- Indexes for table `event_task_log`
--
ALTER TABLE `event_task_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_task_id`,`player_id`), ADD KEY `fk_event_task_log_player_id` (`player_id`), ADD KEY `fk_event_task_log_event_id` (`event_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_hash` (`hash`) USING HASH, ADD KEY `fk_log_event_id` (`event_id`), ADD KEY `fk_activity_activity_id` (`activity_id`) USING BTREE, ADD KEY `fk_log_player_idx` (`player_id`) USING BTREE, ADD KEY `fk_log_domain_idx` (`domain_id`) USING BTREE, ADD KEY `fk_log_player_id_owner` (`player_id_owner`), ADD KEY `fk_log_player_id_pair` (`player_id_pair`);

--
-- Indexes for table `log_tag`
--
ALTER TABLE `log_tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_log_tag_tag_id` (`tag_id`), ADD KEY `unique` (`log_id`,`tag_id`);

--
-- Indexes for table `log_votes`
--
ALTER TABLE `log_votes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`log_id`,`player_id`), ADD KEY `fk_log_vote_player_id` (`player_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_notification_player_id` (`player_id`) USING HASH, ADD KEY `fk_notification_player_id_sender` (`player_id_sender`) USING HASH;

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_verification_hash` (`hash`) USING HASH, ADD KEY `fk_player_type_id` (`player_type_id`), ADD KEY `fk_player_team_id` (`team_id`);

--
-- Indexes for table `player_type`
--
ALTER TABLE `player_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tag_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_team_player_id_scrummaster` (`player_id_owner`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_timeline_player_id` (`player_id`), ADD KEY `fk_timeline_activity_id` (`activity_id`), ADD KEY `fk_timeline_badge_id` (`badge_id`), ADD KEY `fk_timeline_domain_id` (`domain_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `min_level` (`min_level`) USING BTREE;

--
-- Indexes for table `xp_log`
--
ALTER TABLE `xp_log`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_xp_log_activity_id` (`activity_id`), ADD KEY `fk_xp_log_activity_id_reviewed` (`activity_id_reviewed`), ADD KEY `fk_xp_log_event_id_completed` (`event_id_completed`), ADD KEY `fk_xp_log_event_task_id` (`event_task_id`), ADD KEY `fk_xp_log_event_task_id_reviewed` (`event_task_id_reviewed`), ADD KEY `fk_xp_log_player_id` (`player_id`), ADD KEY `fk_xp_log_log_id` (`log_id`), ADD KEY `fk_xp_log_log_id_reviewed` (`log_id_reviewed`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_log`
--
ALTER TABLE `access_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=668;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `activity_requisite`
--
ALTER TABLE `activity_requisite`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT for table `activity_requisite_summary`
--
ALTER TABLE `activity_requisite_summary`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1674;
--
-- AUTO_INCREMENT for table `activity_requisite_tag`
--
ALTER TABLE `activity_requisite_tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `badge_log`
--
ALTER TABLE `badge_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `badge_requisite`
--
ALTER TABLE `badge_requisite`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domain`
--
ALTER TABLE `domain`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_activity`
--
ALTER TABLE `event_activity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_complete_log`
--
ALTER TABLE `event_complete_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_join_log`
--
ALTER TABLE `event_join_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_task`
--
ALTER TABLE `event_task`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_task_log`
--
ALTER TABLE `event_task_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1500;
--
-- AUTO_INCREMENT for table `log_tag`
--
ALTER TABLE `log_tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=332;
--
-- AUTO_INCREMENT for table `log_votes`
--
ALTER TABLE `log_votes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1381;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `player_type`
--
ALTER TABLE `player_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=771;
--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `xp_log`
--
ALTER TABLE `xp_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1329;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `activity`
--
ALTER TABLE `activity`
ADD CONSTRAINT `activity_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
ADD CONSTRAINT `fk_activity_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `activity_requisite`
--
ALTER TABLE `activity_requisite`
ADD CONSTRAINT `prerequisite_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
ADD CONSTRAINT `prerequisite_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`);

--
-- Limitadores para a tabela `activity_requisite_summary`
--
ALTER TABLE `activity_requisite_summary`
ADD CONSTRAINT `fk_activity_requisite_summary_activity_requisite_id` FOREIGN KEY (`activity_requisite_id`) REFERENCES `activity_requisite` (`id`),
ADD CONSTRAINT `fk_activity_requisite_summary_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`),
ADD CONSTRAINT `fk_activity_requisite_summary_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `activity_requisite_tag`
--
ALTER TABLE `activity_requisite_tag`
ADD CONSTRAINT `fk_activity_requisite_tag_activity_requisite_id` FOREIGN KEY (`activity_requisite_id`) REFERENCES `activity_requisite` (`id`),
ADD CONSTRAINT `fk_activity_requisite_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Limitadores para a tabela `badge`
--
ALTER TABLE `badge`
ADD CONSTRAINT `badge_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
ADD CONSTRAINT `badge_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `badge_log`
--
ALTER TABLE `badge_log`
ADD CONSTRAINT `fk_badge_log_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`),
ADD CONSTRAINT `fk_badge_log_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
ADD CONSTRAINT `fk_badge_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `badge_requisite`
--
ALTER TABLE `badge_requisite`
ADD CONSTRAINT `badge_requisite_badge_id` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`),
ADD CONSTRAINT `badge_requisite_badge_id_requisite` FOREIGN KEY (`badge_id_requisite`) REFERENCES `badge` (`id`);

--
-- Limitadores para a tabela `domain`
--
ALTER TABLE `domain`
ADD CONSTRAINT `fk_domain_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`),
ADD CONSTRAINT `fk_domain_player_type_id` FOREIGN KEY (`player_type_id`) REFERENCES `player_type` (`id`);

--
-- Limitadores para a tabela `event`
--
ALTER TABLE `event`
ADD CONSTRAINT `event_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`),
ADD CONSTRAINT `fk_event_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`);

--
-- Limitadores para a tabela `event_activity`
--
ALTER TABLE `event_activity`
ADD CONSTRAINT `fk_event_activity_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
ADD CONSTRAINT `fk_event_activity_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Limitadores para a tabela `event_complete_log`
--
ALTER TABLE `event_complete_log`
ADD CONSTRAINT `fk_event_completed_log_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
ADD CONSTRAINT `fk_event_completed_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `event_join_log`
--
ALTER TABLE `event_join_log`
ADD CONSTRAINT `fk_event_join_log_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
ADD CONSTRAINT `fk_event_join_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `event_task`
--
ALTER TABLE `event_task`
ADD CONSTRAINT `fk_event_task_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Limitadores para a tabela `event_task_log`
--
ALTER TABLE `event_task_log`
ADD CONSTRAINT `fk_event_task_log_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
ADD CONSTRAINT `fk_event_task_log_event_task_id` FOREIGN KEY (`event_task_id`) REFERENCES `event_task` (`id`),
ADD CONSTRAINT `fk_event_task_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `log`
--
ALTER TABLE `log`
ADD CONSTRAINT `fk_log_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
ADD CONSTRAINT `fk_log_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
ADD CONSTRAINT `fk_log_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`),
ADD CONSTRAINT `fk_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `fk_log_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`),
ADD CONSTRAINT `fk_log_player_id_pair` FOREIGN KEY (`player_id_pair`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `log_tag`
--
ALTER TABLE `log_tag`
ADD CONSTRAINT `fk_log_tag_log_id` FOREIGN KEY (`log_id`) REFERENCES `log` (`id`),
ADD CONSTRAINT `fk_log_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);

--
-- Limitadores para a tabela `log_votes`
--
ALTER TABLE `log_votes`
ADD CONSTRAINT `fk_log_vote_log_id` FOREIGN KEY (`log_id`) REFERENCES `log` (`id`),
ADD CONSTRAINT `fk_log_vote_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `player`
--
ALTER TABLE `player`
ADD CONSTRAINT `fk_player_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
ADD CONSTRAINT `fk_player_type_id` FOREIGN KEY (`player_type_id`) REFERENCES `player_type` (`id`);

--
-- Limitadores para a tabela `tag`
--
ALTER TABLE `tag`
ADD CONSTRAINT `fk_tag_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `team`
--
ALTER TABLE `team`
ADD CONSTRAINT `fk_team_player_id_owner` FOREIGN KEY (`player_id_owner`) REFERENCES `player` (`id`);

--
-- Limitadores para a tabela `xp_log`
--
ALTER TABLE `xp_log`
ADD CONSTRAINT `fk_xp_log_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
ADD CONSTRAINT `fk_xp_log_activity_id_reviewed` FOREIGN KEY (`activity_id_reviewed`) REFERENCES `activity` (`id`),
ADD CONSTRAINT `fk_xp_log_event_id_completed` FOREIGN KEY (`event_id_completed`) REFERENCES `event` (`id`),
ADD CONSTRAINT `fk_xp_log_event_task_id` FOREIGN KEY (`event_task_id`) REFERENCES `event_task` (`id`),
ADD CONSTRAINT `fk_xp_log_event_task_id_reviewed` FOREIGN KEY (`event_task_id_reviewed`) REFERENCES `event_task` (`id`),
ADD CONSTRAINT `fk_xp_log_log_id` FOREIGN KEY (`log_id`) REFERENCES `log` (`id`),
ADD CONSTRAINT `fk_xp_log_log_id_reviewed` FOREIGN KEY (`log_id_reviewed`) REFERENCES `log` (`id`),
ADD CONSTRAINT `fk_xp_log_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);
--
-- Database: `agileleagues_test`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_tag_to_logs_with_activity`(
	_activity_id INT,
	_tag_id INT
)
    MODIFIES SQL DATA
BEGIN 
		
	DECLARE _id INT UNSIGNED DEFAULT NULL;
	DECLARE _done INT DEFAULT FALSE;
	DECLARE _cursor CURSOR FOR 
		SELECT id FROM log WHERE log.activity_id = _activity_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE;

	OPEN _cursor;

	  	read_loop: LOOP
	    	FETCH _cursor INTO _id;
	    
	    IF _done THEN
	    	LEAVE read_loop;
	    END IF;
	   
	    INSERT INTO log_tag SET log_id = _id, tag_id = _tag_id;

		END LOOP;

	CLOSE _cursor;


END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `player_level`(
	_xp INT(10) UNSIGNED
) RETURNS int(10) unsigned
    NO SQL
BEGIN

	RETURN FLOOR(1 + 0.0464159 * POW(_xp, 2/3));

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `access_log`
--

CREATE TABLE IF NOT EXISTS `access_log` (
`id` int(10) unsigned NOT NULL,
  `plugin` varchar(10) DEFAULT NULL,
  `controller` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `params` text,
  `post` text,
  `get` text,
  `player_id` int(10) unsigned NOT NULL
) ENGINE=ARCHIVE  DEFAULT CHARSET=latin1 AUTO_INCREMENT=788 ;

--
-- Extraindo dados da tabela `access_log`
--

INSERT INTO `access_log` (`id`, `plugin`, `controller`, `action`, `params`, `post`, `get`, `player_id`) VALUES
(668, NULL, 'players', 'invite', '[]', '[]', '[]', 5),
(669, NULL, 'players', 'invite', '[]', '[]', '[]', 1),
(670, NULL, 'players', 'invite', '[]', '{"Player":{"name":"","email":"email@email.com","team_id":"1"}}', '[]', 5),
(671, NULL, 'players', 'invite', '[]', '{"Player":{"name":"Player name","email":"email@email.com","team_id":"1"}}', '[]', 5),
(672, NULL, 'players', 'team', '["1"]', '[]', '[]', 1),
(673, NULL, 'players', 'invited', '[]', '[]', '[]', 5),
(674, NULL, 'players', 'index', '[]', '[]', '[]', 1),
(675, NULL, 'players', 'login', '[]', '[]', '[]', 1),
(676, NULL, 'players', 'myaccount', '[]', '[]', '[]', 5),
(677, NULL, 'players', 'myaccount', '[]', '{"Player":{"id":"1","password":"654321","repeat_password":"654321"}}', '[]', 5),
(678, NULL, 'players', 'myaccount', '[]', '{"Player":{"id":"1","password":"654321","repeat_password":"123456"}}', '[]', 5),
(679, NULL, 'players', 'logout', '[]', '[]', '[]', 1),
(680, NULL, 'tags', 'add', '[]', '[]', '[]', 1),
(681, NULL, 'tags', 'index', '[]', '[]', '[]', 5),
(682, NULL, 'tags', 'inactivate', '["0"]', '[]', '[]', 5),
(683, NULL, 'tags', 'inactivate', '["1"]', '[]', '[]', 5),
(684, NULL, 'tags', 'add', '[]', '[]', '[]', 5),
(685, NULL, 'tags', 'add', '[]', '{"Tag":{"name":"name new tag","description":"blablabla","color":"#123265","new":"0"}}', '[]', 5),
(686, NULL, 'tags', 'add', '[]', '{"Tag":{"name":"","description":"blablabla","color":"#123265","new":"0"}}', '[]', 5),
(687, NULL, 'tags', 'edit', '["1"]', '[]', '[]', 5),
(688, NULL, 'tags', 'edit', '["1"]', '{"Tag":{"id":1,"name":"name changed","description":""}}', '[]', 5),
(689, NULL, 'tags', 'edit', '["1"]', '{"Tag":{"id":1,"name":"","description":""}}', '[]', 5),
(690, NULL, 'events', 'complete', '["1"]', '[]', '[]', 1),
(691, NULL, 'events', 'complete', '["0"]', '[]', '[]', 1),
(692, NULL, 'events', 'notReviewed', '[]', '[]', '[]', 5),
(693, NULL, 'events', 'deleteTask', '["0"]', '[]', '[]', 2),
(694, NULL, 'events', 'review', '["0"]', '[]', '[]', 2),
(695, NULL, 'events', 'review', '["4"]', '[]', '[]', 2),
(696, NULL, 'events', 'deleteTask', '["7"]', '[]', '[]', 2),
(697, NULL, 'events', 'pending', '[]', '[]', '[]', 2),
(698, NULL, 'events', 'report', '[]', '[]', '[]', 1),
(699, NULL, 'events', 'report', '[]', '{"EventTaskLog":{"event_id":"1","event_task_id":"1"}}', '[]', 1),
(700, NULL, 'events', 'create', '[]', '[]', '[]', 1),
(701, NULL, 'events', 'create', '[]', '[]', '[]', 5),
(702, NULL, 'events', 'create', '[]', '{"Event":{"event_type_id":"1","name":"Mission","description":"Description","start":{"month":"04","day":"05","year":"2014"},"end":{"month":"04","day":"12","year":"2014"}},"EventTask":[{"name":"Task Name 1","description":"Task Description 1","xp":4},{"name":"Task Name 2","description":"Task Description 2","xp":8},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""}],"EventActivity":[{"activity_id":"9","count":""},{"activity_id":"9","count":"10"},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""}]}', '[]', 5),
(703, NULL, 'events', 'create', '[]', '{"Event":{"name":""},"EventTask":[],"EventActivity":[]}', '[]', 5),
(704, NULL, 'events', 'edit', '["6"]', '[]', '[]', 5),
(705, NULL, 'events', 'edit', '["0"]', '[]', '[]', 5),
(706, NULL, 'events', 'edit', '["1"]', '{"Event":{"id":1,"event_type_id":"1","name":"Mission","description":"Description","start":{"month":"04","day":"05","year":"2014"},"end":{"month":"04","day":"12","year":"2014"}},"EventTask":[{"name":"Task Name 1","description":"Task Description 1","xp":4},{"name":"Task Name 2","description":"Task Description 2","xp":3},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""},{"name":"","description":"","xp":""}],"EventActivity":[{"activity_id":"9","count":""},{"activity_id":"9","count":"10"},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""}]}', '[]', 5),
(707, NULL, 'events', 'index', '[]', '[]', '[]', 1),
(708, NULL, 'events', 'details', '["6"]', '[]', '[]', 1),
(709, NULL, 'events', 'details', '["0"]', '[]', '[]', 1),
(710, NULL, 'events', 'join', '["0"]', '[]', '[]', 1),
(711, NULL, 'events', 'join', '["3"]', '[]', '[]', 1),
(712, NULL, 'events', 'join', '["6"]', '[]', '[]', 1),
(713, NULL, 'events', 'join', '["3"]', '[]', '[]', 1),
(714, NULL, 'events', 'join', '["6"]', '[]', '[]', 1),
(715, NULL, 'events', 'join', '["6"]', '[]', '[]', 1),
(716, NULL, 'activities', 'index', '[]', '[]', '[]', 1),
(717, NULL, 'activities', 'index', '[]', '[]', '[]', 6),
(718, NULL, 'activities', 'inactivate', '["0"]', '[]', '[]', 1),
(719, NULL, 'activities', 'inactivate', '["0"]', '[]', '[]', 5),
(720, NULL, 'activities', 'inactivate', '["1"]', '[]', '[]', 5),
(721, NULL, 'activities', 'report', '[]', '[]', '[]', 1),
(722, NULL, 'activities', 'report', '[]', '{"Log":{"activity_id":2,"acquired":{"day":"09","month":"09","year":"2014"},"description":["Some random and unique description"],"player_id_pair":2},"Tags":{"Tags":["1","2"]},"Event":{"id":""}}', '[]', 1),
(723, NULL, 'activities', 'report', '[]', '{"Log":{"activity_id":2,"acquired":{"day":"09","month":"09","year":"2014"},"description":["Some random and unique description 1","Some random and unique description 2",""],"player_id_pair":2},"Tags":{"Tags":["1","2"]},"Event":{"id":""}}', '[]', 1),
(724, NULL, 'activities', 'myPending', '[]', '[]', '[]', 1),
(725, NULL, 'activities', 'day', '["2014-01-01"]', '[]', '[]', 1),
(726, NULL, 'activities', 'calendar', '[]', '[]', '[]', 1),
(727, NULL, 'activities', 'edit', '["1"]', '[]', '[]', 1),
(728, NULL, 'activities', 'edit', '["1"]', '[]', '[]', 5),
(729, NULL, 'activities', 'edit', '["1"]', '{"Activity":{"id":1,"name":"name changed","acceptance_votes":"1","rejection_votes":"1"}}', '[]', 5),
(730, NULL, 'activities', 'edit', '["1"]', '{"Activity":{"id":1,"name":null}}', '[]', 5),
(731, NULL, 'activities', 'add', '[]', '[]', '[]', 5),
(732, NULL, 'activities', 'add', '[]', '{"Activity":{"name":"name new activity","domain_id":"1","description":"blablabla","acceptance_votes":"1","rejection_votes":"1"}}', '[]', 5),
(733, NULL, 'activities', 'add', '[]', '{"Activity":{"name":"some name","domain_id":"1","description":"","acceptance_votes":"0","rejection_votes":"0"}}', '[]', 5),
(734, NULL, 'activities', 'team', '[]', '[]', '[]', 1),
(735, NULL, 'activities', 'team', '[]', '{"Log":{"1838":{"rejection_comment":"some very very very long comment"},"1837":{"acceptance_comment":"some very very very long comment"},"1836":{"rejection_comment":"some very very very long comment"},"1835":{"acceptance_comment":"some very very very long comment"},"1834":{"rejection_comment":"some very very very long comment"},"1833":{"acceptance_comment":"some very very very long comment"},"1832":{"rejection_comment":"some very very very long comment"},"1831":{"acceptance_comment":"some very very very long comment"}}}', '[]', 1),
(736, NULL, 'activities', 'myActivities', '[]', '[]', '[]', 1),
(737, NULL, 'badges', 'claimed', '[]', '[]', '[]', 1),
(738, NULL, 'badges', 'claimed', '[]', '[]', '[]', 5),
(739, NULL, 'badges', 'index', '[]', '[]', '[]', 1),
(740, NULL, 'badges', 'inactivate', '["0"]', '[]', '[]', 1),
(741, NULL, 'badges', 'inactivate', '["0"]', '[]', '[]', 5),
(742, NULL, 'badges', 'inactivate', '["4"]', '[]', '[]', 5),
(743, NULL, 'badges', 'inactivate', '["4","true"]', '[]', '[]', 5),
(744, NULL, 'badges', 'claim', '["1"]', '[]', '[]', 1),
(745, NULL, 'badges', 'claim', '["0"]', '[]', '[]', 1),
(746, NULL, 'badges', 'view', '["1"]', '[]', '[]', 1),
(747, NULL, 'badges', 'add', '[]', '[]', '[]', 5),
(748, NULL, 'badges', 'add', '["1"]', '[]', '[]', 5),
(749, NULL, 'badges', 'edit', '["1","4"]', '[]', '[]', 5),
(750, NULL, 'badges', 'edit', '["1","0"]', '[]', '[]', 5),
(751, NULL, 'badges', 'add', '["1"]', '{"Badge":{"name":"Glossarier","icon":"entypo entypo-users","credly_badge_id":"","new":"1"},"BadgeRequisite":[{"badge_id_requisite":""},{"badge_id_requisite":""},{"badge_id_requisite":""},{"badge_id_requisite":""}],"ActivityRequisite":[{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""}]}', '[]', 5),
(752, NULL, 'badges', 'add', '["1"]', '{"Badge":{"name":"","icon":"entypo entypo-users","credly_badge_id":"","new":"1"},"BadgeRequisite":[{"badge_id_requisite":""},{"badge_id_requisite":""},{"badge_id_requisite":""},{"badge_id_requisite":""}],"ActivityRequisite":[{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""},{"activity_id":"","count":""}]}', '[]', 5),
(753, NULL, 'domains', 'inactivate', '["0"]', '[]', '[]', 1),
(754, NULL, 'domains', 'inactivate', '["0"]', '[]', '[]', 5),
(755, NULL, 'domains', 'inactivate', '["1"]', '[]', '[]', 5),
(756, NULL, 'domains', 'add', '[]', '[]', '[]', 1),
(757, NULL, 'domains', 'add', '[]', '[]', '[]', 5),
(758, NULL, 'domains', 'edit', '["1"]', '[]', '[]', 5),
(759, NULL, 'domains', 'edit', '["0"]', '[]', '[]', 5),
(760, NULL, 'domains', 'add', '[]', '{"Domain":{"name":"A domain","abbr":"ABBR","color":"#112233","description":"Blablablabla","icon":"icon-icon"}}', '[]', 5),
(761, NULL, 'domains', 'add', '[]', '{"Domain":{"name":"","abbr":"ABBR","color":"#112233","description":"Blablablabla","icon":"icon-icon"}}', '[]', 5),
(762, NULL, 'domains', 'index', '[]', '[]', '[]', 1),
(763, NULL, 'domains', 'index', '[]', '[]', '[]', 6),
(764, NULL, 'pages', 'display', '["home"]', '[]', '[]', 1),
(765, NULL, 'pages', 'display', '[]', '[]', '[]', 1),
(766, NULL, 'pages', 'display', '["doesnotexist","subpage"]', '[]', '[]', 1),
(767, NULL, 'pages', 'display', '["doesnotexist"]', '[]', '[]', 1),
(768, NULL, 'notifications', 'index', '[]', '[]', '[]', 5),
(769, NULL, 'notifications', 'send', '[]', '[]', '[]', 5),
(770, NULL, 'notifications', 'send', '[]', '{"Notification":{"title":"A","text":"B","type":"success","player_id":""}}', '[]', 5),
(771, NULL, 'dashboards', 'activities', '[]', '[]', '[]', 1),
(772, NULL, 'dashboards', 'activities', '["1"]', '[]', '[]', 1),
(773, NULL, 'dashboards', 'badges', '[]', '[]', '[]', 1),
(774, NULL, 'dashboards', 'leaderboards', '[]', '[]', '[]', 1),
(775, NULL, 'dashboards', 'players', '[]', '[]', '[]', 1),
(776, NULL, 'logs', 'delete', '["1918"]', '[]', '[]', 5),
(777, NULL, 'logs', 'delete', '["0"]', '[]', '[]', 5),
(778, NULL, 'teams', 'index', '[]', '[]', '[]', 1),
(779, NULL, 'teams', 'index', '[]', '[]', '[]', 5),
(780, NULL, 'teams', 'edit', '["1"]', '[]', '[]', 5),
(781, NULL, 'teams', 'edit', '["0"]', '[]', '[]', 5),
(782, NULL, 'teams', 'add', '[]', '[]', '[]', 5),
(783, NULL, 'teams', 'add', '[]', '{"Team":{"name":"A team"}}', '[]', 5),
(784, NULL, 'teams', 'add', '[]', '{"Team":{"name":"","player_id_owner":5}}', '[]', 5),
(785, NULL, 'teams', 'delete', '["0"]', '[]', '[]', 5),
(786, NULL, 'teams', 'delete', '["3"]', '[]', '[]', 5),
(787, NULL, 'teams', 'delete', '["1"]', '[]', '[]', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reported` int(10) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned NOT NULL,
  `acceptance_votes` int(10) unsigned NOT NULL DEFAULT '1',
  `rejection_votes` int(10) unsigned NOT NULL DEFAULT '1',
  `details` varchar(250) NOT NULL,
  `restrictions` varchar(250) NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_last_month`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_last_month` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_last_week`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_last_week` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_this_month`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_this_month` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_leaderboards_this_week`
--
CREATE TABLE IF NOT EXISTS `activity_leaderboards_this_week` (
`count` bigint(21)
,`player_id_owner` int(10) unsigned
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `activity_ranking`
--
CREATE TABLE IF NOT EXISTS `activity_ranking` (
`count` bigint(21)
,`player_id` int(10) unsigned
,`player_name` varchar(30)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite`
--

CREATE TABLE IF NOT EXISTS `activity_requisite` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=169 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite_summary`
--

CREATE TABLE IF NOT EXISTS `activity_requisite_summary` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `activity_requisite_id` int(10) unsigned NOT NULL,
  `times` int(10) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1674 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity_requisite_tag`
--

CREATE TABLE IF NOT EXISTS `activity_requisite_tag` (
`id` int(10) unsigned NOT NULL,
  `activity_requisite_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge`
--

CREATE TABLE IF NOT EXISTS `badge` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `domain_id` int(10) unsigned NOT NULL,
  `new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credly_badge_id` int(10) DEFAULT NULL,
  `credly_badge_name` varchar(255) DEFAULT NULL,
  `credly_badge_image_url` varchar(255) DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_activity_progress`
--
CREATE TABLE IF NOT EXISTS `badge_activity_progress` (
`player_id` int(10) unsigned
,`badge_id` int(10) unsigned
,`activity_requisite_id` int(10) unsigned
,`activity_id` int(10) unsigned
,`activities_completed` decimal(32,0)
,`activities_required` decimal(5,0)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `badge_claimed`
--
CREATE TABLE IF NOT EXISTS `badge_claimed` (
`player_id` int(10) unsigned
,`badge_id` int(10) unsigned
,`claimed` int(1)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_log`
--

CREATE TABLE IF NOT EXISTS `badge_log` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `domain_id` int(10) unsigned NOT NULL,
  `credly_given` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_requisite`
--

CREATE TABLE IF NOT EXISTS `badge_requisite` (
`id` int(10) unsigned NOT NULL,
  `badge_id` int(10) unsigned NOT NULL,
  `badge_id_requisite` int(10) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `calendar_log`
--
CREATE TABLE IF NOT EXISTS `calendar_log` (
`coins` bigint(21)
,`player_id` int(10) unsigned
,`acquired` date
,`domain_id` int(10) unsigned
,`activity_id` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
`id` int(10) unsigned NOT NULL,
  `key` varchar(30) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `different_activities_completed`
--
CREATE TABLE IF NOT EXISTS `different_activities_completed` (
`different_activities_completed` bigint(21)
,`domain_id` int(10) unsigned
,`domain_name` varchar(30)
,`player_id` int(10) unsigned
,`player_name` varchar(30)
,`player_id_owner` int(10) unsigned
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `domain`
--

CREATE TABLE IF NOT EXISTS `domain` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `color` char(7) NOT NULL,
  `abbr` char(3) NOT NULL,
  `description` varchar(200) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `player_type_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `domain_activities_count`
--
CREATE TABLE IF NOT EXISTS `domain_activities_count` (
`domain_id` int(10) unsigned
,`player_id_owner` int(10) unsigned
,`count` bigint(21)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `event`
--

CREATE TABLE IF NOT EXISTS `event` (
`id` int(10) unsigned NOT NULL,
  `event_type_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `xp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id_owner` int(10) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_activity`
--

CREATE TABLE IF NOT EXISTS `event_activity` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `event_activity_progress`
--
CREATE TABLE IF NOT EXISTS `event_activity_progress` (
`player_id` int(10) unsigned
,`event_id` int(1) unsigned
,`activity_id` int(10) unsigned
,`times_obtained` bigint(21)
,`times_required` smallint(5) unsigned
,`progress` decimal(16,0)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `event_complete_log`
--

CREATE TABLE IF NOT EXISTS `event_complete_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_join_log`
--

CREATE TABLE IF NOT EXISTS `event_join_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_task`
--

CREATE TABLE IF NOT EXISTS `event_task` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `xp` smallint(5) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_task_log`
--

CREATE TABLE IF NOT EXISTS `event_task_log` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `event_task_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed` timestamp NULL DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `level_required` smallint(5) NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `last_week_logs`
--
CREATE TABLE IF NOT EXISTS `last_week_logs` (
`activity_id` int(10) unsigned
,`logs` varbinary(153)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `player_id` int(10) unsigned NOT NULL,
  `acquired` date NOT NULL,
  `reviewed` timestamp NULL DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL,
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `event_id` int(1) unsigned DEFAULT NULL,
  `player_id_owner` int(10) unsigned NOT NULL,
  `player_id_pair` int(10) unsigned DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `rejected` timestamp NULL DEFAULT NULL,
  `acceptance_votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rejection_votes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `hash` char(64) DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1927 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_tag`
--

CREATE TABLE IF NOT EXISTS `log_tag` (
`id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=340 ;

--
-- Extraindo dados da tabela `log_tag`
--

INSERT INTO `log_tag` (`id`, `log_id`, `tag_id`) VALUES
(332, 1628, 1),
(333, 1628, 2),
(334, 1645, 1),
(335, 1645, 2),
(336, 1646, 1),
(337, 1646, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_votes`
--

CREATE TABLE IF NOT EXISTS `log_votes` (
`id` int(10) unsigned NOT NULL,
  `log_id` int(10) unsigned NOT NULL,
  `vote` smallint(5) NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `comment` varchar(250) NOT NULL DEFAULT '',
  `creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
`id` int(10) unsigned NOT NULL,
  `text` varchar(200) NOT NULL,
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `player_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(30) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'success',
  `action` varchar(10) DEFAULT NULL,
  `player_id_sender` int(10) unsigned DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1402 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player`
--

CREATE TABLE IF NOT EXISTS `player` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `player_type_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(40) NOT NULL,
  `xp` bigint(20) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hash` char(64) DEFAULT NULL,
  `verified_in` timestamp NULL DEFAULT NULL,
  `timezone` varchar(200) NOT NULL DEFAULT 'UTC',
  `credly_id` varchar(20) DEFAULT NULL,
  `credly_email` varchar(255) DEFAULT NULL,
  `credly_access_token` varchar(200) DEFAULT NULL,
  `credly_refresh_token` varchar(200) DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

--
-- Extraindo dados da tabela `player`
--

INSERT INTO `player` (`id`, `name`, `player_type_id`, `email`, `password`, `xp`, `team_id`, `created`, `hash`, `verified_in`, `timezone`, `credly_id`, `credly_email`, `credly_access_token`, `credly_refresh_token`) VALUES
(6, 'GameMaster 2', 2, 'scrummaster2@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 999, NULL, '2014-09-09 03:36:19', NULL, '2014-09-09 03:36:19', 'UTC', NULL, NULL, NULL, NULL),
(5, 'GameMaster 1', 2, 'scrummaster1@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 999, NULL, '2014-09-09 03:36:19', NULL, '2014-09-09 03:36:19', 'UTC', NULL, NULL, NULL, NULL),
(4, 'Player 4', 1, 'email3@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 100, 2, '2014-09-09 03:36:19', NULL, NULL, 'UTC', NULL, NULL, NULL, NULL),
(3, 'Player 3', 1, 'email3@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 100, 2, '2014-09-09 03:36:19', NULL, '2014-09-09 03:36:19', 'UTC', NULL, NULL, NULL, NULL),
(2, 'Player 2', 1, 'email2@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 100, 1, '2014-09-09 03:36:19', NULL, '2014-09-09 03:36:19', 'UTC', NULL, NULL, NULL, NULL),
(1, 'Player 1', 1, 'email1@email.com', '24bae80ca7f5a1fd95e9ae0388b7e79bdb9b7c0d', 500, 1, '2014-09-09 03:36:19', NULL, '2014-09-09 03:36:19', 'UTC', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `player_activity_summary`
--
CREATE TABLE IF NOT EXISTS `player_activity_summary` (
`player_id` int(10) unsigned
,`player_name` varchar(30)
,`count` bigint(21)
,`activity_id` int(10) unsigned
,`log_reviewed` timestamp
,`activity_name` varchar(30)
,`activity_description` varchar(200)
,`domain_id` int(10) unsigned
,`domain_name` varchar(30)
,`domain_abbr` char(3)
,`domain_color` char(7)
);
-- --------------------------------------------------------

--
-- Estrutura da tabela `player_type`
--

CREATE TABLE IF NOT EXISTS `player_type` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `player_type`
--

INSERT INTO `player_type` (`id`, `name`) VALUES
(2, 'Game Master'),
(1, 'Player');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `color` char(7) NOT NULL,
  `inactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `player_id_owner` int(10) unsigned NOT NULL,
  `bonus_type` char(1) NOT NULL DEFAULT '+',
  `bonus_value` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `team`
--

CREATE TABLE IF NOT EXISTS `team` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `player_id_owner` int(10) unsigned DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `team`
--

INSERT INTO `team` (`id`, `name`, `player_id_owner`) VALUES
(3, 'Team Empty', NULL),
(2, 'Team 2', 5),
(1, 'Team 1', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `what` varchar(30) NOT NULL,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `badge_id` int(10) unsigned DEFAULT NULL,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `domain_id` int(10) unsigned DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=771 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `title`
--

CREATE TABLE IF NOT EXISTS `title` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `min_level` smallint(5) unsigned NOT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `xp_log`
--

CREATE TABLE IF NOT EXISTS `xp_log` (
`id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `xp` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity_id` int(10) unsigned DEFAULT NULL,
  `activity_id_reviewed` int(10) unsigned DEFAULT NULL,
  `event_id_joined` int(10) unsigned DEFAULT NULL,
  `event_id_completed` int(10) unsigned DEFAULT NULL,
  `event_task_id` int(10) unsigned DEFAULT NULL,
  `event_task_id_reviewed` int(10) unsigned DEFAULT NULL,
  `log_id` int(10) unsigned DEFAULT NULL,
  `log_id_reviewed` int(10) unsigned DEFAULT NULL
) ENGINE=MEMORY  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1350 ;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards`
--
DROP TABLE IF EXISTS `activity_leaderboards`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards` AS select count(0) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name` from (`log` join `player` on((`player`.`id` = `log`.`player_id`))) where (`log`.`accepted` is not null) group by `log`.`player_id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_last_month`
--
DROP TABLE IF EXISTS `activity_leaderboards_last_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_last_month` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval ((dayofmonth(curdate()) + dayofmonth(last_day(curdate()))) - 1) day)) and (`log`.`acquired` < (curdate() - interval (dayofmonth(curdate()) - 1) day)) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_last_week`
--
DROP TABLE IF EXISTS `activity_leaderboards_last_week`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_last_week` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofweek(curdate()) + 6) day)) and (`log`.`acquired` < (curdate() - interval (dayofweek(curdate()) - 1) day)) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_this_month`
--
DROP TABLE IF EXISTS `activity_leaderboards_this_month`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_this_month` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofmonth(curdate()) - 1) day)) and (`log`.`acquired` <= curdate()) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_leaderboards_this_week`
--
DROP TABLE IF EXISTS `activity_leaderboards_this_week`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_leaderboards_this_week` AS select count(`log`.`id`) AS `count`,`log`.`player_id_owner` AS `player_id_owner`,`player`.`id` AS `player_id`,`player`.`name` AS `player_name` from (`player` left join `log` on(((`player`.`id` = `log`.`player_id`) and (`log`.`acquired` >= (curdate() - interval (dayofweek(curdate()) - 1) day)) and (`log`.`acquired` <= curdate()) and (`log`.`accepted` is not null)))) group by `player`.`id`,`log`.`player_id_owner` order by `count` desc;

-- --------------------------------------------------------

--
-- Structure for view `activity_ranking`
--
DROP TABLE IF EXISTS `activity_ranking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `activity_ranking` AS select count(0) AS `count`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name` from (`log` join `player` on((`player`.`id` = `log`.`player_id`))) group by `log`.`player_id` order by count(0) desc;

-- --------------------------------------------------------

--
-- Structure for view `badge_activity_progress`
--
DROP TABLE IF EXISTS `badge_activity_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_activity_progress` AS select `player`.`id` AS `player_id`,`badge`.`id` AS `badge_id`,`ar`.`id` AS `activity_requisite_id`,`ar`.`activity_id` AS `activity_id`,coalesce((select sum(`ars`.`times`) from `activity_requisite_summary` `ars` where ((`ars`.`activity_requisite_id` = `ar`.`id`) and (`ars`.`player_id` = `player`.`id`))),0) AS `activities_completed`,coalesce(`ar`.`count`,0) AS `activities_required` from ((`player` join `badge`) left join `activity_requisite` `ar` on((`ar`.`badge_id` = `badge`.`id`))) group by `player`.`id`,`ar`.`badge_id`,`activity_requisite_id` order by `player`.`id`,`badge_id`,`activity_requisite_id`;

-- --------------------------------------------------------

--
-- Structure for view `badge_claimed`
--
DROP TABLE IF EXISTS `badge_claimed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `badge_claimed` AS select `player`.`id` AS `player_id`,`badge`.`id` AS `badge_id`,(`badge_log`.`id` is not null) AS `claimed` from ((`player` join `badge`) left join `badge_log` on(((`badge_log`.`player_id` = `player`.`id`) and (`badge_log`.`badge_id` = `badge`.`id`))));

-- --------------------------------------------------------

--
-- Structure for view `calendar_log`
--
DROP TABLE IF EXISTS `calendar_log`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calendar_log` AS select count(0) AS `coins`,`log`.`player_id` AS `player_id`,`log`.`acquired` AS `acquired`,`log`.`domain_id` AS `domain_id`,`log`.`activity_id` AS `activity_id` from `log` group by `log`.`activity_id`,`log`.`player_id`,`log`.`acquired` order by `log`.`acquired`,`log`.`player_id`;

-- --------------------------------------------------------

--
-- Structure for view `different_activities_completed`
--
DROP TABLE IF EXISTS `different_activities_completed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `different_activities_completed` AS select count(distinct `log`.`activity_id`) AS `different_activities_completed`,`log`.`domain_id` AS `domain_id`,`domain`.`name` AS `domain_name`,`log`.`player_id` AS `player_id`,`player`.`name` AS `player_name`,`log`.`player_id_owner` AS `player_id_owner` from (((`log` join `player` on((`player`.`id` = `log`.`player_id`))) join `activity` on((`activity`.`id` = `log`.`activity_id`))) join `domain` on((`domain`.`id` = `activity`.`domain_id`))) where ((`log`.`reviewed` is not null) and (`activity`.`inactive` = 0)) group by `log`.`player_id`,`log`.`domain_id` order by `log`.`player_id`,`log`.`domain_id`;

-- --------------------------------------------------------

--
-- Structure for view `domain_activities_count`
--
DROP TABLE IF EXISTS `domain_activities_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `domain_activities_count` AS select `activity`.`domain_id` AS `domain_id`,`activity`.`player_id_owner` AS `player_id_owner`,count(0) AS `count` from `activity` where (`activity`.`inactive` = 0) group by `activity`.`domain_id`,`activity`.`player_id_owner` order by `activity`.`domain_id`;

-- --------------------------------------------------------

--
-- Structure for view `event_activity_progress`
--
DROP TABLE IF EXISTS `event_activity_progress`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_activity_progress` AS select `log`.`player_id` AS `player_id`,`log`.`event_id` AS `event_id`,`log`.`activity_id` AS `activity_id`,count(0) AS `times_obtained`,`event_activity`.`count` AS `times_required`,floor(((count(0) / `event_activity`.`count`) * 100)) AS `progress` from (`log` left join `event_activity` on(((`event_activity`.`event_id` = `log`.`event_id`) and (`event_activity`.`activity_id` = `log`.`activity_id`)))) where ((`log`.`reviewed` is not null) and (`log`.`event_id` is not null)) group by `log`.`player_id`,`log`.`event_id`,`log`.`activity_id`;

-- --------------------------------------------------------

--
-- Structure for view `last_week_logs`
--
DROP TABLE IF EXISTS `last_week_logs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_week_logs` AS select `activity`.`id` AS `activity_id`,concat((select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 1 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 2 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 3 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 4 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 5 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 6 day)))),',',(select count(0) from `log` where ((`log`.`activity_id` = `activity`.`id`) and (`log`.`acquired` = (curdate() - interval 7 day))))) AS `logs` from `activity` where (`activity`.`inactive` = 0) order by `activity`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `player_activity_summary`
--
DROP TABLE IF EXISTS `player_activity_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `player_activity_summary` AS select `log`.`player_id` AS `player_id`,`player`.`name` AS `player_name`,count(0) AS `count`,`log`.`activity_id` AS `activity_id`,`log`.`reviewed` AS `log_reviewed`,`activity`.`name` AS `activity_name`,`activity`.`description` AS `activity_description`,`domain`.`id` AS `domain_id`,`domain`.`name` AS `domain_name`,`domain`.`abbr` AS `domain_abbr`,`domain`.`color` AS `domain_color` from (((`log` join `activity` on((`activity`.`id` = `log`.`activity_id`))) join `player` on((`player`.`id` = `log`.`player_id`))) join `domain` on((`domain`.`id` = `activity`.`domain_id`))) where ((`activity`.`inactive` = 0) and (`log`.`accepted` is not null)) group by `log`.`activity_id`,`log`.`player_id` order by `log`.`player_id`,`activity`.`domain_id`,`activity`.`name`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_log`
--
ALTER TABLE `access_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
 ADD PRIMARY KEY (`id`), ADD KEY `activity_domain_id` (`domain_id`), ADD KEY `activity_reported` (`reported`) USING BTREE, ADD KEY `fk_activity_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `activity_requisite`
--
ALTER TABLE `activity_requisite`
 ADD PRIMARY KEY (`id`), ADD KEY `prerequisite_badge_id` (`badge_id`), ADD KEY `prerequisite_activity_id` (`activity_id`);

--
-- Indexes for table `activity_requisite_summary`
--
ALTER TABLE `activity_requisite_summary`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`badge_id`,`player_id`,`activity_requisite_id`), ADD KEY `fk_activity_requisite_summary_activity_requisite_id` (`activity_requisite_id`), ADD KEY `fk_activity_requisite_summary_player_id` (`player_id`);

--
-- Indexes for table `activity_requisite_tag`
--
ALTER TABLE `activity_requisite_tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_activity_requisite_tag_tag_id` (`tag_id`), ADD KEY `fk_activity_requisite_tag_activity_requisite_id` (`activity_requisite_id`);

--
-- Indexes for table `badge`
--
ALTER TABLE `badge`
 ADD PRIMARY KEY (`id`), ADD KEY `badge_domain_id` (`domain_id`), ADD KEY `badge_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `badge_log`
--
ALTER TABLE `badge_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`badge_id`,`player_id`) USING HASH, ADD KEY `fk_badge_log_player_id` (`player_id`), ADD KEY `fk_badge_log_domain_id` (`domain_id`);

--
-- Indexes for table `badge_requisite`
--
ALTER TABLE `badge_requisite`
 ADD PRIMARY KEY (`id`), ADD KEY `badge_requisite_badge_id` (`badge_id`), ADD KEY `badge_requisite_badge_id_requisite` (`badge_id_requisite`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `key_idx` (`key`) USING HASH;

--
-- Indexes for table `domain`
--
ALTER TABLE `domain`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_domain_player_type_id` (`player_type_id`), ADD KEY `fk_domain_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_event_type_id` (`event_type_id`), ADD KEY `event_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `event_activity`
--
ALTER TABLE `event_activity`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_activity_event_id` (`event_id`), ADD KEY `fk_event_activity_activity_id` (`activity_id`);

--
-- Indexes for table `event_complete_log`
--
ALTER TABLE `event_complete_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_id`,`player_id`), ADD KEY `fk_event_completed_log_player_id` (`player_id`);

--
-- Indexes for table `event_join_log`
--
ALTER TABLE `event_join_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_id`,`player_id`), ADD KEY `fk_event_join_log_player_id` (`player_id`);

--
-- Indexes for table `event_task`
--
ALTER TABLE `event_task`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_event_task_event_id` (`event_id`);

--
-- Indexes for table `event_task_log`
--
ALTER TABLE `event_task_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`event_task_id`,`player_id`), ADD KEY `fk_event_task_log_player_id` (`player_id`), ADD KEY `fk_event_task_log_event_id` (`event_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_hash` (`hash`) USING HASH, ADD KEY `fk_log_event_id` (`event_id`), ADD KEY `fk_activity_activity_id` (`activity_id`) USING BTREE, ADD KEY `fk_log_player_idx` (`player_id`) USING BTREE, ADD KEY `fk_log_domain_idx` (`domain_id`) USING BTREE, ADD KEY `fk_log_player_id_owner` (`player_id_owner`), ADD KEY `fk_log_player_id_pair` (`player_id_pair`);

--
-- Indexes for table `log_tag`
--
ALTER TABLE `log_tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_log_tag_tag_id` (`tag_id`), ADD KEY `unique` (`log_id`,`tag_id`);

--
-- Indexes for table `log_votes`
--
ALTER TABLE `log_votes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique` (`log_id`,`player_id`), ADD KEY `fk_log_vote_player_id` (`player_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_notification_player_id` (`player_id`) USING HASH, ADD KEY `fk_notification_player_id_sender` (`player_id_sender`) USING HASH;

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_verification_hash` (`hash`) USING HASH, ADD KEY `fk_player_type_id` (`player_type_id`), ADD KEY `fk_player_team_id` (`team_id`);

--
-- Indexes for table `player_type`
--
ALTER TABLE `player_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_tag_player_id_owner` (`player_id_owner`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_team_player_id_scrummaster` (`player_id_owner`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_timeline_player_id` (`player_id`), ADD KEY `fk_timeline_activity_id` (`activity_id`), ADD KEY `fk_timeline_badge_id` (`badge_id`), ADD KEY `fk_timeline_domain_id` (`domain_id`);

--
-- Indexes for table `title`
--
ALTER TABLE `title`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `min_level` (`min_level`) USING BTREE;

--
-- Indexes for table `xp_log`
--
ALTER TABLE `xp_log`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_xp_log_activity_id` (`activity_id`), ADD KEY `fk_xp_log_activity_id_reviewed` (`activity_id_reviewed`), ADD KEY `fk_xp_log_event_id_completed` (`event_id_completed`), ADD KEY `fk_xp_log_event_task_id` (`event_task_id`), ADD KEY `fk_xp_log_event_task_id_reviewed` (`event_task_id_reviewed`), ADD KEY `fk_xp_log_player_id` (`player_id`), ADD KEY `fk_xp_log_log_id` (`log_id`), ADD KEY `fk_xp_log_log_id_reviewed` (`log_id_reviewed`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_log`
--
ALTER TABLE `access_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=788;
--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `activity_requisite`
--
ALTER TABLE `activity_requisite`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT for table `activity_requisite_summary`
--
ALTER TABLE `activity_requisite_summary`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1674;
--
-- AUTO_INCREMENT for table `activity_requisite_tag`
--
ALTER TABLE `activity_requisite_tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `badge_log`
--
ALTER TABLE `badge_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `badge_requisite`
--
ALTER TABLE `badge_requisite`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `domain`
--
ALTER TABLE `domain`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `event_activity`
--
ALTER TABLE `event_activity`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `event_complete_log`
--
ALTER TABLE `event_complete_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `event_join_log`
--
ALTER TABLE `event_join_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `event_task`
--
ALTER TABLE `event_task`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `event_task_log`
--
ALTER TABLE `event_task_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1927;
--
-- AUTO_INCREMENT for table `log_tag`
--
ALTER TABLE `log_tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=340;
--
-- AUTO_INCREMENT for table `log_votes`
--
ALTER TABLE `log_votes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1402;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1003;
--
-- AUTO_INCREMENT for table `player_type`
--
ALTER TABLE `player_type`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=771;
--
-- AUTO_INCREMENT for table `title`
--
ALTER TABLE `title`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `xp_log`
--
ALTER TABLE `xp_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1350;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
