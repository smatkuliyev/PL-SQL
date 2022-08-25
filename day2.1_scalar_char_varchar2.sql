SET SERVEROUTPUT ON;

DECLARE
    wadi CHAR(15);
    wsoyadi VARCHAR2(15);
BEGIN
    wadi := 'Mehmet';
    wsoyadi := 'Celebi';
    
    DBMS_OUTPUT.PUT_LINE('*'||wadi||'*');
    DBMS_OUTPUT.PUT_LINE('*'||wsoyadi||'*');
END;