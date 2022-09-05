-- DML TRIGGERS, TEST

SELECT * FROM regions_log ORDER BY 4;
/
SELECT * FROM regions;
/
INSERT INTO regions VALUES (5, 'AAAA');
/
commit;
/
UPDATE regions SET region_name = 'BBBB' WHERE region_id = 5;
/
DELETE FROM regions WHERE region_id = 5;