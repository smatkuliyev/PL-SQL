-- RECORD DATA TYPES -- TABLE BASED RECORDS
SET SERVEROUTPUT ON;

DECLARE
    calisanlar  employees%ROWTYPE;
BEGIN
    SELECT * INTO calisanlar FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
    
    DBMS_OUTPUT.PUT_LINE('Ýsmi: ' ||calisanlar.first_name);
    DBMS_OUTPUT.PUT_LINE('Soyismi: ' ||calisanlar.last_name);
    DBMS_OUTPUT.PUT_LINE('Maas: ' ||calisanlar.salary);
END;