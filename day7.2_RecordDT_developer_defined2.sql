-- RECORD DATA TYPES -- Developer/User Defined Records + Nested Records
SET SERVEROUTPUT ON;

DECLARE
    TYPE r_kisi IS RECORD (
                            ad      employees.first_name%TYPE,
                            soyad   employees.last_name%TYPE
                            );
    TYPE contact IS RECORD (
                            kisi        r_kisi, --nested record
                            telefon     employees.phone_number%TYPE
                            );
    TYPE dizi IS TABLE OF contact; -- Nested table data types with records
                            
 -- rehber      contact;
    rehber      dizi := dizi();
    j           NUMBER:=0;
BEGIN
 /* rehber.isim.ad      := 'Sulayman';
    rehber.isim.soyad   := 'Matkuliyev';
    rehber.telefon      := '1234567890';
    DBMS_OUTPUT.PUT_LINE('Name: ' || rehber.isim.ad || ', Last Name: ' || rehber.isim.soyad || ', Phone No:' || rehber.telefon ); */
    
    FOR i IN (SELECT first_name, last_name,phone_number FROM employees /* WHERE department_id = 60 */) LOOP
        j := j +1;
        rehber.EXTEND;
        rehber(j).kisi.ad       := i.first_name;
        rehber(j).kisi.soyad    := i.last_name;
        rehber(j).telefon       := i.phone_number;
    END LOOP;
    
    j := rehber.FIRST;
    WHILE j IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rehber(j).kisi.ad || ', Last Name: ' || rehber(j).kisi.soyad || ', Phone No: ' || rehber(j).telefon );
        j := rehber.NEXT(j);
      END LOOP;   
    
END;