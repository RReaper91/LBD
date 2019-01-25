CREATE TABLE  "ACCOUNT" 
   (	"ACCID" VARCHAR2(25), 
	"USERNAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(16) NOT NULL ENABLE, 
	"ISCRIZIONE" DATE NOT NULL ENABLE, 
	"COGNOME" VARCHAR2(20) NOT NULL ENABLE, 
	"NOME" VARCHAR2(20) NOT NULL ENABLE, 
	"NASCITA" VARCHAR2(20) NOT NULL ENABLE, 
	"CITTAN" VARCHAR2(20), 
	"CITTAR" VARCHAR2(20), 
	"TELEFONO" VARCHAR2(10), 
	"MAIL" VARCHAR2(50), 

	 PRIMARY KEY ("ACCID") ENABLE,
	 CONSTRAINT "UQ_ACCOUNT" UNIQUE (USERNAME), 
	 CONSTRAINT "CK_ACCOUNT2" CHECK (USERNAME <> PASSWORD) ENABLE, 
	 CONSTRAINT "CK_ACCOUNT1" CHECK (REGEXP_LIKE(PASSWORD, '(.){8,16}')) ENABLE
   )

/

CREATE TABLE  "RICHIESTAAMICIZIA" 
   (	"ACC1" VARCHAR2(25) NOT NULL ENABLE, 
	"ACC2" VARCHAR2(25) NOT NULL ENABLE, 
	"ACCETTATO" NUMBER(1,0) DEFAULT NULL, 
	"DATARICHIESTA" DATE NOT NULL ENABLE, 
	 CONSTRAINT "UQ_RICHIESTA" UNIQUE ("ACC1", "ACC2") ENABLE, 
	 CONSTRAINT "CK_RICHIESTA1" CHECK (ACCETTATO IN(-1, 1, NULL)) ENABLE, 
	 CONSTRAINT "CK_RICHIESTA2" CHECK (ACC1 <> ACC2) ENABLE,
	CONSTRAINT "FK_RICHIESTA1" FOREIGN KEY ("ACC1") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_RICHIESTA2" FOREIGN KEY ("ACC2") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "AMICI" 
   (	"ACC1" VARCHAR2(25) NOT NULL ENABLE, 
	"ACC2" VARCHAR2(25) NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	 CONSTRAINT "UQ_AMICI" UNIQUE ("ACC1", "ACC2") ENABLE, 
	 CONSTRAINT "CK_AMICI" CHECK (ACC1 <> ACC2) ENABLE,
	CONSTRAINT "FK_AMICI1" FOREIGN KEY ("ACC1") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_AMICI2" FOREIGN KEY ("ACC2") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "MESSAGGIOPRIVATO" 
   (	"ID" VARCHAR2(25), 
	"DATA" DATE NOT NULL ENABLE, 
	"ORA" CHAR(5) NOT NULL ENABLE, 
	"TESTO" VARCHAR2(250), 
	"AUTORE" VARCHAR2(25), 
	PRIMARY KEY ("ID") ENABLE, 
	CONSTRAINT "FK_PRIVATO" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE SET NULL ENABLE
   ) 

/

CREATE TABLE  "DESTINAZMESSPRIVATO" 
   (	"MESSAGGIO" VARCHAR2(25) NOT NULL ENABLE, 
	"DESTINATARIO" VARCHAR2(25) NOT NULL ENABLE, 
	 CONSTRAINT "UQ_DESTINAZIONE" UNIQUE ("MESSAGGIO", "DESTINATARIO") ENABLE,
	CONSTRAINT "FK_DESTINAZIONE1" FOREIGN KEY ("MESSAGGIO") REFERENCES  "MESSAGGIOPRIVATO" ("ID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_DESTINAZIONE2" FOREIGN KEY ("DESTINATARIO") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "STATO" 
   (	"ID" VARCHAR2(25), 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	"ORA" CHAR(5) NOT NULL ENABLE, 
	"TESTO" VARCHAR2(250), 
	"DESTINATARIO" VARCHAR2(25) NOT NULL ENABLE, 
  PRIMARY KEY ("ID") ENABLE, 
	CONSTRAINT "FK_STATO1" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE, 
	CONSTRAINT "FK_STATO2" FOREIGN KEY ("DESTINATARIO") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   )

/

CREATE TABLE  "COMMENTOSTATO" 
   (	"ID" VARCHAR2(25), 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	"STATO" VARCHAR2(25) NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	"ORA" CHAR(5) NOT NULL ENABLE, 
	"TESTO" VARCHAR2(250), 
	PRIMARY KEY ("ID") ENABLE, 
	CONSTRAINT "FK_CSTATO1" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE, 
	CONSTRAINT "FK_CSTATO2" FOREIGN KEY ("STATO") REFERENCES  "STATO" ("ID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "MIPIACESTATO" 
   (	"STATO" VARCHAR2(25) NOT NULL ENABLE, 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	 CONSTRAINT "UQ_MPSTATO" UNIQUE ("STATO", "AUTORE") ENABLE,
	CONSTRAINT "FK_MPSTATO1" FOREIGN KEY ("STATO") REFERENCES  "STATO" ("ID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_MPSTATO2" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   )

/

CREATE TABLE  "MIPIACECOMMSTATO" 
   (	"COMMENTOSTATO" VARCHAR2(25) NOT NULL ENABLE, 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	 CONSTRAINT "UQ_MPCOMMS" UNIQUE ("COMMENTOSTATO", "AUTORE") ENABLE,
	CONSTRAINT "FK_MPCOMMS1" FOREIGN KEY ("COMMENTOSTATO") REFERENCES  "COMMENTOSTATO" ("ID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_MPCOMMS2" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "GEF" 
   (	"ID" VARCHAR2(25), 
	"GRUPPO" NUMBER(1,0) NOT NULL ENABLE, 
	"EVENTO" NUMBER(1,0) NOT NULL ENABLE, 
	"FANPAGE" NUMBER(1,0) NOT NULL ENABLE, 
	"NOME" VARCHAR2(20) NOT NULL ENABLE, 
	"DESCRIZIONE" VARCHAR2(250), 
	"VISIBILITA" NUMBER(1,0) NOT NULL ENABLE, 
	"DOVE" VARCHAR2(20), 
	"DATAINIZIO" DATE, 
	"ORAINIZIO" CHAR(5), 
	"DATAFINE" DATE, 
	"ORAFINE" CHAR(5), 
	"POSTADMIN" NUMBER(1,0) NOT NULL ENABLE, 
	"COMMENTO" NUMBER(1,0), 
	 PRIMARY KEY ("ID") ENABLE, 
	 CONSTRAINT "CK_GEF4" CHECK (VISIBILITA IN (-1, 1)) ENABLE, 
	 CONSTRAINT "CK_GEF5" CHECK (POSTADMIN IN (-1, 1)) ENABLE, 
	 CONSTRAINT "CK_GEF6" CHECK (COMMENTO IN (-1, 1, NULL)) ENABLE, 
	 CONSTRAINT "CK_GEF1" CHECK ( GRUPPO IN(-1, 1) AND EVENTO IN(-1, 1) AND FANPAGE IN(-1, 1) AND ((GRUPPO=1 AND EVENTO=-1 AND FANPAGE=-1) OR (GRUPPO=-1 AND EVENTO=1 AND FANPAGE=-1) OR (GRUPPO=-1 AND EVENTO=-1 AND FANPAGE=1))) ENABLE
   ) 

/

CREATE TABLE  "MEMBRO" 
   (	"ACCOUNT" VARCHAR2(25) NOT NULL ENABLE, 
	"PAGINA" VARCHAR2(25) NOT NULL ENABLE, 
	"AMMINISTRATORE" NUMBER(1,0) NOT NULL ENABLE, 
	"NOTIFICA" NUMBER(1,0) NOT NULL ENABLE, 
	 CONSTRAINT "CK_MEMBRO1" CHECK (AMMINISTRATORE IN (-1, 1)) ENABLE, 
	 CONSTRAINT "CK_MEMBRO2" CHECK (NOTIFICA IN (-1, 1)) ENABLE,
	CONSTRAINT "FK_MEMBRO1" FOREIGN KEY ("ACCOUNT") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_MEMBRO2" FOREIGN KEY ("PAGINA") REFERENCES  "GEF" ("ID") ON DELETE CASCADE ENABLE
   )

/

CREATE TABLE  "POST" 
   (	"ID" VARCHAR2(25), 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	"ORA" CHAR(5) NOT NULL ENABLE, 
	"TESTO" VARCHAR2(250), 
	"PAGINA" VARCHAR2(25) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID") ENABLE, 
	CONSTRAINT "FK_POST1" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_POST2" FOREIGN KEY ("PAGINA") REFERENCES  "GEF" ("ID") ON DELETE CASCADE ENABLE
   )

/

CREATE TABLE  "COMMENTOPOST" 
   (	"ID" VARCHAR2(25), 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	"POST" VARCHAR2(25) NOT NULL ENABLE, 
	"DATA" DATE NOT NULL ENABLE, 
	"ORA" CHAR(5) NOT NULL ENABLE, 
	"TESTO" VARCHAR2(250), 
	 PRIMARY KEY ("ID") ENABLE, 
	CONSTRAINT "FK_CPOST1" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_CPOST2" FOREIGN KEY ("POST") REFERENCES  "POST" ("ID") ON DELETE CASCADE ENABLE
   ) 

/

CREATE TABLE  "MIPIACEPOST" 
   (	"POST" VARCHAR2(25) NOT NULL ENABLE, 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	 CONSTRAINT "UQ_MPPOST" UNIQUE ("POST", "AUTORE") ENABLE,
	CONSTRAINT "FK_MPPOST1" FOREIGN KEY ("POST") REFERENCES  "POST" ("ID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_MPPOST2" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   )

/

CREATE TABLE  "MIPIACECOMMPOST" 
   (	"COMMENTOPOST" VARCHAR2(25) NOT NULL ENABLE, 
	"AUTORE" VARCHAR2(25) NOT NULL ENABLE, 
	 CONSTRAINT "UQ_MPCOMMP" UNIQUE ("COMMENTOPOST", "AUTORE") ENABLE,
	CONSTRAINT "FK_MPCOMMP1" FOREIGN KEY ("COMMENTOPOST") REFERENCES  "COMMENTOPOST" ("ID") ON DELETE CASCADE ENABLE,
	CONSTRAINT "FK_MPCOMMP2" FOREIGN KEY ("AUTORE") REFERENCES  "ACCOUNT" ("ACCID") ON DELETE CASCADE ENABLE
   )

/

INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, CITTAN, MAIL) VALUES ('ABC1', 'ALESSANDRO', 'ALEROSSI', '01/03/2012', 'ROSSI', 'ALESSANDRO', '04/05/1985', 'MILANO', 'A.ROSSI@PROGETTO.COM');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, MAIL) VALUES ('ABC2', 'ALBERTO', 'ALBBIANCHI', '01/02/2012', 'BIANCHI', 'ALBERTO', '25/11/1983', 'A.BIANCHI@PROGETTO.COM');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, CITTAR) VALUES ('ABC3', 'ANDREA', 'ANDVERDI', '03/06/2009', 'VERDI', 'ANDREA', '03/06/1990', 'BARI');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, CITTAN, CITTAR, TELEFONO, MAIL) VALUES ('ABC4', 'TIZIANA', 'TIZVIOLA', '03/03/2013', 'VIOLA', 'TIZIANA', '24/12/1996', 'NAPOLI', 'NAPOLI', '8004123123', 'T.VIOLA@PROGETTO.COM');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, CITTAN, CITTAR) VALUES ('ABC5', 'UMBERTO', 'UMBNERI5', '12/09/2012', 'NERI', 'UMBERTO', '26/02/1979', 'ROMA', 'MILANO');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA) VALUES ('ABC6', 'FRANCESCA', 'FRARUSSO', '22/11/2011', 'RUSSO', 'FRANCESCA', '08/08/1989');
INSERT INTO ACCOUNT (ACCID, USERNAME, PASSWORD, ISCRIZIONE, COGNOME, NOME, NASCITA, CITTAN, CITTAR, MAIL) VALUES ('ABC7', 'LUIGI', 'LUIMORRONE', '05/02/2010', 'MORRONE', 'LUIGI', '15/08/1992', 'CATANIA', 'PALERMO', 'L.MORRONE@PROGETTO.COM');

INSERT INTO RICHIESTAAMICIZIA (ACC1, ACC2, DATARICHIESTA) VALUES ('ABC4', 'ABC2', '12/03/2013');
INSERT INTO RICHIESTAAMICIZIA (ACC1, ACC2, DATARICHIESTA) VALUES ('ABC4', 'ABC3', '08/01/2014');
INSERT INTO RICHIESTAAMICIZIA (ACC1, ACC2, DATARICHIESTA) VALUES ('ABC4', 'ABC5', '02/09/2013');
INSERT INTO RICHIESTAAMICIZIA (ACC1, ACC2, DATARICHIESTA) VALUES ('ABC4', 'ABC7', '23/11/2013');
INSERT INTO RICHIESTAAMICIZIA (ACC1, ACC2, DATARICHIESTA) VALUES ('ABC6', 'ABC4', '04/03/2013');

INSERT INTO AMICI (ACC1, ACC2, DATA) VALUES ('ABC1', 'ABC2', '01/04/2012');
INSERT INTO AMICI (ACC1, ACC2, DATA) VALUES ('ABC1', 'ABC4', '03/03/2013');
INSERT INTO AMICI (ACC1, ACC2, DATA) VALUES ('ABC3', 'ABC5', '20/09/2012');
INSERT INTO AMICI (ACC1, ACC2, DATA) VALUES ('ABC3', 'ABC6', '01/01/2012');
INSERT INTO AMICI (ACC1, ACC2, DATA) VALUES ('ABC3', 'ABC7', '15/06/2011');

INSERT INTO MESSAGGIOPRIVATO (ID, DATA, ORA, TESTO, AUTORE) VALUES ('MS1001', '28/08/2013', '14:15', 'CIAO, OGGI SONO FELICE', 'ABC1');
INSERT INTO MESSAGGIOPRIVATO (ID, DATA, ORA, TESTO, AUTORE) VALUES ('MS2005', '15/09/2013', '09:01', 'SI VA A SCUOLA', 'ABC4');
INSERT INTO MESSAGGIOPRIVATO (ID, DATA, ORA, TESTO, AUTORE) VALUES ('MS2006', '15/09/2013', '09:18', 'ARRIVATO!', 'ABC1');

INSERT INTO DESTINAZMESSPRIVATO (MESSAGGIO, DESTINATARIO) VALUES ('MS1001', 'ABC2');
INSERT INTO DESTINAZMESSPRIVATO (MESSAGGIO, DESTINATARIO) VALUES ('MS1001', 'ABC4');
INSERT INTO DESTINAZMESSPRIVATO (MESSAGGIO, DESTINATARIO) VALUES ('MS2005', 'ABC1');
INSERT INTO DESTINAZMESSPRIVATO (MESSAGGIO, DESTINATARIO) VALUES ('MS2006', 'ABC4');

INSERT INTO STATO (ID, AUTORE, DATA, ORA, TESTO, DESTINATARIO) VALUES ('ST7001', 'ABC7', '20/10/2013', '00:05', 'NON VEDO L ORA CHE ARRIVI DOMANI. NOTTE!', 'ABC7');

INSERT INTO COMMENTOSTATO (ID, AUTORE, STATO, DATA, ORA, TESTO) VALUES ('CS7001001', 'ABC3', 'ST7001', '20/10/2013', '00:07', 'BUONANOTTE');
INSERT INTO COMMENTOSTATO (ID, AUTORE, STATO, DATA, ORA, TESTO) VALUES ('CS7001002', 'ABC7', 'ST7001', '20/10/2013', '00:10', 'GRAZIE');

INSERT INTO MIPIACECOMMSTATO (COMMENTOSTATO, AUTORE) VALUES ('CS7001002', 'ABC3');

INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, DESCRIZIONE, VISIBILITA, POSTADMIN) VALUES ('GEF1', '1', '-1', '-1', 'INF_DB', 'GRUPPO PER LA CONDIVISIONE DELLE INFORMAZIONI TRA GLI STUDENTI DEL CORSO DI BASI DI DATI', '1', '-1');
INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, VISIBILITA, DOVE, DATAINIZIO, ORAINIZIO, DATAFINE, ORAFINE, POSTADMIN) VALUES ('GEF2', '-1', '1', '-1', 'ESAME_BD', '1', 'NAPOLI', '31/03/2014', '16:30', '31/03/2014', '18:30', '1');
INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, VISIBILITA, POSTADMIN, COMMENTO) VALUES ('GEF3', '-1', '-1', '1', 'RENATO ZERO', '1', '1', '1');
INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, VISIBILITA, POSTADMIN, COMMENTO) VALUES ('GEF4', '-1', '-1', '1', 'EMINEM', '-1', '-1', '1');
INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, DESCRIZIONE, VISIBILITA, POSTADMIN) VALUES ('GEF5', '1', '-1', '-1', 'INF_UNINA', 'COMUNITA DEGLI STUDENTI DI INFORMATICA DELLA FEDERICO II', '-1', '-1');
INSERT INTO GEF (ID, GRUPPO, EVENTO, FANPAGE, NOME, VISIBILITA, POSTADMIN, COMMENTO) VALUES ('GEF6', '-1', '-1', '1', 'QUEEN', '1', '-1', '-1');

INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC3', 'GEF5', '1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC4', 'GEF5', '-1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC6', 'GEF5', '-1', '-1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC7', 'GEF5', '1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC5', 'GEF2', '1', '-1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC3', 'GEF1', '1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC4', 'GEF3', '1', '-1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC7', 'GEF4', '1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC6', 'GEF6', '1', '1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC1', 'GEF6', '1', '-1');
INSERT INTO MEMBRO (ACCOUNT, PAGINA, AMMINISTRATORE, NOTIFICA) VALUES ('ABC5', 'GEF6', '-1', '1')

/

CREATE SEQUENCE "ACCOUNT_ID_SEQ"
MINVALUE 1 MAXVALUE 9999999999999999999999
INCREMENT BY 1 START WITH 8 CACHE 20

/

CREATE SEQUENCE "MESSAGGIOPRIVATO_ID_SEQ"
MINVALUE 1 MAXVALUE 99999999999999999999999
INCREMENT BY 1 START WITH 3015 CACHE 20

/

CREATE SEQUENCE "STATO_ID_SEQ"
MINVALUE 1 MAXVALUE 99999999999999999999999
INCREMENT BY 1 START WITH 7012 CACHE 20

/

CREATE SEQUENCE "COMMENTOSTATO_ID_SEQ"
MINVALUE 1 MAXVALUE 99999999999999999999999
INCREMENT BY 1 START WITH 7001003 CACHE 20

/

CREATE SEQUENCE "GEF_ID_SEQ"
MINVALUE 1 MAXVALUE 9999999999999999999999
INCREMENT BY 1 START WITH 7 CACHE 20

/

CREATE SEQUENCE "POST_ID_SEQ"
MINVALUE 1 MAXVALUE 99999999999999999999999
INCREMENT BY 1 START WITH 1 CACHE 20

/

CREATE SEQUENCE "COMMENTOPOST_ID_SEQ"
MINVALUE 1 MAXVALUE 99999999999999999999999
INCREMENT BY 1 START WITH 1 CACHE 20

/

CREATE OR REPLACE TRIGGER "TG_ACCOUNT_ID"
BEFORE INSERT ON "ACCOUNT" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT ACCOUNT_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ACCID := CONCAT('ABC', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_ACCOUNT_ISCRIZIONE"
BEFORE INSERT ON "ACCOUNT"
FOR EACH ROW

BEGIN
   :NEW.ISCRIZIONE := SYSDATE;
END;

/

CREATE OR REPLACE TRIGGER "TG_MESSAGGIOPRIVATO_ID"
BEFORE INSERT ON "MESSAGGIOPRIVATO" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT MESSAGGIOPRIVATO_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('MS', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_STATO_ID"
BEFORE INSERT ON "STATO" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT STATO_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('ST', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_COMMENTOSTATO_ID"
BEFORE INSERT ON "COMMENTOSTATO" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR(25);

BEGIN
   SELECT COMMENTOSTATO_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('CS', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_GEF_ID"
BEFORE INSERT ON "GEF" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT GEF_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('GEF', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_POST_ID"
BEFORE INSERT ON "POST" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT POST_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('PS', NUOVO_ID);
END;

/

CREATE OR REPLACE TRIGGER "TG_COMMENTOPOST_ID"
BEFORE INSERT ON "COMMENTOPOST" FOR EACH ROW
DECLARE NUOVO_ID VARCHAR2(25);

BEGIN
   SELECT COMMENTOPOST_ID_SEQ.NEXTVAL
   INTO NUOVO_ID
   FROM DUAL;
   :NEW.ID := CONCAT('CP', NUOVO_ID);
END;

/