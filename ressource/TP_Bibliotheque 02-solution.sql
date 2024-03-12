-- Etape 1
ALTER TABLE BIB_Membres
    ADD CONSTRAINT un_membres UNIQUE (nom, prenom, telephone);

-- Etape 2
ALTER TABLE BIB_Exemplaires
    MODIFY etat CHAR(2);
    
-- Etape 3
-- Il n'est pas possible de modifier la clause ON DELETE
--  => il faut détruire et recréer la contrainte
ALTER TABLE BIB_DetailsEmprunts 
    DROP CONSTRAINT fk_details_emprunts ;
ALTER TABLE BIB_DetailsEmprunts
    ADD CONSTRAINT fk_details_emprunts FOREIGN KEY (emprunt) REFERENCES BIB_Emprunts(numero)
                                        ON DELETE CASCADE ;
                                        
-- Etape 4
ALTER TABLE BIB_Exemplaires
    MODIFY etat DEFAULT 'NE';
    
-- Etape 5
RENAME BIB_DetailsEmprunts TO BIB_Details;


-- Etape 6
CREATE INDEX ix_ouvrages_genres     ON BIB_Ouvrages(genre);
CREATE INDEX ix_exemplaires_isbn    ON BIB_Exemplaires(isbn);
CREATE INDEX ix_emprunts_membre     ON BIB_Emprunts(membre);
CREATE INDEX ix_details_emprunt     ON BIB_Details(emprunt);
CREATE INDEX ix_detials_exemplaires ON BIB_Details(isbn, exemplaire);



