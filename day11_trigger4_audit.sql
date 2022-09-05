-- TRIGGER, LOGON-LOGOFF

CREATE TABLE logon_logoff_audit(
                                userName    VARCHAR2(30),
                                sessId      NUMBER(10),
                                logonTime   DATE,
                                logoffTime  DATE,
                                hostName    VARCHAR2(20),
                                IP          VARCHAR2(15)
                                );

/

CREATE OR REPLACE TRIGGER logon_audit_trg
AFTER LOGON ON DATABASE
BEGIN
    INSERT INTO logon_logoff_audit(userName, sessId, logonTime, logoffTime, hostName, IP) 
            VALUES (
                USER, sys_context('userenv', 'sessionid'), 
                sysdate, null, 
                sys_context('userenv', 'host'),
                sys_context('userenv', 'IP_ADDRESS')
                );
END;

/

CREATE OR REPLACE TRIGGER logoff_audit_trg
BEFORE LOGOFF ON DATABASE
BEGIN
    INSERT INTO logon_logoff_audit(userName, sessId, logonTime, logoffTime, hostName, IP) 
            VALUES (
                USER, sys_context('userenv', 'sessionid'), 
                null, sysdate, 
                sys_context('userenv', 'host'),
                sys_context('userenv', 'IP_ADDRESS')
                );
END;

/

SELECT * FROM logon_logoff_audit;