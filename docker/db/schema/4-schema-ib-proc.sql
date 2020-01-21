/*!50003 DROP PROCEDURE IF EXISTS `update_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;

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


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_task`(IN p_datestr VARCHAR(20))
BEGIN   
update task t,
     ( select date(sq.quote_date) quote_date, CONVERT('stock_quote' using 'utf8')  task, sq.contract_id, count(*) in_count 
      from stock_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 99
      union 
      select date(sq.quote_date), CONVERT('option_quote' using 'utf8'), sq.contract_id, count(*) in_count
      from option_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 99) a
set t.status = 200, t.row_count = a.in_count
	where a.quote_date = t.schedule_date
    and a.task = t.task
    and a.contract_id = t.contract_id
    and t.status in (100,101);
    
update task t,
     ( select date(sq.quote_date) quote_date, CONVERT('stock_quote' using 'utf8')  task, sq.contract_id, count(*) in_count
      from stock_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 1 and count(*) < 99
      union 
      select date(sq.quote_date), CONVERT('option_quote' using 'utf8'), sq.contract_id, count(*) in_count
      from option_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 1 and count(*) < 99) a
set t.status = 101, t.row_count = a.in_count, t.retry_count = t.retry_count + 1
	where a.quote_date = t.schedule_date
    and a.task = t.task
    and a.contract_id = t.contract_id
    and t.status in (100);    


update task t,
     ( select date(sq.quote_date) quote_date, CONVERT('stock_quote' using 'utf8')  task, sq.contract_id, count(*) in_count
      from stock_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 1 and count(*) < 99
      union 
      select date(sq.quote_date), CONVERT('option_quote' using 'utf8'), sq.contract_id, count(*) in_count
      from option_quote sq 
      where date(sq.quote_date) between DATE_SUB(p_datestr, INTERVAL 120 day) AND p_datestr
      group by date(sq.quote_date), sq.contract_id
      having count(*) > 1 and count(*) < 99) a
set t.status = 400,  t.row_count = a.in_count
	where a.quote_date = t.schedule_date
    and a.task = t.task
    and a.contract_id = t.contract_id
    and t.retry_count > 3
    and t.status in (100,101);

END ;;
DELIMITER ;

/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

