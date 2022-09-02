-- Stored Procedures

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ins_dept(
                                    p_dno   IN NUMBER,
                                    p_name  IN VARCHAR2,
                                    p_man   IN departments.manager_id%TYPE DEFAULT 145,
                                    p_loc   IN departments.location_id%TYPE,
                                    p_sonuc OUT VARCHAR2
                                    ) IS
BEGIN
    IF TO_CHAR(sysdate, 'DY') IN ('SAT', 'SUN') THEN
        p_sonuc := 'Can not insert values on Saturday and Sunday!';
    ELSE
        BEGIN
            INSERT INTO departments(department_id, department_name, manager_id, location_id) 
            VALUES (p_dno, p_name, p_man, p_loc);
            p_sonuc := 'Added';
            EXCEPTION WHEN OTHERS THEN
                p_sonuc := SQLCODE || ' ' || SQLERRM;
        END;
    END IF;
END;
/
-- EXECUTE ins_dept(280,'Education', '145', 1700);
DECLARE
    wsonuc  VARCHAR2(300);
BEGIN
    -- position notation
 -- ins_dept(280,'Education', '145', 1700, wsonuc);
    
    -- name notation
    ins_dept(p_dno => 282,p_name => 'Finance',p_loc => 1700,p_sonuc => wsonuc);
    DBMS_OUTPUT.PUT_LINE(wsonuc);
END;
/
SELECT * FROM departments ORDER BY 1;
/
DROP PROCEDURE ins_dept;


