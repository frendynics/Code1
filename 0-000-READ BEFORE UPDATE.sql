select SQL_SCRIPT from T_CONFIG_ALTER_SCRIPT where pk_id >974 order by pk_id

--TWO TABLE WHICH SHOULD BE AFFECTED

T_STOCK_ARCHIVE
T_STOCK_SMRY_DAILY_CLOSING

--CREATION OF TABLE BEFORE ALTER 

CREATE TABLE TEMP_SA_15082020 AS
SELECT STOCK_TAKING_ID, STOCK_ID, STOCK_BOM_ID, VARIANT_ID, STOCK_CODE, QUANTITY, CONVERSION_FACTOR, STOCK_VALUE, LABOUR_VALUE, STOCK_STATUS_ID, OWNER_PARTY_ID, BATCH_ID, LOCATION_ID, WC_ID, WCGROUP_ID, PARTY_ID, TRANSIT_IND, BATCH_TYPE_ID, PBATCH_ID, BATCH_NO, BATCH_QUANTITY, ROW_STATUS, PBAG_ID, ISSUE_TRANS_ITEM_ID, ITEM_GROUP_ID, BASE_ITEM_GROUP_ID, QUANTITY_1, CAST(ROWNUM AS NUMBER(10)) AS PK_ID
FROM T_STOCK_ARCHIVE;



CREATE TABLE TEMP_SSDC_20122020 AS
SELECT CLOSING_DATE, LOCATION_ID, WCGROUP_ID, PARTY_ID, OWNER_PARTY_ID, TRANS_SUBTYPE_ID, ITEM_TYPE_ID, ITEM_GROUP_ID, BASE_ITEM_GROUP_ID, VARIANT_ID, STOCK_TYPE, ROW_IDENTITY, QUANTITY, PG_QUANTITY, STOCK_VALUE, LABOUR_VALUE, TRANSIT_QUANTITY, TRANSIT_PG_QUANTITY, TRANSIT_STOCK_VALUE, TRANSIT_LABOUR_VALUE, TRANSIT_IN_QUANTITY, TRANSIT_IN_PG_QUANTITY, TRANSIT_IN_STOCK_VALUE, TRANSIT_IN_LABOUR_VALUE, FETCH_IND, TRANS_ITEM_ID, MAIN_VARIANT_ID, STOCK_CODE, TRANS_ID, STOCK_ID, BATCH_QUANTITY, BATCH_ROW_STATUS, QUANTITY_1, TRANSIT_QUANTITY_1, TRANSIT_IN_QUANTITY_1, WC_ID, BATCH_ID, SRC_WCGROUP_ID, SRC_WC_ID, SRC_PARTY_ID, CAST(SYS_GUID() AS VARCHAR2(150)) AS PK_ID
FROM T_SMRY_STOCK_DAILY_CLOSING;

CREATE TABLE TEMP_SESSAC_15082020 AS
SELECT SESSION_ID, TABLE_NAME, KEY_VALUE, EVENT_NAME, EVENT_DATE, COLUMN_NAME, OLD_VALUE, NEW_VALUE, CAST(ROWNUM AS NUMBER(10)) AS PK_ID
FROM T_SESSION_ACTIVITY;

CREATE TABLE TEMP_SSMC_15082020 AS
SELECT LOCATION_ID, ITEM_GROUP_ID, CLOSING_DATE, QUANTITY, PG_QUANTITY, STOCK_VALUE, STOCK_VALUE_1, LABOUR_VALUE, WCGROUP_ID, PARTY_ID, VARIANT_ID, FETCH_IND, QUANTITY1, WC_ID, TRANSIT_QUANTITY, TRANSIT_PG_QUANTITY, TRANSIT_STOCK_VALUE, TRANSIT_LABOUR_VALUE, MULTI_METAL_QUANTITY, STOCK_TYPE, PWCGROUP_ID, WCGROUP_TYPE_ID, CAST(ROWNUM AS NUMBER(10)) AS PK_ID
FROM T_SMRY_STOCK_MONTH_CLOSING;

CREATE TABLE TEMP_TIMI_15082020 AS
SELECT TRANS_ITEM_ID, COLUMN_NAME, COLUMN_VAL, CAST(ROWNUM AS NUMBER(10)) AS PK_ID
FROM T_TRANS_ITEM_MISC_INFO;


COMMIT;


--AFTER UPLOADING DB BEFORE ALTER RENAME THE TABLE.
ALTER TABLE [OLD TABLE_NAME] RENAME TO [NEW TABLE NAME]