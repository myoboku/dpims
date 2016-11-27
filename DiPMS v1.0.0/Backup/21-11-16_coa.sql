-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: coa
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crops` (
  `CropID` varchar(3) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `DataTableName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CropID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
INSERT INTO `crops` VALUES ('RCE','Rice',NULL),('WHT','Wheat',NULL);
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'Yellow Rust'),(2,'Brown Rust'),(3,'Black Rust'),(4,'Loose Smut'),(5,'Powdery Mildew'),(6,'Karnal Bunt'),(7,'Alternaria Leaf Blight'),(8,'Wht8'),(9,'Wht9'),(10,'Wht10'),(11,'RCE11'),(12,'RCE12'),(13,'RCE13'),(14,'RCE14'),(15,'RCE15'),(16,'RCE16'),(17,'RCE17'),(18,'RCE18'),(19,'RCE19'),(20,'RCE20'),(21,'SGR21'),(22,'SGR22'),(23,'SGR23'),(24,'SGR24'),(25,'SGR25'),(26,'SGR26'),(27,'SGR27'),(28,'SGR28'),(29,'SGR29'),(30,'SGR30');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseaseremedy`
--

DROP TABLE IF EXISTS `diseaseremedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diseaseremedy` (
  `DiseaseID` int(11) NOT NULL,
  `SeverityLowerBound` decimal(10,2) DEFAULT NULL,
  `SeverityUpperBound` decimal(10,2) DEFAULT NULL,
  `Chemical` varchar(30) DEFAULT NULL,
  `Dose` decimal(10,2) DEFAULT NULL,
  `Biological` varchar(250) NOT NULL,
  `Agronomical` varchar(250) NOT NULL,
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sno`),
  KEY `DiseaseID` (`DiseaseID`),
  CONSTRAINT `diseaseremedy_ibfk_1` FOREIGN KEY (`DiseaseID`) REFERENCES `disease` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseaseremedy`
--

LOCK TABLES `diseaseremedy` WRITE;
/*!40000 ALTER TABLE `diseaseremedy` DISABLE KEYS */;
INSERT INTO `diseaseremedy` VALUES (1,5.00,30.00,'Propioconazole (Tilt 25EC)',0.80,'','',1),(1,30.00,50.00,'Propioconazole (Tilt 25EC)',1.00,'','',2),(1,50.00,100.00,'Propioconazole (Tilt 25EC)',1.50,'','',3),(2,5.00,30.00,'Propioconazole (Tilt 25EC)',0.50,'','',4),(2,30.00,50.00,'Propioconazole (Tilt 25EC)',1.00,'','',5),(2,50.00,100.00,'Propioconazole (Tilt 25EC)',1.50,'','',6),(3,5.00,30.00,'Diathane M-45',1.00,'','',7),(3,30.00,50.00,'Diathane M-45',1.50,'','',8),(3,50.00,100.00,'Diathane M-45',2.00,'','',9),(4,5.00,30.00,'Carbendazim',0.90,'','',10),(4,30.00,50.00,'Carbendazim',1.00,'','',11),(4,50.00,100.00,'Carbendazim',1.20,'','',12),(5,5.00,30.00,'Wettable Sulphur 0.2% ',6.00,'','',17),(5,30.00,50.00,'Wettable Sulphur 0.2% ',8.00,'','',18),(5,50.00,100.00,'Wettable Sulphur 0.2% ',10.00,'','',19),(6,5.00,30.00,'Propiconazole (Tilt 25EC)',0.80,'','',20),(6,30.00,50.00,'Propiconazole (Tilt 25EC)',1.00,'','',21),(6,50.00,100.00,'Propiconazole (Tilt 25EC)',1.20,'','',22),(7,5.00,30.00,'Propiconazole (Tilt 25EC)',0.80,'','',23),(7,30.00,50.00,'Propiconazole (Tilt 25EC)',1.00,'','',24),(7,50.00,100.00,'Propiconazole (Tilt 25EC)',1.20,'','',25);
/*!40000 ALTER TABLE `diseaseremedy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgin`
--

DROP TABLE IF EXISTS `msgin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgin` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgin`
--

LOCK TABLES `msgin` WRITE;
/*!40000 ALTER TABLE `msgin` DISABLE KEYS */;
INSERT INTO `msgin` VALUES (1,'2016-11-21 19:04:36','0000-00-00 00:00:00','BP-656300','+919458960236','','दोस्ती को मज़बूत बनाती हैं बातें,तो मस्त बाते करो 5630035 पर','','','','',0,0);
/*!40000 ALTER TABLE `msgin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msglog`
--

DROP TABLE IF EXISTS `msglog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msglog` (
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msglog`
--

LOCK TABLES `msglog` WRITE;
/*!40000 ALTER TABLE `msglog` DISABLE KEYS */;
INSERT INTO `msglog` VALUES (1,'2014-05-20 11:45:56',NULL,300,'Error: No gateway available','+919045431435','','Tilt 1.00 lit/ha\nIndoxacarb 0.90 lit/ha','','','','','',NULL,'',''),(2,'2014-05-20 11:46:06',NULL,300,'Error: No gateway available','+913434234578','','Tilt 0.50 lit/ha\nIndoxacarb 0.90 lit/ha','','','','','',NULL,'',''),(3,'2014-05-20 11:49:50','2014-05-20 11:49:54',201,'Success: Message received on handset.','+919045431435','','Tilt 1.00 lit/ha\nIndoxacarb 0.90 lit/ha','sms.automatic','7:+919045431435:118','','','test',NULL,'',''),(4,'2014-05-20 15:06:51','2014-05-20 15:06:48',201,'Success: Message received on handset.','+919411159871','','Tilt 1.00 lit/ha\nDiclorovas 1.20 lit/ha','sms.automatic','7:+919411159871:119','','','test',NULL,'',''),(5,'2014-05-20 15:08:31','2014-05-20 15:08:33',201,'Success: Message received on handset.','+919411159871','','Tilt 1.00 lit/ha\nDiclorovas 1.20 lit/ha','sms.automatic','7:+919411159871:120','','','test',NULL,'',''),(6,'2014-08-16 10:37:39',NULL,201,NULL,'+919045431435',NULL,'Data Successfully Entered\nData Successfully Entered',NULL,'2:+919045431435:124',NULL,NULL,NULL,NULL,NULL,NULL),(7,'2014-08-16 13:00:47',NULL,200,NULL,'+919411159871',NULL,'Data Successfully Entered\nData Successfully Entered\nData Successfully Entered',NULL,'2:+919411159871:125',NULL,NULL,NULL,NULL,NULL,NULL),(8,'2014-08-16 13:07:57',NULL,200,NULL,'+919411159871',NULL,'Tilt 1.00 lit/ha\nMancozeb 0.90 lit/ha\nDiclorovas 0.80 lit/ha',NULL,'2:+919411159871:127',NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,'+919045431435',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,'+919045431436',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,'+919045431438',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,'+919045431435',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,NULL,'+919045431436',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,NULL,'+919045431435',NULL,'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,NULL,'+919045431435',NULL,'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL,'+919045431436',NULL,'Yellow Rust: Tilt 1.00 lit/ha\nBrown Rust: Propicanozol 1.50 lit/ha\nWilt: Diathane M-45 2.00 lit/ha\nKaterpiller: Indoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,NULL,'+919045431435',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,NULL,'+',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Data Successfully Entered\nData Successfully Entered\nData Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Tilt 1.00 lit/ha\nPropicanozol 1.50 lit/ha\nDiathane M-45 2.00 lit/ha\nIndoxacarb 1.00 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Tilt 1.50 lit/ha\nPropicanozol 1.00 lit/ha\nIndoxacarb 0.90 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Data Successfully Entered\nData Successfully Entered\nData Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Data Successfully Entered\nData Successfully Entered\nData Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Tilt 1.50 lit/ha\nPropicanozol 1.00 lit/ha\nIndoxacarb 0.90 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,NULL,NULL,NULL,NULL,'+919012004485',NULL,'Tilt 1.50 lit/ha\nPropicanozol 1.00 lit/ha\nIndoxacarb 0.90 lit/ha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Data Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Data Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Data Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Data Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,NULL,NULL,NULL,NULL,'+919012953488',NULL,'ERR:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Data Successfully Entered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,NULL,NULL,NULL,NULL,'+919012953488',NULL,'ERR:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,'+919012953488',NULL,'ERR:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.00 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.00 lit/ha, , \nBrown Rust: Propicanozol 1.50 lit/ha, , \nWilt: Diathane M-45 2.00 lit/ha, , \nKaterpiller: Indoxacarb 1.00 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.50 lit/ha, , \nWilt: Diathane M-45 2.00 lit/ha, , \nKaterpiller: Indoxacarb 1.00 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,NULL,NULL,NULL,NULL,'+919012953488',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.50 lit/ha, , \nWilt: Diathane M-45 2.00 lit/ha, , \nKaterpiller: Indoxacarb 1.00 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nWilt: Diathane M-45 2.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Brown Rust: Propicanozol 1.50 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.50 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,NULL,NULL,NULL,NULL,'+918475001125',NULL,'ERR:02\nERR:02\nERR:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Wht6: test1 1.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, , \nWht6: test1 1.00 lit/ha, , \nERR:02\nERR:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.00 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, , \nWht6: test1 1.00 lit/ha, , \nERR:02\nERR:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Brown Rust: Propicanozol 1.50 lit/ha, , \nERR:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Yellow Rust: Tilt 1.50 lit/ha, , \nBrown Rust: Propicanozol 1.50 lit/ha, , \nKaterpiller: Indoxacarb 0.90 lit/ha, , \nSpotted Ladybird: Diclorovas 1.20 lit/ha, , \nKarnal Bunt: Propiconazole (Tilt 25EC) 0.80 lit/ha, , \nAlternaria Leaf Blight: Propiconazole (Tilt 25EC) 1.00 lit/ha, , \nERR:03\nERR:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Loose Smut: Carbendazim 1.00 lit/ha, , \nKarnal Bunt: Propiconazole (Tilt 25EC) 1.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,NULL,NULL,NULL,NULL,'+919012004485',NULL,'Yellow Rust: Propioconazole (Tilt 25EC) 1.50 lit/ha, , \nBrown Rust: Propioconazole (Tilt 25EC) 1.50 lit/ha, , \nAphids: Imidacloprid (0.0022%) 0.00 lit/ha, , \nArmy Worm : carbaryl (48 oz/acre) 0.00 lit/ha, , \nKarnal Bunt: Propiconazole (Tilt 25EC) 0.80 lit/ha, , \nAlternaria Leaf Blight: Propiconazole (Tilt 25EC) 1.00 lit/ha, , \nERR:03\nERR:03\nLoose Smut: Carbendazim 1.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Black Rust: Diathane M-45 1.50 lit/ha, , \nSeed Gall Nematode: brine solution 5.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,NULL,NULL,NULL,NULL,'+919411159871',NULL,'Brown Rust: Propioconazole (Tilt 25EC) 0.50 lit/ha, , \nTermites: Chlorpyriphos 0.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Black Rust: Diathane M-45 1.50 lit/ha, , \nSeed Gall Nematode: brine solution 5.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,NULL,NULL,NULL,NULL,'+918475001125',NULL,'ERR:06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Black Rust: Diathane M-45 1.50 lit/ha, , \nSeed Gall Nematode: brine solution 5.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,NULL,NULL,NULL,NULL,'+918475001125',NULL,'Black Rust: Diathane M-45 1.50 lit/ha, , \nSeed Gall Nematode: brine solution 5.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,NULL,NULL,NULL,NULL,'+919012004485',NULL,'Yellow Rust: Propioconazole (Tilt 25EC) 1.50 lit/ha, , \nBrown Rust: Propioconazole (Tilt 25EC) 1.00 lit/ha, , \nAphids: Imidacloprid (0.0022%) 0.00 lit/ha, , \nArmy Worm : carbaryl (48 oz/acre) 0.00 lit/ha, , \nKarnal Bunt: Propiconazole (Tilt 25EC) 0.80 lit/ha, , \nAlternaria Leaf Blight: Propiconazole (Tilt 25EC) 1.00 lit/ha, , \nERR:03\nERR:03\nLoose Smut: Carbendazim 1.00 lit/ha, , \nBlack Rust: Diathane M-45 2.00 lit/ha, , \nSeed Gall Nematode: brine solution 5.00 lit/ha, , \nTermites: Chlorpyriphos 0.00 lit/ha, ,',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'2016-11-21 18:54:28',NULL,201,NULL,'+919411159871',NULL,'Yellow Rust: Propioconazole (Tilt 25EC) 1.50 lit/ha\nBrown Rust: Propioconazole (Tilt 25EC) 1.00 lit/ha\nAphids: Imidacloprid (0.0022%) 0.00 lit/ha\nArmy Worm : carbaryl (48 oz/acre) 0.00 lit/ha\nKarnal Bunt: Propiconazole (Tilt 25EC) 0.80 lit/ha\nAlternaria Leaf Blight: Propiconazole (Tilt 25EC) 1.00 lit/ha\nERR:03\nERR:03\nLoose Smut: Carbendazim 1.00 lit/ha\nBlack Rust: Diathane M-45 1.50 lit/ha\nSeed Gall Nematode: brine solution 5.00 lit/ha\nTermites: Chlorpyriphos 0.00 lit/ha',NULL,'2:+919411159871:177',NULL,NULL,NULL,NULL,NULL,NULL),(66,'2016-11-21 18:57:35',NULL,201,NULL,'+919411159871',NULL,'Brown Rust: Propioconazole (Tilt 25EC) 0.50 lit/ha\nTermites: Chlorpyriphos 0.00 lit/ha',NULL,'2:+919411159871:178',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `msglog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgout`
--

DROP TABLE IF EXISTS `msgout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgout` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgout`
--

LOCK TABLES `msgout` WRITE;
/*!40000 ALTER TABLE `msgout` DISABLE KEYS */;
/*!40000 ALTER TABLE `msgout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pest`
--

DROP TABLE IF EXISTS `pest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pest`
--

LOCK TABLES `pest` WRITE;
/*!40000 ALTER TABLE `pest` DISABLE KEYS */;
INSERT INTO `pest` VALUES (1,'Aphids'),(2,'Army Worm '),(3,'Termites'),(4,'Seed Gall Nematode'),(5,'WHT5'),(6,'WHT6'),(7,'WHT7'),(8,'WHT8'),(9,'WHT9'),(10,'WHT10'),(11,'RCE11'),(12,'RCE12'),(13,'RCE13'),(14,'RCE14'),(15,'RCE15'),(16,'RCE16'),(17,'RCE17'),(18,'RCE18'),(19,'RCE19'),(20,'RCE20');
/*!40000 ALTER TABLE `pest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pestremedy`
--

DROP TABLE IF EXISTS `pestremedy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pestremedy` (
  `PestID` int(11) NOT NULL,
  `SeverityLowerBound` decimal(10,2) NOT NULL,
  `SeverityUpperBound` decimal(10,2) NOT NULL,
  `Chemical` varchar(30) DEFAULT NULL,
  `Dose` decimal(10,2) NOT NULL,
  `Biological` varchar(250) NOT NULL,
  `Agronomical` varchar(250) NOT NULL,
  `snoo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`snoo`),
  KEY `PestID` (`PestID`),
  CONSTRAINT `pestremedy_ibfk_1` FOREIGN KEY (`PestID`) REFERENCES `pest` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pestremedy`
--

LOCK TABLES `pestremedy` WRITE;
/*!40000 ALTER TABLE `pestremedy` DISABLE KEYS */;
INSERT INTO `pestremedy` VALUES (1,5.00,30.00,'Imidacloprid (0.002%)',0.00,'','',1),(1,30.00,50.00,'Imidacloprid (0.0022%)',0.00,'','',2),(1,50.00,100.00,'Imidacloprid (0.0025%)',0.00,'','',3),(2,5.00,30.00,'carbaryl (32 oz/acre )',0.00,'','',4),(2,30.00,50.00,'carbaryl (40 oz/acre )',0.00,'','',5),(2,50.00,100.00,'carbaryl (48 oz/acre)',0.00,'','',6),(3,5.00,30.00,'Chlorpyriphos',0.00,'','',7),(3,30.00,50.00,'Chlorpyriphos',0.00,'','',8),(3,50.00,100.00,'Chlorpyriphos',0.00,'','',9),(4,5.00,30.00,'brine solution',2.00,'','',10),(4,30.00,50.00,'brine solution',4.00,'','',11),(4,50.00,100.00,'brine solution',5.00,'','',12);
/*!40000 ALTER TABLE `pestremedy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `ID` varchar(2) NOT NULL DEFAULT '',
  `TableName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES ('D','Disease'),('P','Pest');
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rcedata`
--

DROP TABLE IF EXISTS `rcedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rcedata` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Severity` decimal(10,2) DEFAULT NULL,
  `Problem` varchar(2) DEFAULT NULL,
  `ProblemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rcedata`
--

LOCK TABLES `rcedata` WRITE;
/*!40000 ALTER TABLE `rcedata` DISABLE KEYS */;
INSERT INTO `rcedata` VALUES (1,56.34,98.56,45.00,'D',1),(2,56.34,98.56,67.00,'D',2),(3,56.34,98.56,78.00,'D',3),(4,56.34,98.56,89.00,'P',1),(5,29.45,34.565,45.00,'D',1),(6,29.45,34.565,67.00,'D',2),(7,29.45,34.565,78.00,'D',3),(8,29.45,34.565,89.00,'P',1),(9,29,79,56.00,'D',1),(10,29,79,45.00,'D',2),(11,29,79,44.00,'P',1),(12,29,79,56.00,'D',1),(13,29,79,45.00,'D',2),(14,29,79,44.00,'P',1),(15,29.45,56.34,67.00,'D',1),(16,29.45,56.34,67.00,'D',1),(17,29.45,56.34,67.00,'D',1),(18,29.45,56.34,67.00,'D',1),(19,29.45,56.34,89.00,'P',2);
/*!40000 ALTER TABLE `rcedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('+917030209221','mayank','chaudhari',29.45,34.565,'m.charly3015@gmaul.com','uttarakhand','vs bhawan','mallagarkha','gangolihat','pithoragarh'),('+917579252911','YOGENDRA','KUMAR',29,79,'','UTTARAKHAND','S/o: VED PAL SINGH\nVILLAGE: BRAHAMPURI\nBLOCK: RAIPUR\nDEHRADUN\nUTTARAKHAND\n\n','BRAHAMPURI','RAIPUR','DEHRADUN'),('+917830842122','RAHUL','KUMAR',29,79,'','UTTARAKHAND','S/O SATVEER SINGH\nVILLAGE: LIBBARHERI\nBLOCK: NARSAN\nDISTRICT: HARIDWAR\nUTTARAKHAND- 247656','LIBBARHERI','NARSAN','HARIDWAR'),('+918191027560','SHUBHAM','',29,79,'bhanu4041@gmail.com','UTTARAKHAND','S/O: RAJESH KUMAR\nVILLAGE: RAMNAGAR VAN\nBLOCK: JASPUR\nUDHAM SINGH NAGAR:244712\nUTTARAKHAND','RAMNAGAR VAN','JASPUR','UDHAM SINGH NAGAR'),('+918475001125','Ajeet','Nain',29,79,'','','','','',''),('+918791356907','saqib','shamsi',78.75,59.99,'pantnagar@pantnagar.com','UK','Pantnagar','pantnagar','pantnagar','pantnagar'),('+919012004485','Meenakshi','Joshi',29.22,79.52,'meenujoshi91@gmail.com','Uttarakhand','Gair Vashali, Uncha Pul,\nHaldwani','Haldwani','Haldwani','Nainital'),('+919012953488','mayank2','',29.45,56.34,'','','','','',''),('+919012960908','YOGENDRA','KUMAR',29,79,'','UTTAR PRADESH','S/O VED PAL SINGH\nVILLAGE: BHUVAPUR\nPO: MORNA\nDISTRICT: MUZAFFARNAGAR\nUTTAR PRADESH','BHUVAPUR','','MUZAFFARNAGAR'),('+919045431435','mayank','chaudhari',56.34,98.56,'m.charly3015@gmail.com','uttarakhand','vs bhawan \ncollege of technology pantnagar','mallagarkha','gangolihat','pithoragarh'),('+919045431438','','',34,45,'','','','','',''),('+919410718995','NARAYAN','DUTT',29,79,'','UTTARAKHAND','S/o: K.D. KAFALTIA\nVILLAGE: KHANSYU\nBLOCK: OKHALANDA\nNAINITAL\nUTTARAKHAND\n\n','KHANSYU','OKHALANDA','NAINITAL'),('+919411132024','TRILOK CHANDRA','JOSHI',29,79,'','UTTARAKHAND','S/o: PADMA DUTT JOSHI\nVILLAGE: BARABEY\nBLOCK: MUNAKOT\nPITHORAGARH\nUTTARAKHAND\n\n','BARABEY','MUNAKOT','PITHORAGARH'),('+919411159871','Ajeet Singh ','Nain',29.07,79.3,'nain_ajeet@hotmail.com','Uttarakhand','N-70, GBPUA&T, Pantnagar','Nagla','Kichcha','US Nagar'),('+919411193253','R.S.','SOLANKI',29,79,'','UTTARAKHAND','S/o AMAR SINGH SOLANKI\nVILLAGE: JOLLI GRANT\nPOST:JOLLI GRANT\nDOIWALA\nDEHRADUN\n','JOLLI GRANT','DOIWALA','DEHRADUN'),('+919411770326','BHANU PRATAP SINGH','GAHLAUT',29,79,'bghalaut@gmail.com','UTTARAKHAND','S/o: HARI SINGH GAHLAUT\nVILLAGE: JASPUR\nBLOCK:JASPUR\nUDHAM SINGH NAGAR:244712\nUTTARAKHAND\n\n','JASPUR','JASPUR','UDHAM SINGH NAGAR'),('+919411907580','SUBASH','CHANDRA',29,79,'','UTTARAKHAND','S/o: GANGA RAM CHAUHAN\nVILLAGE: SITABHPUR\nBLOCK: DUGGADA\nPAURI GARHWAL:246149\nUTTARAKHAND\n\n\n','SITABHPUR','DUGGADA','PAURI GARHWAL'),('+919412158542','ILAM SINGH','PANWAR',29,79,'','UTTARAKHAND','S/o: RAFAL SINGH\n585 GANESHPUR\nROORKEE\nHARIDWAR:246776\nUTTARAKHAND\n\n\n','','ROORKEE','HARIDWAR'),('+919456368558','BHUWAN','JOSHI',29,79,'','UTTARAKHAND','S/o: SHASTI BALLABH JOSHI\nVILLAGE: BARABEY\nBLOCK: MUNAKOT\nPITHORAGARH\nUTTARAKHAND\n\n','BARABEY','MUNAKOT','PITHORAGARH'),('+919557114962','CHITRESH','BELWAL',29,79,'chetanbelwal35@gmail.com','UTTARAKHAND','S/O: ISHWAR DUTT BELWAL\nVILLAGE: DHARI\nBLOCK: DHARI\nNAINITAL:263136\nUTTARAKHAND','DHARI','DHARI','NAINITAL'),('+919627636001','AMEJ','KUMAR',29,79,'','UTTARAKHAND','S/o TULA RAM\nVILLAGE: GIDHAWALI\nBLOCK:KHANPUR\nHARIDWAR:247671\nUTTARAKHAND\n\n','GIDHAWALI','KHANPUR','HARIDWAR'),('+919627644966','TARA SINGH','BISHT',29,79,'','UTTARAKHAND','S/o: BACCHI SINGH BISHT\nVILLAGE: KAULE\nBLOCK:DHARI\nNAINITAL\nUTTARAKHAND\n\n','KAULE','DHARI','NAINITAL'),('+919627979452','SUMIT KUMAR','SAINI',29,79,'sumitsaini2987@gmail.com','UTTARAKHAND','S/o: JAGPAL SAINI\nVILLAGE: BAJUHARI\nBLOCK:MEHWAR KALAN\nHARIDWAR:247667\nUTTARAKHAND\n\n','BAJUHARI','MEHWAR KALAN','HARIDWAR'),('+919675281405','RISHIPAL','',29,79,'','UTTARAKHAND','AGRICULTURE AND SOIL CONSERVATION\nOFFICERS SATPULI\nPAURI GARHWAL\nUTTARAKHAND\n\n\n','','','PAURI GARHWAL'),('+919719758743','KRISHNA','BISHT',29,79,'','UTTARAKHAND','S/O TRILOK SINGH BISHT\nVILLAGE: SARNA\nBLOCK: DHARI\nDISTRICT: NAINITAL\nUTTARAKHAND','SARNA','DHARI','NAINITAL'),('+919719758744','KRISHNA','BISHT',29,79,'','UTTARAKHAND','S/o: TRILOK SINGH BISHT\nVILLAGE: KAULE\nBLOCK:DHARI\nNAINITAL\nUTTARAKHAND\n\n','SARNA ','DHARI','NAINITAL'),('+919758989306','RAJ ','KUMAR',29,79,'','UTTARAKHAND','S/o: BAIJ NATH\nVILLAGE: BANKATIA\nBLOCK: KHATIMA\nUDHAM SINGH NAGAR\nUTTARAKHAND\n\n','BANKATIA','KHATIMA','UDHAM SINGH NAGAR'),('+919760555714','RISSIKESH','MISHRA',29,79,'','UTTARAKHAND','AGRICULTURE AND SOIL CONSERVATION\nOFFICERS SATPULI\nPAURI GARHWAL\nUTTARAKHAND\n\n\n','','','PAURI GARHWAL'),('+919760824896','Rajeev','Ranjan',29.05,79.52,'rajeevranjanagri@gmail.com','Uttarakhand','Department of Agrometeorology,\nCollege of Agriculture, GBPUA&T, Pantnagar','','Kichha','US Nagar'),('+919760911460','NAVNEET','GUPTA',29,79,'navneet.gupta777@gmail.com','UTTARAKHAND','S/o: PARAS NATH GUPTA\nAMARDEV COLONY\nRUDRAPUR\nUDHAM SINGH NAGAR:263153\nUTTARAKHAND\n\n','','','UDHAM SINGH NAGAR'),('+919837272762','SANDEEP','KUMAR',29,79,'sandeeplohan1379@gmail.com','UTTAR PRADESH','S/o DHARAM VEER SINGH\nVILLAGE: MORNA\nBLOCK:MORNA\nNEAR POST OFFICE\nMUZAFFARNAGAR:251316\nUTTAR PRADESH\n\n','MORNA','MORNA','MUZAFFARNAGAR'),('+919837889265','SATENDRA','KUMAR',29,79,'','UTTARAKHAND','S/o: RATI RAM\nDEFENCE COLONY\nNEAR SBI BANK\nMOHANPURA MOHAMMEDPUR\nP/O MILAFNAGAR\nROORKEE-247667\nUTTARAKHAND\n\n\n','P/O MILAFNAGAR','','HARIDWAR'),('+919927001059','LALIT','PUSHKAR',29,79,'lalitpushkar46@gmail.com','UTTARAKHAND','S/o G.S.PUSHKAR\nBLOCK: ROORKEE\nHARIDWAR- 247667\nUTTARAKHAND','','ROORKEE','HARIDWAR');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whtdata`
--

DROP TABLE IF EXISTS `whtdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whtdata` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Severity` decimal(10,2) DEFAULT NULL,
  `Problem` varchar(2) DEFAULT NULL,
  `ProblemID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whtdata`
--

LOCK TABLES `whtdata` WRITE;
/*!40000 ALTER TABLE `whtdata` DISABLE KEYS */;
INSERT INTO `whtdata` VALUES (1,29,79,56.00,'D',1),(2,29,79,45.00,'D',2),(3,29,79,44.00,'P',1),(4,29,79,56.00,'D',1),(5,29.07,79.3,30.00,'D',2),(6,29.07,79.3,80.00,'P',2),(7,29,79,20.00,'D',6),(8,29,79,45.00,'D',7),(9,29,79,44.00,'P',10),(10,29.07,79.3,80.00,'P',6),(11,29.07,79.3,50.00,'D',4),(12,29,79,50.00,'D',3),(13,29,79,80.00,'P',4),(14,29.07,79.3,40.00,'P',3);
/*!40000 ALTER TABLE `whtdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-21 19:13:48
