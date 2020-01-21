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
-- Table structure for table `option_list`
--

USE ib;

DROP TABLE IF EXISTS `ib.stock_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.stock_list (
  contract_id INT(11) NOT NULL,
  symbol VARCHAR(25) NOT NULL,
  primary_exchange VARCHAR(25) NOT NULL,
  exchange VARCHAR(25) NOT NULL,
  category VARCHAR(25) NOT NULL,
  industry VARCHAR(25) NOT NULL,
  long_name VARCHAR(25) NOT NULL,
  trading_class VARCHAR(25) DEFAULT NULL,
  PRIMARY KEY (contract_id),
  UNIQUE INDEX UK_stock_list_symbol (symbol),
  UNIQUE INDEX UK2_stock_list_symbol (contract_id)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 3276
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `ib.option_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.option_list (
  contract_id INT(11) NOT NULL,
  ref_contract_id INT(11) NOT NULL,
  symbol VARCHAR(25) NOT NULL,
  start_trade DATE DEFAULT NULL,
  expiry DATE NOT NULL,
  strike DECIMAL(7, 3) NOT NULL,
  option_type VARCHAR(1) NOT NULL,
  pull_date DATETIME NOT NULL,
  PRIMARY KEY (contract_id),
  UNIQUE INDEX UK_option_list_symbol (symbol),
  CONSTRAINT FK_option_list_stock_list_contract_id FOREIGN KEY (ref_contract_id)
    REFERENCES ib.stock_list(contract_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AVG_ROW_LENGTH = 129
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `ib.stock_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.stock_quote (
  id INT(11) NOT NULL AUTO_INCREMENT,
  contract_id INT(11) NOT NULL,
  quote_date DATETIME NOT NULL,
  open DECIMAL(7, 3) DEFAULT NULL,
  high DECIMAL(7, 3) DEFAULT NULL,
  low DECIMAL(7, 3) DEFAULT NULL,
  close DECIMAL(7, 3) DEFAULT NULL,
  volume INT(11) DEFAULT NULL,
  impl_volatility DECIMAL(7, 3) DEFAULT NULL,
  count INT(11) DEFAULT NULL,
  bid_min DECIMAL(7, 3) DEFAULT NULL,
  bid_avg DECIMAL(7, 3) DEFAULT NULL,
  ask_avg DECIMAL(7, 3) DEFAULT NULL,
  ask_max DECIMAL(7, 3) DEFAULT NULL,
  _delta_close DECIMAL(7, 3) DEFAULT NULL,
  _delta_bid DECIMAL(7, 3) DEFAULT NULL,
  _delta_ask DECIMAL(7, 3) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_stock_quote (quote_date, contract_id),
  CONSTRAINT FK_stock_quote_stock_list_contract_id2 FOREIGN KEY (contract_id)
    REFERENCES ib.stock_list(contract_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 25427143
AVG_ROW_LENGTH = 88
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `ib.option_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.option_quote (
  id INT(11) NOT NULL AUTO_INCREMENT,
  contract_id INT(11) NOT NULL,
  quote_date DATETIME NOT NULL,
  open DECIMAL(7, 3) DEFAULT NULL,
  high DECIMAL(7, 3) DEFAULT NULL,
  low DECIMAL(7, 3) DEFAULT NULL,
  close DECIMAL(7, 3) DEFAULT NULL,
  volume INT(11) DEFAULT NULL,
  impl_volatility DECIMAL(7, 3) DEFAULT NULL,
  count INT(11) DEFAULT NULL,
  bid_min DECIMAL(7, 3) DEFAULT NULL,
  bid_avg DECIMAL(7, 3) DEFAULT NULL,
  ask_avg DECIMAL(7, 3) DEFAULT NULL,
  ask_max DECIMAL(7, 3) DEFAULT NULL,
  _delta_close DECIMAL(7, 3) DEFAULT NULL,
  _tv DECIMAL(7, 3) DEFAULT NULL,
  _iv DECIMAL(7, 3) DEFAULT NULL,
  _delta_tv DECIMAL(7, 3) DEFAULT NULL,
  _delta_iv DECIMAL(7, 3) DEFAULT NULL,
  _tv_pct DECIMAL(7, 3) DEFAULT NULL,
  _theta_pct DECIMAL(7, 3) DEFAULT NULL,
  _delta_bid DECIMAL(7, 3) DEFAULT NULL,
  _delta_ask DECIMAL(7, 3) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX `UK_option_quote` (quote_date, contract_id),
  CONSTRAINT FK_option_quote_option_list_contract_id2 FOREIGN KEY (contract_id)
    REFERENCES ib.option_list(contract_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 25696522
AVG_ROW_LENGTH = 83
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DROP TABLE IF EXISTS `ib.task`;
CREATE TABLE ib.task (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique PK',
  contract_id INT(11) NOT NULL COMMENT 'Required. stock/option security id',
  task VARCHAR(255) NOT NULL COMMENT '4 known tasks so far',
  schedule_date VARCHAR(255) NOT NULL COMMENT 'Required. planned pull date',
  arg_1 VARCHAR(255) DEFAULT NULL COMMENT 'optional. not sure what this is used for yet.',
  arg_2 VARCHAR(255) DEFAULT NULL COMMENT 'optional. not sure what this is used for yet.',
  create_date DATETIME NOT NULL COMMENT 'When this task was created',
  start_date DATETIME DEFAULT NULL COMMENT 'Last execution start date',
  end_date DATETIME DEFAULT NULL COMMENT 'Last execution end date',
  row_count INT(11) DEFAULT NULL COMMENT 'After execution, how many minute quotes / rows was downloaded',
  expected_row_count INT(11) DEFAULT NULL COMMENT 'null = 390 default or 6 1/2 hours of trading',
  status INT(11) NOT NULL COMMENT 'Status of this task;',
  retry_count INT(11) DEFAULT NULL COMMENT 'TWS is not 100% reliable and needs to be retried 3-5 times',
  error_message VARCHAR(255) DEFAULT NULL COMMENT 'Last error message when downloading from TWS',
  PRIMARY KEY (id),
  UNIQUE INDEX UK_task (schedule_date, contract_id, task)
)
ENGINE = INNODB
AUTO_INCREMENT = 30686
AVG_ROW_LENGTH = 215
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
DROP TABLE IF EXISTS `ib.task_plan`;
CREATE TABLE ib.task_plan (
  id INT(11) NOT NULL AUTO_INCREMENT,
  task VARCHAR(255) NOT NULL COMMENT '4 known tasks so far',  
  contract_id INT(11) NOT NULL COMMENT 'Required. stock/option security id',
  start_date DATE DEFAULT NULL,
  active VARCHAR(1) DEFAULT NULL,
  months_out INT(11) DEFAULT NULL,
  bracket_pct DECIMAL(7, 3) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_task_plan (contract_id, task)
)
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 2340
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `ib.task_status`;
CREATE TABLE ib.task_status (
  id INT(11) NOT NULL,
  description VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;


DROP TABLE IF EXISTS `ib.log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.log (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1063943 DEFAULT CHARSET=latin1;

create table ib.hibernate_sequence(next_val bigint(20));

DROP TABLE IF EXISTS `ib.sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ib.sequence (
  SEQ_NAME VARCHAR(50) NOT NULL,
  SEQ_COUNT DECIMAL(38, 0) DEFAULT NULL,
  PRIMARY KEY (SEQ_NAME)
)
ENGINE = INNODB
CHARACTER SET latin1
COLLATE latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
