begin
    for i in (select filename from 
    table(RDSADMIN.RDS_FILE_UTIL.LISTDIR('DATA_PUMP_DIR')) where type='file')
    loop
    UTL_FILE.FREMOVE ('DATA_PUMP_DIR', i.filename);
    end loop;
end;
/