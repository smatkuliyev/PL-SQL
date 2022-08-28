-- EXPLICIT CURSORS
-- CURSOR DURUM BILGISI, %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
-- CURSORS AND RECORDS (%ROWTYPE)
-- FOR LOOP

SET SERVEROUTPUT ON;
/
DECLARE
i number := 0;
BEGIN
     FOR r_oku IN (SELECT * FROM employees ORDER BY employee_id) LOOP
        i := i+1;
        DBMS_OUTPUT.PUT_LINE(   'Sira no: '|| i||', Sicil no: '||
                                r_oku.employee_id||', Soyismi: '||r_oku.last_name||
                                ', Adi: '||r_oku.first_name);
     END LOOP;
END;