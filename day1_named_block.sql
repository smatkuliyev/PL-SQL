-- NAMED BLOCK

CREATE OR REPLACE FUNCTION GET_DAY_NAME(P_TARIH DATE) RETURN VARCHAR2
IS
BEGIN
    RETURN(TO_CHAR(P_TARIH,'DAY'));
END;

SELECT GET_DAY_NAME(SYSDATE)FROM DUAL;
