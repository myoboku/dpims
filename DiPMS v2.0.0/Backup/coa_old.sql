-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2014 at 08:16 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `coa`
--

-- --------------------------------------------------------

--
-- Table structure for table `crops`
--

CREATE TABLE IF NOT EXISTS `crops` (
  `CropID` varchar(3) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `DataTableName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CropID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crops`
--

INSERT INTO `crops` (`CropID`, `Name`, `DataTableName`) VALUES
('RCE', 'Rice', NULL),
('WHT', 'Wheat', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE IF NOT EXISTS `disease` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`ID`, `Name`) VALUES
(1, 'Yellow Rust'),
(2, 'Brown Rust'),
(3, 'Wilt'),
(4, 'Root Rot');

-- --------------------------------------------------------

--
-- Table structure for table `diseaseremedy`
--

CREATE TABLE IF NOT EXISTS `diseaseremedy` (
  `DiseaseID` int(11) NOT NULL,
  `SeverityLowerBound` decimal(10,2) DEFAULT NULL,
  `SeverityUpperBound` decimal(10,2) DEFAULT NULL,
  `Chemical` varchar(30) DEFAULT NULL,
  `Dose` decimal(10,2) DEFAULT NULL,
  KEY `DiseaseID` (`DiseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diseaseremedy`
--

INSERT INTO `diseaseremedy` (`DiseaseID`, `SeverityLowerBound`, `SeverityUpperBound`, `Chemical`, `Dose`) VALUES
(1, '5.00', '30.00', 'Tilt', '0.50'),
(1, '30.00', '50.00', 'Tilt', '1.00'),
(1, '50.00', '100.00', 'Tilt', '1.50'),
(2, '5.00', '30.00', 'Propicanozol', '0.50'),
(2, '30.00', '50.00', 'Propicanozol', '1.00'),
(2, '50.00', '100.00', 'Propicanozol', '1.50'),
(3, '5.00', '30.00', 'Diathane M-45', '1.00'),
(3, '30.00', '50.00', 'Diathane M-45', '1.50'),
(3, '50.00', '100.00', 'Diathane M-45', '2.00'),
(4, '5.00', '30.00', 'Mancozeb', '0.90'),
(4, '30.00', '50.00', 'Mancozeb', '1.20'),
(4, '50.00', '100.00', 'Mancozeb', '1.50');

-- --------------------------------------------------------

--
-- Table structure for table `msgin`
--

CREATE TABLE IF NOT EXISTS `msgin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendtime` datetime NOT NULL,
  `receivetime` datetime NOT NULL,
  `msgfrom` varchar(80) DEFAULT NULL,
  `msgto` varchar(80) NOT NULL,
  `smsc` varchar(80) NOT NULL,
  `msgtext` text NOT NULL,
  `msgtype` varchar(20) NOT NULL,
  `msgpdu` text NOT NULL,
  `gateway` varchar(80) NOT NULL,
  `userid` varchar(80) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `msglog`
--

CREATE TABLE IF NOT EXISTS `msglog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendtime` datetime DEFAULT NULL,
  `receivetime` datetime DEFAULT NULL,
  `statuscode` int(11) DEFAULT NULL,
  `statustext` varchar(80) DEFAULT NULL,
  `msgto` varchar(80) DEFAULT NULL,
  `msgfrom` varchar(80) DEFAULT NULL,
  `msgtext` text,
  `msgtype` varchar(20) DEFAULT NULL,
  `msgid` varchar(80) DEFAULT NULL,
  `errorcode` varchar(80) DEFAULT NULL,
  `errortext` varchar(80) DEFAULT NULL,
  `gateway` varchar(80) DEFAULT NULL,
  `msgpdu` text,
  `userid` varchar(80) DEFAULT NULL,
  `userinfo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `msglog`
--

INSERT INTO `msglog` (`id`, `sendtime`, `receivetime`, `statuscode`, `statustext`, `msgto`, `msgfrom`, `msgtext`, `msgtype`, `msgid`, `errorcode`, `errortext`, `gateway`, `msgpdu`, `userid`, `userinfo`) VALUES
(1, '2014-05-20 11:45:56', NULL, 300, 'Error: No gateway available', '+919045431435', '', 'Tilt 1.00 lit/ha\nIndoxacarb 0.90 lit/ha', '', '', '', '', '', NULL, '', ''),
(2, '2014-05-20 11:46:06', NULL, 300, 'Error: No gateway available', '+913434234578', '', 'Tilt 0.50 lit/ha\nIndoxacarb 0.90 lit/ha', '', '', '', '', '', NULL, '', ''),
(3, '2014-05-20 11:49:50', '2014-05-20 11:49:54', 201, 'Success: Message received on handset.', '+919045431435', '', 'Tilt 1.00 lit/ha\nIndoxacarb 0.90 lit/ha', 'sms.automatic', '7:+919045431435:118', '', '', 'test', NULL, '', ''),
(4, '2014-05-20 15:06:51', '2014-05-20 15:06:48', 201, 'Success: Message received on handset.', '+919411159871', '', 'Tilt 1.00 lit/ha\nDiclorovas 1.20 lit/ha', 'sms.automatic', '7:+919411159871:119', '', '', 'test', NULL, '', ''),
(5, '2014-05-20 15:08:31', '2014-05-20 15:08:33', 201, 'Success: Message received on handset.', '+919411159871', '', 'Tilt 1.00 lit/ha\nDiclorovas 1.20 lit/ha', 'sms.automatic', '7:+919411159871:120', '', '', 'test', NULL, '', ''),
(6, '2014-08-16 10:37:39', NULL, 201, NULL, '+919045431435', NULL, 'Data Successfully Entered\nData Successfully Entered', NULL, '2:+919045431435:124', NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2014-08-16 13:00:47', NULL, 200, NULL, '+919411159871', NULL, 'Data Successfully Entered\nData Successfully Entered\nData Successfully Entered', NULL, '2:+919411159871:125', NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2014-08-16 13:07:57', NULL, 200, NULL, '+919411159871', NULL, 'Tilt 1.00 lit/ha\nMancozeb 0.90 lit/ha\nDiclorovas 0.80 lit/ha', NULL, '2:+919411159871:127', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `msgout`
--

CREATE TABLE IF NOT EXISTS `msgout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgto` varchar(80) NOT NULL,
  `msgfrom` varchar(80) DEFAULT NULL,
  `msgtxt` text NOT NULL,
  `msgtype` varchar(20) DEFAULT NULL,
  `gatewaytype` varchar(80) DEFAULT NULL,
  `userid` varchar(80) DEFAULT NULL,
  `usrinfo` text,
  `priority` int(11) DEFAULT NULL,
  `scheduled` datetime DEFAULT NULL,
  `issent` tinyint(1) NOT NULL DEFAULT '0',
  `isread` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `msgout`
--

INSERT INTO `msgout` (`id`, `msgto`, `msgfrom`, `msgtxt`, `msgtype`, `gatewaytype`, `userid`, `usrinfo`, `priority`, `scheduled`, `issent`, `isread`) VALUES
(1, '+919045431435', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(2, '+919045431436', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(3, '+919045431438', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(4, '+919045431435', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(5, '+919045431436', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(6, '+919045431435', NULL, 'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha\n', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(7, '+919045431435', NULL, 'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha\n', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(8, '+919045431436', NULL, 'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha\n', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pest`
--

CREATE TABLE IF NOT EXISTS `pest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pest`
--

INSERT INTO `pest` (`ID`, `Name`) VALUES
(1, 'Katerpiller'),
(2, 'Spotted Ladybird');

-- --------------------------------------------------------

--
-- Table structure for table `pestremedy`
--

CREATE TABLE IF NOT EXISTS `pestremedy` (
  `PestID` int(11) NOT NULL,
  `SeverityLowerBound` decimal(10,2) NOT NULL,
  `SeverityUpperBound` decimal(10,2) NOT NULL,
  `Chemical` varchar(30) DEFAULT NULL,
  `Dose` decimal(10,2) NOT NULL,
  KEY `PestID` (`PestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pestremedy`
--

INSERT INTO `pestremedy` (`PestID`, `SeverityLowerBound`, `SeverityUpperBound`, `Chemical`, `Dose`) VALUES
(1, '5.00', '30.00', 'Indoxacarb', '0.75'),
(1, '30.00', '50.00', 'Indoxacarb', '0.90'),
(1, '50.00', '100.00', 'Indoxacarb', '1.00'),
(2, '5.00', '30.00', 'Diclorovas', '0.80'),
(2, '30.00', '50.00', 'Diclorovas', '1.00'),
(2, '50.00', '100.00', 'Diclorovas', '1.20');

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `ID` varchar(2) NOT NULL DEFAULT '',
  `TableName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`ID`, `TableName`) VALUES
('D', 'Disease'),
('P', 'Pest');

-- --------------------------------------------------------

--
-- Table structure for table `rcedata`
--

CREATE TABLE IF NOT EXISTS `rcedata` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Severity` decimal(10,2) DEFAULT NULL,
  `Problem` varchar(2) DEFAULT NULL,
  `ProblemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `rcedata`
--

INSERT INTO `rcedata` (`SNo`, `Latitude`, `Longitude`, `Severity`, `Problem`, `ProblemID`) VALUES
(1, 56.34, 98.56, '45.00', 'D', 1),
(2, 56.34, 98.56, '67.00', 'D', 2),
(3, 56.34, 98.56, '78.00', 'D', 3),
(4, 56.34, 98.56, '89.00', 'P', 1),
(5, 29.45, 34.565, '45.00', 'D', 1),
(6, 29.45, 34.565, '67.00', 'D', 2),
(7, 29.45, 34.565, '78.00', 'D', 3),
(8, 29.45, 34.565, '89.00', 'P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `m_no` varchar(13) NOT NULL,
  `fisrt_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `email` varchar(40) NOT NULL,
  `state` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `village` varchar(25) NOT NULL,
  `block` varchar(25) NOT NULL,
  `district` varchar(25) NOT NULL,
  PRIMARY KEY (`m_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`m_no`, `fisrt_name`, `last_name`, `latitude`, `longitude`, `email`, `state`, `address`, `village`, `block`, `district`) VALUES
('+919045431435', 'mayank', 'chaudhari', 56.34, 98.56, 'm.charly3015@gmail.com', 'uttarakhand', 'vs bhawan \ncollege of technology pantnagar', 'mallagarkha', 'gangolihat', 'pithoragarh'),
('+919045431436', 'mayank', 'chaudhari', 29.45, 34.565, 'm.charly3015@gmaul.com', 'uttarakhand', 'vs bhawan', 'mallagarkha', 'gangolihat', 'pithoragarh'),
('+919045431438', '', '', 34, 45, '', '', '', '', '', ''),
('+919411159871', 'Ajeet Singh ', 'Nain', 29.07, 79.3, 'nain_ajeet@hotmail.com', 'Uttarakhand', 'N-70, GBPUA&T, Pantnagar', 'Nagla', 'Kichcha', 'US Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `whtdata`
--

CREATE TABLE IF NOT EXISTS `whtdata` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Severity` decimal(10,2) DEFAULT NULL,
  `Problem` varchar(2) DEFAULT NULL,
  `ProblemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diseaseremedy`
--
ALTER TABLE `diseaseremedy`
  ADD CONSTRAINT `diseaseremedy_ibfk_1` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`ID`);

--
-- Constraints for table `pestremedy`
--
ALTER TABLE `pestremedy`
  ADD CONSTRAINT `pestremedy_ibfk_1` FOREIGN KEY (`PestID`) REFERENCES `pest` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
