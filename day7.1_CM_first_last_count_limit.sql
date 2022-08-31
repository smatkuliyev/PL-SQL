-- COLLECTION METHODS FIRST, LAST, COUNT, LIMIT
SET SERVEROUTPUT ON;

DECLARE
 -- TYPE varray_type IS VARRAY(10) OF INTEGER;
 -- varray varray_type := varray_type(1,2,3,4,5,6);
 
 -- TYPE varray_type IS TABLE OF INTEGER;
 -- varray varray_type := varray_type(10,20,30,40,50,60);
    -- limitless
    
    TYPE varray_type IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    varray varray_type;
    
    PROCEDURE yaz IS    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('varray.COUNT ' || varray.COUNT);
        DBMS_OUTPUT.PUT_LINE('varray.LIMIT ' || varray.LIMIT);
        DBMS_OUTPUT.PUT_LINE('varray.FIRST ' || varray.FIRST);
        DBMS_OUTPUT.PUT_LINE('varray.LAST ' || varray.LAST);
    END;
BEGIN    
 /* DBMS_OUTPUT.PUT_LINE('Original degerler');
    yaz;
    
    varray.EXTEND(2, 4);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('varray.EXTEND(2, 4) sonrasi');
    yaz;
    
    varray.TRIM(2);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('varray.TRIM(2, 4) sonrasi');
    yaz; */
    
    varray(1) := 10; varray(2) := 20; varray(3) := 30; varray(4) := 40; varray(5) := 50; varray(6) := 60;
    DBMS_OUTPUT.PUT_LINE('Original degerler');
    yaz;
    
 -- varray.EXTEND(2, 4);
    varray(7) := 70;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('varray(7) sonrasi');
    yaz;
    
 -- varray.TRIM(2);
    varray.DELETE(1);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('varray.DELETE(1) sonrasi');
    yaz;
    
END;