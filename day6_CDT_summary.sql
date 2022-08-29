DECLARE
 -- TYPE t_nested IS TABLE OF VARCHAR2(30);
    
 -- TYPE t_varray IS VARRAY(5) OF NUMBER(17,2);
    
 -- TYPE t_assoc_array_num IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE t_assoc_array_str IS TABLE OF VARCHAR2(32) INDEX BY PLS_INTEGER;
    TYPE t_assoc_array_str2 IS TABLE OF VARCHAR2(32) INDEX BY VARCHAR2(64);
    
    ndt_var     t_nested;
    
    varr_var    t_varray;
    
    assoc_var1  t_assoc_array_num;
    assoc_var2  t_assoc_array_str;
    assoc_var3  t_assoc_array_str2;
BEGIN
    ndt_var     := t_nested('SQL', 'PL/SQL', 'DBA', 'APEX');
    varr_var    := t_varray(12.5, 2, 35.7, 40.01, 15.25);
    
    assoc_var1(99)  := 15;
    assoc_var1(8)   := 100;
    
    assoc_var2(40)  := 'KIRSHEHIR';
    assoc_var2(06)  := 'ANKARA';
    
    assoc_var3('Ankara')  := 'Ic Anadolu';

END;