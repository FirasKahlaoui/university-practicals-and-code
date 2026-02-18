CREATE TYPE T_Salle_v2 AS OBJECT( 
    Numero VARCHAR(20), 
    Videoprojecteur CHAR(1)) 
NOT FINAL 
/

CREATE TYPE T_Salle_cours_v2 UNDER T_Salle_v2( 
    Capacite NUMBER(3),
    Retroprojecteur CHAR(1), 
    Micro CHAR(1)) 
/

CREATE TYPE T_Salle_info_v2 UNDER T_Salle_v2( 
    Nb_ordinateurs NUMBER(2), 
    OS VARCHAR(20)) 
/ 

CREATE TYPE T_Enseignement_v2 AS OBJECT( 
    Code VARCHAR(20),
    Effectif NUMBER(3),
    Videoprojecteur CHAR(1))
NOT FINAL 
/

CREATE TYPE T_CM_v2 UNDER T_Enseignement_v2(
    Retroprojecteur CHAR(1))
/ 

CREATE TYPE T_TD_v2 UNDER T_Enseignement_v2( 
    Sur_machine CHAR(1))
/

CREATE TYPE T_Planning_v2 AS OBJECT( 
    Ref_salle REF T_Salle_v2, 
    Ref_ens REF T_Enseignement_v2, 
    Jour VARCHAR(10), 
    Heure_debut NUMBER(4,1), 
    Heure_fin NUMBER(4,1)) 
/
