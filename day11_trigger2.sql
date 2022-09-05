-- DML TRIGGERS, AUDIT

SET SERVEROUTPUT ON;

DESC REGIONS;

CREATE TABLE REGIONS_LOG (
        region_id   NUMBER,   
        region_name VARCHAR2(25),
        kim         VARCHAR2(30),
        nezaman     DATE,
        neyapti     VARCHAR2(10)        
        );
/

CREATE OR REPLACE TRIGGER regions_audit_trg
    AFTER INSERT OR UPDATE OR DELETE ON regions
    FOR EACH ROW
DECLARE
    wislem  VARCHAR2(10);
BEGIN
    wislem := CASE
            WHEN INSERTING THEN 'INSERT'
            WHEN UPDATING THEN 'UPDATE'
            WHEN DELETING THEN 'DELETE'
        END;
    IF INSERTING THEN
        INSERT INTO regions_log(region_id, region_name, kim, nezaman, neyapti) 
            VALUES (:NEW.region_id, :NEW.region_name, USER, sysdate, wislem);
    END IF;
    
    IF UPDATING THEN
        INSERT INTO regions_log(region_id, region_name, kim, nezaman, neyapti) 
            VALUES (:OLD.region_id, :OLD.region_name, USER, sysdate, wislem);
            
        INSERT INTO regions_log(region_id, region_name, kim, nezaman, neyapti) 
            VALUES (NVL(:NEW.region_id, :OLD.region_id), 
                    NVL(:NEW.region_name, :OLD.region_name), USER, sysdate, wislem ||' 2');
    END IF;
    
    IF DELETING THEN
        INSERT INTO regions_log(region_id, region_name, kim, nezaman, neyapti) 
            VALUES (:OLD.region_id, :OLD.region_name, USER, sysdate, wislem);
    END IF;
END;