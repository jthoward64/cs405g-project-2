-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: mysql    Database: ktma234
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.48-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ktma234`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `team21` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `team21`;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `StreetAddress` varchar(255) NOT NULL,
  `BuildingName` varchar(255) DEFAULT NULL,
  `ApartmentSuite` varchar(50) DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `State` char(50) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'300 Rose Street','Hardymon Building','Room 102','Lexington','Kentucky','40506'),(2,'82 Beaver St',NULL,'Room 1301','New York','New York','10005'),(3,'200 Park Avenue',NULL,'Penthouse','New York\n','New York','10001'),(4,'117A Bleecker Street',NULL,NULL,'New York','New York','10001'),(5,'#1 Avenue of Champions',NULL,NULL,'Lexington','Ky','40506'),(6,'200 Park Avenue',NULL,'Apartment 221','New\nYork','New York','10001'),(7,'1 Dead End Row',NULL,'Room 200','Dallas','\nTX','12347'),(8,'301 Hilltop Avenue',NULL,'Room 102','Lexington','Ky','40506'),(9,'2558 Larkin Rd',NULL,'#120','Lexington','KY','40503'),(10,'10 Quality St',NULL,NULL,'Lexington','KY','40507'),(11,'2333 Alexandria Drive',NULL,NULL,'Lexington','KY','40504'),(12,'740 W New Circle Rd',NULL,NULL,'Lexington','KY','40511'),(13,'1780 Lexington Road',NULL,NULL,'Lexington','KY','40505'),(14,'1700 Lexington Rd',NULL,NULL,'Lexington','KY','40505'),(15,'4000 East New Circle Rd',NULL,NULL,'Lexington','KY','40511'),(16,'4201 Versailles Rd.',NULL,NULL,'Lexington','KY','40510'),(17,'123 Elm Street',NULL,NULL,'Lexington','KY','40502'),(18,'456 Oak Ave.',NULL,'Apt. 374','Lexington','KY','40503'),(19,'789 Maple Road',NULL,'Unit 3','Lexington','KY','40504'),(20,'101 Pine Lane',NULL,NULL,'Lexington','KY','40505'),(21,'234 Cedar Dr.',NULL,NULL,'Lexington','KY','40506'),(22,'890 Birch Circle',NULL,NULL,'Lexington','KY','40508'),(23,'111 Willow Drive',NULL,NULL,'Lexington','KY','40509'),(24,'222 Spruce Avenue',NULL,NULL,'Lexington','KY','40510'),(25,'333 Hickory Street',NULL,NULL,'Lexington','KY','40511'),(26,'444 Sycamore Lane',NULL,NULL,'Lexington','KY','40512'),(27,'555 Redwood Drive',NULL,NULL,'Lexington','KY','40513'),(28,'666 Chestnut Road',NULL,NULL,'Lexington','KY','40514'),(29,'777 Poplar Court',NULL,NULL,'Lexington','KY','40515'),(30,'888 Birch Circle',NULL,NULL,'Lexington','KY','40516'),(31,'999 Willow Drive',NULL,NULL,'Lexington','KY','40517'),(32,'121 Pine Lane',NULL,NULL,'Lexington','KY','40518'),(33,'232 Cedar Drive',NULL,NULL,'Lexington','KY','40519'),(34,'343 Walnut Court',NULL,NULL,'Lexington','KY','40520'),(35,'454 Maple Road',NULL,NULL,'Lexington','KY','40521'),(36,'547 Euclid Ave Ste. 120',NULL,NULL,'Lexington','Kentucky','40504');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Name`
--

DROP TABLE IF EXISTS `Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Name` (
  `NameID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `Suffix` varchar(20) DEFAULT NULL,
  `CompanyName` varchar(500) DEFAULT NULL,
  `CareOf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NameID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Name`
--

LOCK TABLES `Name` WRITE;
/*!40000 ALTER TABLE `Name` DISABLE KEYS */;
INSERT INTO `Name` VALUES (1,'Ray','L.','Hyatt','Mr.','Jr.',NULL,NULL),(2,'John',NULL,'Wick',NULL,NULL,NULL,NULL),(3,'Tony',NULL,'Stark',NULL,NULL,NULL,NULL),(4,'Stephen',NULL,'Strange','Dr.',NULL,NULL,NULL),(5,'Bowman','F.',' Wildcat',NULL,NULL,NULL,NULL),(6,'Bob','C.','Smith',NULL,NULL,NULL,NULL),(7,'Bob',NULL,'Porter',NULL,NULL,NULL,'Intech'),(8,'Bob',NULL,'Sydell','Mr.',NULL,NULL,'Intech'),(9,NULL,NULL,NULL,NULL,NULL,'Newport Cleaners #17',NULL),(10,NULL,NULL,NULL,NULL,NULL,'Gray Construction',NULL),(11,NULL,NULL,NULL,NULL,NULL,'Weesner Properties, INC.',NULL),(12,NULL,NULL,NULL,NULL,NULL,'Lexmark International, Inc.',NULL),(13,NULL,NULL,NULL,NULL,NULL,'Tempur Sealey',NULL),(14,NULL,NULL,NULL,NULL,NULL,'Valvoline',NULL),(15,NULL,NULL,NULL,NULL,NULL,'Lockheed Martin',NULL),(16,NULL,NULL,NULL,NULL,NULL,'Keeneland Race Course',NULL),(17,'John',NULL,'Doe','Mr.',NULL,NULL,NULL),(18,'Jane',NULL,'Doe','Mrs.',NULL,NULL,NULL),(19,'Alice',NULL,'Smith','Prof.',NULL,NULL,NULL),(20,'Michael',NULL,'Johnson',NULL,'PhD',NULL,NULL),(21,'Emily',NULL,'Brown','Ms.',NULL,NULL,NULL),(22,'Robert',NULL,'Taylor',NULL,'Esq.',NULL,NULL),(23,'William',NULL,'Davis',NULL,NULL,NULL,NULL),(24,'Linda',NULL,'Wilson',NULL,NULL,NULL,NULL),(25,'David',NULL,'Moore',NULL,NULL,NULL,NULL),(26,'Susan',NULL,'Anderson',NULL,NULL,NULL,NULL),(27,'James',NULL,'Harris',NULL,NULL,NULL,NULL),(28,'Patricia',NULL,'Martin',NULL,NULL,NULL,NULL),(29,'Joseph',NULL,'Thompson',NULL,NULL,NULL,NULL),(30,'Jessica',NULL,'White',NULL,NULL,NULL,NULL),(31,'Richard',NULL,'Jackson',NULL,NULL,NULL,NULL),(32,'Mary',NULL,'Lewis',NULL,NULL,NULL,NULL),(33,'Thomas',NULL,'Hall',NULL,NULL,NULL,NULL),(34,'Elizabeth',NULL,'Adams',NULL,NULL,NULL,NULL),(35,'Charles',NULL,'Clark',NULL,NULL,NULL,NULL),(36,'Karen',NULL,'Walker',NULL,NULL,NULL,NULL),(37,NULL,NULL,NULL,NULL,NULL,'Jimmy John\'s',NULL);
/*!40000 ALTER TABLE `Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NameAddress`
--

DROP TABLE IF EXISTS `NameAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NameAddress` (
  `NameAddressID` int(11) NOT NULL AUTO_INCREMENT,
  `NameID` int(11) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  PRIMARY KEY (`NameAddressID`),
  KEY `NameID` (`NameID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `NameAddress_ibfk_1` FOREIGN KEY (`NameID`) REFERENCES `Name` (`NameID`),
  CONSTRAINT `NameAddress_ibfk_2` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NameAddress`
--

LOCK TABLES `NameAddress` WRITE;
/*!40000 ALTER TABLE `NameAddress` DISABLE KEYS */;
INSERT INTO `NameAddress` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,6),(9,1,7),(10,8,8),(11,9,9),(12,10,10),(13,11,11),(14,12,12),(15,13,13),(16,14,14),(17,15,15),(18,16,16),(19,17,16),(20,18,17),(21,19,18),(22,20,19),(23,21,18),(24,22,19),(25,23,20),(26,24,21),(27,25,22),(28,26,23),(29,27,24),(30,28,25),(31,29,26),(32,30,27),(33,31,28),(34,32,29),(35,33,30),(36,34,31),(37,35,32),(38,35,33),(39,35,34),(40,37,36);
/*!40000 ALTER TABLE `NameAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneNumbers`
--

DROP TABLE IF EXISTS `PhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhoneNumbers` (
  `PhoneNumberID` int(11) NOT NULL AUTO_INCREMENT,
  `NameID` int(11) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberID`),
  KEY `NameID` (`NameID`),
  CONSTRAINT `PhoneNumbers_ibfk_1` FOREIGN KEY (`NameID`) REFERENCES `Name` (`NameID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneNumbers`
--

LOCK TABLES `PhoneNumbers` WRITE;
/*!40000 ALTER TABLE `PhoneNumbers` DISABLE KEYS */;
INSERT INTO `PhoneNumbers` VALUES (1,2,'555-555-5555'),(2,3,'555-555-3142'),(3,4,'(555)555-4321'),(4,5,NULL),(5,1,NULL),(6,6,NULL),(7,7,NULL),(8,8,NULL),(9,9,'859-123-4567'),(10,10,'859-234-5678'),(11,11,'859-345-6789'),(12,12,'859-456-7890'),(13,13,'859-567-8901'),(14,14,'859-678-9012'),(15,15,'859-789-0123'),(16,16,'859-890-1234'),(17,17,'859-901-2345'),(18,18,'859-012-3456'),(19,19,'859-123-4568'),(20,20,'859-234-5670'),(21,21,'859-345-6781'),(22,22,'859-456-7892'),(23,23,'859-567-8903'),(24,24,'859-678-9014'),(25,25,'859-789-0125'),(26,26,'859-890-1236'),(27,27,'859-901-2347'),(28,28,'859-012-3458'),(29,29,'859-123-4569'),(30,30,'859-234-5671'),(31,31,'859-345-6782'),(32,32,'859-456-7893'),(33,33,'859-567-8904'),(34,34,'859-678-9015'),(35,35,'859-789-0126'),(36,36,'859-890-1237');
/*!40000 ALTER TABLE `PhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipts`
--

DROP TABLE IF EXISTS `Receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receipts` (
  `ReceiptID` int(11) NOT NULL AUTO_INCREMENT,
  `ReceiptDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `ReceiptImage` blob,
  `ItemsSold` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BusinessAddressID` int(11) DEFAULT NULL,
  `HighestItem` decimal(10,2) DEFAULT NULL,
  `LowestItem` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ReceiptID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `BusinessAddressID` (`BusinessAddressID`),
  CONSTRAINT `Receipts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Name` (`NameID`),
  CONSTRAINT `Receipts_ibfk_2` FOREIGN KEY (`BusinessAddressID`) REFERENCES `Name` (`NameID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipts`
--

LOCK TABLES `Receipts` WRITE;
/*!40000 ALTER TABLE `Receipts` DISABLE KEYS */;
INSERT INTO `Receipts` VALUES (1,'2023-06-12',36.92,NULL,3,28,37,20.87,3.49),(2,'2022-01-18',9.84,NULL,1,31,14,9.84,9.84),(3,'2023-03-04',29.02,NULL,5,30,14,24.90,2.10),(4,'2022-02-01',56.78,NULL,3,22,9,32.89,5.22),(5,'2022-09-26',39567.08,NULL,7,25,15,29456.08,3967.33),(6,'2021-11-02',19.34,NULL,2,23,14,17.34,2.00),(7,'2022-12-25',8.22,NULL,1,33,13,8.22,8.22),(8,'2023-10-04',309.90,NULL,1,35,11,309.90,309.90),(9,'2023-10-02',678.92,NULL,1,20,12,678.92,678.92),(10,'2023-02-28',10.24,NULL,2,27,9,7.11,3.13),(11,'2023-03-17',90.76,NULL,7,35,9,34.56,5.11),(12,'2023-01-09',45.64,NULL,4,17,10,22.34,0.92),(13,'2023-05-22',12.34,NULL,1,18,37,12.34,12.34),(14,'2023-06-26',11.61,NULL,1,21,16,11.61,11.61),(15,'2022-05-01',73.32,NULL,6,31,16,56.78,1.92);
/*!40000 ALTER TABLE `Receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StateAbbreviations`
--

DROP TABLE IF EXISTS `StateAbbreviations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StateAbbreviations` (
  `StateName` varchar(100) NOT NULL,
  `OtherAbbreviation` varchar(255) DEFAULT NULL,
  `PostalAbbreviation` char(2) NOT NULL,
  PRIMARY KEY (`StateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StateAbbreviations`
--

LOCK TABLES `StateAbbreviations` WRITE;
/*!40000 ALTER TABLE `StateAbbreviations` DISABLE KEYS */;
INSERT INTO `StateAbbreviations` VALUES ('Alabama','Ala.','AL'),('Alaska','Alaska','AK'),('Arizona','Ariz.','AZ'),('Arkansas','Ark.','AR'),('California','Calif.','CA'),('Canal Zone','C.Z.','CZ'),('Colorado','Colo.','CO'),('Connecticut','Conn.','CT'),('Delaware','Del.','DE'),('District of Columbia','D.C.','DC'),('Florida','Fla.','FL'),('Georgia','Ga.','GA'),('Guam','Guam','GU'),('Hawaii','Hawaii','HI'),('Idaho','Idaho','ID'),('Illinois','Ill.','IL'),('Indiana','Ind.','IN'),('Iowa','Iowa','IA'),('Kansas','Kan.','KA'),('Kentucky','Ky.','KY'),('Louisiana','La.','LA'),('Maine','Maine','ME'),('Maryland','Md.','MD'),('Massachusetts','Mass.','MA'),('Michigan','Mich.','MI'),('Minnesota','Minn','MN'),('Mississippi','Miss.','MS'),('Missouri','Mo.','MO'),('Montana','Mont.','MT'),('Nebraska','Neb.','NE'),('Nevada','Nev.','NV'),('New Hampshire','N.H.','NH'),('New Jersey','N.J.','NJ'),('New Mexico','N.M.','NM'),('New York','N.Y.','NY'),('North Carolina','N.C.','NC'),('North Dakota','N.D.','ND'),('Ohio','Ohio','OH'),('Oklahoma','Okla.','OK'),('Oregon','Ore.','OR'),('Pennsylvania','Pa.','PA'),('Puerto Rico','P.R.','PR'),('Rhode Island','R.I.','RI'),('South Carolina','S.C.','SC'),('South Dakota','S.D.','SD'),('Tennessee','Tenn.','TN'),('Texas','Texas','TX'),('Utah','Utah','UT'),('Vermont','Vt.','VT'),('Virgin Islands','V.I.','VI'),('Virginia','Va.','VA'),('Washington','Wash.','WA'),('West Virginia','W.Va.','WV'),('Wisconsin','Wis.','WI'),('Wyoming','Wyo.','WY');
/*!40000 ALTER TABLE `StateAbbreviations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05  8:45:19
