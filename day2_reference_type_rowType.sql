SET SERVEROUTPUT ON;

DESC departments;

DECLARE
  --  WDEPARTMENT_ID    NUMBER(4);
  --  WDEPARTMENT_NAME  VARCHAR2(30);
  --  WMANAGER_ID       NUMBER(6);
  --  WLOCATION_ID      NUMBER(4);
    
    WDEPARTMENT_ID    departments.department_id%TYPE;
    WDEPARTMENT_NAME  departments.department_name%TYPE;
    WMANAGER_ID       departments.location_id%TYPE;
    WLOCATION_ID      departments.manager_id%TYPE; 
BEGIN
    SELECT * INTO wdepartment_id, wdepartment_name, wlocation_id, wmanager_id
    FROM departments
    WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE(wdepartment_id ||' '|| wdepartment_name ||' '|| wlocation_id ||' '|| wmanager_id);    
END;



DECLARE
    r_dept departments%ROWTYPE;
BEGIN
    SELECT * INTO r_dept
    FROM departments
    WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE(r_dept.department_id ||' '|| r_dept.department_name ||' '|| r_dept.location_id ||' '|| r_dept.manager_id);
END;
