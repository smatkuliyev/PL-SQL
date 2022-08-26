-- WHILE LOOP
SET SERVEROUTPUT ON;
/
DECLARE
    tarih1 DATE;
    tarih2 DATE;
    WBOOL BOOLEAN;
BEGIN
    tarih1 := TO_DATE('26/08/1071', 'DD/MM/YYYY');
    tarih2 := LAST_DAY(tarih1);
    
    WBOOL := tarih1 <= tarih2;
 -- WHILE tarih1 <= tarih2 LOOP
    WHILE WBOOL LOOP
    
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(tarih1, 'DAY')|| ' '|| TO_CHAR(tarih1, 'DD/MM/YYYY'));
        
        tarih1 := tarih1+1;
        
        WBOOL := tarih1 <= tarih2;
        
     -- EXIT WHEN tarih1 > TO_DATE('29/08/1071', 'DD/MM/YYYY');
    
    END LOOP;
END;