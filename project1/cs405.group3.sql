-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: mysql.cs.uky.edu    Database: jtho264
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
-- Current Database: `jtho264`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jtho264` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `jtho264`;

--
-- Table structure for table `Entity_Table`
--

DROP TABLE IF EXISTS `Entity_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entity_Table` (
  `Entity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Street_Name` varchar(50) NOT NULL,
  `Zip` varchar(5) NOT NULL,
  `City` varchar(128) NOT NULL,
  `StateName` char(2) NOT NULL,
  `EntityName` varchar(128) NOT NULL,
  `Primary_Telephone_Number` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Entity_ID`),
  KEY `fk_Telephone_Number` (`Primary_Telephone_Number`),
  CONSTRAINT `fk_Telephone_Number` FOREIGN KEY (`Primary_Telephone_Number`) REFERENCES `Telephone_Numbers` (`Telephone_Number`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity_Table`
--

LOCK TABLES `Entity_Table` WRITE;
/*!40000 ALTER TABLE `Entity_Table` DISABLE KEYS */;
INSERT INTO `Entity_Table` VALUES (1,'300 Rose Street Room 102 Hardymon Building','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL),(2,'301 Hilltop Avenue, Room 102','40506','Lexington','KY','Mr. Ray L. Hyatt Jr.',NULL),(3,'82 Beaver St Room 1301','10005','New York','NY','John Wick','555-555-5555'),(4,'200 Park Avenue Penthouse','10001','New York','NY','Tony Stark','555-555-3142'),(5,'117A Bleecker Street','10001','New York','NY','Dr. Stephen Strange','(555)555-4321'),(6,'200 Park Avenue Apartment 221','10001','New York','NY','Bob C. Smith',NULL),(7,'#1 Avenue of Champions','40506','Lexington','KY','Bowman F. Wildcat',NULL),(8,'200 Park Avenue','40507','Lexington','KY','Bob C. Smith',NULL),(9,'1 Dead End Row Room 200','12347','Dallas','TX','Bob Porter c/o Intech',NULL),(10,'1 Dead End Row Room 200','12347','Dallas','TX','Mr. Bob Sydell c/o Intech',NULL),(11,'2299 Richmond Rd','40502','Lexington','KY','Chick-fil-A','(859)335-9856'),(12,'471 Rose St','40508','Lexington','KY','President Eli Capilouto','859-257-1701'),(13,'150 W Lowry Ln #190','40503','Lexington','KY','Kroger','(859) 278-6228'),(14,'2161 Paul Jones Way','40509','Lexington','KY','Culver\'s','(859)263-7777'),(15,'1180 Seven Seas Dr','32830','Lake Buena Vista','FL','Magic Kingdom Park','(407)939-5277'),(16,'500 W New Circle Rd','40511','Lexington','KY','Walmart Supercenter','(859)381-9370'),(17,'123 NotAReal St','40502','Lexington','KY','Tag Howard','(859)684-8444'),(18,'1600 Pennsylvania Ave NW','20500','Washington','DC','White House','(202)456-1414'),(19,'1400 Defense Pentagon','20301','Washington','DC','Pentagon','(703)697-1776'),(20,'101 Cochran Rd','40502','Lexington','KY','Joella\'s Hot Chicken','(859) 269-9593'),(21,'867 South Broadway','40504','Lexington','KY','Jersey Mike\'s Subs','(859)288-0008'),(22,'700 Clark Ave','63102','St. Louis','MO','Busch Stadium','13143459600'),(23,'Antarctic Support Contract 7400 S. Tucson Way','80112','Centennial','CO','Palmer Station (Antarctica)',NULL),(24,'1386 Lexington Rd','40206','Louisville','KY','Headliners Music Hall','(502) 584-8088'),(25,'867 South Broadway','40504','Lexington','KY','Miyako Poke Bowl','(859)469-9098'),(26,'899 Manchester St','40508','Lexington','KY','Manchester Music Hall','(859) 537-7321'),(27,'1649 M-32','49735','Gaylord','MI','E-Free Church Gaylord Campus','19897322647'),(28,'7345 Delridge Way SW','98106','Seattle','WA','The Home Depot','12067622126'),(29,'500 S Upper St STE 110','40508','Lexington','KY','Target','18592863352'),(30,'211 NE Revere Avenue','97701','Bend','OR','Blockbuster','(541)385-9111'),(31,'1837 Plaudit Pl','40509','Lexington','KY','Michael Stacy','(859)789-0812'),(32,'525 Alakawa St','96817','Honolulu','HI','Costco Wholesale','(808)526-6100'),(33,'2021 Harrodsburg Rd','40504','Lexington','KY','The Home Depot','(859) 373-0594'),(34,'2039 El Camino Real','95050','Santa Clara','CA','Patel Brothers','14082613555'),(35,'918 Natural Bridge Rd','40376','Slade','KY','Thatcher Barbecue Company','(606)947-8040'),(36,'867 S Broadway','40504','Lexington','KY','DV8 Kitchen','(859) 955-0388'),(37,'3400 Vine St','45220','Cincinnati','OH','Cincinnati Zoo & Botanical Garden','(513)281-4700'),(38,'417 E Maxwell St Unit B','40508','Lexington','KY','Kentucky Native Café','(859)281-1718'),(39,'4055 Nichols Park Dr','40503','Lexington','KY','Lowe\'s','(859) 971-8300'),(40,'4081 Finn Way','40503','Lexington','KY','J. Alexander\'s Restaurant','(859)687-0099');
/*!40000 ALTER TABLE `Entity_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Receipt_Table`
--

DROP TABLE IF EXISTS `Receipt_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Receipt_Table` (
  `Transaction_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Seller_Key` int(11) NOT NULL,
  `Buyer_Key` int(11) NOT NULL,
  `Picture` blob,
  `Zip` varchar(5) NOT NULL,
  `StateName` char(2) NOT NULL,
  `Number_Of_Items` int(11) NOT NULL,
  `Total_Sales` decimal(15,2) NOT NULL,
  `Highest_Price` decimal(15,2) NOT NULL,
  `Lowest_Price` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Transaction_Number`),
  KEY `Seller_Key` (`Seller_Key`),
  KEY `Buyer_Key` (`Buyer_Key`),
  CONSTRAINT `Receipt_Table_ibfk_1` FOREIGN KEY (`Seller_Key`) REFERENCES `Entity_Table` (`Entity_ID`),
  CONSTRAINT `Receipt_Table_ibfk_2` FOREIGN KEY (`Buyer_Key`) REFERENCES `Entity_Table` (`Entity_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Receipt_Table`
--

LOCK TABLES `Receipt_Table` WRITE;
/*!40000 ALTER TABLE `Receipt_Table` DISABLE KEYS */;
INSERT INTO `Receipt_Table` VALUES (1,13,1,NULL,'40503','KY',5,25.00,5.00,5.00),(2,33,31,NULL,'40504','KY',5,30.00,6.99,3.49),(3,11,4,NULL,'40502','KY',3,29.75,13.37,6.49),(4,29,17,NULL,'40509','KY',5,36.04,12.00,2.89),(5,36,3,NULL,'40504','KY',4,30.02,15.00,3.00),(6,13,5,NULL,'40503','KY',5,22.10,6.49,0.24),(7,24,17,NULL,'40508','KY',1,16.53,16.53,16.53),(8,13,2,NULL,'40503','KY',5,47.44,23.00,4.49),(9,14,12,NULL,'40509','KY',4,25.00,9.99,4.00),(10,15,9,NULL,'32830','FL',6,78.25,15.99,9.99),(11,16,8,NULL,'40511','KY',4,57.80,20.83,10.87),(12,29,17,NULL,'40508','KY',6,80.97,30.67,5.87),(13,21,31,NULL,'40527','KY',4,40.28,15.60,6.00),(14,22,31,NULL,'20500','DC',2,36217.34,36213.35,3.99),(15,18,19,NULL,'20301','DC',1,705392000000.00,705392000000.00,705392000000.00);
/*!40000 ALTER TABLE `Receipt_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telephone_Numbers`
--

DROP TABLE IF EXISTS `Telephone_Numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telephone_Numbers` (
  `Telephone_Number` varchar(32) NOT NULL,
  `Entity_ID` int(11) NOT NULL,
  PRIMARY KEY (`Telephone_Number`),
  KEY `Entity_ID` (`Entity_ID`),
  CONSTRAINT `Telephone_Numbers_ibfk_1` FOREIGN KEY (`Entity_ID`) REFERENCES `Entity_Table` (`Entity_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telephone_Numbers`
--

LOCK TABLES `Telephone_Numbers` WRITE;
/*!40000 ALTER TABLE `Telephone_Numbers` DISABLE KEYS */;
INSERT INTO `Telephone_Numbers` VALUES ('555-555-5555',3),('555-555-3142',4),('(555)555-4321',5),('(859)335-9856',11),('859-257-1701',12),('(859) 278-6228',13),('(859)263-7777',14),('(407)939-5277',15),('(859)381-9370',16),('(859)684-8444',17),('(202)456-1414',18),('(703)697-1776',19),('(859) 269-9593',20),('(859)288-0008',21),('13143459600',22),('(502) 584-8088',24),('(859)469-9098',25),('(859) 537-7321',26),('19897322647',27),('12067622126',28),('1-800-591-3869',29),('18592863352',29),('(541)385-9111',30),('(859)789-0812',31),('(808)526-6100',32),('(859) 373-0594',33),('(859)260-9404',33),('(859)260-9410',33),('14082613555',34),('(606)947-8040',35),('(859) 955-0388',36),('(513)281-4700',37),('(859)281-1718',38),('(859) 971-8300',39),('(859)687-0099',40);
/*!40000 ALTER TABLE `Telephone_Numbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-05 21:19:30
