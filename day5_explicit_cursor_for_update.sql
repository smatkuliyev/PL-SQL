/* Formatted on 28/08/2022 14:43:09 (QP5 v5.252.13127.32867) */
-- CURSORS - FOR UPDATE ve WHERE CURRENT OF kullanýmý
-- Maasi 5000'den az olanlara %20 zam yapalým

DROP TABLE employees2;
/

CREATE TABLE employees2
AS
   SELECT * FROM employees;
/

DECLARE
   -- cursor c_emp is select * from employees2 for update; -- tum kaydi lock eder, update ve delete için
   CURSOR c_emp
   IS
          SELECT *
            FROM employees2
      FOR UPDATE OF salary;                         -- sadece salary lock eder
BEGIN
   FOR r_emp IN c_emp
   LOOP
      IF r_emp.salary < 5000
      THEN
         DBMS_OUTPUT.PUT_LINE (r_emp.employee_id || ' updated');

         UPDATE employees2
            SET salary = salary * 1.2
          -- where employee_id = r_emp.employee_id;
          WHERE CURRENT OF c_emp;
      END IF;
   END LOOP;

   COMMIT;
END;
/

SELECT * FROM employees2;