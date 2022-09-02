-- Nested Functions
-- PROCEDURE and FUNCTION

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_dept IS SELECT department_id FROM departments;
    r_dept  c_dept%ROWTYPE;

    FUNCTION dept_name(p_dept departments.department_id%TYPE) RETURN departments.department_name%TYPE IS
        wdeptname  departments.department_name%TYPE;
    BEGIN
        SELECT department_name INTO wdeptname FROM departments WHERE department_id=p_dept;
        RETURN (wdeptname);
        EXCEPTION WHEN NO_DATA_FOUND THEN
            RETURN(NULL);
    END;
    
    PROCEDURE emp_oku(p_dept departments.department_id%TYPE) IS
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE(p_dept ||' - ' || dept_name(p_dept) );                
        FOR I IN ( SELECT * FROM employees WHERE department_id = p_dept ) LOOP
            DBMS_OUTPUT.PUT_LINE('      ' || I.employee_id || ' ' || I.last_name );
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END;
BEGIN
 -- emp_oku(60);
 
    OPEN c_dept;
    LOOP
        FETCH c_dept INTO r_dept;
        EXIT WHEN c_dept%NOTFOUND;
        emp_oku(r_dept.department_id);
    END LOOP;
    CLOSE c_dept;
END;
/

--2
DECLARE
    CURSOR c_dept IS SELECT department_id FROM departments;
    r_dept  c_dept%ROWTYPE;
BEGIN
 -- emp_oku(60);
 
    OPEN c_dept;
    LOOP
        FETCH c_dept INTO r_dept;
        EXIT WHEN c_dept%NOTFOUND;
        emp_oku(r_dept.department_id);
    END LOOP;
    CLOSE c_dept;
END;
/
--3)-- SELECT

SELECT dept_name(90) FROM DUAL;