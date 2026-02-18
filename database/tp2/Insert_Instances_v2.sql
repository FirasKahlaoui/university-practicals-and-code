INSERT INTO Salle_v2 VALUES(
    T_Salle_cours_v2('Amphi Cassin', 'O', 400, 'O', 'O'));

INSERT INTO Salle_v2 VALUES(
    T_Salle_cours_v2('L231', 'N', 80, 'N', 'N')); 

INSERT INTO Salle_v2 VALUES( 
    T_Salle_cours_v2('K188', 'N', 50, 'O', 'N')); 

INSERT INTO Salle_v2 VALUES( 
    T_Salle_info_v2('L219', 'O', 12, 'Windows'));

INSERT INTO Salle_v2 VALUES( 
    T_Salle_info_v2('K192', 'N', 12, 'Windows/Linux')); 

INSERT INTO Enseignement_v2 VALUES(
    T_Enseignement_v2('S0INFO', 500, 'N')); 

INSERT INTO Enseignement_v2 VALUES(
    T_CM_v2('S1BDPROGCM', 50, 'O', 'N')); 

INSERT INTO Enseignement_v2 VALUES( 
    T_CM_v2('S2BDACM', 25, 'O', 'N'));

INSERT INTO Enseignement_v2 VALUES( 
    T_TD_v2('S1BDPROGTD1', 50, 'O', 'N')); 

INSERT INTO Enseignement_v2 VALUES( 
    T_TD_v2('S1BDPROGTD2', 25, 'N', 'O')); 

INSERT INTO Enseignement_v2 VALUES( 
    T_TD_v2('S2BDATD', 25, 'N', 'N'));

INSERT INTO Planning_v2 VALUES(
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'L231'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S1BDPROGCM'),
    'Mardi', 8, 9.5);

INSERT INTO Planning_v2 VALUES( 
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'K188'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S2BDACM'), 
    'Mercredi', 8, 9.5);

INSERT INTO Planning_v2 VALUES( 
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'L231'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S2BDACM'),
    'Mercredi', 9.5, 11);

INSERT INTO Planning_v2 VALUES( 
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'Amphi Cassin'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S0INFO'), 
    'Lundi', 15, 16.5); 

INSERT INTO Planning_v2 VALUES( 
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'L231'),
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S1BDPROGTD1'),
    'Mardi', 9.5, 11); 

INSERT INTO Planning_v2 VALUES(
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'K192'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S1BDPROGTD2'),
    'Mardi', 15, 16.5); 

INSERT INTO Planning_v2 VALUES(
    (SELECT REF(s) FROM Salle_v2 s WHERE s.Numero = 'K192'), 
    (SELECT REF(e) FROM Enseignement_v2 e WHERE e.Code = 'S2BDATD'),
    'Jeudi', 9.5, 11);
