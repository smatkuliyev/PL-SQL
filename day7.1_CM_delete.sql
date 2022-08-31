-- COLLECTION METHODS DELETE
SET SERVEROUTPUT ON;

DECLARE
    TYPE ndt_sayilar IS TABLE OF INTEGER;
    dizi ndt_sayilar := ndt_sayilar(10, 21, 23, 49, 60, 63);
BEGIN
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Original ---');
    FOR i IN 1..dizi.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')=' || dizi(i));
    END LOOP;
    
    dizi.DELETE(2);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('2th is deleted');
    FOR i IN 1..dizi.COUNT LOOP
        IF dizi.EXISTS(i)  THEN
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')=' || dizi(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
    
    dizi(2) := 9999;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('2th is inserted');
    FOR i IN 1..dizi.COUNT LOOP
        IF dizi.EXISTS(i)  THEN
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')=' || dizi(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
    
    dizi.DELETE(2,4);
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('2,3,4th is deleted');
    FOR i IN 1..dizi.COUNT LOOP
        IF dizi.EXISTS(i)  THEN
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')=' || dizi(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
    
    dizi.DELETE;
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('All deleted');
    FOR i IN 1..dizi.COUNT LOOP
        IF dizi.EXISTS(i)  THEN
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')=' || dizi(i));
        ELSE
            DBMS_OUTPUT.PUT_LINE('dizi(' || i || ')= NOT EXIST');
        END IF;
    END LOOP;
    
END;