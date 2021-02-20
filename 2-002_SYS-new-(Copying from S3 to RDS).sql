SELECT rdsadmin.rdsadmin_s3_tasks.download_from_s3(
      p_bucket_name    =>  'sspl-data-bucket',       
      p_directory_name =>  'DATA_PUMP_DIR',
      p_s3_prefix      =>  '[FILE_NAME].DMP' 
      ) 
   AS TASK_ID FROM DUAL;    ;
  
--SELECT text FROM table(rdsadmin.rds_file_util.read_text_file('BDUMP','dbtask-1592997927333-17782.log')) ;

/*

SELECT * FROM table(rdsadmin.rds_file_util.listdir(p_directory => 'DATA_PUMP_DIR')) WHERE UPPER(FILENAME) LIKE '%[FILE_NAME].DMP%'


*/