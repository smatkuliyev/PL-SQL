-- FOR LOOP -- NESTED LOOOP
SET SERVEROUTPUT ON;
/
DECLARE
    MANAGER employees.last_name%type;
BEGIN
    FOR D IN ( SELECT department_id, department_name, manager_id FROM departments ORDER BY department_id ) LOOP
    
        BEGIN
            SELECT LAST_NAME INTO MANAGER FROM employees WHERE employee_id = D.manager_id;
            EXCEPTION WHEN NO_DATA_FOUND THEN
            MANAGER := NULL;
        END;
    
        DBMS_OUTPUT.PUT_LINE ('BOLUM No: '|| D.department_id ||', BOLUM Adi: '|| D.department_name || ', Manager: '|| MANAGER);
        
        FOR E IN ( SELECT employee_id, first_name, last_name  FROM employees WHERE department_id = D.department_id ) LOOP
        
            DBMS_OUTPUT.PUT_LINE ('        Emp_id: '|| E.employee_id || ', First Name : '|| E.first_name || ', Last Name : '|| E.last_name);
            
        END LOOP;
        DBMS_OUTPUT.PUT_LINE (' ');    
    END LOOP;
END;