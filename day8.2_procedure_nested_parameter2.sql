-- NESTED PROCEDURES WITH PARAMETER, --( IN, OUT, INOUT )

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
    get_info(145, wmaas, wmaas_zamli);
    DBMS_OUTPUT.PUT_LINE('Sicil no: ' || 145 || ', maas: ' || wmaas || ', zamli maas: ' || wmaas_zamli);
END;
/
ROLLBACK;