-- NESTED PROCEDURES WITH PARAMETER, --( IN, OUT, INOUT )
-- POSITION, NAME, COMPLICATED NOTATION

SET SERVEROUTPUT ON;

DECLARE
    wmaas           employees.salary%TYPE;
    wmaas_zamli     employees.salary%TYPE := 1.25;
    PROCEDURE get_info( p_id            IN employees.employee_id%TYPE, 
                        p_salary        OUT employees.salary%TYPE,
                        p_new_salary    IN OUT employees.salary%TYPE
                        ) IS
    BEGIN
        SELECT salary INTO p_salary FROM employees WHERE employee_id = p_id;
        p_new_salary := p_new_salary * p_salary;
    END;
BEGIN
    FOR I IN (SELECT employee_id FROM employees) LOOP
     -- get_info(I.employee_id, wmaas, wmaas_zamli);
     -- get_info(p_salary => wmaas, p_id => I.employee_id, p_new_salary => wmaas_zamli);
        get_info(I.employee_id, wmaas, p_new_salary => wmaas_zamli);
        DBMS_OUTPUT.PUT_LINE('Sicil no: ' || I.employee_id || ', maas: ' || wmaas || ', zamli maas: ' || wmaas_zamli);
        wmaas_zamli := 1.25;
    END LOOP;
 -- get_info(145, wmaas, wmaas_zamli);
 -- DBMS_OUTPUT.PUT_LINE('Sicil no: ' || 145 || ', maas: ' || wmaas || ', zamli maas: ' || wmaas_zamli);
END;
/
ROLLBACK;