-- STATIC SQL ( DML, TCL, SAVEPOINT )

SET SERVEROUTPUT ON;

CREATE TABLE employees2 AS SELECT * FROM employees;

DECLARE
    emp_id              employees2.EMPLOYEE_ID%TYPE;
    emp_first_name      employees2.FIRST_NAME%TYPE  := 'SULAYMAN';
    emp_last_name       employees2.LAST_NAME%TYPE  := 'MATKULIYEV';
    emp_job_id          employees2.JOB_ID%TYPE  := 'PL/SQL';
    emp_email           employees2.EMAIL%TYPE  := 'abc@xyz.com';
    emp_hire_date       employees2.HIRE_DATE%TYPE  := sysdate;
BEGIN
    SELECT NVL(MAX(EMPLOYEE_ID), 0) + 1 INTO emp_id FROM employees2;
    
    INSERT  INTO employees2(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID,EMAIL,HIRE_DATE) 
            VALUES (emp_id,emp_first_name,emp_last_name,emp_job_id,emp_email,emp_hire_date);
            
    UPDATE employees2 SET job_id = 'DBA' WHERE employee_id = emp_id;
    
    DELETE employees2 WHERE employee_id = emp_id
    RETURNING EMPLOYEE_ID, FIRST_NAME,  JOB_ID INTO emp_id, emp_first_name, emp_job_id;
    
    --ROLLBACK;
    --COMMIT;
    
    DBMS_OUTPUT.PUT_LINE(emp_id ||' '|| emp_first_name ||' '|| emp_job_id);
      
END;