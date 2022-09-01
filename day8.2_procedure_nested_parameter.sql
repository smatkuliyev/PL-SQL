-- NESTED PROCEDURES WITH PARAMETER, --( IN )

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_emp IS SELECT employee_id FROM employees WHERE department_id = 60;
    r_emp   c_emp%ROWTYPE;

    wname   employees.last_name%TYPE;
    
    PROCEDURE show_name(p_id IN employees.employee_id%TYPE) IS
    --  wname   employees.last_name%TYPE;
    BEGIN
        SELECT last_name INTO wname FROM employees WHERE employee_id = p_id;
        DBMS_OUTPUT.PUT_LINE('ismi:= ' || wname);
    END;
    
    PROCEDURE change_name(p_id /* IN */ employees.employee_id%TYPE) IS -- IN is optional
    --  wname   employees.last_name%TYPE;
    BEGIN
        UPDATE employees SET last_name = UPPER(last_name) WHERE employee_id = p_id
        RETURNING last_name INTO wname;
     -- SELECT last_name INTO wname FROM employees WHERE employee_id = 101;
        DBMS_OUTPUT.PUT_LINE('Yeni ismi:= ' || wname);
    END change_name; -- optional, you can write or no
BEGIN
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO r_emp;
        EXIT WHEN c_emp%NOTFOUND;
        show_name(r_emp.employee_id);
        change_name(r_emp.employee_id);
    END LOOP;
    CLOSE c_emp;

 -- show_name(101);
 -- change_name(101);
END;
/
ROLLBACK;