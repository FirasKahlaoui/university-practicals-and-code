INSERT INTO Salle VALUES(
      T_Salle_cours('Amphi Cassin', 'O', 400, 'O', 'O'));

INSERT INTO Salle VALUES(
      T_Salle_cours('L231', 'N', 80, 'N', 'N')); 

INSERT INTO Salle VALUES( 
      T_Salle_cours('K188', 'N', 50, 'O', 'N')); 

INSERT INTO Salle VALUES( 
      T_Salle_info('L219', 'O', 12, 'Windows'));

INSERT INTO Salle VALUES( 
      T_Salle_info('K192', 'N', 12, 'Windows/Linux')); 

INSERT INTO Enseignement VALUES(
       'S0INFO', 500, 'N'); 

INSERT INTO Enseignement VALUES(
        T_CM('S1BDPROGCM', 50, 'O', 'N')); 

INSERT INTO Enseignement VALUES( 
        T_CM('S2BDACM', 25, 'O', 'N'));
INSERT INTO Enseignement VALUES( 
               T_TD('S1BDPROGTD1', 50, 'O', 'N')); 

INSERT INTO Enseignement VALUES( 
               T_TD('S1BDPROGTD2', 25, 'N', 'O')); 

INSERT INTO Enseignement VALUES( 
               T_TD('S2BDATD', 25, 'N', 'N'));

INSERT INTO Planning VALUES(
             (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'), 
             (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGCM'),
               'Mardi', 8, 9.5);

INSERT INTO Planning VALUES( 
             (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K188'), 
             (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDACM'), 
               'Mercredi', 8, 9.5);

INSERT INTO Planning VALUES( 
              (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'), 
              (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDACM'),
               'Mercredi', 9.5, 11);

INSERT INTO Planning VALUES( 
               (SELECT REF(s) FROM Salle s WHERE s.Numero = 'Amphi Cassin'), 
               (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S0INFO'), 
                 'Lundi', 15, 16.5); 

INSERT INTO Planning VALUES( 
                (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'),
                (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGTD1'),
                 'Mardi', 9.5, 11); 

INSERT INTO Planning VALUES(
                (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K192'), 
                (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGTD2'),
                 'Mardi', 15, 16.5); 

INSERT INTO Planning VALUES(
                (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K192'), 
                (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDATD'),
                 'Jeudi', 9.5, 11);
