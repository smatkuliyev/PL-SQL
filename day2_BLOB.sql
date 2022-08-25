/* Formatted on 25/08/2022 12:19:24 (QP5 v5.252.13127.32867) */
CREATE TABLE resimler
(
   dosyaAdi   VARCHAR (100) PRIMARY KEY,
   resim      BLOB
);

DECLARE
   foto           BFILE;
   tempdata       BLOB;
   KaynakOffSet   PLS_INTEGER := 1;
   HedefOffSet    PLS_INTEGER := 1;
   dosyaIsmi      VARCHAR2 (30) := '84681.JPG';
BEGIN
   DBMS_LOB.CreateTemporary (tempdata, TRUE);
   foto := BFILENAME ('IMAGE_DIR', dosyaIsmi);
   DBMS_LOB.FileOpen (foto, DBMS_LOB.FILE_READONLY);
   DBMS_LOB.LoadFromFile (tempdata,
                          foto,
                          DBMS_LOB.LOBMAXSIZE,
                          HedefOffSet,
                          KaynakOffSet);

   INSERT INTO resimler (dosyaAdi, resim)
        VALUES (dosyaIsmi, tempdata);

   COMMIT;

   DBMS_LOB.FileClose (foto);
END;


SELECT * FROM resimler;





