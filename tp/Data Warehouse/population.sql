-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: northwind_dw
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dim_cliente`
--

DROP TABLE IF EXISTS `dim_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_cliente`
--

LOCK TABLES `dim_cliente` WRITE;
/*!40000 ALTER TABLE `dim_cliente` DISABLE KEYS */;
INSERT INTO `dim_cliente` VALUES (1,'Anna Bedecs','Company A','Seattle','WA'),(2,'Antonio Gratacos Solsona','Company B','Boston','MA'),(3,'Thomas Axen','Company C','Los Angelas','CA'),(4,'Christina Lee','Company D','New York','NY'),(5,'Martin O’Donnell','Company E','Minneapolis','MN'),(6,'Francisco Pérez-Olaeta','Company F','Milwaukee','WI'),(7,'Ming-Yang Xie','Company G','Boise','ID'),(8,'Elizabeth Andersen','Company H','Portland','OR'),(9,'Sven Mortensen','Company I','Salt Lake City','UT'),(10,'Roland Wacker','Company J','Chicago','IL'),(11,'Peter Krschne','Company K','Miami','FL'),(12,'John Edwards','Company L','Las Vegas','NV'),(13,'Andre Ludick','Company M','Memphis','TN'),(14,'Carlos Grilo','Company N','Denver','CO'),(15,'Helena Kupkova','Company O','Honolulu','HI'),(16,'Daniel Goldschmidt','Company P','San Francisco','CA'),(17,'Jean Philippe Bagel','Company Q','Seattle','WA'),(18,'Catherine Autier Miconi','Company R','Boston','MA'),(19,'Alexander Eggerer','Company S','Los Angelas','CA'),(20,'George Li','Company T','New York','NY'),(21,'Bernard Tham','Company U','Minneapolis','MN'),(22,'Luciana Ramos','Company V','Milwaukee','WI'),(23,'Michael Entin','Company W','Portland','OR'),(24,'Jonas Hasselberg','Company X','Salt Lake City','UT'),(25,'John Rodman','Company Y','Chicago','IL'),(26,'Run Liu','Company Z','Miami','FL'),(27,'Karen Toh','Company AA','Las Vegas','NV'),(28,'Amritansh Raghav','Company BB','Memphis','TN'),(29,'Soo Jung Lee','Company CC','Denver','CO');
/*!40000 ALTER TABLE `dim_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_data`
--

DROP TABLE IF EXISTS `dim_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_data` (
  `idData` bigint(20) NOT NULL,
  `data` varchar(45) NOT NULL,
  `diaSemana` varchar(45) NOT NULL,
  `dia` varchar(45) NOT NULL,
  `mes` varchar(45) NOT NULL,
  `ano` varchar(45) NOT NULL,
  `trimestre` varchar(45) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  PRIMARY KEY (`idData`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_data`
--

LOCK TABLES `dim_data` WRITE;
/*!40000 ALTER TABLE `dim_data` DISABLE KEYS */;
INSERT INTO `dim_data` VALUES (0,'desconhecido','desconhecido','desconhecido','desconhecido','desconhecido','desconhecido','desconhecido'),(20060206,'2006-2-6','0','6','2','2006','1','1'),(20060207,'2006-2-7','1','7','2','2006','1','1'),(20060306,'2006-3-6','0','6','3','2006','1','1'),(20060309,'2006-3-9','3','9','3','2006','1','1'),(20060403,'2006-4-3','0','3','4','2006','2','1'),(20060405,'2006-4-5','2','5','4','2006','2','1'),(20060407,'2006-4-7','4','7','4','2006','2','1'),(20060408,'2006-4-8','5','8','4','2006','2','1'),(20060509,'2006-5-9','1','9','5','2006','2','1'),(20060605,'2006-6-5','0','5','6','2006','2','1'),(20060607,'2006-6-7','2','7','6','2006','2','1'),(20060608,'2006-6-8','3','8','6','2006','2','1'),(200601015,'2006-1-15','6','15','1','2006','1','1'),(200601020,'2006-1-20','4','20','1','2006','1','1'),(200601022,'2006-1-22','6','22','1','2006','1','1'),(200601030,'2006-1-30','0','30','1','2006','1','1'),(200601031,'2006-1-31','1','31','1','2006','1','1'),(200602010,'2006-2-10','4','10','2','2006','1','1'),(200602012,'2006-2-12','6','12','2','2006','1','1'),(200602023,'2006-2-23','3','23','2','2006','1','1'),(200602025,'2006-2-25','5','25','2','2006','1','1'),(200603010,'2006-3-10','4','10','3','2006','1','1'),(200603011,'2006-3-11','5','11','3','2006','1','1'),(200603022,'2006-3-22','2','22','3','2006','1','1'),(200603024,'2006-3-24','4','24','3','2006','1','1'),(200604012,'2006-4-12','2','12','4','2006','2','1'),(200604022,'2006-4-22','5','22','4','2006','2','1'),(200604025,'2006-4-25','1','25','4','2006','2','1'),(200604030,'2006-4-30','6','30','4','2006','2','1'),(200605011,'2006-5-11','3','11','5','2006','2','1'),(200605024,'2006-5-24','2','24','5','2006','2','1'),(200606023,'2006-6-23','4','23','6','2006','2','1');
/*!40000 ALTER TABLE `dim_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_expedidor`
--

DROP TABLE IF EXISTS `dim_expedidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_expedidor` (
  `idExpedidor` int(11) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  PRIMARY KEY (`idExpedidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_expedidor`
--

LOCK TABLES `dim_expedidor` WRITE;
/*!40000 ALTER TABLE `dim_expedidor` DISABLE KEYS */;
INSERT INTO `dim_expedidor` VALUES (0,'desconhecido'),(1,'Shipping Company A'),(2,'Shipping Company B'),(3,'Shipping Company C');
/*!40000 ALTER TABLE `dim_expedidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_fornecedor`
--

DROP TABLE IF EXISTS `dim_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_fornecedor`
--

LOCK TABLES `dim_fornecedor` WRITE;
/*!40000 ALTER TABLE `dim_fornecedor` DISABLE KEYS */;
INSERT INTO `dim_fornecedor` VALUES (1,'Supplier A'),(2,'Supplier B'),(3,'Supplier C'),(4,'Supplier D'),(5,'Supplier E'),(6,'Supplier F'),(7,'Supplier G'),(8,'Supplier H'),(9,'Supplier I'),(10,'Supplier J');
/*!40000 ALTER TABLE `dim_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_funcionario`
--

DROP TABLE IF EXISTS `dim_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_funcionario`
--

LOCK TABLES `dim_funcionario` WRITE;
/*!40000 ALTER TABLE `dim_funcionario` DISABLE KEYS */;
INSERT INTO `dim_funcionario` VALUES (1,'Nancy Freehafer','Sales Representative','Seattle'),(2,'Andrew Cencini','Vice President, Sales','Bellevue'),(3,'Jan Kotas','Sales Representative','Redmond'),(4,'Mariya Sergienko','Sales Representative','Kirkland'),(5,'Steven Thorpe','Sales Manager','Seattle'),(6,'Michael Neipper','Sales Representative','Redmond'),(7,'Robert Zare','Sales Representative','Seattle'),(8,'Laura Giussani','Sales Coordinator','Redmond'),(9,'Anne Hellung-Larsen','Sales Representative','Seattle');
/*!40000 ALTER TABLE `dim_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_produto`
--

DROP TABLE IF EXISTS `dim_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dim_produto` (
  `idProduto` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `quantidadeUnidade` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_produto`
--

LOCK TABLES `dim_produto` WRITE;
/*!40000 ALTER TABLE `dim_produto` DISABLE KEYS */;
INSERT INTO `dim_produto` VALUES (1,'Northwind Traders Chai','10 boxes x 20 bags','Beverages'),(3,'Northwind Traders Syrup','12 - 550 ml bottles','Condiments'),(4,'Northwind Traders Cajun Seasoning','48 - 6 oz jars','Condiments'),(5,'Northwind Traders Olive Oil','36 boxes','Oil'),(6,'Northwind Traders Boysenberry Spread','12 - 8 oz jars','Jams, Preserves'),(7,'Northwind Traders Dried Pears','12 - 1 lb pkgs.','Dried Fruit & Nuts'),(8,'Northwind Traders Curry Sauce','12 - 12 oz jars','Sauces'),(14,'Northwind Traders Walnuts','40 - 100 g pkgs.','Dried Fruit & Nuts'),(17,'Northwind Traders Fruit Cocktail','15.25 OZ','Canned Fruit & Vegetables'),(19,'Northwind Traders Chocolate Biscuits Mix','10 boxes x 12 pieces','Baked Goods & Mixes'),(20,'Northwind Traders Marmalade','30 gift boxes','Jams, Preserves'),(21,'Northwind Traders Scones','24 pkgs. x 4 pieces','Baked Goods & Mixes'),(34,'Northwind Traders Beer','24 - 12 oz bottles','Beverages'),(40,'Northwind Traders Crab Meat','24 - 4 oz tins','Canned Meat'),(41,'Northwind Traders Clam Chowder','12 - 12 oz cans','Soups'),(43,'Northwind Traders Coffee','16 - 500 g tins','Beverages'),(48,'Northwind Traders Chocolate','10 pkgs','Candy'),(51,'Northwind Traders Dried Apples','50 - 300 g pkgs.','Dried Fruit & Nuts'),(52,'Northwind Traders Long Grain Rice','16 - 2 kg boxes','Grains'),(56,'Northwind Traders Gnocchi','24 - 250 g pkgs.','Pasta'),(57,'Northwind Traders Ravioli','24 - 250 g pkgs.','Pasta'),(65,'Northwind Traders Hot Pepper Sauce','32 - 8 oz bottles','Sauces'),(66,'Northwind Traders Tomato Sauce','24 - 8 oz jars','Sauces'),(72,'Northwind Traders Mozzarella','24 - 200 g pkgs.','Dairy products'),(74,'Northwind Traders Almonds','5 kg pkg.','Dried Fruit & Nuts'),(77,'Northwind Traders Mustard','12 boxes','Condiments'),(80,'Northwind Traders Dried Plums','1 lb bag','Dried Fruit & Nuts'),(81,'Northwind Traders Green Tea','20 bags per box','Beverages'),(82,'Northwind Traders Granola','desconhecido','Cereal'),(83,'Northwind Traders Potato Chips','desconhecido','Chips, Snacks'),(85,'Northwind Traders Brownie Mix','3 boxes','Baked Goods & Mixes'),(86,'Northwind Traders Cake Mix','4 boxes','Baked Goods & Mixes'),(87,'Northwind Traders Tea','100 count per box','Beverages'),(88,'Northwind Traders Pears','15.25 OZ','Canned Fruit & Vegetables'),(89,'Northwind Traders Peaches','15.25 OZ','Canned Fruit & Vegetables'),(90,'Northwind Traders Pineapple','15.25 OZ','Canned Fruit & Vegetables'),(91,'Northwind Traders Cherry Pie Filling','15.25 OZ','Canned Fruit & Vegetables'),(92,'Northwind Traders Green Beans','14.5 OZ','Canned Fruit & Vegetables'),(93,'Northwind Traders Corn','14.5 OZ','Canned Fruit & Vegetables'),(94,'Northwind Traders Peas','14.5 OZ','Canned Fruit & Vegetables'),(95,'Northwind Traders Tuna Fish','5 oz','Canned Meat'),(96,'Northwind Traders Smoked Salmon','5 oz','Canned Meat'),(97,'Northwind Traders Hot Cereal','desconhecido','Cereal'),(98,'Northwind Traders Vegetable Soup','desconhecido','Soups'),(99,'Northwind Traders Chicken Soup','desconhecido','Soups');
/*!40000 ALTER TABLE `dim_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tf_encomendas`
--

DROP TABLE IF EXISTS `tf_encomendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tf_encomendas` (
  `idOrderSK` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `expedidor` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dataPedido` bigint(20) NOT NULL,
  `dataPagamento` bigint(20) NOT NULL,
  `dataEnvio` bigint(20) NOT NULL,
  `quantidade` decimal(18,4) NOT NULL,
  `precoTotal` decimal(19,4) NOT NULL,
  `precoUnidade` decimal(19,4) NOT NULL,
  `precoEnvio` decimal(19,4) NOT NULL,
  `desconto` double NOT NULL,
  PRIMARY KEY (`idOrderSK`),
  KEY `fk_TF-Orders_DIM-Employee1_idx` (`funcionario`),
  KEY `fk_TF-Orders_DIM-Product1_idx` (`produto`),
  KEY `fk_TF-Orders_DIM-Customer1_idx` (`cliente`),
  KEY `fk_TF-Orders_DIM-Suppliers1_idx` (`fornecedor`),
  KEY `fk_TF-Encomendas_DIM-Data1_idx` (`dataPedido`),
  KEY `fk_TF-Encomendas_DIM-Data2_idx` (`dataPagamento`),
  KEY `fk_TF-Encomendas_DIM-Data3_idx` (`dataEnvio`),
  KEY `fk_TF-Encomendas_DIM-Expedidor1_idx` (`expedidor`),
  CONSTRAINT `DIM-Cliente` FOREIGN KEY (`cliente`) REFERENCES `dim_cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data1` FOREIGN KEY (`dataPedido`) REFERENCES `dim_data` (`idData`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data2` FOREIGN KEY (`dataPagamento`) REFERENCES `dim_data` (`idData`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Data3` FOREIGN KEY (`dataEnvio`) REFERENCES `dim_data` (`idData`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Expedidor1` FOREIGN KEY (`expedidor`) REFERENCES `dim_expedidor` (`idExpedidor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Fornecedor` FOREIGN KEY (`fornecedor`) REFERENCES `dim_fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Funcionario` FOREIGN KEY (`funcionario`) REFERENCES `dim_funcionario` (`idFuncionario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `DIM-Produto` FOREIGN KEY (`produto`) REFERENCES `dim_produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tf_encomendas`
--

LOCK TABLES `tf_encomendas` WRITE;
/*!40000 ALTER TABLE `tf_encomendas` DISABLE KEYS */;
INSERT INTO `tf_encomendas` VALUES (1,30,34,4,2,9,27,200601015,200601015,200601022,100.0000,1400.0000,14.0000,200.0000,0),(2,30,80,2,2,9,27,200601015,200601015,200601022,30.0000,105.0000,3.5000,200.0000,0),(3,31,7,2,1,3,4,200601020,200601020,200601022,10.0000,300.0000,30.0000,5.0000,0),(4,31,51,2,1,3,4,200601020,200601020,200601022,10.0000,530.0000,53.0000,5.0000,0),(5,31,80,2,1,3,4,200601020,200601020,200601022,10.0000,35.0000,3.5000,5.0000,0),(6,32,1,4,2,4,12,200601022,200601022,200601022,15.0000,270.0000,18.0000,5.0000,0),(7,32,43,3,2,4,12,200601022,200601022,200601022,20.0000,920.0000,46.0000,5.0000,0),(8,33,19,1,3,6,8,200601030,200601030,200601031,30.0000,276.0000,9.2000,50.0000,0),(9,34,19,1,3,9,4,20060206,20060206,20060207,20.0000,184.0000,9.2000,4.0000,0),(10,35,48,10,2,3,29,200602010,200602010,200602012,10.0000,127.5000,12.7500,7.0000,0),(11,36,41,6,2,4,3,200602023,200602023,200602025,200.0000,1930.0000,9.6500,7.0000,0),(12,37,8,8,2,8,6,20060306,20060306,20060309,17.0000,680.0000,40.0000,12.0000,0),(13,38,43,3,3,9,28,200603010,200603010,200603011,300.0000,13800.0000,46.0000,10.0000,0),(14,39,48,10,3,3,8,200603022,200603022,200603024,100.0000,1275.0000,12.7500,5.0000,0),(15,40,81,3,2,4,10,200603024,200603024,200603024,200.0000,598.0000,2.9900,9.0000,0),(16,41,43,3,0,1,7,200603024,0,0,300.0000,13800.0000,46.0000,0.0000,0),(17,42,6,2,1,1,10,200603024,0,20060407,10.0000,250.0000,25.0000,0.0000,0),(18,42,4,10,1,1,10,200603024,0,20060407,10.0000,220.0000,22.0000,0.0000,0),(19,42,19,1,1,1,10,200603024,0,20060407,10.0000,92.0000,9.2000,0.0000,0),(20,43,80,2,3,1,11,200603024,0,0,20.0000,70.0000,3.5000,0.0000,0),(21,43,81,3,3,1,11,200603024,0,0,50.0000,149.5000,2.9900,0.0000,0),(22,44,1,4,0,1,1,200603024,0,0,25.0000,450.0000,18.0000,0.0000,0),(23,44,43,3,0,1,1,200603024,0,0,25.0000,1150.0000,46.0000,0.0000,0),(24,44,81,3,0,1,1,200603024,0,0,25.0000,74.7500,2.9900,0.0000,0),(25,45,41,6,3,1,28,20060407,20060407,20060407,50.0000,482.5000,9.6500,40.0000,0),(26,45,40,7,3,1,28,20060407,20060407,20060407,50.0000,920.0000,18.4000,40.0000,0),(27,46,57,1,1,7,9,20060405,20060405,20060405,100.0000,1950.0000,19.5000,100.0000,0),(28,46,72,5,1,7,9,20060405,20060405,20060405,50.0000,1740.0000,34.8000,100.0000,0),(29,47,34,4,2,6,6,20060408,20060408,20060408,300.0000,4200.0000,14.0000,300.0000,0),(30,48,8,8,2,4,8,20060405,20060405,20060405,25.0000,1000.0000,40.0000,50.0000,0),(31,48,19,1,2,4,8,20060405,20060405,20060405,25.0000,230.0000,9.2000,50.0000,0),(32,50,21,1,1,9,25,20060405,20060405,20060405,20.0000,200.0000,10.0000,5.0000,0),(33,51,5,10,3,9,26,20060405,20060405,20060405,25.0000,533.7500,21.3500,60.0000,0),(34,51,41,6,3,9,26,20060405,20060405,20060405,30.0000,289.5000,9.6500,60.0000,0),(35,51,40,7,3,9,26,20060405,20060405,20060405,30.0000,552.0000,18.4000,60.0000,0),(36,56,48,10,3,2,6,20060403,20060403,20060403,10.0000,127.5000,12.7500,0.0000,0),(37,55,34,4,2,1,29,20060405,20060405,20060405,87.0000,1218.0000,14.0000,200.0000,0),(38,79,7,2,3,2,6,200606023,200606023,200606023,30.0000,900.0000,30.0000,0.0000,0),(39,79,51,2,3,2,6,200606023,200606023,200606023,30.0000,1590.0000,53.0000,0.0000,0),(40,78,17,6,2,1,29,20060605,20060605,20060605,40.0000,1560.0000,39.0000,200.0000,0),(41,77,6,2,3,9,26,20060605,20060605,20060605,90.0000,2250.0000,25.0000,60.0000,0),(42,76,4,10,1,9,25,20060605,20060605,20060605,30.0000,660.0000,22.0000,5.0000,0),(43,75,48,10,2,4,8,20060605,20060605,20060605,40.0000,510.0000,12.7500,50.0000,0),(44,74,48,10,2,6,6,20060608,20060608,20060608,40.0000,510.0000,12.7500,300.0000,0),(45,73,41,6,1,7,9,20060605,20060605,20060605,10.0000,96.5000,9.6500,100.0000,0),(46,72,43,3,3,1,28,20060607,20060607,20060607,5.0000,230.0000,46.0000,40.0000,0),(47,71,40,7,3,1,1,200605024,0,0,40.0000,736.0000,18.4000,0.0000,0),(48,70,8,8,3,1,11,200605024,0,0,20.0000,800.0000,40.0000,0.0000,0),(49,69,80,2,1,1,10,200605024,0,0,15.0000,52.5000,3.5000,0.0000,0),(50,67,74,2,2,4,10,200605024,200605024,200605024,20.0000,200.0000,10.0000,9.0000,0),(51,60,72,5,3,6,8,200604030,200604030,200604030,40.0000,1392.0000,34.8000,50.0000,0),(52,63,3,10,2,4,3,200604025,200604025,200604025,50.0000,500.0000,10.0000,7.0000,0),(53,63,8,8,2,4,3,200604025,200604025,200604025,3.0000,120.0000,40.0000,7.0000,0),(54,58,20,2,1,3,4,200604022,200604022,200604022,40.0000,3240.0000,81.0000,5.0000,0),(55,58,52,1,1,3,4,200604022,200604022,200604022,40.0000,280.0000,7.0000,5.0000,0),(56,80,56,1,0,2,4,200604025,0,0,10.0000,380.0000,38.0000,0.0000,0),(57,81,81,3,0,2,3,200604025,0,0,0.0000,0.0000,2.9900,0.0000,0),(58,81,56,1,0,2,3,200604025,0,0,0.0000,0.0000,38.0000,0.0000,0),(59,32,43,4,2,4,12,200601022,200601022,200601022,20.0000,920.0000,46.0000,5.0000,0),(60,38,43,4,3,9,28,200603010,200603010,200603011,300.0000,13800.0000,46.0000,10.0000,0),(61,41,43,4,0,1,7,200603024,0,0,300.0000,13800.0000,46.0000,0.0000,0),(62,42,6,6,1,1,10,200603024,0,20060407,10.0000,250.0000,25.0000,0.0000,0),(63,44,43,4,0,1,1,200603024,0,0,25.0000,1150.0000,46.0000,0.0000,0),(64,77,6,6,3,9,26,20060605,20060605,20060605,90.0000,2250.0000,25.0000,60.0000,0),(65,72,43,4,3,1,28,20060607,20060607,20060607,5.0000,230.0000,46.0000,40.0000,0),(66,67,74,6,2,4,10,200605024,200605024,200605024,20.0000,200.0000,10.0000,9.0000,0),(67,58,20,6,1,3,4,200604022,200604022,200604022,40.0000,3240.0000,81.0000,5.0000,0);
/*!40000 ALTER TABLE `tf_encomendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'northwind_dw'
--

--
-- Dumping routines for database 'northwind_dw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-12 17:12:37