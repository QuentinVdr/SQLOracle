
INSERT INTO BIB_Genres(code, libelle) VALUES('BD' ,'Bande dessinee');
INSERT INTO BIB_Genres(code, libelle) VALUES('REC','Recit');
INSERT INTO BIB_Genres(code, libelle) VALUES('POL','Policier');
INSERT INTO BIB_Genres(code, libelle) VALUES('INF','Informatique');
INSERT INTO BIB_Genres(code, libelle) VALUES('THE','Théâtre');
INSERT INTO BIB_Genres(code, libelle) VALUES('ROM','Roman');

INSERT INTO BIB_Ouvrages (isbn, titre, auteur, genre, editeur) 
VALUES (2203314168, 'LEFRANC-L''ultimatum', 'Martin, Carin', 'BD', 'Casterman');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2746021285, 'HTML entraînez-vous pour maîtriser le code source', 'Luc Van Lancker', 'INF', 'ENI');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2266085816, 'Pantagruel', 'François RABELAIS', 'ROM', 'POCKET');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2266091611, 'Voyage au centre de la terre', 'Jules Verne', 'ROM', 'POCKET');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2253010219, 'Le crime de l''Orient Express', 'Agatha Christie', 'POL', 'Livre de Poche');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2070400816, 'Le Bourgeois gentilhomme', 'Moliere', 'THE', 'Gallimard');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2070367177, 'Le curé de Tours', 'Honoré de Balzac', 'ROM', 'Gallimard');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2080720872, 'Boule de suif', 'Guy de Maupassant', 'REC', 'Flammarion');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2877065073, 'La gloire de mon père', 'Marcel Pagnol', 'ROM', 'Fallois');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2020549522, 'L''aventure des manuscrits de la mer morte ', default, 'REC', 'Seuil');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2253006327, 'Vingt mille lieues sous les mers ', 'Jules Verne', 'ROM', 'LGF');
INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) 
VALUES(2038704015, 'De la terre à la lune', 'Jules Verne', 'ROM', 'Larousse');

INSERT INTO BIB_Exemplaires(isbn, numero, etat) SELECT isbn, 1,'BO' FROM BIB_Ouvrages;
INSERT INTO BIB_Exemplaires(isbn, numero, etat) SELECT isbn, 2,'MO' FROM BIB_Ouvrages;
DELETE FROM BIB_Exemplaires WHERE isbn=2746021285 AND numero=2;
UPDATE BIB_Exemplaires SET etat='MO' WHERE isbn=2203314168 AND numero=1;
UPDATE BIB_Exemplaires SET etat='BO' WHERE isbn=2203314168 AND numero=2;
INSERT INTO BIB_Exemplaires(isbn, numero, etat) VALUES (2203314168,3,'NE');
INSERT INTO BIB_Exemplaires(isbn, numero, etat) VALUES (2203314168,4,'MA');
INSERT INTO BIB_Exemplaires(isbn, numero, etat) VALUES (2746021285,3,'MA');

INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(1, 'ALBERT', 'Anne', '13 rue des alpes', '0601020304', sysdate-60, 1);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(2, 'BERNAUD', 'Barnabé', '6 rue des bécasses', '0602030105', sysdate-10, 3);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(3, 'CUVARD', 'Camille', '52 rue des cerisiers', '0602010509', sysdate-100, 6);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(4, 'DUPOND', 'Daniel', '11 rue des daims', '0610236515', sysdate-250, 12);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(5, 'EVROUX', 'Eglantine', '34 rue des elfes', '0658963125', sysdate-150, 6);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(6, 'FREGEON', 'Fernand', '11 rue des Francs', '0602036987', sysdate-400, 6);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(7, 'GORIT', 'Gaston', '96 rue de la glacerie ', '0684235781', sysdate-150, 1);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(8, 'HEVARD', 'Hector', '12 rue haute', '0608546578', sysdate-250, 12);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(9, 'INGRAND', 'Irène', '54 rue des iris', '0605020409', sysdate-50, 12);
INSERT INTO BIB_Membres(numero, nom, prenom, adresse, telephone, adhesion, duree) VALUES(10, 'JUSTE', 'Julien', '5 place des Jacobins', '0603069876', sysdate-100, 6);

INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(1,1,sysdate-200);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(2,3,sysdate-190);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(3,4,sysdate-180);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(4,1,sysdate-170);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(5,5,sysdate-160);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(6,2,sysdate-150);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(7,4,sysdate-140);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(8,1,sysdate-130);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(9,9,sysdate-120);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(10,6,sysdate-110);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(11,1,sysdate-100);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(12,6,sysdate-90);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(13,2,sysdate-80);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(14,4,sysdate-70);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(15,1,sysdate-60);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(16,3,sysdate-50);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(17,1,sysdate-40);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(18,5,sysdate-30);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(19,4,sysdate-20);
INSERT INTO BIB_Emprunts(numero, membre, creele) VALUES(20,1,sysdate-10);

INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(1,1,2038704015,1,sysdate-195);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(1,2,2070367177,2,sysdate-190);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(2,1,2080720872,1,sysdate-180);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(2,2,2203314168,1,sysdate-179);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(3,1,2038704015,1,sysdate-170);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(4,1,2203314168,2,sysdate-155);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(4,2,2080720872,1,sysdate-155);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(4,3,2266085816,1,sysdate-159);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(5,1,2038704015,1,sysdate-140);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(6,1,2266085816,2,sysdate-141);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(6,2,2080720872,2,sysdate-130);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(6,3,2746021285,1,sysdate-133);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(7,1,2070367177,2,sysdate-100);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(8,1,2080720872,1,sysdate-116);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(9,1,2038704015,1,sysdate-100);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(10,1,2080720872,2,sysdate-107);
--INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(10,2,2746026090,1,sysdate-78);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(11,1,2746021285,1,sysdate-81);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(12,1,2203314168,1,sysdate-86);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(12,2,2038704015,1,sysdate-60);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(13,1,2070367177,1,sysdate-65);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(14,1,2266091611,1,sysdate-66);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(15,1,2070400816,1,sysdate-50);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(16,1,2253010219,2,sysdate-41);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(16,2,2070367177,2,sysdate-41);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(17,1,2877065073,2,sysdate-36);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(18,1,2070367177,1,sysdate-14);
--INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(19,1,2746026090,1,sysdate-12);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(20,1,2266091611,1,default);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(20,2,2253010219,1,default);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(7,2,2038704015,1,sysdate-136);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(8,2,2038704015,1,sysdate-127);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(11,2,2038704015,1,sysdate-95);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(15,2,2038704015,1,sysdate-54);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(16,3,2038704015,1,sysdate-43);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(17,2,2038704015,1,sysdate-36);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(18,2,2038704015,1,sysdate-24);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(19,2,2038704015,1,sysdate-13);
INSERT INTO BIB_Details(emprunt, numero, isbn, exemplaire, rendule) VALUES(20,3,2038704015,1,sysdate-3);

INSERT INTO BIB_Ouvrages(isbn, titre, auteur, genre, editeur) VALUES(2080703234, 'Cinq semaines en ballon', 'Jules Verne', 'ROM', 'Flammarion');

COMMIT;