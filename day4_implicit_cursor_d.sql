SET SERVEROUTPUT ON;
/
DESC EMPLOYEES2;
/
SELECT * FROM EMPLOYEES2;
/
CREATE TABLE EMPLOYEES2 AS SELECT * FROM EMPLOYEES;
/
DROP TABLE EMPLOYEES2;
/
DECLARE
    REC_EMP EMPLOYEES2%ROWTYPE;
BEGIN
    DELETE FROM EMPLOYEES2 WHERE DEPARTMENT_ID IN (100,80);
    
    IF SQL%ROWCOUNT <> 0 THEN
        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT ||' personnel deleted 2 ');
    END IF;
    
    
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT ||' personnel deleted');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('Can not deleted');
    END IF;
    
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Can not deleted 1');
    ELSE
        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT ||' personnel deleted 1');
    END IF;  
    
END;

-- INSERT is also same, so no need to do example again