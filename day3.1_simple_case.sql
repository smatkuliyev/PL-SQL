-- SEARCHED CASE AND SIMPLE CASE

-- SIMPLE CASE
DECLARE
  SAYI  NUMBER := &sayi;
  POUT  VARCHAR2(2000);
BEGIN
  CASE MOD(SAYI, 2)
    WHEN 1 THEN pout := 'Odd number: ' ||sayi;
    ELSE        pout := 'Even number: ' ||sayi;   
  END CASE;
  DBMS_OUTPUT.PUT_LINE(pout);  
END;


-- SEARCHED CASE
DECLARE
  SAYI  NUMBER := &sayi;
  POUT  VARCHAR2(2000);
BEGIN
  CASE 
    WHEN MOD(SAYI, 2) = 1 THEN pout := 'Odd number: ' ||sayi;
    ELSE        pout := 'Even number: ' ||sayi;   
  END CASE;
  DBMS_OUTPUT.PUT_LINE(pout);  
END;