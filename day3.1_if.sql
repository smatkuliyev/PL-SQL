-- IF, NESTED IF

SET SERVEROUTPUT ON;

DECLARE
    birthDate     DATE := TO_DATE('21/05/2003', 'DD/MM/YYYY');
    age           NUMBER(3);
BEGIN
    age := (sysdate - birthdate)/365;
    
    IF age < 15 then
        DBMS_OUTPUT.PUT_LINE('I am a child '|| age);
    ELSIF age < 20 then
        DBMS_OUTPUT.PUT_LINE('I am a teenager '|| age);
        IF age > 18 THEN
        DBMS_OUTPUT.PUT_LINE('I am a  '|| age);
        END IF;
    ELSIF age < 30 then
        DBMS_OUTPUT.PUT_LINE('I am a 20th '|| age);
    ELSIF age < 40 then
        DBMS_OUTPUT.PUT_LINE('I am a 30th '|| age);
    ELSE  
        DBMS_OUTPUT.PUT_LINE('I am a adult '|| age);
    END IF;    
    
END;