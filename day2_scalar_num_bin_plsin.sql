SET SERVEROUTPUT ON;

DECLARE
    p1 BINARY_INTEGER := 2147483647; 
 -- p2 BINARY_INTEGER := 1;

 -- p1 PLS_INTEGER := 2147483647;
 -- p2 PLS_INTEGER := 1;
    p2 NUMBER := 1;
    n NUMBER;
BEGIN
    n := p1 + p2;
    
    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;