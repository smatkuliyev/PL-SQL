-- EXPLICIT CURSORS
-- CURSOR DURUM BILGISI, %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
-- CURSORS AND RECORDS (%ROWTYPE)
-- FOR LOOP

SET SERVEROUTPUT ON;
/
DECLARE
    CURSOR c_emp IS SELECT * FROM employees ORDER BY employee_id;
BEGIN
     FOR r_oku IN c_emp LOOP        
        DBMS_OUTPUT.PUT_LINE(   'Sira no: '|| c_emp%rowcount ||', Sicil no: '||
                                r_oku.employee_id||', Soyismi: '||r_oku.last_name||
                                ', Adi: '||r_oku.first_name);
     END LOOP;
END;