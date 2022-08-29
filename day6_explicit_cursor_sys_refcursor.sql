-- SYS_REFCURSOR

DECLARE
    Wimlec      SYS_REFCURSOR;
    Wquery      VARCHAR2(2000);
    Weskimaas   employees.salary%TYPE;
    Wyenimaas   employees.salary%TYPE;
BEGIN
    Wquery := 'SELECT SALARY, SALARY *1.3 FROM EMPLOYEES WHERE DEPARTMENT_ID = 100 ';
    
    OPEN Wimlec FOR Wquery;
    LOOP
        FETCH Wimlec INTO Weskimaas,Wyenimaas;
        EXIT WHEN Wimlec%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Eski maas: ' || Weskimaas || ' Yeni maas: ' ||Wyenimaas);
        
    END LOOP;
    CLOSE Wimlec;
END;