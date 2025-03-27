-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mariadb
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','12345','2025-02-25 11:18:49');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_acc`
--

DROP TABLE IF EXISTS `customer_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_acc` (
  `cm_accID` int(255) NOT NULL AUTO_INCREMENT,
  `gmail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`cm_accID`),
  UNIQUE KEY `gmail` (`gmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_acc`
--

LOCK TABLES `customer_acc` WRITE;
/*!40000 ALTER TABLE `customer_acc` DISABLE KEYS */;
INSERT INTO `customer_acc` VALUES (1,'customer@gmail.com','123');
/*!40000 ALTER TABLE `customer_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcarwashbooking`
--

DROP TABLE IF EXISTS `tblcarwashbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcarwashbooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookingId` bigint(10) DEFAULT NULL,
  `packageType` varchar(120) DEFAULT NULL,
  `carWashPoint` int(11) DEFAULT NULL,
  `fullName` varchar(150) DEFAULT NULL,
  `mobileNumber` bigint(12) DEFAULT NULL,
  `washDate` date DEFAULT NULL,
  `washTime` time DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `foodSelection` text DEFAULT NULL,
  `status` varchar(120) DEFAULT NULL,
  `adminRemark` mediumtext DEFAULT NULL,
  `paymentMode` varchar(120) DEFAULT NULL,
  `txnNumber` varchar(120) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `verification_status` enum('pending','accepted','declined') DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `carWashPoint` (`carWashPoint`),
  CONSTRAINT `washingpointid` FOREIGN KEY (`carWashPoint`) REFERENCES `tblwashingpoints` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcarwashbooking`
--

LOCK TABLES `tblcarwashbooking` WRITE;
/*!40000 ALTER TABLE `tblcarwashbooking` DISABLE KEYS */;
INSERT INTO `tblcarwashbooking` VALUES (1,316460298,'1',1,'ANuj kumar',1234567890,'2021-12-16','11:45:00','NA',NULL,'Completed','Washing completed','e-Wallet','345345345','2021-12-13 19:14:22','2025-03-27 00:00:28','accepted'),(2,647869499,'3',2,'Anuj kumar',1234567890,'2021-12-30','15:47:00','na',NULL,'Completed','test','UPI','1234567890','2021-12-13 19:14:47','2025-03-26 06:27:50','pending'),(3,215755984,'2',3,'AMit',9874563210,'2021-12-19','15:05:00','NA',NULL,'Completed','test','e-Wallet','123456789','2021-12-13 19:16:19','2025-03-26 06:29:11','pending'),(4,440337019,'1',2,'Sarita',6987412360,'2022-01-01','19:37:00','NA',NULL,'Completed',NULL,NULL,NULL,'2021-12-14 17:01:55','2025-03-27 00:02:40','accepted'),(5,783971257,'2',2,'John Doe',1234567890,'2021-12-25','13:31:00','NA',NULL,'Declined',NULL,NULL,NULL,'2021-12-14 19:00:44','2025-03-26 06:50:49','pending'),(6,328979472,'3 ',3,'Rahul Yadav',1234567890,'2021-12-18','10:15:00','NA',NULL,'Declined',NULL,NULL,NULL,'2021-12-14 19:12:37','2025-03-26 06:45:15','pending'),(7,151983398,'1',2,'Sanjeev',1234569870,'2021-12-15','19:50:00','Car wash',NULL,'Declined','Car Wash Completed','Debit/Credit Card','DSGFS72342834','2021-12-14 19:15:28','2025-03-26 06:53:35','pending');
/*!40000 ALTER TABLE `tblcarwashbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblenquiry`
--

DROP TABLE IF EXISTS `tblenquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblenquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `Status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblenquiry`
--

LOCK TABLES `tblenquiry` WRITE;
/*!40000 ALTER TABLE `tblenquiry` DISABLE KEYS */;
INSERT INTO `tblenquiry` VALUES (4,'Anuj kumar','anuj@gmail.com','General Enquiry','I want to know the price of car wash','2021-12-13 18:27:53',1),(5,'Amit','amit@gmail.com','Test','Test','2021-12-14 19:14:22',1),(6,'ering','hungry@123','carwash','meow hungry','2025-03-21 05:00:50',1),(7,'test','test@gmail.com','Booking Service','test  ','2025-03-24 17:32:22',1);
/*!40000 ALTER TABLE `tblenquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpages`
--

DROP TABLE IF EXISTS `tblpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT '',
  `detail` longtext DEFAULT NULL,
  `openignHrs` varchar(255) DEFAULT NULL,
  `phoneNumber` bigint(20) DEFAULT NULL,
  `emailId` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpages`
--

LOCK TABLES `tblpages` WRITE;
/*!40000 ALTER TABLE `tblpages` DISABLE KEYS */;
INSERT INTO `tblpages` VALUES (3,'aboutus','																				<div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: Georgia; font-size: 15px;\">Car Wash Management System is a brand which is literally going to change the way people think about car cleaning. It is a unique mechanized car cleaning concept where cars are getting pampered by the latest equipments including high pressure cleaning machines, spray injection and extraction machines, high powered vacuum cleaners, steam cleaners and so on.</span></div><div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: Georgia; font-size: 15px;\"><br></span></div><div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: Georgia; font-size: 15px;\">Car Wash&nbsp; Management System is a brand that is literally going to change the way people think about car cleaning. It is a unique mechanized car cleaning concept where cars are getting pampered by the latest equipments including high pressure cleaning machines, spray injection and extraction machines, high powered vacuum cleaners, steam cleaners and so on.&nbsp;</span><br></div><div></div>\r\n										\r\n										',NULL,NULL,NULL),(11,'contact','Overpass, Tominobo, Iligan City, Philippines','Mon - Fri, 8:00 AM - 9:00 PM',1234567890,'BMH Carwash Food & Drinks@Gmail.com');
/*!40000 ALTER TABLE `tblpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwashingpoints`
--

DROP TABLE IF EXISTS `tblwashingpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwashingpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `washingPointName` varchar(255) DEFAULT NULL,
  `washingPointAddress` varchar(255) DEFAULT NULL,
  `contactNumber` bigint(20) DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwashingpoints`
--

LOCK TABLES `tblwashingpoints` WRITE;
/*!40000 ALTER TABLE `tblwashingpoints` DISABLE KEYS */;
INSERT INTO `tblwashingpoints` VALUES (1,'BMH Carwash Food & Drinks','\r\nTominobo, Iligan City, Philippines',1236547890,'2021-12-13 16:21:20'),(2,'ABC Test Car Washing Point','A3263 Test Sector 1- Noida 201301',98745463210,'2021-12-13 16:22:38'),(3,' Matrix Test Car washing Point ','H911 Test Indira Puram Ghaziabad 201017 UP',4582365419,'2021-12-13 16:24:28');
/*!40000 ALTER TABLE `tblwashingpoints` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27  1:43:53
