CREATE DATABASE  IF NOT EXISTS `lab9_zombies` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab9_zombies`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab9_zombies
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `efectividad`
--

DROP TABLE IF EXISTS `efectividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `efectividad` (
  `idTiposDeZombie` int NOT NULL,
  `idObjetos` int NOT NULL,
  `porcentaje` double NOT NULL,
  PRIMARY KEY (`idTiposDeZombie`,`idObjetos`),
  KEY `fk_TiposDeZombie_has_Objetos_Objetos1_idx` (`idObjetos`),
  KEY `fk_TiposDeZombie_has_Objetos_TiposDeZombie1_idx` (`idTiposDeZombie`),
  CONSTRAINT `fk_TiposDeZombie_has_Objetos_Objetos1` FOREIGN KEY (`idObjetos`) REFERENCES `objetos` (`idObjetos`),
  CONSTRAINT `fk_TiposDeZombie_has_Objetos_TiposDeZombie1` FOREIGN KEY (`idTiposDeZombie`) REFERENCES `tiposdezombie` (`idTiposDeZombie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efectividad`
--

LOCK TABLES `efectividad` WRITE;
/*!40000 ALTER TABLE `efectividad` DISABLE KEYS */;
INSERT INTO `efectividad` VALUES (2,83,85.3),(4,84,94.7),(5,85,43);
/*!40000 ALTER TABLE `efectividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humanos`
--

DROP TABLE IF EXISTS `humanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanos` (
  `idHumanos` varchar(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `estadoZ` tinyint NOT NULL,
  PRIMARY KEY (`idHumanos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humanos`
--

LOCK TABLES `humanos` WRITE;
/*!40000 ALTER TABLE `humanos` DISABLE KEYS */;
INSERT INTO `humanos` VALUES ('22284294663','Hildagarde','Janz','Femenino',0),('22379685280','Dido','Armsby','Otro',1),('22669537645','Raynor','Le Huquet','Otro',0),('23527985769','Calypso','Rebeiro','Femenino',0),('23972575355','Loren','Orht','Otro',1),('24739294542','Batsheva','Marler','Masculino',1),('25386728587','Lucais','Mobius','Masculino',0),('25866763834','Caryl','Levin','Femenino',1),('26225296922','Lauralee','Jochens','Femenino',1),('26374793832','Laverna','Trathen','Masculino',1),('26963689549','Katey','Gioani','Otro',0),('26982777724','Trev','Tomik','Otro',1),('28356679285','Darb','Cissell','Femenino',1),('28692533998','Dick','Rowly','Masculino',1),('29828699697','Erv','Fillary','Femenino',0),('32337875575','Reg','Greaterex','Otro',0),('33276585553','Vassili','Frensche','Masculino',1),('33886878845','Birk','Trowell','Femenino',1),('35857643738','Goldie','McAvey','Femenino',1),('36222322447','Roseline','Ferber','Otro',0),('36239852975','Coleen','Kiossel','Otro',1),('36675845958','Welby','Budden','Otro',1),('38259789676','Gordan','Fawke','Otro',0),('39453956969','Garvin','Loughren','Masculino',1),('42227969488','Giffer','Beekman','Masculino',0),('42482785558','Misty','Rizzini','Masculino',1),('42688586254','Byrann','Seaward','Masculino',0),('43343464742','Wendye','Plessing','Masculino',1),('44255976832','Tersina','Dobbison','Masculino',0),('47947935262','Bill','Pagel','Masculino',1),('47956784468','Cal','O\'Lynn','Femenino',0),('49453547669','Alyss','Beer','Otro',1),('49745873358','Delcina','Gabitis','Otro',1),('49898582824','Dall','Cardenas','Femenino',0),('52738823569','Honoria','Hambribe','Femenino',0),('53783442832','Emerson','Aves','Masculino',0),('55755356375','Morganne','Izac','Masculino',0),('55949492923','Nickey','Bignell','Femenino',1),('56283583647','Osbourn','Rattenbury','Otro',1),('56853694294','Andre','Mussettini','Masculino',1),('58369739422','Dylan','Bennit','Masculino',0),('58388536423','Rafaellle','Baptie','Femenino',0),('58446648263','Fanechka','Junifer','Otro',1),('62399444986','Margot','Jeske','Otro',0),('62434664378','Shayna','Patifield','Masculino',1),('62863535924','Lettie','Pinnington','Otro',0),('62942735724','Carlynn','Aglione','Otro',0),('63347485386','Reeta','D\'Ambrosi','Otro',0),('63572349796','Farleigh','de Najera','Femenino',0),('63928452229','Vonny','Lamasna','Masculino',1),('64348493244','Patience','McVicar','Masculino',0),('66224487636','Burty','Lineen','Masculino',0),('66372925362','Kaiser','Griffin','Otro',1),('66634779599','Deina','Butchers','Masculino',1),('67464274875','Chantal','Corck','Otro',0),('67476442727','Edi','Peacher','Otro',1),('67722348489','Lorry','Stradling','Femenino',1),('68223839734','Denys','Glasspoole','Otro',0),('68633922345','Alexander','Whitchurch','Masculino',0),('69286262388','Thomas','Neighbour','Femenino',1),('69296696429','Mitzi','Willatt','Masculino',1),('69677436774','Collin','Oats','Otro',1),('72368334838','Querida','McConville','Otro',0),('73363255845','Rhea','Grigs','Otro',0),('73385839745','Con','Langabeer','Otro',1),('73997237232','Becki','Gavagan','Otro',1),('74358658437','Xylia','Duester','Otro',0),('74366865544','Nancie','Houtby','Femenino',0),('74485799575','Winny','Brewse','Otro',0),('74768779865','Katy','Gordon-Giles','Masculino',0),('74876256272','Birdie','Frude','Masculino',1),('75252387624','Susana','Ilyinski','Masculino',0),('76364964436','Lesley','Rockwill','Masculino',0),('76379937799','Edita','Payze','Otro',0),('77257337684','Nadya','Benoist','Otro',1),('79837643947','Templeton','Colson','Masculino',1),('82368682786','John','Bostick','Masculino',1),('82898556782','Osbourn','O\'Fallon','Otro',1),('83976475555','Bendicty','Martensen','Femenino',1),('84467388345','Angeline','Trevarthen','Masculino',1),('84924685437','Pierson','Tureville','Masculino',1),('85298663945','Tyne','Channing','Femenino',0),('85336977237','Gustave','Richfield','Otro',1),('86232698272','Sherlocke','Empson','Masculino',0),('86464324645','Rosamond','Parkman','Otro',0),('86466955384','Neely','Colliford','Femenino',1),('86665387646','Perry','Mathes','Femenino',0),('87389594245','Branden','Antic','Masculino',0),('88523978782','Jacquetta','Dupoy','Otro',1),('89933765523','Erl','Young','Masculino',0),('92379449733','Antonio','Garthshore','Femenino',1),('94642878777','Guido','Player','Otro',1),('95923954866','Gilburt','Bristowe','Masculino',1),('95932394268','Joellen','Hyland','Otro',1),('96884489986','Johnny','Manuelli','Femenino',1),('98665777546','Timotheus','Mohan','Otro',0),('99462783892','Ingrid','Wallbank','Femenino',0),('99477446373','Tait','Burdess','Masculino',1),('99735449326','Sindee','Itschakov','Otro',1),('99834859239','Lena','Giany','Otro',0);
/*!40000 ALTER TABLE `humanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetos`
--

DROP TABLE IF EXISTS `objetos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetos` (
  `idObjetos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `masa` double NOT NULL,
  `vacuna` tinyint NOT NULL,
  `idHumanos` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idObjetos`),
  KEY `fk_Objetos_Superviviente1_idx` (`idHumanos`),
  CONSTRAINT `fk_Objetos_Superviviente1` FOREIGN KEY (`idHumanos`) REFERENCES `superviviente` (`idHumanos`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetos`
--

LOCK TABLES `objetos` WRITE;
/*!40000 ALTER TABLE `objetos` DISABLE KEYS */;
INSERT INTO `objetos` VALUES (1,'Botella de agua',1,0.5,0,'22284294663'),(2,'Botella de agua',1,0.5,0,'22669537645'),(3,'Botella de agua',1,0.5,0,'23527985769'),(4,'Botella de agua',1,0.5,0,'25386728587'),(5,'Botella de agua',1,0.5,0,'26963689549'),(6,'Botella de agua',1,0.5,0,'29828699697'),(7,'Botella de agua',1,0.5,0,'32337875575'),(8,'Botella de agua',1,0.5,0,'36222322447'),(9,'Botella de agua',1,0.5,0,'38259789676'),(10,'Botella de agua',1,0.5,0,'42227969488'),(11,'Botella de agua',1,0.5,0,'42688586254'),(12,'Botella de agua',1,0.5,0,'44255976832'),(13,'Botella de agua',1,0.5,0,'47956784468'),(14,'Botella de agua',1,0.5,0,'49898582824'),(15,'Botella de agua',1,0.5,0,'52738823569'),(16,'Botella de agua',1,0.5,0,'53783442832'),(17,'Botella de agua',1,0.5,0,'55755356375'),(18,'Botella de agua',1,0.5,0,'58369739422'),(19,'Pistola Glock',1,0.75,0,'42688586254'),(20,'Pistola Glock',1,0.75,0,'49898582824'),(21,'Pistola Glock',1,0.75,0,'47956784468'),(22,'Pistola Glock',1,0.75,0,'44255976832'),(23,'Pistola Glock',1,0.75,0,'52738823569'),(24,'Pistola Glock',1,0.75,0,'53783442832'),(25,'Pistola Glock',1,0.75,0,'55755356375'),(26,'Pistola Glock',1,0.75,0,'58369739422'),(27,'Pistola Glock',1,0.75,0,'58388536423'),(28,'Pistola Glock',1,0.75,0,'62399444986'),(29,'Pistola Glock',1,0.75,0,'62863535924'),(30,'Pistola Glock',1,0.75,0,'62942735724'),(31,'Balas de pistola',27,0.216,0,'49898582824'),(32,'Balas de pistola',5,0.04,0,'58369739422'),(33,'Balas de pistola',10,0.08,0,'53783442832'),(34,'Balas de pistola',71,0.568,0,'52738823569'),(35,'Balas de pistola',25,0.2,0,'58388536423'),(36,'Balas de pistola',47,0.376,0,'55755356375'),(37,'Balas de pistola',43,0.344,0,'62399444986'),(38,'Balas de pistola',1,0.008,0,'62863535924'),(39,'Rifle de asalto',1,2.97,0,'67464274875'),(40,'Rifle de asalto',1,2.97,0,'68223839734'),(41,'Rifle de asalto',1,2.97,0,'68633922345'),(42,'Rifle de asalto',1,2.97,0,'72368334838'),(43,'Rifle de asalto',1,2.97,0,'73363255845'),(44,'Rifle de asalto',1,2.97,0,'74358658437'),(45,'Balas de rifle',30,5.4,0,'74358658437'),(46,'Balas de rifle',37,6.66,0,'73363255845'),(47,'Balas de rifle',20,3.6,0,'72368334838'),(48,'Balas de rifle',21,3.78,0,'68633922345'),(49,'Balas de rifle',45,8.1,0,'68223839734'),(50,'Balas de rifle',7,1.26,0,'67464274875'),(51,'Hacha',1,2,0,'99834859239'),(52,'Hacha',1,2,0,'99462783892'),(53,'Hacha',1,2,0,'98665777546'),(54,'Hacha',1,2,0,'89933765523'),(55,'Hacha',1,2,0,'87389594245'),(56,'Hacha',1,2,0,'86665387646'),(57,'Hacha',1,2,0,'86464324645'),(58,'Hacha',1,2,0,'86232698272'),(59,'Hacha',1,2,0,'85298663945'),(60,'Hacha',1,2,0,'76379937799'),(61,'Hacha',1,2,0,'76364964436'),(62,'Hacha',1,2,0,'75252387624'),(63,'Hacha',1,2,0,'74768779865'),(64,'Hacha',1,2,0,'74485799575'),(65,'Hacha',1,2,0,'74366865544'),(66,'Hacha',1,2,0,'74358658437'),(67,'Hacha',1,2,0,'73363255845'),(68,'Hacha',1,2,0,'72368334838'),(69,'Hacha',1,2,0,'68633922345'),(70,'Hacha',1,2,0,'68223839734'),(71,'Hacha',1,2,0,'67464274875'),(72,'Hacha',1,2,0,'66224487636'),(73,'Hacha',1,2,0,'64348493244'),(74,'Hacha',1,2,0,'63572349796'),(75,'Hacha',1,2,0,'63347485386'),(76,'Hacha',1,2,0,'62942735724'),(77,'Hacha',1,2,0,'62863535924'),(78,'Hacha',1,2,0,'62399444986'),(79,'Hacha',1,2,0,'58388536423'),(80,'Hacha',1,2,0,'58369739422'),(81,'Biblia',1,0.4,0,NULL),(82,'Calculadora',1,0.1,0,NULL),(83,'Relantizador3000',1,0.2,1,NULL),(84,'Pfizer2020',1,0.1,1,NULL),(85,'Aromas de chamán',1,0.008,1,NULL);
/*!40000 ALTER TABLE `objetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superviviente`
--

DROP TABLE IF EXISTS `superviviente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superviviente` (
  `idHumanos` varchar(11) NOT NULL,
  `peso` double NOT NULL,
  `fuerza` double NOT NULL,
  `idPareja` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idHumanos`),
  KEY `fk_Superviviente_Humanos1_idx` (`idHumanos`),
  KEY `fk_Superviviente_Superviviente1_idx` (`idPareja`),
  CONSTRAINT `fk_Superviviente_Humanos1` FOREIGN KEY (`idHumanos`) REFERENCES `humanos` (`idHumanos`),
  CONSTRAINT `fk_Superviviente_Superviviente1` FOREIGN KEY (`idPareja`) REFERENCES `superviviente` (`idHumanos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superviviente`
--

LOCK TABLES `superviviente` WRITE;
/*!40000 ALTER TABLE `superviviente` DISABLE KEYS */;
INSERT INTO `superviviente` VALUES ('22284294663',138,31,'32337875575'),('22669537645',109,97,NULL),('23527985769',60,112,NULL),('25386728587',114,22,NULL),('26963689549',122,47,NULL),('29828699697',115,38,NULL),('32337875575',58,82,'22284294663'),('36222322447',107,122,NULL),('38259789676',70,96,'42227969488'),('42227969488',113,90,'38259789676'),('42688586254',67,99,NULL),('44255976832',107,23,NULL),('47956784468',132,131,NULL),('49898582824',76,131,NULL),('52738823569',120,119,NULL),('53783442832',76,129,NULL),('55755356375',113,61,NULL),('58369739422',138,14,'58388536423'),('58388536423',119,131,'58369739422'),('62399444986',129,19,NULL),('62863535924',106,22,NULL),('62942735724',115,23,NULL),('63347485386',129,88,NULL),('63572349796',91,123,'87389594245'),('64348493244',96,63,NULL),('66224487636',107,22,NULL),('67464274875',72,41,NULL),('68223839734',108,89,NULL),('68633922345',68,53,NULL),('72368334838',71,138,NULL),('73363255845',115,108,NULL),('74358658437',67,133,NULL),('74366865544',126,55,NULL),('74485799575',56,10,NULL),('74768779865',57,91,NULL),('75252387624',58,30,NULL),('76364964436',98,86,NULL),('76379937799',70,59,NULL),('85298663945',92,60,NULL),('86232698272',128,92,NULL),('86464324645',119,66,NULL),('86665387646',72,119,NULL),('87389594245',57,23,'63572349796'),('89933765523',72,135,NULL),('98665777546',100,49,'99462783892'),('99462783892',88,111,'98665777546'),('99834859239',56,89,NULL);
/*!40000 ALTER TABLE `superviviente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdezombie`
--

DROP TABLE IF EXISTS `tiposdezombie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdezombie` (
  `idTiposDeZombie` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTiposDeZombie`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdezombie`
--

LOCK TABLES `tiposdezombie` WRITE;
/*!40000 ALTER TABLE `tiposdezombie` DISABLE KEYS */;
INSERT INTO `tiposdezombie` VALUES (1,'Demoledor'),(2,'Rápido'),(3,'Niño'),(4,'Normal'),(5,'Otro');
/*!40000 ALTER TABLE `tiposdezombie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `idVariante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idVirus` int NOT NULL,
  PRIMARY KEY (`idVariante`),
  KEY `fk_Variante_Virus1_idx` (`idVirus`),
  CONSTRAINT `fk_Variante_Virus1` FOREIGN KEY (`idVirus`) REFERENCES `virus` (`idVirus`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
INSERT INTO `variante` VALUES (1,'Omicron',1),(2,'Alfa',1),(3,'Beta',1),(4,'Delta',1),(5,'Gamma',1),(6,'Burga',2),(7,'Lucho',2),(8,'Lopez',2),(9,'Roldan',2),(10,'Adauto',2),(11,'Rojas',2),(12,'Ugaz',2),(13,'Bautista',2),(14,'Sudan',3),(15,'Zaire',3),(16,'Bundibugyo',3),(17,'Corintio',4),(18,'Tesalonicense',4),(19,'Habacuc',4),(20,'Miqueas',4),(21,'Oseas',4),(22,'Galata',4),(23,'Trica',5),(24,'PrimeraCarta',5),(25,'SegundaCarta',5),(26,'Expulsado',5),(27,'TrasladarTalento',5);
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virus`
--

DROP TABLE IF EXISTS `virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virus` (
  `idVirus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idVirus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virus`
--

LOCK TABLES `virus` WRITE;
/*!40000 ALTER TABLE `virus` DISABLE KEYS */;
INSERT INTO `virus` VALUES (1,'Covid5'),(2,'Hanta'),(3,'Ebola'),(4,'Machupo'),(5,'Bica');
/*!40000 ALTER TABLE `virus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zombie`
--

DROP TABLE IF EXISTS `zombie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zombie` (
  `fechaDeInfeccion` datetime NOT NULL,
  `numeroVictimas` int NOT NULL DEFAULT '0',
  `idTipoZombie` int NOT NULL,
  `idVariante` int NOT NULL,
  `idHumanos` varchar(11) NOT NULL,
  PRIMARY KEY (`idHumanos`),
  KEY `fk_Zombie_TiposDeZombie1_idx` (`idTipoZombie`),
  KEY `fk_Zombie_Variante1_idx` (`idVariante`),
  KEY `fk_Zombie_Humanos1_idx` (`idHumanos`),
  CONSTRAINT `fk_Zombie_Humanos1` FOREIGN KEY (`idHumanos`) REFERENCES `humanos` (`idHumanos`),
  CONSTRAINT `fk_Zombie_TiposDeZombie1` FOREIGN KEY (`idTipoZombie`) REFERENCES `tiposdezombie` (`idTiposDeZombie`),
  CONSTRAINT `fk_Zombie_Variante1` FOREIGN KEY (`idVariante`) REFERENCES `variante` (`idVariante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zombie`
--

LOCK TABLES `zombie` WRITE;
/*!40000 ALTER TABLE `zombie` DISABLE KEYS */;
INSERT INTO `zombie` VALUES ('2022-03-28 15:45:30',11,4,22,'22379685280'),('2022-03-20 23:00:39',14,1,10,'23972575355'),('2022-03-25 03:46:14',11,1,9,'24739294542'),('2022-02-10 15:19:42',7,3,19,'25866763834'),('2022-04-18 04:57:11',12,1,6,'26225296922'),('2022-01-19 02:22:48',14,5,20,'26374793832'),('2022-01-26 17:11:22',0,3,16,'26982777724'),('2022-05-12 00:06:46',3,1,7,'28356679285'),('2022-05-08 11:52:58',6,1,19,'28692533998'),('2022-03-08 11:53:00',13,3,1,'33276585553'),('2022-01-29 03:30:30',10,2,7,'33886878845'),('2022-04-03 06:29:09',12,1,2,'35857643738'),('2022-04-09 02:03:33',7,3,10,'36239852975'),('2022-03-31 03:42:09',3,1,15,'36675845958'),('2022-03-08 01:10:07',3,2,18,'39453956969'),('2022-05-13 23:13:56',9,5,21,'42482785558'),('2022-05-21 17:09:45',8,5,23,'43343464742'),('2022-03-16 08:27:32',13,3,12,'47947935262'),('2022-01-09 23:25:13',6,5,19,'49453547669'),('2022-02-19 07:00:16',1,4,17,'49745873358'),('2022-06-19 07:56:17',13,2,10,'55949492923'),('2022-03-11 11:51:31',10,3,8,'56283583647'),('2022-05-01 15:14:01',8,3,8,'56853694294'),('2022-04-06 19:46:36',13,3,21,'58446648263'),('2022-02-20 17:14:58',7,5,14,'62434664378'),('2022-05-18 17:35:06',7,4,10,'63928452229'),('2022-01-07 22:21:04',12,1,18,'66372925362'),('2022-06-17 03:42:58',0,5,11,'66634779599'),('2022-06-05 19:46:22',9,2,14,'67476442727'),('2022-06-08 14:05:03',1,2,15,'67722348489'),('2022-02-02 18:08:17',1,1,9,'69286262388'),('2022-04-22 08:52:44',0,1,27,'69296696429'),('2022-01-11 23:36:56',11,4,11,'69677436774'),('2022-01-19 01:40:01',8,3,2,'73385839745'),('2022-03-06 14:43:46',10,1,11,'73997237232'),('2022-01-08 08:20:19',13,2,19,'74876256272'),('2022-03-15 03:06:54',7,1,23,'77257337684'),('2022-01-25 10:54:14',2,2,2,'79837643947'),('2022-02-23 07:42:57',12,1,27,'82368682786'),('2022-03-09 20:27:19',11,2,27,'82898556782'),('2022-06-06 11:50:24',2,5,23,'83976475555'),('2022-05-11 00:34:42',12,3,12,'84467388345'),('2022-03-19 15:11:08',7,3,7,'84924685437'),('2022-06-07 15:44:18',10,2,13,'85336977237'),('2022-04-26 10:12:09',0,1,11,'86466955384'),('2022-02-09 07:29:39',3,2,13,'88523978782'),('2022-05-30 06:47:51',11,1,19,'92379449733'),('2022-05-30 17:58:53',3,3,24,'94642878777'),('2022-03-21 19:53:18',1,2,16,'95923954866'),('2022-01-08 05:52:48',13,2,15,'95932394268'),('2022-02-05 15:30:21',3,3,10,'96884489986'),('2022-01-25 19:55:34',0,1,7,'99477446373'),('2022-03-01 02:13:59',8,5,3,'99735449326');
/*!40000 ALTER TABLE `zombie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21  1:32:46
