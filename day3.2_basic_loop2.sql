CREATE TABLE KURSLAR (
                        KURS_ID     NUMBER(3),
                        KURS_ADI    VARCHAR2(50),
                        EGITMEN     VARCHAR2(50),
                        START_DATE  DATE,
                        END_DATE    DATE
                        );
/                        
SELECT * FROM KURSLAR;
/    
DELETE FROM KURSLAR;
/
commit;
/

DECLARE
  rec_kurs  KURSLAR%ROWTYPE;
BEGIN
  rec_kurs.egitmen       := 'SULAYMAN MATKULIYEV';
  rec_kurs.start_date    := TRUNC(SYSDATE);
  rec_kurs.end_date      := rec_kurs.start_date + 4;  
  LOOP
    rec_kurs.kurs_id      := NVL(rec_kurs.kurs_id, 0) + 1;    
    IF rec_kurs.kurs_id = 2 THEN CONTINUE; END IF;
    EXIT WHEN rec_kurs.kurs_id = 4;
    
    CASE rec_kurs.kurs_id
        WHEN 1 THEN rec_kurs.kurs_adi := 'Oracle SQL';
        WHEN 2 THEN rec_kurs.kurs_adi := 'PL/SQL';
        WHEN 3 THEN rec_kurs.kurs_adi := 'Oracle DBA';
    END CASE;    
 /* SELECT DECODE(rec_kurs.kurs_id, 1, 'Oracle SQL',
                                    2, 'PL/SQL',
                                    3, 'Oracle DBA')
    INTO rec_kurs.kurs_adi FROM DUAL; */    
    INSERT INTO KURSLAR(kurs_id,kurs_adi,egitmen,start_date,end_date) 
            VALUES(rec_kurs.kurs_id , rec_kurs.kurs_adi ,rec_kurs.egitmen , 
                    rec_kurs.start_date , rec_kurs.end_date);    
    rec_kurs.start_date    := rec_kurs.start_date + 1;
    rec_kurs.end_date      := rec_kurs.start_date + 4;   
  END LOOP;
  COMMIT;
END;
/