-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Information_ESPN
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Information_ESPN`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Information_ESPN` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Information_ESPN`;

--
-- Table structure for table `Leagues`
--

DROP TABLE IF EXISTS `Leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Leagues` (
  `leagueID` int(11) NOT NULL AUTO_INCREMENT,
  `leagueName` varchar(100) NOT NULL,
  `numOfTeams` int(11) DEFAULT NULL,
  `numOfPlayers` int(11) DEFAULT NULL,
  `sport` varchar(100) NOT NULL,
  `gamesInSeason` int(11) DEFAULT NULL,
  PRIMARY KEY (`leagueID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leagues`
--

LOCK TABLES `Leagues` WRITE;
/*!40000 ALTER TABLE `Leagues` DISABLE KEYS */;
INSERT INTO `Leagues` VALUES (1,'National Football League',32,300,'American Football',17),(2,'Major League Baseball',30,300,'Baseball',162),(3,'National Basketball Association',30,500,'Basketball',82),(4,'Premier League',20,200,'Soccer',38),(5,'National Hockey League',32,400,'Hockey',82),(6,'PGA Tour',0,NULL,'Golf',NULL);
/*!40000 ALTER TABLE `Leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Players` (
  `playerID` int(11) NOT NULL AUTO_INCREMENT,
  `leagueID` int(11) DEFAULT NULL,
  `playerName` varchar(100) NOT NULL,
  `playerNum` int(11) DEFAULT NULL,
  `team` varchar(100) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `yearsPro` int(11) NOT NULL,
  `points` int(11) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  `assists` int(11) DEFAULT NULL,
  PRIMARY KEY (`playerID`),
  KEY `leagueID` (`leagueID`),
  CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `Leagues` (`leagueID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,2,'Marcus Rashford',10,'Manchester United',25,7,130,81,49),(2,2,'Joao Palhinha',26,'Fulham',27,8,19,4,15),(3,2,'Allan Saint-Maximin',10,'Manchester United',25,7,130,81,49),(4,2,'Casemiro',18,'Manchester United',31,12,48,8,40),(5,2,'Neal Maupay',20,'Everton',26,6,39,32,7),(6,2,'Erling Haaland',9,'Manchester City',22,3,99,81,18),(7,2,'Raheem Sterling',17,'Chelsea',25,7,134,68,66),(8,2,'Wilfried Zaha',11,'Crystal Palace',30,11,88,38,50),(9,2,'William Saliba',12,'Arsenal',22,4,9,8,1),(10,2,'Jamie Vardy',9,'Leicester City',36,16,196,170,26),(11,2,'Darwin Nunez',27,'Liverpool',23,5,41,34,7),(12,2,'Son Heung-min',7,'Tottenham Hotspur',30,11,155,101,54),(13,2,'Amadou Onana',8,'Everton',21,3,7,4,3),(14,2,'Douglas Luiz',6,'Aston VIlla',24,6,18,5,13);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teams` (
  `leagueID` int(11) DEFAULT NULL,
  `teamName` varchar(100) NOT NULL,
  `positionInLeague` int(11) NOT NULL,
  `numOfPlayers` int(11) NOT NULL,
  `amountBet` float DEFAULT NULL,
  `trophiesWon` varchar(100) DEFAULT NULL,
  KEY `leagueID` (`leagueID`),
  CONSTRAINT `Teams_ibfk_1` FOREIGN KEY (`leagueID`) REFERENCES `Leagues` (`leagueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES (2,'Arsenal',1,20,NULL,NULL),(2,'Manchester City',2,20,NULL,NULL),(2,'Manchester United',3,20,NULL,NULL),(2,'Tottenham',4,19,NULL,NULL),(2,'Newcastle United',5,21,NULL,NULL),(2,'Liverpool',6,22,NULL,NULL),(2,'Brighton',7,17,NULL,NULL),(2,'Brentford',8,24,NULL,NULL),(2,'Fulham',9,17,NULL,NULL),(2,'Chelsea',10,14,NULL,NULL),(2,'Aston Villa',11,17,NULL,NULL),(2,'Crystal Palace',12,19,NULL,NULL),(2,'Wolves',13,18,NULL,NULL),(2,'Nottingham Forest',14,17,NULL,NULL),(2,'Everton',15,19,NULL,NULL),(2,'Leicester City',16,21,NULL,NULL),(2,'West Ham United',17,22,NULL,NULL),(2,'Bournemouth',18,23,NULL,NULL),(2,'Leeds United',19,17,NULL,NULL),(2,'Southampton',20,20,NULL,NULL),(1,'Arizona Cardinals',1,50,NULL,NULL),(1,'Atlanta Falcons',1,50,NULL,NULL),(1,'Carolina Panthers',1,50,NULL,NULL),(1,'Chicago Bears',1,50,NULL,NULL),(1,'Dallas Cowboys',1,50,NULL,NULL),(1,'Detroit Lions',1,50,NULL,NULL),(1,'Green Bay Packers',1,50,NULL,NULL),(1,'Los Angeles Rams',1,50,NULL,NULL),(1,'Minnesota Vikings',1,50,NULL,NULL),(1,'New Orleans Saints',1,50,NULL,NULL),(1,'New York Giants',1,50,NULL,NULL),(1,'Philadelphia Eagles',1,50,NULL,NULL),(1,'San Francisco 49ers',1,50,NULL,NULL),(1,'Seattle Seahawks',1,50,NULL,NULL),(1,'Tampa Bay Buccaneers',1,50,NULL,NULL),(1,'Washington Commanders',1,50,NULL,NULL),(1,'Baltimore Ravens',1,50,NULL,NULL),(1,'Buffalo Bills',1,50,NULL,NULL),(1,'Cincinnati Bengals',1,50,NULL,NULL),(1,'Cleveland Browns',1,50,NULL,NULL),(1,'Denver Broncos',1,50,NULL,NULL),(1,'Houston Texans',1,50,NULL,NULL),(1,'Indianapolis Colts',1,50,NULL,NULL),(1,'Jacksonville Jaguars',1,50,NULL,NULL),(1,'Kansas City Chiefs',1,50,NULL,NULL),(1,'Las Vegas Raiders',1,50,NULL,NULL),(1,'Los Angeles Chargers',1,50,NULL,NULL),(1,'Miami Dolphins',1,50,NULL,NULL),(1,'New England Patriots',1,50,NULL,NULL),(1,'New York Jets',1,50,NULL,NULL),(1,'Pittsburgh Steelers',1,50,NULL,NULL),(1,'Tennessee Titans',1,50,NULL,NULL),(3,'Milwaukee Bucks',1,12,NULL,NULL),(3,'Boston Celtics',2,13,NULL,NULL),(3,'Philadeplhia 76ers',3,11,NULL,NULL),(3,'Denver Nuggets',4,15,NULL,NULL),(3,'Cleveland Cavaliers',5,20,NULL,NULL),(3,'Sacramento Kings',6,13,NULL,NULL),(3,'Memphis Grizzlies',7,15,NULL,NULL),(3,'New York Knicks',8,13,NULL,NULL),(3,'Brooklyn Nets',9,14,NULL,NULL),(3,'Phoenix Suns',10,16,NULL,NULL),(3,'Miami Heat',11,17,NULL,NULL),(3,'Los Angeles Clippers',12,13,NULL,NULL),(3,'Golden State Warriors',13,12,NULL,NULL),(3,'Minnesota Timberwolves',14,11,NULL,NULL),(3,'Dallas Mavericks',15,14,NULL,NULL),(3,'Atlanta Hawks',16,16,NULL,NULL),(3,'Oklahoma City Thunder',17,17,NULL,NULL),(3,'Los Angeles Lakers',18,18,NULL,NULL),(3,'Toronto Raptors',19,19,NULL,NULL),(3,'Utah Jazz',20,13,NULL,NULL),(3,'New Orleans Pelicans',21,11,NULL,NULL),(3,'Washington Wizards',22,12,NULL,NULL),(3,'Chicago Bulls',23,14,NULL,NULL),(3,'Indiana Pacers',24,15,NULL,NULL),(3,'Portland Trail Blazers',25,13,NULL,NULL),(3,'Orlando Magic',26,16,NULL,NULL),(3,'Charlotte Hornets',27,12,NULL,NULL),(3,'San Antonio Spurs',28,20,NULL,NULL),(3,'Houston Rockets',29,13,NULL,NULL),(3,'Detroit Pistons',30,15,NULL,NULL),(1,'Arizona Cardinals',1,50,NULL,NULL),(1,'Atlanta Falcons',1,50,NULL,NULL),(1,'Carolina Panthers',1,50,NULL,NULL),(1,'Chicago Bears',1,50,NULL,NULL),(1,'Dallas Cowboys',1,50,NULL,NULL),(1,'Detroit Lions',1,50,NULL,NULL),(1,'Green Bay Packers',1,50,NULL,NULL),(1,'Los Angeles Rams',1,50,NULL,NULL),(1,'Minnesota Vikings',1,50,NULL,NULL),(1,'New Orleans Saints',1,50,NULL,NULL),(1,'New York Giants',1,50,NULL,NULL),(1,'Philadelphia Eagles',1,50,NULL,NULL),(1,'San Francisco 49ers',1,50,NULL,NULL),(1,'Seattle Seahawks',1,50,NULL,NULL),(1,'Tampa Bay Buccaneers',1,50,NULL,NULL),(1,'Washington Commanders',1,50,NULL,NULL),(1,'Baltimore Ravens',1,50,NULL,NULL),(1,'Buffalo Bills',1,50,NULL,NULL),(1,'Cincinnati Bengals',1,50,NULL,NULL),(1,'Cleveland Browns',1,50,NULL,NULL),(1,'Denver Broncos',1,50,NULL,NULL),(1,'Houston Texans',1,50,NULL,NULL),(1,'Indianapolis Colts',1,50,NULL,NULL),(1,'Jacksonville Jaguars',1,50,NULL,NULL),(1,'Kansas City Chiefs',1,50,NULL,NULL),(1,'Las Vegas Raiders',1,50,NULL,NULL),(1,'Los Angeles Chargers',1,50,NULL,NULL),(1,'Miami Dolphins',1,50,NULL,NULL),(1,'New England Patriots',1,50,NULL,NULL),(1,'New York Jets',1,50,NULL,NULL),(1,'Pittsburgh Steelers',1,50,NULL,NULL),(1,'Tennessee Titans',1,50,NULL,NULL),(4,'Boston Bruins',1,12,NULL,NULL),(4,'Carolina Hurricanes',2,13,NULL,NULL),(4,'New Jersey Devils',3,11,NULL,NULL),(4,'Vegas Golden Knights',4,15,NULL,NULL),(4,'Toronto Maple Leafs',5,20,NULL,NULL),(4,'Dallas Stars',6,13,NULL,NULL),(4,'Los Angeles Kings',7,15,NULL,NULL),(4,'New York Rangers',8,13,NULL,NULL),(4,'Tampa Bay Lightning',9,14,NULL,NULL),(4,'Minnesota Wild',10,16,NULL,NULL),(4,'Colorado Avalanche',11,17,NULL,NULL),(4,'Edmonton Oilers',12,13,NULL,NULL),(4,'Seattle Kraken',13,12,NULL,NULL),(4,'Winnipeg Jets',14,11,NULL,NULL),(4,'Pittsburgh Penguins',15,14,NULL,NULL),(4,'New York Islanders',16,16,NULL,NULL),(4,'Nashville Predatorsr',17,17,NULL,NULL),(4,'Calgary Flames',18,18,NULL,NULL),(4,'Florida Panthers',19,19,NULL,NULL),(4,'Washington Capitals',20,13,NULL,NULL),(4,'Buffalo Sabres',21,11,NULL,NULL),(4,'Ottawa Senators',22,12,NULL,NULL),(4,'Detroit Red Wings',23,14,NULL,NULL),(4,'Vancouver Canucks',24,15,NULL,NULL),(4,'St. Louis Blues',25,13,NULL,NULL),(4,'Arizona Coyotes',26,16,NULL,NULL),(4,'Montreal Canadiens',27,12,NULL,NULL),(4,'Philadelphia Flyers',28,20,NULL,NULL),(4,'Anaheim Ducks',29,13,NULL,NULL),(4,'Chicago Blackhawks',30,15,NULL,NULL),(4,'San Jose Sharks',31,13,NULL,NULL),(4,'Columbus Blue Jackets',32,15,NULL,NULL);
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 17:04:10
