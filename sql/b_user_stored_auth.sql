-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 27 2011 г., 10:10
-- Версия сервера: 5.1.54
-- Версия PHP: 5.2.10-2ubuntu6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kamin_icf1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `b_user_stored_auth`
--

CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) NOT NULL,
  `TEMP_HASH` char(1) NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=517489 ;

--
-- Дамп данных таблицы `b_user_stored_auth`
--

INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
(516933, 1, '2011-04-25 21:32:48', '2011-05-09 20:19:53', 'f865ebb29921d9cb60894f5dc42c0c82', 'N', 1595570770),
(517477, 1, '2011-06-14 14:50:03', '2011-06-21 15:34:34', '9a2ecb8f5a8f6abb4a577ce38707b5ef', 'N', 2130706433),
(517478, 1, '2011-06-14 17:13:37', '2011-06-21 13:51:00', 'ae82d3c6b0648c0243af6bb4b453d28a', 'N', 2130706433),
(517479, 1, '2011-06-15 15:33:55', '2011-06-21 15:34:22', 'c61bc231acd0701d18fff9b0694f2272', 'N', 2130706433),
(517480, 1, '2011-06-17 17:55:22', '2011-06-21 12:30:43', 'cbb530aa40e6ec65d3ac7d2e544a6d06', 'N', 2130706433),
(517481, 1, '2011-06-20 13:57:40', '2011-06-21 13:54:25', 'd0dee311a47d2f01787c447a7d6e8602', 'N', 2130706433),
(517482, 1, '2011-06-20 14:16:36', '2011-06-20 15:10:10', '985415b0378c3970e7e59a2ed999b210', 'N', 3232235622),
(517483, 1, '2011-06-20 14:20:02', '2011-06-20 14:20:12', '07be960cc8dc416353fc65c71ac207f5', 'N', 3232235626),
(517487, 1, '2011-06-22 12:38:06', '2011-06-23 10:46:07', '6d3897845d4e5cd40b72871c24e0ba5e', 'N', 2130706433),
(517488, 1, '2011-06-23 10:47:48', '2011-06-24 10:31:43', 'a1245b102799418f2ac54f4373c261b4', 'N', 2130706433);
