-- Stored Procedures

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE merhabaDunya IS

BEGIN
    DBMS_OUTPUT.PUT_LINE('merhaba Dunya');
END;
/
EXECUTE merhabaDunya;
/
EXEC merhabaDunya;
/
DECLARE

BEGIN
  merhabaDunya;
END;