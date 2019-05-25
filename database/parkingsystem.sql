-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: parkingsystem
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.10.2

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LocationID` int(11) NOT NULL,
  `SlotID` int(11) NOT NULL,
  `ParkingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ParkingHours` int(11) NOT NULL,
  `Username` varchar(16) NOT NULL,
  `CarID` int(11) NOT NULL,
  `BookingTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Category` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,3,1,'2019-05-23 22:29:00',2,'robogod',1,'2019-05-20 22:30:18','premium'),(2,3,4,'2019-05-24 22:42:00',2,'robogod',1,'2019-05-20 22:37:29','premium'),(3,3,2,'2019-05-23 22:49:00',2,'robogod',1,'2019-05-20 22:41:44','economy'),(4,2,9,'2019-05-24 21:46:00',1,'robogod',2,'2019-05-20 22:47:39','premium'),(5,3,14,'2019-05-30 21:55:00',2,'robogod',2,'2019-05-20 22:56:11','economy'),(6,3,4,'2019-05-23 19:32:00',12,'robogod',1,'2019-05-21 20:40:06','economy'),(7,3,5,'2019-05-23 21:17:00',4,'robogod',1,'2019-05-21 21:19:36','premium'),(8,3,105,'2019-05-23 18:37:00',12,'robogod',1,'2019-05-23 20:04:16','economy'),(9,3,36,'2019-05-23 20:04:00',12,'robogod',1,'2019-05-23 20:05:30','economy'),(10,3,28,'2019-05-23 21:07:00',15,'robogod',1,'2019-05-23 20:06:18','economy'),(11,3,87,'2019-05-23 21:07:00',11,'robogod',1,'2019-05-23 20:07:26','economy'),(12,3,62,'2019-05-24 00:50:00',3,'robogod',1,'2019-05-23 20:14:43','economy'),(13,3,48,'2019-05-23 23:18:00',4,'robogod',1,'2019-05-23 22:18:26','economy');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `SNo` int(11) NOT NULL AUTO_INCREMENT,
  `Make` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Year` int(4) NOT NULL,
  `PlateNo` varchar(50) NOT NULL,
  `Username` varchar(16) NOT NULL,
  PRIMARY KEY (`SNo`),
  UNIQUE KEY `PlateNo` (`PlateNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Tesla','Model S',2016,'ZX 21 NP 2245','robogod'),(2,'Rolls Royce','Phantom',2019,'BZ 23 LM 2346','robogod');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charges`
--

DROP TABLE IF EXISTS `charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charges` (
  `category` varchar(50) NOT NULL,
  `PerHour` int(11) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charges`
--

LOCK TABLES `charges` WRITE;
/*!40000 ALTER TABLE `charges` DISABLE KEYS */;
INSERT INTO `charges` VALUES ('economy',5),('premium',10);
/*!40000 ALTER TABLE `charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StreetAddress` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `PostalCode` int(11) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'2436 Fincham Road','Los Angeles',90017,'California','United States'),(2,'91 Graystone Lakes','Davisboro',31018,'Georgia','United States'),(3,'1875 Memory Lane','Rockford',61101,'Illinois','United States'),(4,'4601 Tecumsah Lane','Monroe',71201,'Louisiana','United States');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(16) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'robogod','5z2r5Nvy9wFMXtHYL+9x5rgSknyEgiklbCIILEOWONk=','robogod@domain.com'),(2,'test1','G08OmFGXGZjnMgeFRMlrNsPQHO33yqMyNZ1vHYNWcBQ=','test1@domain.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-24  3:49:17
