-- CURSORS WITH PARAMETERS

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp(wdeptno employees.department_id%TYPE DEFAULT 90) IS SELECT employee_id, last_name FROM employees 
                                                                                 -- WHERE department_id = 30;
                                                                                    WHERE department_id = wdeptno;
    r_emp c_emp%ROWTYPE;
BEGIN
 -- OPEN c_emp;
    OPEN c_emp(100);
    LOOP
        FETCH c_emp INTO r_emp;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Sicil no: '||r_emp.employee_id||' Soyismi: '|| r_emp.last_name);
    END LOOP;
    CLOSE c_emp;
END;