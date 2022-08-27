-- EXPLICIT CURSORS
-- CURSOR DURUM BILGISI, %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT

SET SERVEROUTPUT ON;
/
DECLARE
    
    CURSOR C_EMP IS SELECT employee_id, last_name FROM EMPLOYEES ORDER BY employee_id;

    Wemployee_id    employees.employee_id%TYPE;
    Wlast_name      employees.last_name%TYPE;
BEGIN
    IF NOT C_EMP%ISOPEN THEN
        OPEN C_EMP;
    END IF;
    
    LOOP
        FETCH C_EMP INTO Wemployee_id,Wlast_name;
        EXIT WHEN C_EMP%NOTFOUND OR c_emp%rowcount > 10;
    -- EXIT WHEN C_EMP%NOTFOUND;
     -- EXIT WHEN NOT C_EMP%FOUND;
        DBMS_OUTPUT.PUT_LINE('Sira no: '|| c_emp%rowcount ||', Sicil no: '||Wemployee_id||', Soyismi: '||Wlast_name);
    END LOOP;
        
    IF C_EMP%ISOPEN THEN
        CLOSE C_EMP;
    END IF;
END;