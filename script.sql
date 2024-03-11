DROP TABLE BIB_DetailsEmprunts;
DROP TABLE BIB_Emprunts;
DROP TABLE BIB_Membres;
DROP TABLE BIB_Exemplaires;
DROP TABLE BIB_Ouvrages;
DROP TABLE BIB_Genres;

CREATE TABLE BIB_Genres (
    Code CHAR(5) PRIMARY KEY NOT NULL,
    libelle VARCHAR2(80) NOT NULL
);

CREATE TABLE BIB_Ouvrages (
    isbn NUMBER(10) PRIMARY KEY NOT NULL,
    titre VARCHAR2(200) NOT NULL,
    auteur VARCHAR2(80),
    genre CHAR(5) REFERENCES BIB_Genres(Code) NOT NULL,
    editeur VARCHAR2(80)
);

CREATE TABLE BIB_Exemplaires (
    isbn NUMBER(10) NOT NULL,
    numero NUMBER(3) NOT NULL,
    etat CHAR(2) CHECK (etat IN ('NE', 'BO', 'MO', 'MA')) NOT NULL,
    PRIMARY KEY (isbn, numero),
    FOREIGN KEY (isbn) REFERENCES BIB_Ouvrages(isbn)
);

CREATE TABLE BIB_Membres (
    numero NUMBER(6) PRIMARY KEY NOT NULL,
    nom VARCHAR2(80) NOT NULL,
    prenom VARCHAR2(80) NOT NULL,
    adresse VARCHAR2(200) NOT NULL,
    telephone CHAR(10) NOT NULL,
    adhesion DATE NOT NULL,
    duree NUMBER(2) CHECK (duree > 0) NOT NULL
);

CREATE TABLE BIB_Emprunts (
    numero NUMBER(10) PRIMARY KEY NOT NULL,
    membre NUMBER(6) REFERENCES BIB_Membres(numero) NOT NULL,
    creele DATE DEFAULT SYSDATE NOT NULL
);

CREATE TABLE BIB_DetailsEmprunts (
    emprunt NUMBER(10) NOT NULL,
    numero NUMBER(3) NOT NULL,
    isbn NUMBER(10) NOT NULL,
    exemplaire NUMBER(3) NOT NULL,
    rendule DATE NOT NULL,
    PRIMARY KEY (emprunt, numero),
    FOREIGN KEY (emprunt) REFERENCES BIB_Emprunts(numero),
    FOREIGN KEY (isbn, exemplaire) REFERENCES BIB_Exemplaires(isbn, numero)
);
