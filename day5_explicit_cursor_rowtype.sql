-- EXPLICIT CURSORS
-- CURSOR DURUM BILGISI, %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
-- CURSORS AND RECORDS (%ROWTYPE)

SET SERVEROUTPUT ON;
/
DECLARE
    
 -- CURSOR c_emp IS SELECT employee_id, last_name FROM employees ORDER BY employee_id;
    CURSOR c_emp IS SELECT * FROM employees ORDER BY employee_id;

 -- Wemployee_id    employees.employee_id%TYPE;
 -- Wlast_name      employees.last_name%TYPE;
    r_oku c_emp%ROWTYPE;
    
BEGIN
    IF NOT c_emp%ISOPEN THEN
        OPEN c_emp;
    END IF;
    
    LOOP
     -- FETCH C_EMP INTO Wemployee_id,Wlast_name;
        FETCH c_emp INTO r_oku;
        EXIT WHEN c_emp%NOTFOUND; 
     -- OR c_emp%rowcount > 10;
     -- EXIT WHEN c_emp%NOTFOUND;
     -- EXIT WHEN NOT c_emp%FOUND;
     -- DBMS_OUTPUT.PUT_LINE('Sira no: '|| c_emp%rowcount ||', Sicil no: '||Wemployee_id||', Soyismi: '||Wlast_name);
        DBMS_OUTPUT.PUT_LINE('Sira no: '|| c_emp%rowcount ||', Sicil no: '||r_oku.employee_id||', Soyismi: '||r_oku.last_name||', Adi: '||r_oku.first_name);
    END LOOP;
        
    IF c_emp%ISOPEN THEN
        CLOSE c_emp;
    END IF;
END;