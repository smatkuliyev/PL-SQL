CREATE OR REPLACE PACKAGE MyTypes AS
    TYPE empData IS RECORD (
                    emp_id  employees.employee_id%TYPE,
                    f_name  employees.first_name%TYPE
                    );
    PI  CONSTANT NUMBER(3,2)    := 3.14;
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;

END MyTypes;