-- DYNAMIC SQL ( DDL, DCL )

SET SERVEROUTPUT ON;

DECLARE
    DDL_COMMAND VARCHAR2(2000);
BEGIN
 -- DDL_COMMAND := 'CREATE TABLE TEMP_TABLE (URUN_ID NUMBER(10), URUN_ADI VARCHAR2(30))';
 -- DDL_COMMAND := ' ALTER TABLE TEMP_TABLE ADD URUN_FIYATI NUMBER(15,2) ';
 -- DDL_COMMAND := ' GRANT SELECT ON TEMP_TABLE TO MEHMET ';
 -- DDL_COMMAND := ' REVOKE SELECT ON TEMP_TABLE FROM MEHMET ';
    DDL_COMMAND := ' DROP TABLE TEMP_TABLE ';
    EXECUTE IMMEDIATE DDL_COMMAND;
    
 -- DBMS_OUTPUT.PUT_LINE('TABLE CREATED');
 -- DBMS_OUTPUT.PUT_LINE('TABLE ALTERED');
END;
/

DESC TEMP_TABLE;

