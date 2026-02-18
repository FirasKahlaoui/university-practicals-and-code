CREATE TABLE Salle OF T_Salle(  
             CONSTRAINT Salle_pk PRIMARY KEY(Numero)); 
 
CREATE TABLE Enseignement OF T_Enseignement(  
             CONSTRAINT Ens_pk PRIMARY KEY(Code)); 
 
CREATE TABLE Planning OF T_Planning(         
CONSTRAINT Planning_ref_salle Ref_salle REFERENCES Salle,  
CONSTRAINT Planning_ref_salle_null CHECK (Ref_salle IS NOT NULL),  
CONSTRAINT Planning_ref_ens Ref_ens REFERENCES Enseignement,  
CONSTRAINT Planning_ref_ens_null CHECK (Ref_ens IS NOT NULL)); 