-- Collection Data Types
-- 1) Associative Array Index By Tables, INDEX ve DEGER, WKARE(INDEX) := DEGER
-- 2) INDEX integer, DEGER varchar2
-- 3) wkare(varchar2) := varchar2

SET SERVEROUTPUT ON;

DECLARE
    TYPE t_assoc_num IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    wkare   t_assoc_num;
    J       NUMBER;
    
    TYPE t_assoc_str IS TABLE OF employees.last_name%TYPE INDEX BY BINARY_INTEGER;
    wlast_name  t_assoc_str;
    
    TYPE t_assoc_str2 IS TABLE OF jobs.job_title%TYPE INDEX BY jobs.job_id%TYPE;
    wjobs t_assoc_str2;
BEGIN
-- 1)
    FOR i IN 1..10 LOOP
        wkare(i) := POWER(i,2);
    END LOOP;
    
    J := wkare.FIRST;
    
    WHILE j IS NOT NULL LOOP
        DBMS_OUTPUT.PUT_LINE(J || ' KARESI ' ||wkare(J));
        J :=wkare.NEXT(J);
    END LOOP;
-- 2)
    j := 0;
    FOR i IN (SELECT last_name FROM employees WHERE ROWNUM <= 10) LOOP
        j := j + 1;
        wlast_name(j) := i.last_name;
        DBMS_OUTPUT.PUT_LINE('Wlast_name(' || j ||') = ' || wlast_name(j) );
    END LOOP;
-- 3)
    FOR i IN (SELECT job_id,job_title FROM jobs) LOOP
        wjobs(i.job_id) := i.job_title;
        DBMS_OUTPUT.PUT_LINE('wjobs(' || i.job_id ||') = ' || wjobs(i.job_id) );
    END LOOP;
END;