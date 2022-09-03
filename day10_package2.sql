SET SERVEROUTPUT ON;

DECLARE
    wempdata    MyTypes.empData;
    c_cursor    MyTypes.cursor_type;
    r           NUMBER := 5;
BEGIN
    OPEN c_cursor FOR SELECT employee_id, first_name FROM employees;
    
    LOOP
        FETCH c_cursor INTO wempdata;
        EXIT WHEN c_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(wempdata.emp_id || ' ' ||wempdata.f_name );
    END LOOP;
    
    CLOSE c_cursor;
    DBMS_OUTPUT.PUT_LINE(R || ' Yaricapli dairenin alani : ' || MyTypes.PI * POWER(r, 2));
END;