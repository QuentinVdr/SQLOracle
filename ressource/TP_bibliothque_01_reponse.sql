-- Script réentrant, l'ordre de suppression doit prendre en compte les
-- dépendances entre les tables (dues aux clefs etrangeres)
DROP TABLE BIB_DETAILSEMPRUNTS;

DROP TABLE BIB_EXEMPLAIRES;

DROP TABLE BIB_OUVRAGES;

DROP TABLE BIB_GENRES;

DROP TABLE BIB_EMPRUNTS;

DROP TABLE BIB_MEMBRES;

/*
commentaires multi lignes
*/

CREATE TABLE BIB_GENRES (
  CODE CHAR(5) CONSTRAINT PK_GENRES PRIMARY KEY, -- contrainte de colonne
  LIBELLE VARCHAR2 (80) CONSTRAINT NN_GENRES_LIBELLE NOT NULL
);

CREATE TABLE BIB_OUVRAGES (
  ISBN NUMBER(10),
  TITRE VARCHAR2(200) NOT NULL,
  AUTEUR VARCHAR2(80) NULL,
  GENRE CHAR(5) NOT NULL CONSTRAINT FK_OVRAGES_GENRES REFERENCES BIB_GENRES(CODE), -- :/!\ pour déclarer une clef etrangere avec une syntaxe de contrainte de colonne, ne PAS mettre FOREIGN KEY (sous Oracle)
  EDITEUR VARCHAR2(80) NULL,
  CONSTRAINT PK_OUVRAGES PRIMARY KEY(ISBN) -- contrainte de table
 --, CONSTRAINT fk_ovrages_genres FOREIGN KEY(genre) REFERENCES BIB_Genres(code) -- avec une snaxe de contrainte de table , METTRE FOREIGN KEY
);

CREATE TABLE BIB_EXEMPLAIRES (
  ISBN NUMBER(10), -- pas beson de déclare NOT NULL car la colonne participe à une clef primaire
  NUMERO NUMBER(3) GENERATED ALWAYS AS IDENTITY, -- pas beson de déclare NOT NULL car la colonne participe à une clef primaire
  ETAT CHAR(2) NOT NULL
 -- CONSTRAINT ck_exemplaires_etat CHECK ( etat = 'NE' OR etat='MO')
  CONSTRAINT CK_EXEMPLAIRES_ETAT CHECK ( ETAT IN ('NE', 'BO', 'MO', 'MA') ),
  CONSTRAINT PK_EXEMPLAIRES PRIMARY KEY ( ISBN, NUMERO ),
  CONSTRAINT FK_EXEMPLAIRE_OUVRAGES FOREIGN KEY (ISBN) REFERENCES BIB_OUVRAGES (ISBN)
);

CREATE TABLE BIB_MEMBRES(
  NUMERO NUMBER(6) GENERATED ALWAYS AS IDENTITY CONSTRAINT PK_MEMBRES PRIMARY KEY,
  NOM VARCHAR2(80) NOT NULL,
  PRENOM VARCHAR2(80) CONSTRAINT NN_PRENOM NOT NULL,
  ADRESSE VARCHAR2(200)CONSTRAINT NN_ADRESSE NOT NULL,
  TELEPHONE CHAR(10) CONSTRAINT NN_TELEPHONE NOT NULL,
  ADHESION DATE CONSTRAINT NN_ADHESION NOT NULL,
  DUREE NUMBER(2) CONSTRAINT NN_DUREE NOT NULL,
  CONSTRAINT CK_MEMBRES_DUREE CHECK (DUREE >= 0)
);

CREATE TABLE BIB_EMPRUNTS(
  NUMERO NUMBER(10) GENERATED ALWAYS AS IDENTITY CONSTRAINT PK_EMPRUNTS PRIMARY KEY,
  MEMBRE NUMBER(6) CONSTRAINT FK_EMPRUNTS_MEMBRES REFERENCES BIB_MEMBRES(NUMERO),
  CREELE DATE DEFAULT SYSDATE -- SYSDATE est la date actuelle
);

CREATE TABLE BIB_DETAILSEMPRUNTS(
  EMPRUNT NUMBER(10) CONSTRAINT FK_DETAILS_EMPRUNTS REFERENCES BIB_EMPRUNTS(NUMERO),
  NUMERO NUMBER(3),
  ISBN NUMBER(10),
  EXEMPLAIRE NUMBER(3),
  RENDULE DATE,
  CONSTRAINT PK_DETAILS_EMPRUNTS PRIMARY KEY (EMPRUNT, NUMERO),
  CONSTRAINT FK_DETAILS_EMPRUNTS_EXEMPLAIRES FOREIGN KEY(ISBN, EXEMPLAIRE) REFERENCES BIB_EXEMPLAIRES(ISBN, NUMERO)
);
