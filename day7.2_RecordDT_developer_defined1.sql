-- RECORD DATA TYPES -- Developer/User Defined RECORDS
SET SERVEROUTPUT ON;

DECLARE
    TYPE r_zaman_type IS RECORD (
                                curr_date   DATE,
                                curr_day    VARCHAR2(12),
                                curr_time   VARCHAR2(8) := '00:00:00'                                
                                );
    v_zaman r_zaman_type;
BEGIN
    SELECT SYSDATE INTO v_zaman.curr_date FROM dual;
 -- DBMS_OUTPUT.PUT_LINE(SYSDATE);
    
    v_zaman.curr_day    := TO_CHAR(v_zaman.curr_date, 'Day');
    v_zaman.curr_time   := TO_CHAR(v_zaman.curr_date, 'HH24:MI:SS');
    
    DBMS_OUTPUT.PUT_LINE('Tarih: ' || TO_CHAR(v_zaman.curr_date, 'DD/MM/YYYY'));
    DBMS_OUTPUT.PUT_LINE('Gun: ' || v_zaman.curr_day);
    DBMS_OUTPUT.PUT_LINE('Zaman: ' || v_zaman.curr_time);
    
END;