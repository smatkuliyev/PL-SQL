CREATE OR REPLACE PACKAGE MyTypes AS
    TYPE empData IS RECORD (
                    emp_id  employees.employee_id%TYPE,
                    f_name  employees.first_name%TYPE
                    );
    PI  CONSTANT NUMBER(3,2)    := 3.14;
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;

    PROCEDURE calisanlar(p_dept_id employees.department_id%TYPE);
END MyTypes;
/
CREATE OR REPLACE PACKAGE BODY MyTypes AS
    PROCEDURE calisanlar(p_dept_id employees.department_id%TYPE)IS
        wempdata    MyTypes.empData;
        c_cursor    MyTypes.cursor_type;
    BEGIN
        OPEN c_cursor FOR SELECT employee_id, first_name FROM employees
           WHERE department_id= p_dept_id ;    
        LOOP
            FETCH c_cursor INTO wempdata;
            EXIT WHEN c_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(wempdata.emp_id || ' ' ||wempdata.f_name );
        END LOOP;
    CLOSE c_cursor;
    END;    
END;