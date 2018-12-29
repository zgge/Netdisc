-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ssh
-- ------------------------------------------------------
-- Server version	5.7.24-log

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
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filesize` double DEFAULT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `is_share` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `savepath` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `uploaddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5uwxepwl5yq7q63knjg6kfbef` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (367,'音乐',2,'陈伟霆 - 我门(电视剧老九门主题曲).mp3',3749.06,'audio/mp3','0','			','D:/upload/89859011-b63c-4342-832b-b74cafb76ccd.mp3',18,'2018-12-21'),(366,'视频',2,'06 弹唱 (A Song for You Till the End of Time).flac',17893.82,'audio/flac','1','			','D:/upload/2f67bc0a-5c48-440c-882d-6638dee6c991.flac',18,'2018-12-21'),(368,'视频',1,'林俊杰 - 可惜没如果.mp3',12061.61,'audio/mp3','1','			','D:/upload/3d52e539-cc1e-41ec-a6b3-93464574f62a.mp3',18,'2018-12-21'),(369,'视频',0,'林俊杰 - 学不会.mp3',9438.08,'audio/mp3','1','			','D:/upload/5c79a56b-1632-47a4-a604-8f26ff5c3ce1.mp3',18,'2018-12-21'),(371,'视频',0,'周杰伦 - 三年二班 [mqms2].mp3',4385.7,'audio/mp3','0','			','D:/upload/d983671d-41bc-4554-9be9-90ac19225d42.mp3',18,'2018-12-21'),(372,'视频',0,'16 序曲：海边 终 (The Beach Departure).flac',7787.44,'audio/flac','0','			','D:/upload/ce6ba761-d112-4b2d-b2ae-2c8e8ecc27c0.flac',18,'2018-12-21'),(373,'音乐',0,'03 序曲：中场休息 (Intermission).flac',5133.31,'audio/flac','0','			','D:/upload/1a9b7901-b091-4007-a24d-e2ba15c70af5.flac',18,'2018-12-21'),(374,'视频',0,'周杰伦 - 以父之名 [mqms2].mp3',5347.74,'audio/mp3','0','			','D:/upload/4ca1a2e1-afed-4b93-b837-22f79967e92e.mp3',18,'2018-12-21'),(375,'音乐',0,'02 不为谁而作的歌 (Twilight).flac',30909.33,'audio/flac','0','			','D:/upload/7e71aa25-36a3-401d-9619-9da338fdf9a8.flac',18,'2018-12-21'),(376,'视频',0,'18 只要有你的地方 (电影《消失的爱人》电影主题曲) [By Your Side (\'\'The Secret\'\' Theme Song)].flac',27167.95,'audio/flac','1','			','D:/upload/89c73ab7-e734-4617-bb27-efe155d3f6b7.flac',18,'2018-12-21'),(377,'音乐',0,'03 序曲：中场休息 (Intermission).flac',5133.31,'audio/flac','1','			','D:/upload/fcab79a6-f881-4cc4-80f5-4a26bd331a8a.flac',18,'2018-12-21'),(384,'视频',0,'3 基于UML的软件开发过程.pptx',9649.54,'application/vnd.openxmlformats-officedocument.presentationml.presentation','1','			','D:/upload/63a5dc51-537d-4eb2-95c1-e0fc897600b6.pptx',12,'2018-12-21'),(379,'音乐',0,'捕获.PNG',20.01,'image/png','1','fdsf			 ','D:/upload/e5cfde07-c959-41c7-bde8-6b4d7d290419.PNG',12,'2018-12-21'),(380,'视频',0,'Capture001.png',185.52,'image/png','1','			','D:/upload/8aeafd39-1616-41eb-b41c-b17dc5eeee9f.png',12,'2018-12-21'),(381,'视频',0,'shop.sql',20.12,'application/octet-stream','1','			','D:/upload/30cac2ad-3059-4f98-a0fe-aeb93215d290.sql',12,'2018-12-21'),(382,'视频',1,'项目开发计划实例.docx',454.82,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','1','			','D:/upload/5cf166d7-bfae-4755-9e5b-f196b983010a.docx',12,'2018-12-21'),(383,'文档',0,'项目开发计划实例.docx',454.82,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','1','			 ','D:/upload/6db2d9db-86aa-4040-9abf-3c0d4f87858f.docx',19,'2018-12-21'),(385,'视频',0,'实验3.docx',16.5,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','1','			','D:/upload/d292640a-6f0d-4f40-9457-ce094b920d10.docx',12,'2018-12-21');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (12,'xmmcute@qq.com','测试','00df9063955e43aeaee70d29eeb4cf8b','13253793155','zgg','af923665-d8e5-4a72-9628-1095ec1c7bb6',1),(13,'xmmcute@qq.com','测试','698d51a19d8a121ce581499d7b701668','13253793155','698d51a19d8a121ce581499d7b701668','39d2fea3-ca3b-44fd-993e-44e0f3982566',1),(18,'xmmcute@qq.com','测试','00df9063955e43aeaee70d29eeb4cf8b','13253793155','liupanke','496a22a1-90ba-4492-a04a-294ef16b4295',1),(16,'xmmcute@qq.com','aaa','08f8e0260c64418510cefb2b06eee5cd','13253793155','aaa','88b1ff84-3045-4f35-993c-8af4142d4bb8',1),(17,'xmmcute@qq.com','测试','47bce5c74f589f4867dbd57e9ca9f808','13253793155','zggg','29019d59-4a9e-4636-aecf-d523e5e34b81',0),(19,'xmmcute@qq.com','测试','202cb962ac59075b964b07152d234b70','13253793155','zhang','25edf0a2-e4b7-4a32-b998-8029dc8762d8',1),(20,'xmmcute@qq.com','测试','74b87337454200d4d33f80c4663dc5e5','13253793155','aaaa','81471573-ed23-4d0a-b684-c8d788237444',1),(21,'xmmcute@qq.com','测试','b2ca678b4c936f905fb82f2733f5297f','13253793155','qq','333fd451-fa70-44bf-8e5b-6cb4cd047f82',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-22 18:37:10
