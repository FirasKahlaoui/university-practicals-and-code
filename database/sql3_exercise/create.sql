CREATE TABLE Client (
    num INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    ddn DATE,
    tel VARCHAR(20),
    genre CHAR(1)
);

CREATE TABLE Adresse (
    num INT PRIMARY KEY,
    rue VARCHAR(100),
    cp INT,
    ville VARCHAR(50),
    client_num INT,
    FOREIGN KEY (client_num) REFERENCES Client(num)
);

CREATE TABLE Produit (
    num INT PRIMARY KEY,
    designation VARCHAR(100),
    prix FLOAT,
    stock INT
);

CREATE TABLE Facture (
    num INT,
    client_num INT,
    produit_num INT,
    qte INT,
    PRIMARY KEY (num, produit_num),
    FOREIGN KEY (client_num) REFERENCES Client(num),
    FOREIGN KEY (produit_num) REFERENCES Produit(num)
);