-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `black_list`
--

DROP TABLE IF EXISTS `black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `black_list` (
  `author_id` bigint unsigned NOT NULL,
  `banned_id` bigint unsigned NOT NULL,
  `banned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`author_id`,`banned_id`),
  KEY `author_idx` (`author_id`),
  KEY `banned_idx` (`banned_id`),
  CONSTRAINT `users_author_fk` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_banned_fk` FOREIGN KEY (`banned_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_list`
--

LOCK TABLES `black_list` WRITE;
/*!40000 ALTER TABLE `black_list` DISABLE KEYS */;
INSERT INTO `black_list` VALUES (1,1,1),(2,2,0),(3,3,0),(4,4,1),(5,5,0),(6,6,0),(7,7,1),(8,8,0),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,0),(16,16,1),(17,17,0),(18,18,1),(19,19,0),(20,20,1),(21,21,1),(22,22,0),(23,23,1),(24,24,0),(25,25,0),(26,26,0),(27,27,1),(28,28,0),(29,29,0),(30,30,1),(31,31,0),(32,32,1),(33,33,0),(34,34,1),(35,35,1),(36,36,0),(37,37,0),(38,38,0),(39,39,0),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,0),(46,46,0),(47,47,0),(48,48,1),(49,49,0),(50,50,1),(51,51,0),(52,52,1),(53,53,1),(54,54,1),(55,55,0),(56,56,0),(57,57,1),(58,58,0),(59,59,1),(60,60,0),(61,61,0),(62,62,1),(63,63,1),(64,64,1),(65,65,0),(66,66,1),(67,67,0),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,0),(74,74,0),(75,75,0),(76,76,0),(77,77,1),(78,78,1),(79,79,0),(80,80,1),(81,81,0),(82,82,0),(83,83,0),(84,84,0),(85,85,1),(86,86,1),(87,87,0),(88,88,1),(89,89,0),(90,90,0),(91,91,0),(92,92,1),(93,93,0),(94,94,0),(95,95,0),(96,96,0),(97,97,1),(98,98,0),(99,99,0),(100,100,0);
/*!40000 ALTER TABLE `black_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `txt` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  KEY `chats_messages_users_fk` (`user_id`),
  CONSTRAINT `chats_messages_fk` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  CONSTRAINT `chats_messages_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (1,1,2,'Welcome Petya','2021-04-06 17:48:50',NULL),(2,1,1,'Privet','2021-04-06 17:48:50',NULL),(3,1,1,'Ura','2021-04-06 17:48:50',NULL);
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_users`
--

DROP TABLE IF EXISTS `chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_users` (
  `chat_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`,`user_id`),
  KEY `chat_id` (`chat_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `chats_fk` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  CONSTRAINT `users_chats_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_users`
--

LOCK TABLES `chat_users` WRITE;
/*!40000 ALTER TABLE `chat_users` DISABLE KEYS */;
INSERT INTO `chat_users` VALUES (1,1,'2021-04-06 17:48:49');
/*!40000 ALTER TABLE `chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_idx` (`author_id`),
  CONSTRAINT `users_chats_fk` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'qui',1),(2,'enim',2),(3,'occaecati',3),(4,'alias',4),(5,'cupiditate',5),(6,'ab',6),(7,'sed',7),(8,'est',8),(9,'consequatur',9),(10,'consequuntur',10),(11,'et',11),(12,'dolor',12),(13,'minus',13),(14,'et',14),(15,'magnam',15),(16,'aut',16),(17,'facilis',17),(18,'eos',18),(19,'aut',19),(20,'laudantium',20),(21,'cumque',21),(22,'quam',22),(23,'architecto',23),(24,'provident',24),(25,'non',25),(26,'ipsam',26),(27,'vero',27),(28,'quas',28),(29,'veniam',29),(30,'rerum',30),(31,'quia',31),(32,'laudantium',32),(33,'sed',33),(34,'architecto',34),(35,'quae',35),(36,'unde',36),(37,'maiores',37),(38,'officiis',38),(39,'quod',39),(40,'facilis',40),(41,'dolorem',41),(42,'qui',42),(43,'iste',43),(44,'dolore',44),(45,'tempora',45),(46,'et',46),(47,'earum',47),(48,'eum',48),(49,'fugit',49),(50,'laboriosam',50),(51,'provident',51),(52,'omnis',52),(53,'necessitatibus',53),(54,'non',54),(55,'commodi',55),(56,'aut',56),(57,'id',57),(58,'quidem',58),(59,'saepe',59),(60,'consequuntur',60),(61,'non',61),(62,'rerum',62),(63,'sed',63),(64,'maiores',64),(65,'eum',65),(66,'mollitia',66),(67,'voluptatem',67),(68,'possimus',68),(69,'libero',69),(70,'sit',70),(71,'est',71),(72,'ex',72),(73,'eligendi',73),(74,'sunt',74),(75,'eum',75),(76,'quisquam',76),(77,'itaque',77),(78,'omnis',78),(79,'architecto',79),(80,'sunt',80),(81,'veniam',81),(82,'ea',82),(83,'rerum',83),(84,'in',84),(85,'sunt',85),(86,'in',86),(87,'repudiandae',87),(88,'iusto',88),(89,'aut',89),(90,'deserunt',90),(91,'in',91),(92,'deserunt',92),(93,'consequatur',93),(94,'repudiandae',94),(95,'praesentium',95),(96,'recusandae',96),(97,'ab',97),(98,'sed',98),(99,'quod',99),(100,'quia',100);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_users_admin_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `communities_users_comm_idx` (`community_id`),
  KEY `communities_users_users_idx` (`user_id`),
  CONSTRAINT `fk_communities_users_comm` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_communities_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_from_user_idx` (`from_user_id`),
  KEY `fk_friend_requests_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,1,0),(2,2,1),(3,3,0),(4,4,1),(5,5,0),(6,6,0),(7,7,0),(8,8,1),(9,9,0),(10,10,1),(11,11,1),(12,12,0),(13,13,0),(14,14,1),(15,15,1),(16,16,1),(17,17,0),(18,18,0),(19,19,1),(20,20,0),(21,21,0),(22,22,1),(23,23,1),(24,24,0),(25,25,0),(26,26,0),(27,27,0),(28,28,1),(29,29,0),(30,30,0),(31,31,1),(32,32,0),(33,33,0),(34,34,1),(35,35,0),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,0),(42,42,0),(43,43,0),(44,44,0),(45,45,0),(46,46,1),(47,47,1),(48,48,1),(49,49,0),(50,50,1),(51,51,1),(52,52,0),(53,53,1),(54,54,1),(55,55,0),(56,56,1),(57,57,1),(58,58,1),(59,59,0),(60,60,0),(61,61,0),(62,62,1),(63,63,0),(64,64,1),(65,65,1),(66,66,0),(67,67,0),(68,68,1),(69,69,1),(70,70,0),(71,71,0),(72,72,0),(73,73,0),(74,74,1),(75,75,1),(76,76,1),(77,77,0),(78,78,1),(79,79,0),(80,80,0),(81,81,1),(82,82,0),(83,83,1),(84,84,0),(85,85,0),(86,86,1),(87,87,1),(88,88,0),(89,89,0),(90,90,1),(91,91,1),(92,92,0),(93,93,0),(94,94,0),(95,95,0),(96,96,1),(97,97,1),(98,98,1),(99,99,0),(100,100,1);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_types_id` int unsigned NOT NULL,
  `file_name` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '/files/folder/img.png',
  `file_size` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `media_media_types_idx` (`media_types_id`),
  KEY `media_users_idx` (`user_id`),
  CONSTRAINT `fk_media_media_types` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'exercitationem'),(3,'magnam'),(4,'quia'),(2,'sed');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delivered` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  KEY `fk_messages_from_user_idx` (`from_user_id`),
  KEY `fk_messages_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `txt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `user_posts_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'voluptatibus','1977-04-02 12:28:45','2007-03-25 21:50:50'),(2,2,'perferendis','1972-12-26 09:00:51','2000-03-21 20:47:58'),(3,3,'soluta','1990-12-04 18:18:30','1996-03-22 00:59:06'),(4,4,'beatae','1989-11-28 08:31:56','2012-08-22 23:38:12'),(5,5,'aut','1986-05-27 12:25:11','1987-01-27 22:05:15'),(6,6,'nihil','2012-10-25 18:02:36','1988-04-11 12:10:22'),(7,7,'recusandae','1977-04-09 05:59:38','1995-06-18 01:13:19'),(8,8,'repellendus','1979-10-28 20:11:58','2019-10-26 17:28:13'),(9,9,'ea','1989-09-27 00:58:36','1979-11-13 00:36:00'),(10,10,'placeat','2001-11-14 16:53:23','2019-03-23 07:18:34'),(11,11,'id','1990-01-29 18:37:44','2014-06-13 18:39:51'),(12,12,'cum','2011-12-03 05:30:31','1994-05-23 07:26:42'),(13,13,'illo','1973-01-14 05:58:37','1989-06-25 07:18:56'),(14,14,'quos','2015-06-20 01:47:44','1989-08-07 08:16:23'),(15,15,'qui','1989-01-24 15:45:11','1979-04-24 11:06:45'),(16,16,'voluptas','2001-11-19 10:48:35','2000-04-20 23:28:47'),(17,17,'et','1994-07-11 10:53:33','1983-08-02 02:15:34'),(18,18,'beatae','1985-01-03 03:44:24','2010-06-08 13:51:13'),(19,19,'laborum','2021-02-07 05:58:56','1990-07-24 04:58:22'),(20,20,'nihil','2004-07-21 13:18:12','2004-08-13 01:04:01'),(21,21,'numquam','2007-07-04 03:33:50','2018-07-10 18:29:32'),(22,22,'dolores','1980-01-06 13:57:43','2012-02-05 07:01:51'),(23,23,'qui','2013-11-17 00:08:38','1994-11-14 06:17:54'),(24,24,'dolores','1976-02-10 18:59:29','2002-01-30 23:08:03'),(25,25,'similique','1975-07-11 07:14:26','2017-06-11 18:52:01'),(26,26,'cumque','2013-03-02 13:30:53','1990-07-31 13:03:45'),(27,27,'repudiandae','2000-05-27 11:33:14','1995-06-19 06:30:54'),(28,28,'numquam','1991-02-14 04:24:38','1996-11-11 00:17:43'),(29,29,'nihil','1980-02-20 03:05:56','2000-07-20 08:32:46'),(30,30,'consequuntur','2007-11-07 18:21:41','2002-04-13 12:32:34'),(31,31,'quia','1974-10-26 11:31:15','1979-08-31 18:25:22'),(32,32,'quia','2005-06-01 22:04:39','2008-03-09 10:43:58'),(33,33,'ipsum','1978-03-11 23:40:15','1971-10-21 05:51:57'),(34,34,'cumque','1972-07-13 07:57:48','1978-04-07 08:48:17'),(35,35,'corporis','1999-08-14 10:16:54','1985-01-09 03:16:19'),(36,36,'et','1999-03-01 11:10:58','1973-11-15 20:07:39'),(37,37,'id','2017-11-28 02:26:39','2006-06-06 13:26:32'),(38,38,'sunt','1975-05-07 19:42:25','1985-06-30 07:49:45'),(39,39,'ea','1984-07-09 16:33:29','2013-06-07 00:51:10'),(40,40,'eum','1992-10-20 14:01:49','2011-06-09 19:45:10'),(41,41,'repellendus','1995-12-13 03:23:29','1972-09-23 03:49:54'),(42,42,'officia','1997-09-23 17:07:24','2014-09-22 03:22:00'),(43,43,'dolorem','1997-08-11 02:25:12','2010-06-06 00:41:06'),(44,44,'nobis','1986-07-04 14:33:10','2004-01-10 04:47:25'),(45,45,'quia','1989-07-14 06:18:12','1990-06-28 10:31:54'),(46,46,'illo','1991-01-30 00:02:57','1985-08-05 15:51:18'),(47,47,'est','2011-05-12 17:22:38','1989-03-06 05:29:02'),(48,48,'tenetur','1999-12-08 18:00:59','2016-10-27 12:27:59'),(49,49,'consequatur','1979-03-28 13:17:44','2011-03-14 08:40:06'),(50,50,'sunt','1994-08-16 01:20:31','2005-12-14 22:29:27'),(51,51,'et','1984-06-07 12:14:37','1990-09-07 10:15:55'),(52,52,'ipsa','1994-02-15 01:34:39','1996-07-07 23:01:36'),(53,53,'aliquid','1980-12-23 23:04:28','1978-09-16 06:44:58'),(54,54,'non','1996-02-07 03:14:44','1970-07-29 11:16:28'),(55,55,'dolores','1994-02-20 16:19:17','2018-11-13 17:48:19'),(56,56,'molestias','2000-08-29 11:58:25','2014-12-08 13:57:54'),(57,57,'est','1973-10-07 09:56:43','1980-02-13 14:22:16'),(58,58,'tempore','2000-08-12 20:41:07','2009-07-26 14:36:15'),(59,59,'delectus','1997-11-21 06:27:24','2011-03-20 16:03:35'),(60,60,'hic','2002-02-26 03:18:04','1975-02-26 20:40:07'),(61,61,'necessitatibus','1985-11-02 06:12:23','2001-10-28 06:38:50'),(62,62,'qui','1984-06-29 21:43:01','1993-01-23 04:24:48'),(63,63,'ea','1979-11-11 14:53:13','1973-06-08 06:05:06'),(64,64,'quia','2002-07-21 16:04:54','2002-04-20 15:51:37'),(65,65,'culpa','1980-11-30 12:29:38','2010-08-03 09:02:18'),(66,66,'alias','1975-02-12 05:18:59','1995-09-24 23:04:06'),(67,67,'id','2004-09-11 00:05:18','2021-02-16 08:02:54'),(68,68,'exercitationem','2016-08-31 06:30:47','2009-05-20 03:58:45'),(69,69,'delectus','1984-07-18 06:46:37','1999-09-16 18:44:15'),(70,70,'porro','2002-06-22 16:01:46','2008-05-18 12:28:54'),(71,71,'reiciendis','2002-10-28 14:37:40','1988-06-01 08:46:37'),(72,72,'laboriosam','1998-06-28 03:33:44','1973-09-22 03:16:43'),(73,73,'sed','2018-09-24 13:42:03','1988-03-25 17:36:19'),(74,74,'similique','1984-05-25 07:20:11','2002-02-23 15:50:31'),(75,75,'ut','2018-03-17 09:12:04','1986-07-02 18:19:57'),(76,76,'et','1996-05-11 05:11:59','1992-03-05 14:53:21'),(77,77,'officiis','2008-11-18 18:28:12','2001-06-04 00:46:23'),(78,78,'voluptas','1991-06-06 22:22:50','2007-03-18 18:18:42'),(79,79,'iste','2000-10-16 22:20:55','1982-01-01 17:33:32'),(80,80,'eius','2008-12-24 13:31:03','1986-12-01 02:29:46'),(81,81,'est','2017-03-14 09:40:05','1992-01-07 23:02:35'),(82,82,'deleniti','1978-12-24 07:11:36','2001-10-15 11:11:39'),(83,83,'optio','1971-06-28 06:34:10','1989-07-02 08:38:48'),(84,84,'ipsum','2000-01-14 17:10:09','1993-09-28 10:11:56'),(85,85,'velit','2015-12-01 14:56:28','1982-11-05 06:10:19'),(86,86,'eius','1996-02-06 15:38:28','2020-03-25 03:08:39'),(87,87,'numquam','2017-10-06 22:51:13','2010-12-08 22:13:45'),(88,88,'quibusdam','2008-04-17 22:18:05','2014-08-24 13:37:35'),(89,89,'perspiciatis','1971-01-05 00:21:03','1992-11-15 12:43:54'),(90,90,'aliquam','2000-06-12 17:15:12','1997-03-16 17:54:41'),(91,91,'ut','1970-03-20 21:42:12','1994-03-23 07:50:08'),(92,92,'quod','2004-10-10 00:38:06','1977-10-13 21:02:24'),(93,93,'ab','1997-07-04 10:58:35','1973-03-17 05:29:22'),(94,94,'consequatur','1998-09-01 23:09:21','2006-02-14 00:58:40'),(95,95,'molestiae','2004-10-13 10:55:42','2019-12-12 13:26:26'),(96,96,'repellendus','1980-06-06 02:27:00','1999-08-06 13:46:40'),(97,97,'alias','1975-05-26 17:14:11','1990-11-14 10:21:09'),(98,98,'quaerat','1973-01-25 19:44:27','2000-03-22 04:25:10'),(99,99,'consequatur','1997-08-06 12:25:41','2003-09-02 03:36:40'),(100,100,'consectetur','1971-06-25 12:33:39','1970-09-24 20:01:07');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_likes`
--

DROP TABLE IF EXISTS `posts_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_likes` (
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `like_type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_idx` (`post_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `posts_likes_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `users_likes_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_likes`
--

LOCK TABLES `posts_likes` WRITE;
/*!40000 ALTER TABLE `posts_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m','x') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` int unsigned DEFAULT NULL,
  `user_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'f','1985-08-05',NULL,'Illum officia quia rerum saepe','South Crystal','98'),(2,'x','1973-02-25',NULL,'Vitae perspiciatis officia vol','Prosaccoborough','11'),(3,'f','1980-07-21',NULL,'Dolor illum eveniet vero totam','South Tianna','81498'),(4,'f','1995-06-15',NULL,'Voluptatem nostrum dolorem min','East Maeland','51146'),(5,'f','2017-03-10',NULL,'Vel aut sed quas. Et officia s','West Alexandrine',''),(6,'m','2010-04-05',NULL,'Blanditiis praesentium aut lab','Binsfurt','6'),(7,'m','1970-05-06',NULL,'Occaecati fuga enim rerum opti','North Esperanza',''),(8,'m','2005-10-18',NULL,'Et quia voluptatem maxime qui ','South Toyland','987'),(9,'m','2003-10-30',NULL,'Qui earum ipsam sit rerum assu','North Orland','297693'),(10,'m','2009-07-08',NULL,'Repellat molestiae nihil cum o','Gerhardbury','8'),(11,'m','2020-07-30',NULL,'Nulla harum optio autem illum ','East Thaliahaven','380806'),(12,'m','2013-04-17',NULL,'Similique amet dolor facere au','New Hiram','86813'),(13,'x','2009-04-11',NULL,'Voluptate quo et necessitatibu','Cathrynburgh','9'),(14,'m','2011-07-07',NULL,'Quas et est voluptatibus velit','Kuhicstad','623604'),(15,'f','1999-11-04',NULL,'Cumque voluptatem soluta quas ','South Kamryn','48'),(16,'m','1974-06-17',NULL,'Et eaque est pariatur fugiat e','Joliemouth','147720314'),(17,'m','1976-03-03',NULL,'Perferendis nihil deserunt vol','New Lewis','672'),(18,'x','1972-11-25',NULL,'Perspiciatis voluptate quae ni','Schmidtstad','936516025'),(19,'f','1999-10-19',NULL,'Quas fuga sapiente numquam. Ma','Keanuhaven','1642822'),(20,'m','1994-10-17',NULL,'Hic itaque est nostrum. Nulla ','Port Noemy','509'),(21,'x','2016-06-04',NULL,'Qui ea consectetur inventore v','South Lea',''),(22,'x','1997-11-29',NULL,'Adipisci sed quia quasi sint r','Marquardtchester','698'),(23,'f','2014-02-19',NULL,'At provident est sed sint. Ist','South Daphney','5098331'),(24,'x','1976-01-30',NULL,'Enim quia dolorem et aut quis ','Annieton','9559209'),(25,'f','1976-03-07',NULL,'Aut voluptates nihil atque exp','West Felicia','631410642'),(26,'x','1999-10-20',NULL,'Sint nobis repudiandae veniam ','Gladycetown','4807'),(27,'x','1971-08-16',NULL,'Dolorem ipsum nam deserunt ull','Wilfredland','7159755'),(28,'f','1974-02-21',NULL,'Modi est at cum molestiae assu','North Karliburgh','8070196'),(29,'f','1972-07-28',NULL,'Odit dolorem similique ut sed ','West Stellamouth','375'),(30,'x','1993-07-14',NULL,'Iusto sint ut facilis optio om','Lake Augustfurt','725522'),(31,'m','2014-11-06',NULL,'Vitae cum ut repellat vitae al','West Jacques','2344'),(32,'f','2018-03-30',NULL,'Tenetur corrupti est voluptate','West Elise','231'),(33,'x','2019-04-26',NULL,'Enim delectus atque quia nostr','Zboncakhaven','5'),(34,'x','2007-11-30',NULL,'Ut ut velit nesciunt rerum sin','Pinkview','14153489'),(35,'f','1987-01-04',NULL,'Veritatis in doloremque molest','East Mariloustad','834'),(36,'m','2002-12-14',NULL,'Omnis explicabo consequuntur e','New Bennett','73725'),(37,'x','1991-08-03',NULL,'Animi labore et qui aperiam ut','Port Vergie','66040379'),(38,'f','2004-03-08',NULL,'Ut aperiam quasi debitis in au','Gusikowskitown','450'),(39,'m','2012-12-10',NULL,'Veritatis tempore asperiores c','Yasmineberg','73793375'),(40,'x','1978-07-24',NULL,'Dolorem nulla ut est maxime vo','West Tremaynehaven','660359'),(41,'m','1986-03-24',NULL,'Molestiae dolorem dolor aut re','South Tiannamouth','950'),(42,'x','2019-04-16',NULL,'Sit voluptatem nihil occaecati','West Claudia','813'),(43,'x','1972-04-19',NULL,'Quaerat consequatur saepe nost','Lake Hazlehaven',''),(44,'m','2002-02-05',NULL,'Aut quis animi quam consequatu','Blandafort','88853420'),(45,'x','1971-12-19',NULL,'Nam quis similique quasi vero ','Alisonport','291'),(46,'x','1973-03-02',NULL,'Harum distinctio delectus rem ','North Stephan','90'),(47,'x','2017-12-24',NULL,'Doloremque aspernatur tempora ','North Jerelberg','3'),(48,'f','1976-11-24',NULL,'Dicta totam aut et aut vel exp','Ethanmouth','7221571'),(49,'m','2005-10-07',NULL,'Quis at occaecati at tempore u','Graysonport','23020201'),(50,'x','2018-02-27',NULL,'Deleniti hic dolor ducimus par','Lake Marilynefurt','711532'),(51,'m','2007-12-04',NULL,'Officia dolorem quos repudiand','Kodyside','110028071'),(52,'x','1992-10-14',NULL,'Facilis impedit aut laudantium','West Pinkport','4'),(53,'m','1975-01-11',NULL,'Illum expedita iste porro faci','North Coralieshire','9303058'),(54,'f','2011-04-22',NULL,'In maxime sit nemo facere ex. ','New Moisesfort','695944667'),(55,'m','1983-09-22',NULL,'Dolorem sunt dolorem sed at re','Sengerstad','1089'),(56,'f','2011-07-19',NULL,'Cumque autem aliquam rerum ass','Shanahanhaven',''),(57,'f','2015-03-21',NULL,'Veniam dolore cum excepturi. A','Furmanborough','18297'),(58,'f','1971-02-03',NULL,'Voluptas dolore excepturi adip','Doviestad','47030'),(59,'x','2016-11-26',NULL,'Sit delectus quas eum laudanti','Cassandramouth','56593'),(60,'x','1971-05-27',NULL,'Non neque accusantium possimus','Conntown',''),(61,'m','2020-06-08',NULL,'Corporis aut esse ut maxime. N','Hagenesborough','3598'),(62,'f','2003-05-20',NULL,'Ut rerum vel magnam voluptatem','North Sherman',''),(63,'x','1984-12-06',NULL,'Et voluptatem unde iste et dol','Hegmannfort',''),(64,'f','2020-08-03',NULL,'Sint commodi sed laborum place','South Camillaberg','6108617'),(65,'f','2013-02-21',NULL,'Aut accusamus dolor est ut et ','Mannmouth','6498'),(66,'f','1980-01-21',NULL,'Quos quos error rerum nihil. V','South Celestinofort','6922'),(67,'f','1977-11-08',NULL,'Tenetur et odit ut consequuntu','Reynoldburgh','186292'),(68,'x','1974-07-20',NULL,'Autem tempora consequatur nesc','North Laurie','172'),(69,'m','2014-04-11',NULL,'Iure atque doloremque quis vol','New Magdalenashire','776957966'),(70,'x','2006-01-13',NULL,'Voluptatem corporis quibusdam ','Howellfort','55297'),(71,'x','1999-10-25',NULL,'Et enim cupiditate enim offici','Heidenreichmouth','268304085'),(72,'x','2019-08-08',NULL,'Possimus eum sunt architecto a','East Ernie','93014'),(73,'m','2010-04-29',NULL,'Consequatur repellendus accusa','Hughburgh','3874549'),(74,'f','1976-01-08',NULL,'Quae at est occaecati earum vo','East Kamronmouth',''),(75,'f','2010-09-13',NULL,'Quia non modi explicabo autem ','West Nicholeton','848942053'),(76,'f','1996-12-30',NULL,'In dicta est est. Et ducimus o','Rippinville','630'),(77,'f','2005-12-03',NULL,'Consequatur magnam itaque numq','West Helgaland','76884'),(78,'x','2020-08-06',NULL,'Qui aut facere molestiae sed a','Port Brisastad','133'),(79,'m','1978-06-17',NULL,'Quis voluptatem commodi repell','Weissnatstad','493804575'),(80,'m','1990-08-28',NULL,'Molestiae suscipit ad et. Volu','New Kristofer','8382'),(81,'f','2008-03-06',NULL,'Necessitatibus sint illo digni','Murraychester','844444'),(82,'x','1980-05-25',NULL,'Animi ea qui sapiente cupidita','Port Columbushaven','2903425'),(83,'m','1994-10-16',NULL,'Repellat non rem qui quaerat. ','Adamchester','511966458'),(84,'x','1972-01-02',NULL,'Et voluptatibus voluptatibus v','Sanfordberg','833664'),(85,'m','1975-10-10',NULL,'Eum quibusdam reprehenderit su','West Ludwig','67043467'),(86,'x','1988-06-23',NULL,'Ab consectetur blanditiis illo','East Alainashire',''),(87,'x','1981-06-24',NULL,'Alias aut eum unde non velit. ','Starkland','690'),(88,'f','1998-04-20',NULL,'Est omnis impedit atque qui. T','Julietfort','3'),(89,'f','2020-02-07',NULL,'Praesentium culpa laborum nobi','East Holliemouth','43473719'),(90,'m','2012-04-23',NULL,'Occaecati iusto hic ab. Ea et ','East Pierre','5419'),(91,'m','2020-11-07',NULL,'Fuga iusto non adipisci verita','West Trentonburgh','208614'),(92,'f','1987-09-05',NULL,'Sunt nihil pariatur sapiente o','East Madisonton','332618'),(93,'f','1989-07-24',NULL,'Et sit aut rerum consequuntur ','Port Julioburgh','875'),(94,'f','1975-09-08',NULL,'Qui cupiditate consequatur dol','New Joycebury','310458'),(95,'x','1995-01-25',NULL,'Autem pariatur in neque corpor','New Adolfo','201'),(96,'f','2006-01-24',NULL,'Et fugiat fugit voluptas bland','Howemouth','69774'),(97,'m','1974-06-19',NULL,'Hic sit ut aliquam est quaerat','West Roscoe','2164813'),(98,'f','1994-06-20',NULL,'Et est reiciendis aspernatur i','Bergstromshire','968288540'),(99,'m','1988-07-01',NULL,'Quis odio nobis ex aut. Dolore','Lake Sigridstad','44192546'),(100,'m','1970-04-12',NULL,'Tenetur tenetur at quidem dele','Alfonsofurt','61');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_users`
--

DROP TABLE IF EXISTS `school_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_users` (
  `school_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `start_year` year NOT NULL,
  `finish_year` year DEFAULT NULL,
  PRIMARY KEY (`school_id`,`user_id`),
  KEY `school_idx` (`school_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `school_users_fk` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `school_users_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_users`
--

LOCK TABLES `school_users` WRITE;
/*!40000 ALTER TABLE `school_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique_idx` (`email`),
  UNIQUE KEY `phone_unique_idx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Enrico','Toy','sauer.aliza@example.com','1-691-179-9','6b0db9203a81a0aaf7f2e361da6eaf2c7024c093','1992-01-19 09:11:54'),(2,'Josie','Brekke','libbie.west@example.org','(830)519-60','1cd7b791e7ca51e9d81f2fbd81c5e4d6095d3756','1990-01-31 23:43:15'),(3,'Jennyfer','Harvey','carter.tevin@example.com','627.214.404','792f18bb6e8be4f87b22ad1b30b37d55667219a1','1983-08-10 13:01:13'),(4,'Hettie','Okuneva','rgerlach@example.net','547-125-712','f3bb933d37ecffb9109cc69f4171663b1cf9790c','1976-05-21 10:12:30'),(5,'Elda','Paucek','otto.hackett@example.net','311.267.337','b2ba5eb2b413dcc8d0cc5b0a01b44c5155f28704','1979-02-13 09:11:48'),(6,'Sheridan','Smitham','colin83@example.com','1-617-270-0','93f69936b10970cbaf2811f1efd4b2e17bf88dfc','2004-04-07 13:25:57'),(7,'Aylin','Beer','pablo54@example.net','1-205-123-7','85fa2fba7e346902725a09e50830d5de48ed59d2','1984-02-10 16:22:57'),(8,'Zachery','Green','adell.o\'keefe@example.com','249-851-095','911d9f9c9d7e6f000ef73d395d9d31d061ab0f67','2000-03-21 08:22:28'),(9,'Pattie','Hettinger','henriette.brekke@example.net','(978)525-13','7e5ef739a26f0c99f743a166a04f3b58b1955935','1981-03-03 20:48:16'),(10,'Bethany','Sipes','ford.fahey@example.net','(399)709-19','1867057f544e100a32244944af24aab44faecd0a','1989-09-16 20:30:51'),(11,'Lloyd','Kub','dwill@example.net','03626118792','03c1467a4b4cae9be2a375860973a86d8a43a337','1973-11-30 07:39:12'),(12,'Estel','Hane','huel.bradley@example.net','957-749-630','5ba97adbcac261f98587043c768d9469c15a1657','1970-07-05 20:09:15'),(13,'Cristal','Cartwright','elenor60@example.org','018-879-135','f8bb51d8fe3223273365349f4054c24c1bcd629f','1984-03-07 22:33:36'),(14,'Allison','Koch','leslie71@example.com','06585742812','82645ff4ddea1b3f02295cdaece0caa93f2ea22a','2017-07-12 11:35:36'),(15,'Eric','Koch','pauline.reichert@example.com','090-786-872','eaf8d292a57f1c84a53720f62518007e2330a909','1982-05-03 02:55:28'),(16,'Laurine','Lockman','mcdermott.savion@example.com','+26(1)91624','50cfd538848d208bccfb988bd68fae9e7cae9fe6','1974-07-06 20:07:23'),(17,'Roderick','Ryan','cdaugherty@example.net','(948)117-79','a533554483d9fc1afacb2336403479cced7447bd','1985-11-10 15:32:44'),(18,'Esperanza','Watsica','qcorwin@example.com','(940)148-85','0a8b4809b6a70cf46e086308db2fe3f28c49d60d','2001-02-27 09:25:30'),(19,'Armani','Smitham','tara97@example.com','143.191.568','2f82bf108a1ae8bd169a3bc2fae871ee71cb1c77','1979-06-20 00:28:52'),(20,'Dorthy','Leuschke','timmy39@example.org','209.526.940','8824b3b657a37dd5b06a21f24f8b6a48034c8d85','1980-10-07 22:19:27'),(21,'Kristopher','Emmerich','reba.weissnat@example.org','(838)436-87','da95b11d66d5ddb8eaaf5b507f0a33e8f924c6c5','1989-08-20 20:33:29'),(22,'Eleanore','Reynolds','smitham.hobart@example.net','561.654.099','16b121647044c6ba3e98c2f5464dc594f5be4ccc','2019-11-23 03:48:46'),(23,'Ottilie','Ratke','rolfson.jaylin@example.com','1-474-451-1','7835ba142f31c9a87d3638b63425776ea11c32ff','1988-03-04 12:59:18'),(24,'Edythe','Feeney','sanford.everette@example.net','(038)574-17','fc3974e28d6f03669d5e28621b4e7f9071859cb6','1994-10-02 07:46:32'),(25,'Monte','Pacocha','london50@example.net','(845)559-57','f0a5916c653bf9b15dc333badb9ca41b9d830d68','1990-08-27 00:46:17'),(26,'Lucinda','Wuckert','lilyan.swift@example.org','(882)203-09','1ab8fb9ccb14be1681f70f9fb138f0254de31aef','2017-07-16 08:19:40'),(27,'Kayden','Reinger','powlowski.leonie@example.net','(663)342-64','ffaac31de403162adb681273a9794857b92d1d44','2016-11-18 01:35:49'),(28,'Alda','Gorczany','josh84@example.org','(697)331-89','52e72ad6d981faf1099adfb31f61f0897e2e8e00','2008-08-04 03:03:12'),(29,'Ernesto','O\'Conner','hand.filiberto@example.org','(730)214-57','2e8b0b124bb7a8fcc4164b5dc97e3a1cd1ca3cf6','1985-11-23 17:33:29'),(30,'Ayden','Batz','serenity26@example.net','880.553.633','7286b48aa8e6e28c3e17358be0f8492ea610a625','2002-12-20 10:02:15'),(31,'Reynold','Wisoky','schmidt.kris@example.org','667.743.370','938832cd97bd2bc0e484f0f893fd1650e08c0334','2014-07-17 15:32:50'),(32,'Marisol','Schimmel','towne.jaylan@example.org','1-429-189-9','31437a5eb63cdb0b8fd5d35ab16cb0062a6de113','2012-05-22 12:27:30'),(33,'Katelin','Strosin','rae35@example.com','595.529.984','74bdc800ef8cfbb76b06250dd3b907b54cd3dcd9','2008-02-06 22:22:05'),(34,'Jacky','Mueller','ztorp@example.org','+14(1)70656','5e165348c2f062bc066de1bc86a5e394e8494efd','2019-01-09 21:53:23'),(35,'Carissa','Veum','fae.beatty@example.org','753-603-579','272e82a64e062d7ea92120ff7fb0e8af77d9a2ab','2001-11-17 06:39:28'),(36,'Darren','Kihn','daniel.elvera@example.net','1-682-410-6','08aae3558e12f304dc08718b31a77fe7a96afcba','2014-02-03 08:10:53'),(37,'Craig','Jones','stanton.sadye@example.com','321.104.960','02724884cff2cc1b1f02d64f7bbb02045f057f0f','1976-11-30 21:29:00'),(38,'Karli','Feest','price.glenna@example.net','695-572-448','7f0f82e860d61047ee18dd041e2c08b25d2622bd','2014-10-02 17:23:28'),(39,'Antwon','Balistreri','matilde.o\'conner@example.com','(632)802-96','13fe12085a7fd2694ed461105cbdcfa897fe38ea','1991-11-01 09:23:10'),(40,'Wellington','Graham','camille15@example.net','+95(5)18221','2c0a7d60dd0ba53ab9160e8731c587ca62091fc5','1988-03-12 18:42:48'),(41,'Sophie','Kuvalis','russell79@example.net','(280)773-99','2c5658da1892cb252ce208d174a64bcd37e0095c','2008-11-30 06:59:01'),(42,'Gabriella','Bartell','alvina.heidenreich@example.net','1-155-356-5','7fb961d1f265b17c5fb96b9758b0191535da255a','1970-10-25 04:54:01'),(43,'Jesus','Schowalter','tyrel48@example.org','(356)680-42','e778f78126c7871902c8dd7b541bf4c186b24329','1986-01-29 02:35:25'),(44,'Jammie','Rohan','mike40@example.net','039.031.683','513d5e94b488627e8ae1464e50193a0fc0e96121','1988-12-17 23:24:23'),(45,'Carley','Ankunding','don12@example.org','229-040-254','4a401c1b8bb44d1e686a26fac69d0e7a81c829bc','1973-01-23 20:51:49'),(46,'Rubye','Collier','ona.block@example.com','(892)808-51','4f6cd2ab806c38a44a4e0824c8df13c21d17902e','1986-07-29 12:14:32'),(47,'Jaren','Moen','tthompson@example.org','599-135-238','9f9ca7f12efb1166a08ca64f1569dfc8406dd167','1972-06-23 11:04:03'),(48,'Sarah','Bailey','ppacocha@example.net','684.101.372','76ade340aebe74d917afceb3049802ea73784ca5','2013-03-28 07:44:01'),(49,'Darius','Jerde','estella70@example.com','(906)300-55','b303af4697dd14700a00afc23027a3c1a73baff4','1976-01-12 14:37:04'),(50,'Eulalia','VonRueden','runte.johnny@example.com','596.391.037','ab31ee6576258e7b1ccab5bb3b1b0e05e70952c1','2017-10-06 03:23:45'),(51,'Marcellus','Kunze','xcummings@example.com','(724)362-01','c3cc3dbb480fd5bd5204100e4ab767ae905b26c4','1994-02-11 08:34:30'),(52,'Aleen','Wolff','dwight85@example.org','011.279.267','c1cca310fbf2d3927817dd3557ec79cf47597fb6','2007-09-02 09:16:14'),(53,'Americo','Ullrich','juliana.olson@example.org','00802791622','5e8f2ccba75802efc1124f96bd63a4265e880e62','1983-01-29 09:54:25'),(54,'Roma','Mertz','murphy.alanna@example.com','1-961-566-1','5d75d373e76cb64b4821913cdf683c33677e8f57','1986-02-13 00:15:02'),(55,'Icie','Schmitt','reynolds.jarred@example.net','558.874.279','05bbb1be71595f6bc8bfbb19c60f70842eba2b5a','1978-07-20 20:53:39'),(56,'Jackson','Schaden','linnea50@example.net','528-408-543','15cd53ada9e75149212eda6a1d9090d1c9bfd612','1997-12-17 11:29:26'),(57,'Laurence','Blick','franecki.haven@example.org','817.554.308','906f27c1ce367b1d5a7ad012c68a5a00a1db3a73','2007-04-16 21:43:14'),(58,'Polly','Will','nathen57@example.org','1-257-262-3','d8cd4773403235cff0ad7c24846b79c0a753789b','1999-08-10 01:47:55'),(59,'Chadrick','Carter','ryan.maci@example.net','(568)160-46','0de90b0e3dfce964cbe2b7b22d873cb2e326acef','1997-11-03 03:53:08'),(60,'Coleman','Hilll','elissa31@example.org','964-729-476','de2246b667ee85d2aa6a407fe839852efd42760c','1975-06-01 21:53:09'),(61,'Mozell','Hackett','ines93@example.org','846.339.991','f2581eacff1d20983f26c3b963f1dd11ece75f0f','1998-04-30 15:48:09'),(62,'Aubree','McKenzie','barrett.strosin@example.org','+82(4)38671','746f5aefb85ee682684a24392edee9134263c6ad','2011-05-23 14:13:49'),(63,'Evert','Schoen','uherman@example.org','336-019-036','ab35c77cd51ea44cd3308787170a84f8eaed0b96','2007-08-25 19:27:10'),(64,'Selina','Beahan','madisyn.kreiger@example.org','03057258940','6d276b6f14f643286bbb0adf9f3a6f28b1daff4f','2016-12-30 05:55:58'),(65,'Casimir','Skiles','jacobi.griffin@example.net','1-540-402-2','502761f12b72b378a159f89e45989e65b4494871','2013-01-22 14:34:52'),(66,'Murl','Reinger','henry15@example.net','896.328.633','eca2812d739db4ef836faa2147fee278f391e51b','2011-11-28 17:06:37'),(67,'Adriel','Kohler','jwehner@example.net','575-955-757','58092e19a76859bcbdc21ae9be2eb14e2c85f77c','2014-10-27 05:11:47'),(68,'Maverick','Adams','hhomenick@example.org','630-767-216','ca4675322686acd1e8305b92cdc2f30d14d7664a','2006-11-04 19:09:55'),(69,'Spencer','Pacocha','wilderman.lorenza@example.com','1-483-839-5','950c937dec0d6b1dfe01c305186daa8603a782b6','2003-10-24 20:16:21'),(70,'Saul','Flatley','teichmann@example.com','1-843-067-1','721713a2fadddc7d81af88009d0e5b010f48c412','1994-12-14 17:47:40'),(71,'Dariana','Baumbach','selina55@example.net','06408792506','fb8446c3b93e5ff1c9c7d6d61691f6546f8943f2','1974-10-08 11:24:02'),(72,'Etha','Bogisich','stephan.o\'connell@example.com','(130)094-53','5ded38d5746f16101f4a479dbb7cb57d15669a86','1987-07-13 08:01:59'),(73,'Kiel','Bode','schmidt.ayden@example.com','01241899042','53e1baab9882503b575a6bb880b09365027f89db','2014-08-20 16:19:46'),(74,'Celine','Bednar','torp.asa@example.org','00771249504','39d03e4587bb45f193d1ea1539c64b20ab704d6e','2007-02-18 21:40:12'),(75,'Milo','Schinner','linnie79@example.org','172.922.176','3654483330d2ae09ba117240aafe2b1ac0934a67','1982-10-07 21:02:44'),(76,'Fay','Terry','nterry@example.com','1-481-089-7','e82eb237243787076c9acba8eccccf3e7186c1cf','1984-01-25 09:29:08'),(77,'Ned','Schultz','hrowe@example.com','136.023.341','9036f8662e390cc82bd5c169c35cfe7825083692','2018-09-20 08:34:03'),(78,'Javonte','Ratke','carol15@example.net','323.767.268','55f42a49ef91668594be1d0ec08cf84572ef165d','1970-10-20 17:08:20'),(79,'Coby','Lind','annabel.schmitt@example.com','(315)736-41','01b55dc3ac9b1b5b2e53d848120b544023fd5640','2009-02-05 16:00:57'),(80,'Celestino','Harvey','hrath@example.com','1-970-728-0','ca9abf235ab32f644feff4fd5a87087efaacd8b3','1998-03-08 16:08:31'),(81,'Lina','Windler','trobel@example.com','1-288-068-1','3b4b26e69b6601731c491a48dc7a4d4c0927791c','2001-02-04 08:15:35'),(82,'Josie','Russel','ceasar.feil@example.org','009-596-015','c059b3d0dc00bcf8af93f2e0499963d7ed2bb26c','2018-01-30 21:25:28'),(83,'Fermin','Wolff','bechtelar.gia@example.org','906-446-378','a63eec192f4f7d8f6aea93da19a065040b5bdc50','1990-04-16 15:52:24'),(84,'Vicenta','Parker','jaskolski.kaitlin@example.com','1-534-620-9','643f1849ac4eb22e146dea6cb7b47b9374e36c7a','2006-04-30 04:18:56'),(85,'Dock','Waelchi','genoveva.gibson@example.org','050-206-649','80b107b34480deceddc4ad078668f5da4d764cda','1979-09-15 11:21:52'),(86,'Raymundo','Nikolaus','wilfrid77@example.net','093.362.584','2092c6b83deafadc5c85b64801a524313cebc900','1990-01-20 23:08:44'),(87,'Marilou','Walter','garnet.quitzon@example.net','398.076.694','7f26e8df8030f8fd89325be7b9620b4ed52d5789','1985-11-18 13:28:18'),(88,'Chasity','Huels','fkreiger@example.org','(956)872-64','5a0d85765b8a6524f871204cb5e7bb98f72c858e','1993-09-21 14:24:03'),(89,'Harrison','Lemke','jeramy44@example.net','1-290-341-8','ca4830d4f806b908595fe4868ae6e5f8a46ea8ae','1983-06-10 08:23:24'),(90,'Janet','Franecki','jodie29@example.org','1-988-804-8','442149484d64abb27ccc6e2ee1b9ff34ff13c388','1974-02-06 22:30:27'),(91,'Dejah','Vandervort','schultz.hadley@example.org','886.436.168','de22b0ff8e61abb5dfe57473069049fb4ca53a86','2000-01-29 02:17:56'),(92,'Mathias','Effertz','harold12@example.org','200.048.533','8f96fd05a21c6cd7ee80be766582e6d64a57c596','2008-08-08 08:13:00'),(93,'Davin','Bogisich','nfarrell@example.org','1-774-706-6','95f2e7afc74ea636b114dcc2768b11b6bdd6ca12','1986-08-06 00:34:33'),(94,'Mercedes','Brekke','eunice.heidenreich@example.com','646-205-977','6a14f1ce89cc9ca4e3d45063e441a9e3e79ae04e','1985-10-22 15:53:59'),(95,'Stephon','Dooley','schowalter.alvina@example.net','(288)204-40','6bb4a176a73b8838524d6a399f2abff54140953a','2000-04-14 04:54:18'),(96,'Tyree','Bradtke','martine22@example.com','563-673-881','3b900b29402a1d5d8562675e22eef92ef35e79bd','2003-06-11 15:40:18'),(97,'Ida','Ferry','uschoen@example.com','1-917-849-9','230ef46cfa461b99b3fff4e3c6e8403d7b7bf863','2001-12-17 19:17:09'),(98,'Hosea','Gerlach','kiehn.susanna@example.net','203.155.927','2576d799dac0b7fe62aca757bfc25518a983e765','1996-07-09 15:48:13'),(99,'Billy','Heidenreich','opollich@example.com','562-758-192','5ae92115e1a34799a8d06016143bea6276bbb107','1978-04-11 22:58:18'),(100,'Yesenia','Fahey','clara65@example.com','02566492998','e7089ca4e31789ac2971eef5ba8bd1bf8ac996f9','2003-06-03 19:25:10');
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

-- Dump completed on 2021-04-06 17:56:34
