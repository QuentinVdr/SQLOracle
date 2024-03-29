/*
Mise en place du schema GESTION DE BIBLIOTHEQUE
*/

DROP TABLE BIB_DETAILS;

DROP TABLE BIB_EXEMPLAIRES;

DROP TABLE BIB_OUVRAGES;

DROP TABLE BIB_GENRES;

DROP TABLE BIB_EMPRUNTS;

DROP TABLE BIB_MEMBRES;

CREATE TABLE BIB_GENRES (
    CODE CHAR(5) CONSTRAINT PK_GENRES PRIMARY KEY, -- deja NOT NULL car clef primaire
    LIBELLE VARCHAR2(80) CONSTRAINT NN_LIBELLE NOT NULL
);

-- BIB_Ouvrages
CREATE TABLE BIB_OUVRAGES (
    ISBN NUMBER(10) CONSTRAINT PK_OUVRAGES PRIMARY KEY,
    TITRE VARCHAR2(200) CONSTRAINT NN_TITRE NOT NULL,
    AUTEUR VARCHAR2(80) NULL,
    GENRE CHAR(5) NOT NULL CONSTRAINT FK_GENRES REFERENCES BIB_GENRES(CODE),
    EDITEUR VARCHAR2(80) NULL
);

CREATE TABLE BIB_EXEMPLAIRES (
    ISBN NUMBER(10), -- NOT NULL car participe a la clef primaire
    NUMERO NUMBER(3) GENERATED BY DEFAULT AS IDENTITY, -- NOT NULL car participe a la clef primaire
    ETAT CHAR(2) DEFAULT 'NE' CONSTRAINT NN_ETAT NOT NULL,
    CONSTRAINT PK_EXEMPLAIRES PRIMARY KEY(ISBN, NUMERO),
    CONSTRAINT FK_EXEMPLAIRES_OUVRAGES FOREIGN KEY(ISBN) REFERENCES BIB_OUVRAGES(ISBN),
    CONSTRAINT CK_EXEMPLAIRES_ETAT CHECK (ETAT IN('NE', 'BO', 'MO', 'MA'))
);

CREATE TABLE BIB_MEMBRES (
    NUMERO NUMBER(6) GENERATED BY DEFAULT AS IDENTITY CONSTRAINT PK_MEMBRES PRIMARY KEY,
    NOM VARCHAR2(80) NOT NULL,
    PRENOM VARCHAR2(80) CONSTRAINT NN_PRENOM NOT NULL,
    ADRESSE VARCHAR2(200)CONSTRAINT NN_ADRESSE NOT NULL,
    TELEPHONE CHAR(10) CONSTRAINT NN_TELEPHONE NOT NULL,
    ADHESION DATE CONSTRAINT NN_ADHESION NOT NULL,
    DUREE NUMBER(2) CONSTRAINT NN_DUREE NOT NULL,
    CONSTRAINT CK_MEMBRES_DUREE CHECK (DUREE >= 0),
    CONSTRAINT UN_MEMBRES UNIQUE (NOM, PRENOM, TELEPHONE)
);

CREATE TABLE BIB_EMPRUNTS (
    NUMERO NUMBER(10) GENERATED BY DEFAULT AS IDENTITY CONSTRAINT PK_EMPRUNTS PRIMARY KEY,
    MEMBRE NUMBER(6) CONSTRAINT FK_EMPRUNTS_MEMBRES REFERENCES BIB_MEMBRES(NUMERO),
    CREELE DATE DEFAULT SYSDATE -- SYSDATE est la date actuelle
);

CREATE TABLE BIB_DETAILS (
    EMPRUNT NUMBER(10) CONSTRAINT FK_DETAILS_EMPRUNTS REFERENCES BIB_EMPRUNTS(NUMERO) ON DELETE CASCADE,
    NUMERO NUMBER(3),
    ISBN NUMBER(10),
    EXEMPLAIRE NUMBER(3),
    RENDULE DATE,
    CONSTRAINT PK_DETAILS_EMPRUNTS PRIMARY KEY (EMPRUNT, NUMERO),
    CONSTRAINT FK_DETAILS_EMPRUNTS_EXEMPLAIRES FOREIGN KEY(ISBN, EXEMPLAIRE) REFERENCES BIB_EXEMPLAIRES(ISBN, NUMERO)
);

CREATE INDEX IX_OUVRAGES_GENRES ON BIB_OUVRAGES(GENRE);

CREATE INDEX IX_EXEMPLAIRES_ISBN ON BIB_EXEMPLAIRES(ISBN);

CREATE INDEX IX_EMPRUNTS_MEMBRE ON BIB_EMPRUNTS(MEMBRE);

CREATE INDEX IX_DETAILS_EMPRUNT ON BIB_DETAILS(EMPRUNT);

CREATE INDEX IX_DETAILS_EXEMPLAIRES ON BIB_DETAILS(ISBN, EXEMPLAIRE);
