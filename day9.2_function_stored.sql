CREATE OR REPLACE FUNCTION dept_name (p_dept departments.department_id%TYPE)
   RETURN departments.department_name%TYPE
IS
   wdeptname   departments.department_name%TYPE;
BEGIN
   SELECT department_name
     INTO wdeptname
     FROM departments
    WHERE department_id = p_dept;

   RETURN (wdeptname);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN (NULL);
END;
/

CREATE OR REPLACE PROCEDURE emp_oku (p_dept departments.department_id%TYPE)
IS
BEGIN
   DBMS_OUTPUT.PUT_LINE (p_dept || ' - ' || dept_name (p_dept));

   FOR I IN (SELECT *
               FROM employees
              WHERE department_id = p_dept)
   LOOP
      DBMS_OUTPUT.PUT_LINE ('      ' || I.employee_id || ' ' || I.last_name);
   END LOOP;

   DBMS_OUTPUT.NEW_LINE;
END;