-- Internally Defined Exceptions - PRAGMA_EXCEPTION_INIT, - OTHERS, EXCEPTION SCOPE

SET SERVEROUTPUT ON;

DECLARE
 -- my_exception    EXCEPTION;
 -- PRAGMA          EXCEPTION_INIT (my_exception, -02292);
    
 -- my_exception2   EXCEPTION;
 -- PRAGMA          EXCEPTION_INIT (my_exception2, -00001);
BEGIN
    INSERT INTO regions VALUES (6, 'Antarctica');
    
    BEGIN
        DELETE FROM departments WHERE department_id = 90;
        
        EXCEPTION WHEN OTHERS THEN
         -- DBMS_OUTPUT.PUT_LINE('ERROR ');
            DBMS_OUTPUT.PUT_LINE('ERROR : ' || SQLCODE || ' : ' || SQLERRM);
            
 --     EXCEPTION WHEN my_exception THEN
 --         DBMS_OUTPUT.PUT_LINE('ERROR');
    END;
 -- EXCEPTION WHEN my_exception2 THEN
 --     DBMS_OUTPUT.PUT_LINE('ERROR2');
 
    EXCEPTION WHEN OTHERS THEN
        --  DBMS_OUTPUT.PUT_LINE('ERROR2 ');
            DBMS_OUTPUT.PUT_LINE('ERROR2 : ' || SQLCODE || ' : ' || SQLERRM);
END;