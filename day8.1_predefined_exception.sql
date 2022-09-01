-- Predefined Exceptions

SET SERVEROUTPUT ON;

DECLARE
    r_emp   employees%ROWTYPE;
    val1    NUMBER(5);
BEGIN
    val1 := 5000/0;
    val1 := 123456;
    
    SELECT * INTO r_emp FROM employees;
    -- WHERE employee_id = 1;
    DBMS_OUTPUT.PUT_LINE(r_emp.employee_id || ' ' || r_emp.first_name);
    
    EXCEPTION WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No id = 1 employee : ' || SQLCODE || ' : ' || SQLERRM);
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('More than 1 employee : ' || SQLCODE || ' : ' || SQLERRM);
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Wrong value : ' || SQLCODE || ' : ' || SQLERRM);
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('ZERO_DIVIDE : ' || SQLCODE || ' : ' || SQLERRM);
END;