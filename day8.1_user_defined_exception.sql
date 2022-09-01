-- USER DEFÝNED EXCEPTIONS

SET SERVEROUTPUT ON;

DECLARE
    v_dept_id       employees.department_id%TYPE;
    v_toplam        NUMBER;
    e_invalid_id    EXCEPTION;
BEGIN
    v_dept_id := &dept_id;
    IF v_dept_id > 0 THEN
        SELECT COUNT(*) INTO v_toplam FROM employees WHERE department_id = v_dept_id;
        DBMS_OUTPUT.PUT_LINE('Toplam: ' || v_toplam);
    ELSE
        RAISE e_invalid_id;
    END IF;
    
    EXCEPTION WHEN e_invalid_id THEN
        DBMS_OUTPUT.PUT_LINE('No negative departmen id!');
END;