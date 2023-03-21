-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
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
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notebook_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `notebook_id` (`notebook_id`),
  CONSTRAINT `note_notebook_id` FOREIGN KEY (`notebook_id`) REFERENCES `notebook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `note_BEFORE_INSERT` BEFORE INSERT ON `note` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
    
    IF
		(SELECT NEW.created - NOW()) > 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This field can\'t have future value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `note_BEFORE_UPDATE` BEFORE UPDATE ON `note` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
    
    IF
		(SELECT NEW.created - NOW()) > 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This field can\'t have future value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notebook`
--

DROP TABLE IF EXISTS `notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notebook` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `color` enum('black','white','red','blue','green') NOT NULL DEFAULT 'black',
  PRIMARY KEY (`id`,`color`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notebook_BEFORE_INSERT` BEFORE INSERT ON `notebook` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
    
    IF
		(SELECT NEW.created - NOW()) > 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This field can\'t have future value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `notebook_BEFORE_UPDATE` BEFORE UPDATE ON `notebook` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
    
    IF
		(SELECT NEW.created - NOW()) > 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This field can\'t have future value';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` bigint NOT NULL,
  `type` enum('text','code','title','quote','file','image','youtube','note') NOT NULL,
  `content` longtext NOT NULL,
  `language` enum('sql','java','c++','shell') NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sort` (`sort`,`note_id`),
  KEY `note_id` (`note_id`),
  CONSTRAINT `record_note_id` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `record_BEFORE_INSERT` BEFORE INSERT ON `record` FOR EACH ROW BEGIN
	IF
		LENGTH(NEW.link) > 255
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `link` can\'t be more than 255 characters';
	END IF;
    
    IF
		NEW.type IN ('file', 'image', 'youtube')
	THEN
		SET NEW.link = NEW.content;
		SET NEW.content = '';
	END IF;
    
    IF
		NEW.type = 'note'
	THEN
		IF
			TRIM(NEW.type) = ''
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `content` can\'t be empty';
        END IF;
        
        IF
			(SELECT COUNT(*) FROM note WHERE id = NEW.content) = 0
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect note ID';
        ELSE
			SET NEW.link = NEW.content;
			SET NEW.content = '';
        END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `record_BEFORE_UPDATE` BEFORE UPDATE ON `record` FOR EACH ROW BEGIN
	IF
		LENGTH(NEW.link) > 255
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `link` can\'t be more than 255 characters';
	END IF;
    
    IF
		NEW.type IN ('file', 'image', 'youtube')
	THEN
		SET NEW.link = NEW.content;
		SET NEW.content = '';
	END IF;
    
    IF
		NEW.type = 'note'
	THEN
		IF
			TRIM(NEW.type) = ''
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `content` can\'t be empty';
        END IF;
        
        IF
			(SELECT COUNT(*) FROM note WHERE id = NEW.content) = 0
        THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect note ID';
        ELSE
			SET NEW.link = NEW.content;
			SET NEW.content = '';
        END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_INSERT` BEFORE INSERT ON `team` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `team_BEFORE_UPDATE` BEFORE UPDATE ON `team` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.name) > 20
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `name` can\'t be more then 20 characters';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birth_day` date NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.first_name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `first_name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.first_name) > 15
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `first_name` can\'t be more then 15 characters';
	END IF;
    
    IF
		TRIM(NEW.last_name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `last_name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.last_name) > 30
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `last_name` can\'t be more then 30 characters';
	END IF;
    
    IF 
		NOT (SELECT NEW.email REGEXP "^[a-zA-Z0-9][a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*?[a-zA-Z0-9._-]?@[a-zA-Z0-9][a-zA-Z0-9._-]*?[a-zA-Z0-9]?\\.[a-zA-Z]{2,63}$")
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong email format';
	END IF;
    
    IF
		(SELECT count(*) FROM user WHERE email = NEW.email) > 0
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This email already in use';
	END IF;
    
    IF
		(SELECT YEAR(NOW()) - YEAR(NEW.birth_day)) < 16 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your age is less then 16';
	END IF;
    
    IF
		LENGTH(NEW.password) < 40
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password hash lenght';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_UPDATE` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
	IF
		TRIM(NEW.first_name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `first_name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.first_name) > 15
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `first_name` can\'t be more then 15 characters';
	END IF;
    
    IF
		TRIM(NEW.last_name) = ''
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `last_name` can\'t be empty';
	END IF;
    
    IF
		LENGTH(NEW.last_name) > 30
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field `last_name` can\'t be more then 30 characters';
	END IF;
    
    IF 
		NOT (SELECT NEW.email REGEXP "^[a-zA-Z0-9][a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]*?[a-zA-Z0-9._-]?@[a-zA-Z0-9][a-zA-Z0-9._-]*?[a-zA-Z0-9]?\\.[a-zA-Z]{2,63}$")
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong email format';
	END IF;
    
    IF
		(SELECT count(*) FROM user WHERE email = NEW.email) > 0
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This email already in use';
	END IF;
    
    IF
		(SELECT YEAR(NOW()) - YEAR(NEW.birth_day)) < 16 
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Your age is less then 16';
	END IF;
    
    IF
		LENGTH(NEW.password) < 40
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password hash lenght';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_notebooks`
--

DROP TABLE IF EXISTS `user_notebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notebooks` (
  `user_id` bigint NOT NULL,
  `notebook_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`notebook_id`),
  KEY `user_id` (`user_id`) /*!80000 INVISIBLE */,
  KEY `notebook_id` (`notebook_id`),
  CONSTRAINT `user_notebooks_notebook_id` FOREIGN KEY (`notebook_id`) REFERENCES `notebook` (`id`),
  CONSTRAINT `user_notebooks_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_teams`
--

DROP TABLE IF EXISTS `user_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams` (
  `user_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `team_id` (`team_id`) /*!80000 INVISIBLE */,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_teams_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_teams_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'project'
--

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-21 11:50:15
