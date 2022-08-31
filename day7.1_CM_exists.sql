-- COLLECTION METHODS EXISTS
SET SERVEROUTPUT ON;

DECLARE
    TYPE ndt_type IS TABLE OF CHAR(1);
    var1 ndt_type := ndt_type('P','L','/','S','Q','L');    
BEGIN
    FOR i IN 1..6 LOOP
        IF var1.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
    var1.DELETE(3);
    FOR i IN 1..6 LOOP
        IF var1.EXISTS(i) THEN
            DBMS_OUTPUT.PUT_LINE('var1(' || i || ')=' || var1(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
END;