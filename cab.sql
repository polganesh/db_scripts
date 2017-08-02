-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for cabbooking
CREATE DATABASE IF NOT EXISTS `cabbooking` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cabbooking`;


-- Dumping structure for table cabbooking.locationcabcapacityusermap
CREATE TABLE IF NOT EXISTS `locationcabcapacityusermap` (
  `locationcabcapacityusermap` int(11) NOT NULL AUTO_INCREMENT,
  `locationcabcapacityid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `iscancelled` bit(1) NOT NULL DEFAULT b'0',
  `adddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `editdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `adduserid` int(11) DEFAULT NULL,
  `edituserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`locationcabcapacityusermap`),
  KEY `FK_locationcabcapacityusermap_locationcabcapacitymaster` (`locationcabcapacityid`),
  KEY `FK_locationcabcapacityusermap_usermaster` (`userid`),
  CONSTRAINT `FK_locationcabcapacityusermap_locationcabcapacitymaster` FOREIGN KEY (`locationcabcapacityid`) REFERENCES `locationcabtimedetail` (`locationcabcapacityid`),
  CONSTRAINT `FK_locationcabcapacityusermap_usermaster` FOREIGN KEY (`userid`) REFERENCES `usermaster` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cabbooking.locationcabcapacityusermap: ~0 rows (approximately)
DELETE FROM `locationcabcapacityusermap`;
/*!40000 ALTER TABLE `locationcabcapacityusermap` DISABLE KEYS */;
/*!40000 ALTER TABLE `locationcabcapacityusermap` ENABLE KEYS */;


-- Dumping structure for table cabbooking.locationcabtimedetail
CREATE TABLE IF NOT EXISTS `locationcabtimedetail` (
  `locationcabcapacityid` int(11) NOT NULL AUTO_INCREMENT,
  `locationid` int(11) NOT NULL,
  `dateforbooking` date NOT NULL,
  `hourforbooking` int(2) NOT NULL,
  `minutesforbooking` int(2) NOT NULL,
  `capacity` int(10) NOT NULL,
  `booked` int(10) NOT NULL DEFAULT '0',
  `isdeleted` bit(1) NOT NULL DEFAULT b'0',
  `adduserid` int(11) NOT NULL,
  `edituserid` int(11) NOT NULL,
  `adddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `editdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`locationcabcapacityid`),
  KEY `FK_locationcabcapacitytx_locationmaster` (`locationid`),
  CONSTRAINT `FK_locationcabcapacitytx_locationmaster` FOREIGN KEY (`locationid`) REFERENCES `locationmaster` (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table cabbooking.locationcabtimedetail: ~4 rows (approximately)
DELETE FROM `locationcabtimedetail`;
/*!40000 ALTER TABLE `locationcabtimedetail` DISABLE KEYS */;
INSERT INTO `locationcabtimedetail` (`locationcabcapacityid`, `locationid`, `dateforbooking`, `hourforbooking`, `minutesforbooking`, `capacity`, `booked`, `isdeleted`, `adduserid`, `edituserid`, `adddate`, `editdate`) VALUES
	(1, 1, '2016-07-24', 18, 0, 30, 1, b'0', 1, 1, '2016-07-22 18:04:50', '2016-07-24 17:31:52'),
	(3, 1, '2016-07-24', 18, 30, 30, 30, b'0', 1, 1, '2016-07-22 18:05:16', '2016-07-24 17:37:11'),
	(4, 1, '2016-07-24', 18, 45, 30, 0, b'0', 1, 1, '2016-07-22 18:00:07', '2016-07-24 14:50:35'),
	(5, 1, '2016-07-24', 19, 0, 20, 0, b'0', 1, 1, '2016-07-22 18:07:12', '2016-07-24 14:50:35');
/*!40000 ALTER TABLE `locationcabtimedetail` ENABLE KEYS */;


-- Dumping structure for table cabbooking.locationmaster
CREATE TABLE IF NOT EXISTS `locationmaster` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `isdeleted` int(1) NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cabbooking.locationmaster: ~2 rows (approximately)
DELETE FROM `locationmaster`;
/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` (`locationid`, `isdeleted`, `location`) VALUES
	(1, 0, 'Airoli'),
	(2, 0, 'Powai-Teritex');
/*!40000 ALTER TABLE `locationmaster` ENABLE KEYS */;


-- Dumping structure for table cabbooking.usermaster
CREATE TABLE IF NOT EXISTS `usermaster` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `empid` varchar(75) DEFAULT NULL,
  `password` varchar(75) DEFAULT NULL,
  `roleid` int(5) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `isdeleted` bit(1) DEFAULT b'0',
  `adduserid` int(11) DEFAULT NULL,
  `edituserid` int(11) DEFAULT NULL,
  `adddate` datetime DEFAULT CURRENT_TIMESTAMP,
  `editdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table cabbooking.usermaster: ~4 rows (approximately)
DELETE FROM `usermaster`;
/*!40000 ALTER TABLE `usermaster` DISABLE KEYS */;
INSERT INTO `usermaster` (`userid`, `firstname`, `lastname`, `empid`, `password`, `roleid`, `username`, `isdeleted`, `adduserid`, `edituserid`, `adddate`, `editdate`) VALUES
	(1, 'ganesh', 'pol', '3419', NULL, NULL, NULL, b'0', 1, 1, '2016-07-22 18:01:16', '2016-07-22 18:01:18'),
	(2, 'swapnil', 'akre', '3420', NULL, NULL, NULL, b'0', 1, 1, '2016-07-22 18:03:05', '2016-07-22 18:03:07'),
	(3, 'sagar', 'mogre', '3421', NULL, NULL, NULL, b'0', 1, 1, '2016-07-22 18:03:36', '2016-07-22 18:03:37'),
	(4, 'vinayak', 'suryavanshi', '3422', NULL, NULL, NULL, b'0', 1, 1, '2016-07-22 18:04:04', '2016-07-22 18:04:05');
/*!40000 ALTER TABLE `usermaster` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
