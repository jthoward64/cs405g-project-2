-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: mysql    Database: nbu244
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
-- Table structure for table `ADDRESS`
--

DROP TABLE IF EXISTS `ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADDRESS` (
  `AddressID` int(11) NOT NULL,
  `EntityName` varchar(255) DEFAULT NULL,
  `StreetAddress` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
INSERT INTO `ADDRESS` VALUES (101,'Mr. Ray L. Hyatt Jr.','300 Rose Street Room 102 Hardymon Building','Lexington','KY','40506'),(102,'Mr. Ray L. Hyatt Jr.','301 Hilltop Avenue, Room 102','Lexington','KY','40506'),(103,'John Wick','82 Beaver St Room 1301','New York','NY','10005'),(104,'Tony Stark','200 Park Avenue Penthouse','New York','NY','10001'),(105,'Dr. Stephen Strange','117A Bleecker Street','New York','NY','10001'),(106,'Bob C. Smith','200 Park Avenue Apartment 221','New York','NY','10001'),(107,'Bowman F. Wildcat','#1 Avenue of Champions','Lexington','KY','40507'),(108,'Bob Porter c/o Intech','1 Dead End Row Room 200','Dallas','TX','12347'),(109,'Mr. Bob Sydell c/o Intech','1 Dead End Row Room 200','Dallas','TX','12347'),(110,'Bob C. Smith','200 Park Avenue','Lexington','KY','40507'),(111,'Alfred Gates','1625 Pelham South','Jacksonville','AL','36265'),(112,'Alvin McKee','3371 S Alabama Ave','Monroeville','AL','36460'),(113,'Karla Herbert','103 North Caroline St','Herkimer','NY','13350'),(114,'Marcy Mays','1000 State Route 36','Hornell','NY','14843'),(115,'Bridget Bawen','1400 County Rd 64','Horseheads','NY','14845'),(116,'Taylor Kaiser','135 Fairgrounds Memorial Pkwy','Ithaca','NY','14850'),(117,'Diane Sanford','2 Gannett Dr','Johnson City','NY','13790'),(118,'Delia Malone','233 5th Ave Ext','Johnstown','NY','12095'),(119,'Ernest Sharp','601 Frank Stottile Blvd','Kingston','NY','12401'),(120,'Marguerite Booth','350 E Fairmount Ave','Lakewood','NY','14750'),(121,'Mike Travis','4975 Transit Rd','Lancaster','NY','14086'),(122,'Debra Mason','579 Troy-Schenectady Road','Latham','NY','12110'),(123,'Victor Norman','5783 So Transit Road','Lockport','NY','14094'),(124,'Herbert McMahon','280 Washington Street','Hudson','MA','1749'),(125,'Roberto Darling','20 Soojian Dr','Leicester','MA','1524'),(126,'Juan Best','11 Jungle Road','Leominster','MA','1453'),(127,'Lorna Schmidt','301 Massachusetts Ave','Lunenburg','MA','1462'),(128,'Rick Nash','780 Lynnway','Lynn','MA','1905'),(129,'Ken Bush','70 Pleasant Valley Street','Methuen','MA','1844'),(130,'Central Business Systems, Inc','3138 Custer Drive, Suite 210','Lexington','KY','40517'),(131,'Inacomp IT','1845 Goodpaster Way','Lexington','KY','40505'),(132,'Trifecta!','721 W. Main St.','Lexington','KY','40508'),(133,'Tylark','241 Meadow Valley Rd.','Lexington','KY','40511'),(134,'Real Deals','123 Means Drive','Nicholasville','KY','40356'),(135,'Green Solutions Land Care','956 Enterprise Ct Suite 150','Lexington','KY','40510'),(136,'Dell Technologies','1 Dell Way','Round Rock','TX','78682'),(137,'Hot Pockets','800 N Brand Blvd','Glendale','CA','91203'),(138,'New York Times','242 W 41st St.','New York','NY','10036'),(139,'Urban Outfitters','5000 South Broad St.','Philadelphia','PA','19112'),(140,'Nike','One Bowerman Drive','Beaverton','OR','97005');
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entities`
--

DROP TABLE IF EXISTS `Entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entities` (
  `entity_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  `entity_type` enum('Business','Consumer','Both') DEFAULT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `Entities_ibfk_1` FOREIGN KEY (`AddressID`) REFERENCES `ADDRESS` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entities`
--

LOCK TABLES `Entities` WRITE;
/*!40000 ALTER TABLE `Entities` DISABLE KEYS */;
INSERT INTO `Entities` VALUES (1,'Mr. Ray L. Hyatt Jr.',101,'Consumer','NULL'),(2,'Mr. Ray L. Hyatt Jr.',102,'Consumer','NULL'),(3,'John Wick',103,'Consumer','555-555-5555'),(4,'Tony Stark',104,'Consumer','555-555-3142'),(5,'Dr. Stephen Strange',105,'Consumer','(555)555-4321'),(6,'Bob C. Smith',106,'Consumer','NULL'),(7,'Bowman F. Wildcat',107,'Consumer','NULL'),(8,'Bob Porter c/o Intech',108,'Consumer','NULL'),(9,'Mr. Bob Sydell c/o Intech',109,'Consumer','NULL'),(10,'Bob C. Smith',110,'Consumer','NULL'),(11,'Alfred Gates',111,'Consumer','859-555-1234'),(12,'Alvin McKee',112,'Consumer','859-455-5678'),(13,'Karla Herbert',113,'Consumer','617-575-1234'),(14,'Marcy Mays',114,'Consumer','617-355-5678'),(15,'Bridget Bawen',115,'Consumer','535-859-1234'),(16,'Central Business Systems, Inc',130,'Business','859-254-5568'),(17,'Inacomp IT',131,'Business','859-494-1234'),(18,'Trifecta!',132,'Business','858-545-5638'),(19,'Tylark',133,'Business','552-682-5334'),(20,'Real Deals',134,'Both','617-606-5678'),(21,'Green Solutions Land Care',135,'Business','687-101-1234'),(22,'Dell Technologies',136,'Business','555-525-1000'),(23,'Hot Pockets',137,'Business','222-222-1234'),(24,'New York Times',138,'Both','888-888-5678'),(25,'Urban Outfitters',139,'Both','551-525-1204, 869-678-789');
/*!40000 ALTER TABLE `Entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PhoneNumbers`
--

DROP TABLE IF EXISTS `PhoneNumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PhoneNumbers` (
  `phone_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`phone_id`),
  KEY `entity_id` (`entity_id`),
  CONSTRAINT `PhoneNumbers_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `Entities` (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PhoneNumbers`
--

LOCK TABLES `PhoneNumbers` WRITE;
/*!40000 ALTER TABLE `PhoneNumbers` DISABLE KEYS */;
INSERT INTO `PhoneNumbers` VALUES (1,1,'NULL'),(2,2,'NULL'),(3,3,'555-555-5555'),(4,4,'555-555-3142'),(5,5,'(555)555-4321'),(6,6,'NULL'),(7,7,'NULL'),(8,8,'NULL'),(9,9,'NULL'),(10,10,'NULL'),(11,11,'859-555-1234'),(12,12,'859-455-5678'),(13,13,'617-575-1234'),(14,14,'617-355-5678'),(15,15,'535-859-1234'),(16,16,'859-254-5568'),(17,17,'859-494-1234'),(18,18,'858-545-5638'),(19,19,'552-682-5334'),(20,20,'617-606-5678'),(21,21,'687-101-1234'),(22,22,'555-525-1000'),(23,23,'222-222-1234'),(24,24,'888-888-5678'),(25,25,'551-525-1204, 869-678-789');
/*!40000 ALTER TABLE `PhoneNumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipts`
--

DROP TABLE IF EXISTS `Receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receipts` (
  `receiptID` int(11) DEFAULT NULL,
  `B_AddressID` int(11) DEFAULT NULL,
  `C_AddressID` int(11) DEFAULT NULL,
  `business_name` varchar(512) DEFAULT NULL,
  `transaction_date` varchar(512) DEFAULT NULL,
  `total_sale` double DEFAULT NULL,
  `num_items` int(11) DEFAULT NULL,
  `receipt_image` varchar(512) DEFAULT NULL,
  `highest_price` decimal(10,2) DEFAULT NULL,
  `lowest_price` decimal(10,2) DEFAULT NULL,
  KEY `B_AddressID` (`B_AddressID`),
  KEY `C_AddressID` (`C_AddressID`),
  CONSTRAINT `Receipts_ibfk_1` FOREIGN KEY (`B_AddressID`) REFERENCES `ADDRESS` (`AddressID`),
  CONSTRAINT `Receipts_ibfk_2` FOREIGN KEY (`C_AddressID`) REFERENCES `ADDRESS` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipts`
--

LOCK TABLES `Receipts` WRITE;
/*!40000 ALTER TABLE `Receipts` DISABLE KEYS */;
INSERT INTO `Receipts` VALUES (301,139,106,'Urban Outfitters','2023-01-12',837.23,12,NULL,69.77,69.77),(302,134,114,'Real Deals','2023-01-24',19429.67,34,NULL,571.46,571.46),(303,132,112,'Trifecta!','2023-02-02',6433.66,23,NULL,279.72,279.72),(304,135,103,'Green Solutions Land Care','2023-02-28',9305.25,86,NULL,108.20,108.20),(305,131,107,'Inacomp IT','2023-03-21',2928.21,53,NULL,55.25,55.25),(306,138,139,'New York Times','2023-04-12',8593.05,45,NULL,190.96,190.96),(307,136,138,'Dell Technologies','2023-05-22',21803.58,16,NULL,1362.72,1362.72),(308,130,110,'Central Business Systems, Inc','2023-06-11',10824.12,8,NULL,1353.02,1353.02),(309,134,102,'Real Deals','2023-07-07',4593.69,43,NULL,106.83,106.83),(310,132,105,'Trifecta!','2023-07-27',8233.85,23,NULL,357.99,357.99),(311,134,104,'Real Deals','2023-08-14',29044.12,60,NULL,484.07,484.07),(312,136,110,'Dell Technologies','2023-09-04',5839.85,9,NULL,648.87,648.87),(313,131,108,'Inacomp IT','2023-09-24',2835.34,6,NULL,472.56,472.56),(314,133,134,'Tylark','2023-09-30',5231.49,3,NULL,1743.83,1743.83),(315,137,101,'Hot Pockets','2023-10-02',91824.41,73,NULL,1257.87,1257.87);
/*!40000 ALTER TABLE `Receipts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 13:03:00
