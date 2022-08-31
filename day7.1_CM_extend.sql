-- COLLECTION METHODS EXTEND , PROCEDURE
SET SERVEROUTPUT ON;

DECLARE
    TYPE ndt_type IS TABLE OF INTEGER;
    var1 ndt_type := ndt_type(10, 20, 30);
    
    PROCEDURE yaz IS
        i INTEGER;
    BEGIN
        i := var1.FIRST;
        WHILE i IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
            i := var1.NEXT(i);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('-----');
    END;
    
BEGIN
    yaz;
    var1.EXTEND(2,1);
    yaz;
    
    var1.DELETE(5);
    yaz;
    
    var1.EXTEND(2);
    yaz;
    
    var1.EXTEND;
    yaz;
END;