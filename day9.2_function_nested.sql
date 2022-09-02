-- Nested Functions

DECLARE
    x   NUMBER;
    FUNCTION toplam(p1 NUMBER, p2 NUMBER) RETURN NUMBER IS
        c   NUMBER;
    BEGIN
        c := p1 + p2;
        RETURN(c);
    END;
BEGIN
    x := toplam(2, 5);
    DBMS_OUTPUT.PUT_LINE('Toplam: ' || x);
END;