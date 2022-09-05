-- DML TRIGGERS, TABLE LEVEL

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE dml_guvenlik_kontrol IS
BEGIN
    IF TO_CHAR(sysdate, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20205, 'Mesai saatleri disinda veri islemi yapilamaz');
    END IF;
END;

/
CREATE OR REPLACE TRIGGER dml_departments
    BEFORE INSERT OR UPDATE OR DELETE ON departments
BEGIN
    dml_guvenlik_kontrol;
END;
/
DELETE FROM departments WHERE department_id = 60;
/
CREATE OR REPLACE TRIGGER dml_jobs
    BEFORE INSERT OR UPDATE OR DELETE ON jobs
BEGIN
    dml_guvenlik_kontrol;
END;
/
SELECT * FROM jobs;
/
UPDATE jobs SET job_title = 'PROGRAMCI' WHERE job_id = 'IT_PROG';
/
DROP TRIGGER dml_jobs;
/
ALTER TRIGGER dml_jobs DISABLE;
/
ALTER TRIGGER dml_jobs ENABLE;