SET SERVEROUTPUT ON;

DECLARE
    TYPE t_dept IS RECORD(
                            dept_id    NUMBER(4),
                            dept_name  departments.department_name%TYPE,
                            mgr_id     departments.location_id%TYPE NOT NULL DEFAULT 0                            
                            );    
    r_dept2 t_dept;    
BEGIN
 -- SELECT * INTO r_dept2
    SELECT department_id, department_name, manager_id INTO r_dept2
    FROM departments
    WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE(r_dept2.dept_id ||' '|| r_dept2.dept_name ||' '|| r_dept2.mgr_id );
END;