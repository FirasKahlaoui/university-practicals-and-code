CREATE TABLE Salle_v2 OF T_Salle_v2 (
    PRIMARY KEY(Numero)
);

CREATE TABLE Enseignement_v2 OF T_Enseignement_v2 (
    PRIMARY KEY(Code)
);

CREATE TABLE Planning_v2 OF T_Planning_v2;
CREATE OR REPLACE TRIGGER Planning_v2_validation
BEFORE INSERT OR UPDATE ON Planning_v2
FOR EACH ROW
BEGIN
    IF :NEW.Ref_salle IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ref_salle cannot be NULL');
    END IF;
    IF :NEW.Ref_ens IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Ref_ens cannot be NULL');
    END IF;
END;
/