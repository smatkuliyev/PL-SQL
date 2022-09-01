-- NESTED PROCEDURES

SET SERVEROUTPUT ON;

DECLARE
    wname   employees.last_name%TYPE;
    
    PROCEDURE show_name IS
    --  wname   employees.last_name%TYPE;
    BEGIN
        SELECT last_name INTO wname FROM employees WHERE employee_id = 101;
        DBMS_OUTPUT.PUT_LINE('ismi:= ' || wname);
    END;
    
    PROCEDURE change_name IS
    --  wname   employees.last_name%TYPE;
    BEGIN
        UPDATE employees SET last_name = UPPER(last_name) WHERE employee_id = 101
        RETURNING last_name INTO wname;
     -- SELECT last_name INTO wname FROM employees WHERE employee_id = 101;
        DBMS_OUTPUT.PUT_LINE('Yeni ismi:= ' || wname);
    END change_name; -- optional, you can write or no
BEGIN
  show_name;
  change_name;
END;
/
ROLLBACK;