-- STATIC SQL ( DML, TCL, SAVEPOINT )

SET SERVEROUTPUT ON;

CREATE TABLE regions2 AS SELECT * FROM regions WHERE 1=2;

DECLARE
    
BEGIN
    INSERT INTO regions2(region_id, region_name) VALUES (1, 'Europe');
    SAVEPOINT A;
    
    INSERT INTO regions2(region_id, region_name) VALUES (2, 'Asya');
    SAVEPOINT B;
    
    UPDATE regions2 SET region_name = 'Asia' WHERE region_id = 2;
    SAVEPOINT C;
    
    DELETE FROM regions2 WHERE region_id = 2;
    
   -- ROLLBACK TO A;
   -- ROLLBACK TO B;
   -- ROLLBACK TO C;
   -- ROLLBACK;
    
    COMMIT;
    
END;