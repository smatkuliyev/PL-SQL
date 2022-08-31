-- COLLECTION METHODS TRIM
SET SERVEROUTPUT ON;

DECLARE
    TYPE varr_type IS VARRAY(10) OF INTEGER;
    var1 varr_type := varr_type(10, 21, 9, 4, 55, 68);
BEGIN
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Original degerler---');
    FOR i IN 1..var1.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
    END LOOP;

    var1.TRIM;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('TRIM USED---');
    FOR i IN 1..var1.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
    END LOOP;
    
    var1.TRIM(2);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('TRIM(2) USED---');
    FOR i IN 1..var1.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
    END LOOP;
    
 -- var1.DELETE(2);
 -- var1.DELETE(2,4);
    var1.DELETE;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('DELETE USED---');
    FOR i IN 1..6 LOOP
        IF var1.EXISTS(i)  THEN
            DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
END;