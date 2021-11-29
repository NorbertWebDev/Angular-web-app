CREATE DATABASE  IF NOT EXISTS `test_ltd` /*!40100 DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test_ltd`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: test_ltd
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `FullName` varchar(200) COLLATE utf32_unicode_ci NOT NULL,
  `Email` varchar(400) COLLATE utf32_unicode_ci DEFAULT NULL,
  `PhoneOrMobile` varchar(13) COLLATE utf32_unicode_ci DEFAULT NULL,
  `Date` datetime NOT NULL,
  `Persons` tinyint unsigned NOT NULL,
  `Message` text COLLATE utf32_unicode_ci,
  PRIMARY KEY (`Id`) KEY_BLOCK_SIZE=1024,
  UNIQUE KEY `Id_UNIQUE` (`Id`) KEY_BLOCK_SIZE=1024
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci PACK_KEYS=1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `FullName` varchar(200) COLLATE utf32_unicode_ci NOT NULL,
  `Email` varchar(400) COLLATE utf32_unicode_ci DEFAULT NULL,
  `Subject` varchar(200) COLLATE utf32_unicode_ci DEFAULT NULL,
  `Message` text COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`) KEY_BLOCK_SIZE=1024,
  UNIQUE KEY `Id_UNIQUE` (`Id`) KEY_BLOCK_SIZE=1024
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci PACK_KEYS=1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `get_all_active_menu_items`
--

DROP TABLE IF EXISTS `get_all_active_menu_items`;
/*!50001 DROP VIEW IF EXISTS `get_all_active_menu_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_all_active_menu_items` AS SELECT 
 1 AS `ImageUrl`,
 1 AS `FoodName`,
 1 AS `Price`,
 1 AS `Ingredients`,
 1 AS `Type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ImageUrl` varchar(128) COLLATE utf32_bin NOT NULL,
  `FoodName` varchar(200) COLLATE utf32_bin NOT NULL,
  `Ingredients` varchar(400) COLLATE utf32_bin NOT NULL,
  `Price` decimal(7,2) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Type` enum('starters','salads','specialty') COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`Id`) KEY_BLOCK_SIZE=1024,
  UNIQUE KEY `Id_UNIQUE` (`Id`) KEY_BLOCK_SIZE=1024,
  UNIQUE KEY `FoodName_UNIQUE` (`FoodName`) KEY_BLOCK_SIZE=4096,
  UNIQUE KEY `Image_UNIQUE` (`ImageUrl`) KEY_BLOCK_SIZE=4096
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf32 COLLATE=utf32_bin PACK_KEYS=1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE  IGNORE INTO `menu` (`Id`, `ImageUrl`, `FoodName`, `Ingredients`, `Price`, `Active`, `Type`) VALUES (2,'/img/menu/lobster-bisque.jpg','Lobster Bisque','Lorem, deren, trataro, filede, nerada',5.95,1,'starters'),(1,'/img/menu/bread-barrel.jpg','Bread Barrel','Lorem, deren, trataro, filede, nerada',6.95,1,'specialty'),(3,'/img/menu/caesar.jpg','Caesar Selections','Lorem, deren, trataro, filede, nerada',8.95,1,'salads'),(4,'/img/menu/tuscan-grilled.jpg','Tuscan Grilled','Grilled chicken with provolone, artichoke hearts, and roasted red pesto',9.95,1,'specialty'),(5,'/img/menu/mozzarella.jpg','Mozzarella Stick','Lorem, deren, trataro, filede, nerada',4.95,1,'starters'),(6,'/img/menu/greek-salad.jpg','Greek Salad','Fresh spinach, crisp romaine, tomatoes, and Greek olives',9.95,1,'salads'),(7,'/img/menu/spinach-salad.jpg','Spinach Salad','Fresh spinach with mushrooms, hard boiled egg, and warm bacon vinaigrette',9.95,1,'salads'),(8,'/img/menu/lobster-roll.jpg','Lobster Roll','Plump lobster meat, mayo and crisp lettuce on a toasted bulky roll',12.95,1,'specialty');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuactive`
--

DROP TABLE IF EXISTS `menuactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuactive` (
  `Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ImageUrl` varchar(128) COLLATE utf32_bin NOT NULL,
  `FoodName` varchar(200) COLLATE utf32_bin NOT NULL,
  `Ingredients` varchar(400) COLLATE utf32_bin NOT NULL,
  `Price` decimal(7,2) NOT NULL,
  `Type` enum('starters','salads','specialty') COLLATE utf32_bin NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  UNIQUE KEY `ImageUrl_UNIQUE` (`ImageUrl`),
  UNIQUE KEY `FoodName_UNIQUE` (`FoodName`)
) ENGINE=MEMORY AUTO_INCREMENT=9 DEFAULT CHARSET=utf32 COLLATE=utf32_bin PACK_KEYS=1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuactive`
--

LOCK TABLES `menuactive` WRITE;
/*!40000 ALTER TABLE `menuactive` DISABLE KEYS */;
REPLACE  IGNORE INTO `menuactive` (`Id`, `ImageUrl`, `FoodName`, `Ingredients`, `Price`, `Type`) VALUES (8,'/img/menu/lobster-roll.jpg','Lobster Roll','Plump lobster meat, mayo and crisp lettuce on a toasted bulky roll',12.95,'specialty'),(7,'/img/menu/spinach-salad.jpg','Spinach Salad','Fresh spinach with mushrooms, hard boiled egg, and warm bacon vinaigrette',9.95,'salads'),(6,'/img/menu/greek-salad.jpg','Greek Salad','Fresh spinach, crisp romaine, tomatoes, and Greek olives',9.95,'salads'),(5,'/img/menu/mozzarella.jpg','Mozzarella Stick','Lorem, deren, trataro, filede, nerada',4.95,'starters'),(4,'/img/menu/tuscan-grilled.jpg','Tuscan Grilled','Grilled chicken with provolone, artichoke hearts, and roasted red pesto',9.95,'specialty'),(3,'/img/menu/caesar.jpg','Caesar Selections','Lorem, deren, trataro, filede, nerada',8.95,'salads'),(1,'/img/menu/bread-barrel.jpg','Bread Barrel','Lorem, deren, trataro, filede, nerada',6.95,'specialty'),(2,'/img/menu/lobster-bisque.jpg','Lobster Bisque','Lorem, deren, trataro, filede, nerada',5.95,'starters');
/*!40000 ALTER TABLE `menuactive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test_ltd'
--

--
-- Dumping routines for database 'test_ltd'
--
/*!50003 DROP PROCEDURE IF EXISTS `book_a_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`booking`@`127.0.0.1` PROCEDURE `book_a_table`(IN fullname varchar(200),IN email varchar(400),IN phoneormobile varchar(13),IN date datetime,IN persons tinyint,IN message text)
BEGIN
	INSERT INTO bookings (FullName,Email,PhoneOrMobile,Date,Persons,Message)
    VALUES (fullname,email,phoneormobile,date,persons,message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_contact_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`contact`@`127.0.0.1` PROCEDURE `create_contact_item`(IN fullname varchar(200),IN email varchar(400),IN subject varchar(200),IN message text)
BEGIN
	INSERT INTO contact (FullName,Email,Subject,Message)
    VALUES (fullname,email,subject,message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fill_active_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `fill_active_menu`()
BEGIN
	INSERT INTO `test_ltd`.`menuactive` (Id,ImageUrl,FoodName,Ingredients,Price,Type)
	SELECT `test_ltd`.`m`.`Id`,`test_ltd`.`m`.`ImageUrl`,`test_ltd`.`m`.`FoodName`,`test_ltd`.`m`.`Ingredients`,`test_ltd`.`m`.`Price`,`test_ltd`.`m`.`Type` FROM `test_ltd`.`menu` AS `m`
    WHERE `test_ltd`.`m`.`Active` = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `get_all_active_menu_items`
--

/*!50001 DROP VIEW IF EXISTS `get_all_active_menu_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`menu`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `get_all_active_menu_items` AS select `menuactive`.`ImageUrl` AS `ImageUrl`,`menuactive`.`FoodName` AS `FoodName`,`menuactive`.`Price` AS `Price`,`menuactive`.`Ingredients` AS `Ingredients`,`menuactive`.`Type` AS `Type` from `menuactive` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-12 22:27:49
