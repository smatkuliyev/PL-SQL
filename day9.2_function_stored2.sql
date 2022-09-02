CREATE OR REPLACE FUNCTION factorial(n INTEGER) RETURN INTEGER IS
    fact    INTEGER;
BEGIN
    IF n = 0 THEN
        fact := 1;
    ELSIF n = 1 THEN
        fact := 1;
    ELSIF n < 0 THEN
        fact := null;
    ELSE
        fact := n * factorial(n-1);
    END IF;
    
    RETURN(fact);
END;
/
SELECT '-5! = '|| factorial(-5) AS factorial FROM DUAL;