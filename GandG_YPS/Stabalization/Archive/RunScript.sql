2.1 
 CREATE TABLE print_summary_new LIKE print_summary;
  CREATE TABLE work_shift_action_new LIKE work_shift_action; 
    CREATE TABLE integration_history_new LIKE integration_history; 
    CREATE TABLE prefunding_log_new LIKE prefunding_log; 
    CREATE TABLE trigger_log_new LIKE trigger_log; 
    CREATE TABLE re_print_new LIKE re_print; 

 3.1  CREATE INDEX idx_storecode_status_workshift_action 
ON work_shift_action_new(Store_code, status);


4.1
4. Move data from original table to new table as plan 
   ---Print Summary-----
   select count(*) from  print_summary WHERE shift_start_date >= '2025-12-01'; 
   
      INSERT INTO print_summary_new
      SELECT *
      FROM print_summary
      WHERE shift_start_date >=  '2025-12-01'; 

 ---YPS Integration-----
         select count(*) from  integration_history WHERE request_date >= '2025-09-01'; 
   
      INSERT INTO integration_history_new
      SELECT *
      FROM integration_history
      WHERE request_date >=  '2025-09-01'; 

  

 ---Prefunding-----
         select count(*) from  prefunding_log WHERE log_datetime >= '2025-09-01'; 
   
      INSERT INTO prefunding_log_new
      SELECT *
      FROM prefunding_log
      WHERE log_datetime >=  '2025-09-01'; 

   

 ---Trigger Log-----
         select count(*) from  trigger_log WHERE log_time >= '2025-09-01'; 
   
      INSERT INTO trigger_log_new
      SELECT *
      FROM trigger_log
      WHERE log_time >=  '2025-09-01'; 

     

       ---workshift action-----
         select count(*) from  work_shift_action WHERE shift_start_on >= '2025-09-01'; 
   
      INSERT INTO work_shift_action_new
      SELECT *
      FROM work_shift_action
      WHERE shift_start_on >=  '2025-09-01'; 

        

     ---reprint-----
        SELECT min(id) from sale_transaction where trans_date>='2025-12-01'

        select count(*) 
      FROM re_print
      WHERE sale_transaction_id >=  56395093
   
      INSERT INTO re_print_new
      SELECT *
      FROM re_print
      WHERE sale_transaction_id >=  ; 56395093

 
 5.1 Validate
      SELECT COUNT(*) 
         FROM print_summary_old
         WHERE created_date >= '2025-12-01';

         SELECT COUNT(*) 
         FROM print_summary;

 5.2 Delete
  Delete  from print_summary   WHERE shift_start_date >='2025-12-01'; 
   Delete  from integration_history   WHERE request_date >=  '2025-09-01'; 
  Delete  from prefunding_log   WHERE log_datetime >=  '2025-09-01'; 
  Delete  from trigger_log   WHERE log_time >=  '2025-09-01'; 
Delete  from work_shift_action   WHERE shift_start_on >=  '2025-09-01'; 
Delete  from re_print   WHERE sale_transaction_id >= 56395093; 

6.Rename

      RENAME TABLE 
    print_summary TO print_summary_old,
    print_summary_new TO print_summary,

    integration_history TO integration_history_old,
    integration_history_new TO integration_history,

    prefunding_log TO prefunding_log_old,
    prefunding_log_new TO prefunding_log,

    trigger_log TO trigger_log_old,
    trigger_log_new TO trigger_log,

    work_shift_action TO work_shift_action_old,
    work_shift_action_new TO work_shift_action,

    re_print TO re_print__old,
    re_print_new TO re_print;
        
7.AUTO_INCREMENT
----print_summary----------
 Select Max(id) from print_summary
ALTER TABLE print_summary AUTO_INCREMENT = (max_id + 1);

----trigger_log----------
 Select Max(id) from trigger_log
ALTER TABLE trigger_log AUTO_INCREMENT = (max_id + 1);

----work_shift_action----------
 Select Max(id) from work_shift_action
ALTER TABLE work_shift_action AUTO_INCREMENT = (max_id + 1);


----re_print----------
 Select Max(id) from re_print
ALTER TABLE re_print AUTO_INCREMENT = (max_id + 1);


----integration_history----------
 Select Max(id) from integration_history
ALTER TABLE integration_history AUTO_INCREMENT = (max_id + 1);


----integration_history----------
 Select Max(id) from prefunding_log
ALTER TABLE prefunding_log AUTO_INCREMENT = (max_id + 1);



