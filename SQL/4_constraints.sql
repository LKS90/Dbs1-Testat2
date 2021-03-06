/*
 * Fremdschluessel setzen
 * TODO: -ON DELETE CASCADE?
 *       -Additional Constraints?
 */

 ALTER TABLE ligazuteilungen
 ADD CONSTRAINT fk_club
 FOREIGN KEY (clubid) REFERENCES clubs (clubid);

 ALTER TABLE ligazuteilungen
 ADD CONSTRAINT fk_liga
 FOREIGN KEY (ligaid) REFERENCES ligen (ligaid);

 ALTER TABLE anstellungen
 ADD CONSTRAINT fk_clubEmployer
 FOREIGN KEY (clubId) REFERENCES clubs (clubid);

 ALTER TABLE anstellungen
 ADD CONSTRAINT fk_aEmployee
 FOREIGN KEY (angId) REFERENCES angestellten (angId);

 ALTER TABLE transfers
 ADD CONSTRAINT fk_tBuyer
 FOREIGN KEY (käufer) REFERENCES clubs (clubId);

 ALTER TABLE transfers
 ADD CONSTRAINT fk_tSeller
 FOREIGN KEY (verkäufer) REFERENCES clubs (clubId);

 ALTER TABLE transfers
 ADD CONSTRAINT fk_tEmployee
 FOREIGN KEY (transferierter) REFERENCES angestellten (angId);

 ALTER TABLE begegnungen
 ADD CONSTRAINT fk_gmHome
 FOREIGN KEY (heim) REFERENCES clubs (clubId);

 ALTER TABLE begegnungen
 ADD CONSTRAINT fk_gmAway
 FOREIGN KEY (gast) REFERENCES clubs (clubId);

 ALTER TABLE zuschauer
 ADD CONSTRAINT fk_vFavClub
 FOREIGN KEY (lieblingsverein) REFERENCES clubs (clubId) ON DELETE CASCADE;

 ALTER TABLE zuschauerverteilungen
 ADD CONSTRAINT fk_vdGame
 FOREIGN KEY (spiel) REFERENCES begegnungen (begegnungsId);

 ALTER TABLE zuschauerverteilungen
 ADD CONSTRAINT fk_vdVisitor
 FOREIGN KEY (besucher) REFERENCES zuschauer (zuschauerId);
 
 ALTER TABLE anstellungen
 ADD CONSTRAINT ck_date
 CHECK (vertragsbeginn < vertragsende);
 
 ALTER TABLE ligen
 ADD CONSTRAINT ck_date
 CHECK (saisonstart < saisonende);
