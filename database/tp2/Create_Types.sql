CREATE TYPE T_Salle AS OBJECT( 
             Numero VARCHAR(20), 
             Videoprojecteur CHAR(1)) 
NOT FINAL 
/

 CREATE TYPE T_Salle_cours UNDER T_Salle( 
             Capacite NUMBER(3),
             Retroprojecteur CHAR(1), 
             Micro CHAR(1)) 
/

 CREATE TYPE T_Salle_info UNDER T_Salle( 
             Nb_ordinateurs NUMBER(2), 
             OS VARCHAR(20)) 
/ 

CREATE TYPE T_Enseignement AS OBJECT( 
             Code VARCHAR(20),
             Effectif NUMBER(3),
             Videoprojecteur CHAR(1))
NOT FINAL 

/

CREATE TYPE T_CM UNDER T_Enseignement(
              Retroprojecteur CHAR(1))
 / 

CREATE TYPE T_TD UNDER T_Enseignement( 
              Sur_machine CHAR(1))
/

 CREATE TYPE T_Planning AS OBJECT( 
              Ref_salle REF T_Salle, 
              Ref_ens REF T_Enseignement, 
              Jour VARCHAR(10), 
                 Heure_debut NUMBER(4,1), 
                 Heure_fin NUMBER(4,1)) 
/



