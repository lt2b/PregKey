-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pregnencydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `baby`
--

DROP TABLE IF EXISTS `baby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baby` (
  `BabyID` int NOT NULL,
  `babyVisitID` int NOT NULL,
  `Fetal_HR` tinyint DEFAULT NULL,
  `Growth` int DEFAULT NULL,
  `Weeks_Along` int DEFAULT NULL,
  PRIMARY KEY (`BabyID`),
  KEY `Visit_FK_idx` (`babyVisitID`),
  CONSTRAINT `Visit_FK` FOREIGN KEY (`babyVisitID`) REFERENCES `visit` (`VisitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baby`
--

LOCK TABLES `baby` WRITE;
/*!40000 ALTER TABLE `baby` DISABLE KEYS */;
INSERT INTO `baby` VALUES (1001,1,0,NULL,2),(1002,2,1,38,38),(1003,3,1,24,24),(1004,4,1,31,31),(1005,5,0,NULL,18),(1006,6,1,23,23),(1007,7,0,NULL,2),(1008,8,0,NULL,6),(1009,9,1,NULL,7),(1010,10,1,NULL,14);
/*!40000 ALTER TABLE `baby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodwork`
--

DROP TABLE IF EXISTS `bloodwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodwork` (
  `BWID` int NOT NULL,
  `PatientBWID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `Platelet_count` int DEFAULT NULL,
  `Hemoglobin_count` int DEFAULT NULL,
  `Red_Blood_Cells_count` int DEFAULT NULL,
  PRIMARY KEY (`BWID`),
  KEY `pbwid_idx` (`PatientBWID`),
  CONSTRAINT `pbwid` FOREIGN KEY (`PatientBWID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodwork`
--

LOCK TABLES `bloodwork` WRITE;
/*!40000 ALTER TABLE `bloodwork` DISABLE KEYS */;
INSERT INTO `bloodwork` VALUES (1,1,'2022-11-19',219,15,4),(2,2,'2023-03-29',204,15,5),(3,3,'2022-05-12',226,12,4),(4,4,'2022-09-27',165,14,5),(5,5,'2022-11-28',103,14,4),(6,6,'2022-08-21',290,13,4),(7,7,'2023-02-21',295,16,4),(8,8,'2022-10-30',168,12,5),(9,9,'2022-04-19',146,14,4),(10,10,'2022-11-14',320,14,4);
/*!40000 ALTER TABLE `bloodwork` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthhistory`
--

DROP TABLE IF EXISTS `healthhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthhistory` (
  `HistoryID` int NOT NULL AUTO_INCREMENT,
  `PatientHealthID` int NOT NULL,
  `Risk_Factor` varchar(45) DEFAULT NULL,
  `Drinking` varchar(45) DEFAULT NULL,
  `Smoking` varchar(45) DEFAULT NULL,
  `STI` varchar(45) DEFAULT NULL,
  `Other` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HistoryID`),
  KEY `boi_idx` (`PatientHealthID`),
  CONSTRAINT `hhid` FOREIGN KEY (`PatientHealthID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthhistory`
--

LOCK TABLES `healthhistory` WRITE;
/*!40000 ALTER TABLE `healthhistory` DISABLE KEYS */;
INSERT INTO `healthhistory` VALUES (1,1,'Low','None','None','No',NULL),(2,2,'Medium','Heavy','Social','No',NULL),(3,3,'Very High','Social','None','No',NULL),(4,4,'Very High','Heavy','Social','No',NULL),(5,5,'High','Moderate','None','No',NULL),(6,6,'Very High','None','Moderate','No',NULL),(7,7,'Medium','Social','Moderate','No',NULL),(8,8,'High','Heavy','None','No',NULL),(9,9,'High','None','Social','No',NULL),(10,10,'Medium','None','None','No',NULL);
/*!40000 ALTER TABLE `healthhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Date_of_Birth` varchar(45) DEFAULT NULL,
  `ZIP_Code` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Height` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Neille','Zanussii','5/7/1983','148403','PO Box 18058',7),(2,'Gabriell','Dacombe','7/26/1999','791687','Room 1580',4),(3,'Charlot','Heinert','1/8/1981','937564','PO Box 1814',7),(4,'Annetta','Cubuzzi','9/25/1996','148312','Room 52',5),(5,'Erina','Easterby','9/29/1983','573829','Apt 1434',7),(6,'Gwynne','Verlander','3/20/1997','509532','Suite 9',4),(7,'Kelsi','Aksell','10/4/1991','225813','Suite 46',6),(8,'Lanna','Veale','11/29/1983','399413','Suite 20',5),(9,'Katrina','Hehl','8/12/1987','896931','PO Box 1794',6),(10,'Clarita','Housaman','4/9/1999','717654','Suite 39',7);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_updates`
--

DROP TABLE IF EXISTS `patient_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_updates` (
  `P_UID` int NOT NULL,
  `P_FK` int NOT NULL,
  `Date` date DEFAULT NULL,
  `BP_N` int DEFAULT NULL,
  `BP_D` int DEFAULT NULL,
  `Beta_hCG` int DEFAULT NULL,
  `Medications` varchar(200) DEFAULT NULL,
  `Other_Symptoms` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`P_UID`),
  KEY `p_fk_idx` (`P_FK`),
  CONSTRAINT `p_fk` FOREIGN KEY (`P_FK`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_updates`
--

LOCK TABLES `patient_updates` WRITE;
/*!40000 ALTER TABLE `patient_updates` DISABLE KEYS */;
INSERT INTO `patient_updates` VALUES (1,1,'2018-06-23',161,86,3439,'Isopropyl Alcohol',NULL),(2,2,'2018-09-12',132,76,100955,'OCTINOXATE, OXYBENZONE',NULL),(3,3,'2018-05-30',131,107,66252,'LIDOCAINE HYDROCHLORIDE, MENTHOL',NULL),(4,4,'2018-06-23',121,79,65275,'Miconazole nitrate',NULL),(5,5,'2018-09-02',166,63,140784,'Triclosan',NULL),(6,6,'2018-08-07',158,91,39467,'Bacitracin Zinc',NULL),(7,7,'2018-08-02',128,105,144461,'Quack Grass',NULL),(8,8,'2018-11-12',134,85,47739,'milnacipran hydrochloride',NULL),(9,9,'2018-05-26',126,69,11021,'witch hazel',NULL),(10,10,'2018-06-15',174,69,16606,'Salicylic Acid',NULL);
/*!40000 ALTER TABLE `patient_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `ProviderID` int NOT NULL,
  `Patient_FK` int NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Number` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ProviderID`),
  KEY `ppid_idx` (`Patient_FK`),
  CONSTRAINT `ppid` FOREIGN KEY (`Patient_FK`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,1,'Joell','Warrington','810-951-2611','jwarrington0@merriam-webster.com'),(2,2,'Tandi','Bendall','529-191-5329','tbendall1@angelfire.com'),(3,3,'Bettina','McDougald','519-449-6552','bmcdougald2@soup.io'),(4,4,'Cesya','Soloway','818-764-8301','csoloway3@people.com.cn'),(5,5,'Rubi','Keane','617-629-7327','rkeane4@zimbio.com'),(6,6,'Trenton','Lassells','292-518-4203','tlassells5@discovery.com'),(7,7,'Laraine','Marvelley','704-932-4159','lmarvelley6@examiner.com'),(8,8,'Bayard','de Lloyd','681-911-7378','bdelloyd7@earthlink.net'),(9,9,'Duke','Dinwoodie','393-739-2598','ddinwoodie8@mac.com'),(10,10,'Olly','Ballinghall','682-530-5221','oballinghall9@microsoft.com');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urinalysis`
--

DROP TABLE IF EXISTS `urinalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urinalysis` (
  `UrinalysisID` int NOT NULL,
  `UBWID` int NOT NULL,
  `Blood` tinyint DEFAULT NULL,
  `Bacteria` tinyint DEFAULT NULL,
  `Glucose` tinyint DEFAULT NULL,
  `Protein` tinyint DEFAULT NULL,
  PRIMARY KEY (`UrinalysisID`),
  KEY `ubwid_idx` (`UBWID`),
  CONSTRAINT `ubwid` FOREIGN KEY (`UBWID`) REFERENCES `bloodwork` (`BWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urinalysis`
--

LOCK TABLES `urinalysis` WRITE;
/*!40000 ALTER TABLE `urinalysis` DISABLE KEYS */;
INSERT INTO `urinalysis` VALUES (1,1,1,0,0,0),(2,2,0,0,0,0),(3,3,0,0,1,0),(4,4,0,0,0,0),(5,5,0,0,0,0),(6,6,0,0,0,0),(7,7,0,0,0,0),(8,8,0,0,0,0),(9,9,0,0,0,0),(10,10,0,0,0,0);
/*!40000 ALTER TABLE `urinalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `VisitID` int NOT NULL,
  `PVisitID` int NOT NULL,
  `Resting_HR` int DEFAULT NULL,
  `Glucose_Amount` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`VisitID`),
  KEY `pvid_idx` (`PVisitID`),
  CONSTRAINT `pvid` FOREIGN KEY (`PVisitID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,1,53,139,165,'2018-06-27'),(2,2,63,89,129,'2018-11-19'),(3,3,65,36,341,'2018-02-11'),(4,4,84,136,114,'2018-03-05'),(5,5,55,81,119,'2018-02-25'),(6,6,43,15,332,'2018-08-13'),(7,7,65,131,272,'2019-01-20'),(8,8,60,145,163,'2018-12-05'),(9,9,45,32,315,'2018-05-23'),(10,10,41,108,233,'2018-07-17');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-02  7:49:24
