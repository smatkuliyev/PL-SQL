SET SERVEROUTPUT ON;

DECLARE
    wempdata    MyTypes.empData;
    c_cursor    MyTypes.cursor_type;
    r           NUMBER := 5;
BEGIN
    MyTypes.calisanlar(60);
 /* OPEN c_cursor FOR SELECT employee_id, first_name FROM employees;   
    LOOP
        FETCH c_cursor INTO wempdata;
        EXIT WHEN c_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(wempdata.emp_id || ' ' ||wempdata.f_name );
    END LOOP;   
    CLOSE c_cursor;
    DBMS_OUTPUT.PUT_LINE(R || ' Yaricapli dairenin alani : ' || MyTypes.PI * POWER(r, 2)); */
END;
/
EXECUTE MyTypes.calisanlar(60);
/
SELECT MyTypes.daireAlani(5) FROM dual;
/
DECLARE
    wsonuc  NUMBER;
BEGIN
  wsonuc := MyTypes.daireAlani(5);
  DBMS_OUTPUT.PUT_LINE(wsonuc);
END;