-- BASIC LOOP

DECLARE
    SAYAC     BINARY_INTEGER := 0;
BEGIN
    LOOP
        SAYAC := NVL(SAYAC,0) + 1;
        
     /* IF MOD(SAYAC, 2) = 0 THEN
            CONTINUE;
        END IF; */
        
        CONTINUE WHEN MOD(SAYAC, 2) = 0;
        
        DBMS_OUTPUT.PUT_LINE('Sayac = '|| sayac);
        
     /* IF sayac = 5 THEN
            EXIT;
        END IF; */
        
        EXIT WHEN sayac = 5;
        
    END LOOP;
END;