-- Collection Data Types
-- VARRAY
SET SERVEROUTPUT ON;

DECLARE
    TYPE takimlar IS VARRAY(10) OF VARCHAR2(30);
    takim takimlar := takimlar('GS', 'FB', 'BJK', 'TS');
BEGIN
    DBMS_OUTPUT.PUT_LINE('2001');
    DBMS_OUTPUT.PUT_LINE('----');
    
 -- FOR i IN 1..5 LOOP --ERROR
    FOR i IN 1..takim.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE( i || '. ' || takim(i) );
    END LOOP;
    
    takim.EXTEND;
    takim(5) := 'Samsun Spor';   
    takim(3) := 'Sivas Spor';
    takim(4) := 'Demir Spor';
    
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('2002');
    DBMS_OUTPUT.PUT_LINE('----');
    
    FOR i IN 1..takim.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE( i || '. ' || takim(i) );
    END LOOP;
    
    takim := takimlar('Genclerbirligi', 'Istanbul Spor', 'BJK', 'GS');
    
        DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('2003');
    DBMS_OUTPUT.PUT_LINE('----');
    
    FOR i IN 1..takim.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE( i || '. ' || takim(i) );
    END LOOP;

END;