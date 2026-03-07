SELECT c.num,
    c.nom,
    SUM(f.qte) AS total_produits,
    AVG(f.qte) AS moyenne_par_facture
FROM Client c
    JOIN Facture f ON c.num = f.client_num
GROUP BY c.num,
    c.nom;
SELECT DISTINCT c.num,
    c.nom
FROM Client c
    JOIN Adresse a ON c.num = a.client_num
    JOIN Facture f ON c.num = f.client_num
WHERE a.ville = 'Compiegne'
    AND f.qte >= 2;
CREATE VIEW ClientR AS
SELECT c.num,
    c.nom,
    c.prenom,
    c.ddn,
    c.tel,
    c.genre,
    a.rue,
    a.cp,
    a.ville
FROM Client c
    JOIN Adresse a ON c.num = a.client_num;