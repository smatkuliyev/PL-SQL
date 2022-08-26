-- SEARCHED CASE AND SIMPLE CASE

-- SEARCHED CASE
SET SERVEROUTPUT ON;

DECLARE
    birthDate       DATE := TO_DATE('21/05/2003', 'DD/MM/YYYY');
    age             NUMBER(3);
    PRINTOUT        VARCHAR2(3000);
BEGIN
    age := (sysdate - birthdate)/365;
    
    CASE
        WHEN age < 15 THEN  PRINTOUT := 'I am a child, '|| age;
        WHEN age < 20 THEN  PRINTOUT := 'I am a teenager, '|| age;
            CASE
                WHEN age > 18 THEN PRINTOUT := 'I am a  '|| age;
            END CASE;
        WHEN age < 30 THEN  PRINTOUT := 'I am a 20th, '|| age;
        WHEN age < 40 THEN  PRINTOUT := 'I am a 30th, '|| age;
        ELSE                PRINTOUT := 'I am a adult, '|| age;
    END CASE;
    DBMS_OUTPUT.PUT_LINE(PRINTOUT);
END;