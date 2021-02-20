-- IN THIS FILE DBUSER WILL BE CLIENT DB AND OLD USER WILL BE DNET (OR FROM WHICH YOU ARE UPDATING THE DATABASE. HENCE DBUSER WILL BE CLIENT DB, OLD USER = DNET DB, FILENAME WILL BE THE DNET DB FILENAME 
-- IMPORT USER
-- REPLACE [DBUSER]
-- REPLACE [OLDUSER]
-- REPLACE [FILE_NAME]

DECLARE
    hdnl NUMBER;
BEGIN
    hdnl := DBMS_DATAPUMP.OPEN( operation => 'IMPORT', job_mode => 'SCHEMA', job_name=>null);
    DBMS_DATAPUMP.ADD_FILE( handle => hdnl, filename => '[FILE_NAME].DMP', directory => 'DATA_PUMP_DIR', filetype => dbms_datapump.ku$_file_type_dump_file);
    DBMS_DATAPUMP.ADD_FILE( handle => hdnl, filename => '[FILE_NAME].log', directory => 'DATA_PUMP_DIR', filetype => dbms_datapump.ku$_file_type_log_file);
    DBMS_DATAPUMP.METADATA_REMAP(hdnl,'REMAP_SCHEMA','[OLDUSER]','[DBUSER]');
    DBMS_DATAPUMP.METADATA_FILTER(hdnl,'SCHEMA_EXPR','IN (''[OLDUSER]'')');
    DBMS_DATAPUMP.START_JOB(hdnl);
END;
/         


/*

SELECT TEXT,CNT
FROM (
    SELECT text,ROWNUM AS CNT FROM table(rdsadmin.rds_file_util.read_text_file('DATA_PUMP_DIR','[FILE_NAME].log'))
)
ORDER BY CNT DESC

*/