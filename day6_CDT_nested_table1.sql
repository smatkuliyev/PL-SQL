-- Collection Data Types
-- NESTED TABLES
SET SERVEROUTPUT ON;

DECLARE
    TYPE ndt_isimler IS TABLE OF VARCHAR2(10);
    TYPE ndt_puanlar IS TABLE OF INTEGER;
    
    isimler     ndt_isimler;
    puanlar     ndt_puanlar;
BEGIN
    isimler := ndt_isimler('Mehmet','Ahmet','Ayse','Fatma','Oguz');
    puanlar := ndt_puanlar(98,97,78,87,92);
    
    DBMS_OUTPUT.PUT_LINE('Toplam ogrenci sayisi: ' || isimler.COUNT);
    
    FOR i IN 1..isimler.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Ogrenci:  ' || isimler(i) || '    Puan: '|| puanlar(i));
    END LOOP;
    
END;