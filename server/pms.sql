CREATE DATABASE  IF NOT EXISTS `pms` /*!40100 DEFAULT CHARACTER SET utf16 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pms`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pms
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admindetails`
--

DROP TABLE IF EXISTS `admindetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admindetails` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  `depname` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindetails`
--

LOCK TABLES `admindetails` WRITE;
/*!40000 ALTER TABLE `admindetails` DISABLE KEYS */;
INSERT INTO `admindetails` VALUES (1,'Dr Vaishali','vaishali.joshi@bvicam.in',9414175414,'MCA'),(2,'Dr Sunil','sunil.pratap@bvicam.in',9546675414,'MCA');
/*!40000 ALTER TABLE `admindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alogin`
--

DROP TABLE IF EXISTS `alogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  CONSTRAINT `alogin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `admindetails` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alogin`
--

LOCK TABLES `alogin` WRITE;
/*!40000 ALTER TABLE `alogin` DISABLE KEYS */;
INSERT INTO `alogin` VALUES (1,'Dr Vaishali','vaishali.joshi@bvicam.in','Admin1'),(2,'Dr Sunil','sunil.pratap@bvicam.in','Admin2');
/*!40000 ALTER TABLE `alogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companydetails`
--

DROP TABLE IF EXISTS `companydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companydetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `cdescription` varchar(300) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint NOT NULL,
  `website` varchar(30) NOT NULL,
  `adrs` varchar(300) NOT NULL,
  `package` varchar(30) NOT NULL,
  `mincgpa` float NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`cname`),
  UNIQUE KEY `cname` (`cname`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydetails`
--

LOCK TABLES `companydetails` WRITE;
/*!40000 ALTER TABLE `companydetails` DISABLE KEYS */;
INSERT INTO `companydetails` VALUES (1,'Amazon','Amazon is an American multinational technology company based in Seattle, Washington, which focuses on e-commerce, cloud computing, digital streaming, and artificial intelligence.','ecr-replies@amazon.com',8882804331,'www.amazon.com','Amazon Development Center India Pvt Ltd., 2nd Floor, Safina Towers, Bangalore ? 560052','15-30 lakhs',7,'WEB DEVELOPER'),(2,'Wipro','Wipro Limited is an Indian multinational corporation that provides information technology, consulting and business process services.','ecr-replies@wipro.com',8046726000,'www.wipro.com','Doddakannelli, Sarjapur Road Bengaluru - 560 035, India','10-20 lakhs',7,'WEB DEVELOPER'),(3,'Infosys','Infosys Limited, is an Indian multinational corporation that provides business consulting, information technology and outsourcing services.','Askus@infosys.com',8028520362,'www.infosys.com','Electronics City, Hosur Road, Bengaluru 560 100, India','10-50 lakhs',7,'WEB DEVELOPER'),(4,'Accenture','Accenture plc is an American-Irish multinational professional services company.','xxxx@accenture.com',8049346001,'www.accenture.com','4/1, IBC Knowledge Park, Bannerghatta Road Bangalore, Karnataka India - 560029','8-12 lakhs',6.5,'WEB DEVELOPER');
/*!40000 ALTER TABLE `companydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refercompany`
--

DROP TABLE IF EXISTS `refercompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refercompany` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) NOT NULL,
  `cdescription` varchar(300) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` bigint DEFAULT NULL,
  `hrname` varchar(30) NOT NULL,
  `usn` decimal(11,0) NOT NULL,
  `referdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `usn` (`usn`),
  CONSTRAINT `refercompany_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refercompany`
--

LOCK TABLES `refercompany` WRITE;
/*!40000 ALTER TABLE `refercompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `refercompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regdrive`
--

DROP TABLE IF EXISTS `regdrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regdrive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usn` decimal(11,0) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `no_duplicate` (`usn`,`cname`,`position`),
  KEY `cname` (`cname`),
  CONSTRAINT `regdrive_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE,
  CONSTRAINT `regdrive_ibfk_2` FOREIGN KEY (`cname`) REFERENCES `companydetails` (`cname`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regdrive`
--

LOCK TABLES `regdrive` WRITE;
/*!40000 ALTER TABLE `regdrive` DISABLE KEYS */;
INSERT INTO `regdrive` VALUES (1,111604421,'Amazon','WEB DEVELOPER'),(3,111604421,'Infosys','WEB DEVELOPER'),(2,111604421,'Wipro','WEB DEVELOPER'),(4,711604421,'Accenture','WEB DEVELOPER'),(6,711604421,'Amazon','WEB DEVELOPER'),(5,711604421,'Wipro','WEB DEVELOPER');
/*!40000 ALTER TABLE `regdrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slogin`
--

DROP TABLE IF EXISTS `slogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slogin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usn` decimal(11,0) NOT NULL,
  `pass` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usn` (`usn`),
  CONSTRAINT `slogin_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slogin`
--

LOCK TABLES `slogin` WRITE;
/*!40000 ALTER TABLE `slogin` DISABLE KEYS */;
INSERT INTO `slogin` VALUES (1,111604421,'One1'),(6,711604421,'Seven7'),(7,611604421,'Six6'),(9,411604421,'Four4');
/*!40000 ALTER TABLE `slogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentdetails`
--

DROP TABLE IF EXISTS `studentdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentdetails` (
  `stid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(30) NOT NULL,
  `usn` decimal(11,0) NOT NULL,
  `mobile` bigint NOT NULL,
  `email` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `branch` varchar(10) NOT NULL,
  `cgpa` float NOT NULL,
  PRIMARY KEY (`stid`,`usn`),
  UNIQUE KEY `usn` (`usn`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentdetails`
--

LOCK TABLES `studentdetails` WRITE;
/*!40000 ALTER TABLE `studentdetails` DISABLE KEYS */;
INSERT INTO `studentdetails` VALUES (1,'Aarushi Rathore',111604421,9149256646,'aarushirathore5@gmai','1998-11-18','MCA',9.1),(2,'Aditi J',211604421,9165487956,'J.aditi@gmail.com','1999-05-18','MCA',8.6),(3,'Akanksha',311604421,8756245891,'anku637@gmail.com','1998-09-06','MCA',8.8),(4,'Aman Sharma',411604421,5487952165,'coolaman@gmail.com','1999-11-02','MCA',7.6),(5,'Kavan Patel',511604421,9456852213,'gujarati.choda@gmail.com','1999-10-18','MCA',6.9),(6,'Priyank Baliyan',611604421,8542696969,'dj.khalid@gmail.com','2000-08-27','MCA',7.1),(7,'Rahul Tilwani',711604421,9511154696,'tillu69@gmail.com','2000-10-12','MCA',7.8),(8,'Ishani',811604421,7456249450,'ishani123@gmail.com','1999-11-06','MCA',9.6),(9,'Disha Panjwani',911604421,9456845213,'dishubabes@gmail.com','1999-03-14','MCA',9.5),(10,'Shikumi',1011604421,8094125720,'shikumi@gmail.com','1999-09-28','MCA',7.8),(11,'Pallavi Pandey',1111604421,7531596482,'ispalpal@gmail.com','1999-11-13','MCA',8.1);
/*!40000 ALTER TABLE `studentdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updateddrive`
--

DROP TABLE IF EXISTS `updateddrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updateddrive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usn` decimal(11,0) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `batch` varchar(10) NOT NULL,
  `cname` varchar(30) NOT NULL,
  `pdate` date NOT NULL,
  `package` varchar(30) NOT NULL,
  `position` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sname` (`sname`),
  KEY `usn` (`usn`),
  KEY `cname` (`cname`),
  CONSTRAINT `updateddrive_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE,
  CONSTRAINT `updateddrive_ibfk_2` FOREIGN KEY (`cname`) REFERENCES `companydetails` (`cname`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updateddrive`
--

LOCK TABLES `updateddrive` WRITE;
/*!40000 ALTER TABLE `updateddrive` DISABLE KEYS */;
INSERT INTO `updateddrive` VALUES (1,111604421,'Aarushi Rathore','2023','Infosys','2022-09-28','11,00,000','WEB DEVELOPER'),(2,711604421,'Rahul Tilwani','2023','Amazon','2022-11-28','19,00,000','WEB DEVELOPER'),(3,311604421,'Akanksha','2023','Wipro','2022-11-08','15,00,000','WEB DEVELOPER'),(4,811604421,'Ishani','2023','Amazon','2022-09-28','16,00,000','WEB DEVELOPER'),(5,511604421,'Kavan Patel','2023','Infosys','2022-09-28','12,00,000','WEB DEVELOPER'),(6,1011604421,'Shikumi','2023','Amazon','2022-09-28','14,00,000','WEB DEVELOPER');
/*!40000 ALTER TABLE `updateddrive` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04  8:47:21
