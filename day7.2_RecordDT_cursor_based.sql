-- RECORD DATA TYPES -- CURSOR BASED RECORDS
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, salary  FROM employees WHERE salary < (SELECT AVG(salary) FROM employees);
      
    calisan c_oku%ROWTYPE;
BEGIN
    SELECT AVG(salary) INTO calisan.salary FROM employees;
    DBMS_OUTPUT.PUT_LINE('AVERAGE SALARY: ' || calisan.salary);
    
    OPEN c_oku;
    LOOP
        FETCH c_oku INTO calisan;
        EXIT WHEN c_oku%NOTFOUND;
        DBMS_OUTPUT.PUT('Calisan: ' || calisan.employee_id || ' ' || calisan.first_name || ' ' || calisan.salary);
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
    CLOSE c_oku;
END;