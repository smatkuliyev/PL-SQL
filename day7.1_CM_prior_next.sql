-- COLLECTION METHODS PRIOR NEXT
SET SERVEROUTPUT ON;

DECLARE
  TYPE arr_type IS VARRAY(10) OF NUMBER;
  v_sayi    arr_type := arr_type();
BEGIN
    v_sayi.EXTEND(4);
    v_sayi(1) := 10;
    v_sayi(2) := 20;
    v_sayi(3) := 30;
    v_sayi(4) := 40;
    
    DBMS_OUTPUT.PUT_LINE('v_sayi.PRIOR(3) = ' || v_sayi.PRIOR(3));
    DBMS_OUTPUT.PUT_LINE('v_sayi.NEXT(3) = ' || v_sayi.NEXT(3));
    
    DBMS_OUTPUT.PUT_LINE('v_sayi.PRIOR(6) = ' || v_sayi.PRIOR(6));
    DBMS_OUTPUT.PUT_LINE('v_sayi.NEXT(6) = ' || v_sayi.NEXT(6));
    
    DBMS_OUTPUT.PUT_LINE('v_sayi.PRIOR(v_sayi.FIRST) = ' || v_sayi.PRIOR(v_sayi.FIRST));
    DBMS_OUTPUT.PUT_LINE('v_sayi.NEXT(v_sayi.LAST) = ' || v_sayi.NEXT(v_sayi.LAST));
END;