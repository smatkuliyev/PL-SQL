DECLARE
 -- CURSOR c_employees IS SELECT first_name FROM employees;
    CURSOR c_employees IS SELECT first_name,last_name FROM employees;
    
 -- TYPE ndt_list IS TABLE OF employees.first_name%TYPE;
    TYPE ndt_list IS TABLE OF c_employees%ROWTYPE;
    
    name_list ndt_list := ndt_list();
    
    counter INTEGER := 0;
BEGIN
    FOR n IN c_employees LOOP
        counter := counter + 1;
        name_list.EXTEND;
   --   name_list(counter) := n.first_name;
   --   DBMS_OUTPUT.PUT_LINE('Employees(' || counter || '): '|| name_list(counter));
        
        name_list(counter).first_name := n.first_name;
        name_list(counter).last_name := n.last_name;
        DBMS_OUTPUT.PUT_LINE('Employees(' || counter || '): '|| name_list(counter).first_name ||' '||name_list(counter).last_name);
    END LOOP;
END;