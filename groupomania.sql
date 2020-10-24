-- MySQL dump 10.13  Distrib 5.7.10, for osx10.9 (x86_64)
--
-- Host: localhost    Database: groupomania
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `postId` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comContent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_postId` (`postId`),
  KEY `fk_comments_userId` (`userId`),
  CONSTRAINT `fk_comments_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,76,78,'2020-10-16 16:56:02','Je serai présente ! '),(6,81,78,'2020-10-16 16:57:49','Moi aussi ;)'),(9,73,81,'2020-10-17 13:05:26','Moi je les trouve super ! '),(14,86,81,'2020-10-22 13:41:53','Super ! '),(15,80,81,'2020-10-23 15:23:57','Merci pour vos retours'),(20,89,81,'2020-10-24 10:07:19','Super ! ');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `fk_like_postId` (`postId`),
  CONSTRAINT `fk_like_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_like_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (6,77,73),(7,78,76),(8,78,81),(9,79,81),(11,79,82),(12,78,82),(15,81,80),(19,81,83),(21,81,84),(23,79,73),(24,78,85),(25,81,86),(26,77,80),(28,81,88),(29,81,89);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL,
  `likes` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_userId` (`userId`),
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (77,76,'Enquête: Amélioration des process internes','Chers tous, \nMerci de partager en commentaires toutes vos idées pour améliorer les process en interne (communication, prospection, productivité, etc).\nReddit: Les propositions seront présentées en conseil d\'administration.','2020-10-13 19:50:53',3),(78,73,'Workshop sur le bien être au travail!','L\'équipe RH et le service de communication organisent un workshop sur le thème du bien-être au travail. \nDate et lieu : Salle de réunion n°1, le 22/10/20 à 16h.\nMerci d\'indiquer votre participation en commentaire.','2020-10-16 16:55:26',4),(79,81,'Soirée Halloween du 31.10.20','Bonjour à tous, \nPour information la soirée Halloween est maintenue mais devra terminer avant 21h; couvre-feu oblige. \nLa \"soirée\" démarrera donc à 17h, apéro oblige !','2020-10-16 16:59:10',3),(81,80,'Que pensez-vous des nouvelles plaquettes?','Bonjour à tous, \n\nJe souhaiterais recueillir vous avis concernant les nouvelles plaquettes distribuées la semaine dernière. \n','2020-10-17 13:03:11',6);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `moderation` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (73,'Martell','Simon','simonchti@hotmail.com','$2a$10$almsECxdglMmiDdWqOEr0OHlbKheIVFTJvxcl7d6uo1c/rpHrr3SG',NULL),(75,'Simond','Sirine','sirine.simond@gmail.com','$2a$10$XZsWvpGM5pBwvk2GXQch8ej2HUrhpemn2QMf6LQQ43c22rH6Iskmy',NULL),(76,'Dupont','Lisa','lisa.dupont@gmail.com','$2a$10$9V15uamuKGt8uenj.S/FIunRa6lONT3Gla/rfKhI7Xwoa8hJiag/e',NULL),(80,'Amelie','Jouvet','admin@groupomania.com','$2a$10$7A/WDcysr4OEBtrUP.sNSO/OMwcEQG6yJU0kGKXPKTDMVeH.5ql6q',1),(81,'Cottard','Erwann','erwancottard@gmail.com','$2a$10$XL/979OtrXN9TQUA3nfXeeNXROKPtOeqFa6nBfir8wZweuoZxL40K',NULL),(82,'Amegavie','Julie','seth.amegavie@groupomania.com','$2a$10$vPewdFp3ipIkpIpBD5t2auIJdvvAsIuvGb5UqRYK0BYejLSPX03L.',NULL),(83,'Choula','Killian','killian.choula@hotmail.com','$2a$10$uzuCX.8h71dyvi0sTFoK9uC1akT.PECHwAKc/5PCzTCy1IZWtER96',NULL),(84,'OLO','Ginette','ginette.olo@yopmail.com','$2a$10$OmWAyT/MiI0Z47wbhawk9.Vi3V38SBWrO6GkXN2xLlG/1HOnYskkO',NULL),(85,'Chavol','Loulou','lulu@chavol.com','$2a$10$k6bJ4qbyzlZLjWbGFmKZIO5XqUC1L019mS1ffjpibmr6Nf8dBfpZC',NULL),(86,'Garcia','Jose','josegg@yopmail.com','$2a$10$2PwHD3dD0uEQ6Ls6XFSO.u/dOfhVhtH7LDL.JFcYqMGwmOsVXkHbO',NULL),(87,'Goland','Oliver','olivier.goland@groupomania.com','$2a$10$dYcN2a0pgrHgHPQm29IS1OrPM7wdRnOgrAUYVWjTVUtGhe9G0XCcC',NULL),(88,'Rodrigo','Nolo','nolo.rodrigo@groupomania.com','$2a$10$uZHghMDvM9QhOWKmeV25G.cEHHv.AvyBcjEhdR8IVFi8F6wz4TLau',NULL),(89,'Lala','Loulou','lala@groupomania.com','$2a$10$Z1peFIUAUkaGEiQD37Jh2eSj.8gorSew6E2BZHsqOJqWhs5Zr8luC',NULL);
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

-- Dump completed on 2020-10-24 10:53:20
