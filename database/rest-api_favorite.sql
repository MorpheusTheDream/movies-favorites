-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rest-api
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `no` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `imdbid` varchar(100) DEFAULT NULL,
  `userrating` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (29,'Eric','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg','The Dark Knight','2008-07-18','tt0468569','9.0'),(30,'Eric','https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_.jpg','The Dark Knight Rises','2012-07-20','tt1345836','8.5'),(31,'Eric','https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg','Batman Begins','2005-06-23','tt0372784','8.0'),(33,'Eric','https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_.jpg','Captain America: Civil War','2016-04-27','tt3498820','9.0'),(34,'Eric','https://m.media-amazon.com/images/M/MV5BYjI3NDg0ZTEtMDEwYS00YWMyLThjYjktMTNlM2NmYjc1OGRiXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg','Zack Snyder&apos;s Justice League','2021-03-18','tt12361974','8.0'),(35,'Eric','https://m.media-amazon.com/images/M/MV5BMTk5ODk1NDkxMF5BMl5BanBnXkFtZTcwNTA5OTY0OQ@@._V1_.jpg','Man of Steel','2013-06-13','tt0770828','8.5'),(36,'Eric','https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg','Avengers: Endgame','2019-04-24','tt4154796','8.5'),(62,'Eric','https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg','The Avengers','2012-08-14','tt0848228','7.1'),(69,'Eric','https://m.media-amazon.com/images/M/MV5BYzMyN2I0NjMtYmZhZS00MWJkLWE1MTktNGM2ZDhmNDE1ZDc0XkEyXkFqcGdeQXVyNDg2NzE0MjE@._V1_.jpg','Captain America: The Winter Soldier','2014-04-02','tt1843866','9.0'),(75,'Eric','https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_.jpg','Avengers: Infinity War','2018-04-25','tt4154756','9.0'),(76,'Eric','https://m.media-amazon.com/images/M/MV5BYmY0NjcwMWMtN2MyNC00ZmZjLWEwZTAtM2ExYWE1NDUwNWQyXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg','Resident Evil: Retribution','2012-09-12','tt1855325','7.5'),(82,'Eric','https://m.media-amazon.com/images/M/MV5BYzFhZWFkMjgtMWJhZC00Zjg1LTk0Y2QtMGY5ZjUyMmNmNmEyXkEyXkFqcGdeQXVyMTM1NjM2ODg1._V1_.jpg','Tokyo Vice','2022-04-07','tt2887954','9.0'),(86,'Eric','https://m.media-amazon.com/images/M/MV5BMmVhNzY5YjItMTBlNC00N2ZmLWE5ZGYtMTUzMDA0YjEwOGY0XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg','Resident Evil','2022-07-14','tt9660182',NULL),(87,'Eric','https://m.media-amazon.com/images/M/MV5BZmI1ZGRhNDYtOGVjZC00MmUyLThlNTktMTQyZGE3MzE1ZTdlXkEyXkFqcGdeQXVyNDE5MTU2MDE@._V1_.jpg','Resident Evil','2002-03-21','tt0120804',NULL),(88,'Eric','https://m.media-amazon.com/images/M/MV5BMTc1NTUxMzk0Nl5BMl5BanBnXkFtZTcwNDQ1MDIzMw@@._V1_.jpg','Resident Evil: Apocalypse','2012-12-04','tt0318627',NULL),(89,'Eric','https://m.media-amazon.com/images/M/MV5BZjRlMGQ0NmUtM2U2Ny00MTk3LTg5NjAtN2M3Y2JmZjllNjJlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_.jpg','Resident Evil: Afterlife','2010-09-21','tt1220634',NULL),(91,'Eric','https://m.media-amazon.com/images/M/MV5BMTU4YmExZGItNDdkMC00MjJjLWI3MDAtNmQzMDZkMjRkZDlhXkEyXkFqcGdeQXVyODY5NzkyMjA@._V1_.jpg','Resident Evil: Death Island','2023-07-14','tt26674627',NULL),(92,'Eric','https://m.media-amazon.com/images/M/MV5BNDQ0MWI3MmEtMzM0OC00Y2ViLWE4MDItMzNhNmY1ZTdjMWE2XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg','Resident Evil: Extinction','2021-07-06','tt0432021',''),(94,'Eric','https://m.media-amazon.com/images/M/MV5BODc5YTBhMTItMjhkNi00ZTIxLWI0YjAtNTZmOTY0YjRlZGQ0XkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_.jpg','Avatar: The Last Airbender','2016-01-07','tt0417299',NULL),(95,'Eric','https://m.media-amazon.com/images/M/MV5BZDA0OGQxNTItMDZkMC00N2UyLTg3MzMtYTJmNjg3Nzk5MzRiXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_.jpg','Avatar','2009-12-17','tt0499549',NULL),(96,'Eric','https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_.jpg','Avatar: The Way of Water','2022-12-15','tt1630029',NULL),(97,'Eric','https://m.media-amazon.com/images/M/MV5BMmQwZWYzNWEtYTMyYy00YzBjLTlkNmQtMmI4ZTdhNDRmZDFkXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_.jpg','Warrior','2019-04-05','tt5743796','7.5'),(98,'Eric','https://m.media-amazon.com/images/M/MV5BM2QyNDIzOGMtNThhNS00NmUwLWI0ZjUtZjdkN2I1OTRjZWQ3XkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_.jpg','Mr. Robot','2016-12-15','tt4158110','8.0'),(99,'Eric','https://m.media-amazon.com/images/M/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg','Harry Potter and the Deathly Hallows - Part 2','2011-07-29','tt1201607','7.5'),(100,'Nelson','https://m.media-amazon.com/images/M/MV5BNjA5NmZkMTYtM2I2Mi00NzJkLWJhZGItOGZhMzE0YTViZDMxXkEyXkFqcGdeQXVyNTA3MTU2MjE@._V1_.jpg','Resident Evil: Welcome to Raccoon City','2021-12-24','tt6920084',NULL),(101,'Nelson','https://m.media-amazon.com/images/M/MV5BMTc1NTUxMzk0Nl5BMl5BanBnXkFtZTcwNDQ1MDIzMw@@._V1_.jpg','Resident Evil: Apocalypse','2012-12-04','tt0318627',NULL),(102,'Nelson','https://m.media-amazon.com/images/M/MV5BMmVhNzY5YjItMTBlNC00N2ZmLWE5ZGYtMTUzMDA0YjEwOGY0XkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_.jpg','Resident Evil','2022-07-14','tt9660182',NULL);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 22:06:11
