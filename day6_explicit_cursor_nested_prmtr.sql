-- CURSORS WITH PARAMETERS, NESTED CURSOR
-- locations -> departments -> employees
SET SERVEROUTPUT ON;
DECLARE
    CURSOR c_loc IS SELECT location_id, city FROM locations ORDER BY city;
    r_loc   c_loc%ROWTYPE;
    
    CURSOR c_dept(p_loc_id departments.location_id%TYPE) IS SELECT department_id, department_name FROM departments WHERE location_id=p_loc_id ORDER BY department_name;
    r_dept  c_dept%ROWTYPE;
    
    CURSOR c_emp(p_dept employees.department_id%TYPE) IS SELECT employee_id, first_name ||' '|| last_name AS ad_soyad, hire_date, job_id FROM employees
    WHERE department_id=p_dept ORDER BY 1;
    r_emp   c_emp%ROWTYPE;
BEGIN
    OPEN c_loc;
    LOOP
        FETCH c_loc INTO r_loc;
        EXIT WHEN c_loc%NOTFOUND;
        DBMS_OUTPUT.NEW_LINE;
        DBMS_OUTPUT.PUT_LINE('Location: ' || r_loc.city || '(' || r_loc.location_id || ')');        
        OPEN c_dept(r_loc.location_id);
            LOOP
                FETCH c_dept INTO r_dept;
                EXIT WHEN c_dept%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('  ' || r_dept.department_name || '(' || r_dept.department_id || ')');                
                OPEN c_emp(r_dept.department_id);
                    LOOP
                        FETCH c_emp INTO r_emp;
                        EXIT WHEN c_emp%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE('      ' || r_emp.ad_soyad || '(' || r_emp.employee_id ||'-'||r_emp.job_id ||'-'|| TO_CHAR(r_emp.hire_date,'DD/MM/YYYY') ||')');
                    END LOOP;
                CLOSE c_emp;                
            END LOOP;        
        CLOSE c_dept;        
    END LOOP;
    CLOSE c_loc;
END;