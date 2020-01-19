-- MySQL dump 10.13  Distrib 5.6.19, for Win64 (x86_64)
--
-- Host: localhost    Database: model
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `mode_execution`
--

USE model;

DROP TABLE IF EXISTS `model.model_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE model.model_execution (
  id INT(11) NOT NULL DEFAULT 0,
  run_id INT(11) NOT NULL,
  model_id INT(11) NOT NULL,
  open_date DATETIME NOT NULL,
  open_reason VARCHAR(255) DEFAULT NULL,
  open_stock_amt DECIMAL(8, 3) NOT NULL,
  open_stock_quote_id INT(11) NOT NULL,
  open_option_quote_id INT(11) NOT NULL,
  open_option_amt DECIMAL(8, 3) NOT NULL,
  close_reason VARCHAR(255) DEFAULT NULL,
  close_date DATETIME NOT NULL,
  close_stock_amt DECIMAL(8, 3) NOT NULL,
  close_option_quote_id INT(11) NOT NULL,
  close_stock_quote_id INT(11) NOT NULL,
  close_option_amt DECIMAL(8, 3) NOT NULL,
  _net DECIMAL(8, 3) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_model_execution_model_description_model_id FOREIGN KEY (model_id)
    REFERENCES model.model_description(model_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `model.model_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE model.model_description (
  model_id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) DEFAULT NULL,
  description VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (model_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `model.sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE model.sequence (
  SEQ_NAME VARCHAR(50) NOT NULL,
  SEQ_COUNT DECIMAL(38, 0) DEFAULT NULL,
  PRIMARY KEY (SEQ_NAME)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

create table model.hibernate_sequence(next_val bigint(20));


DROP TABLE IF EXISTS `model.log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE model.log (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063943 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
