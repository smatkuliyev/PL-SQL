DELETE FROM resimler;
/
commit;
/
SELECT * FROM all_directories;
/
CREATE OR REPLACE PROCEDURE file_to_blob (
    p_dir       IN VARCHAR2,
    p_dosyaIsmi VARCHAR
                                            ) IS
    wfoto           BFILE;
    wtempdata       BLOB;
    wKaynakOffSet   PLS_INTEGER := 1;
    wHedefOffSet    PLS_INTEGER := 1;
BEGIN
    DBMS_LOB.CreateTemporary (wtempdata, TRUE);
    wfoto := BFILENAME (p_dir, p_dosyaIsmi);
    DBMS_LOB.FileOpen (wfoto, DBMS_LOB.FILE_READONLY);
    DBMS_LOB.LoadFromFile (wtempdata,
                          wfoto,
                          DBMS_LOB.LOBMAXSIZE,
                          wHedefOffSet,
                          wKaynakOffSet);

    INSERT INTO resimler (dosyaAdi, resim)
        VALUES (p_dosyaIsmi, wtempdata);

    COMMIT;

    DBMS_LOB.FileClose (wfoto);
END;
/
SELECT * FROM resimler;
/
EXECUTE file_to_blob('IMAGE_DIR', '4x5 Zaman.jpg');/
EXECUTE file_to_blob('IMAGE_DIR', '80637.JPG');/
EXECUTE file_to_blob('IMAGE_DIR', '84681.JPG');



