public class Fabricant extends Employe {

    private int nbUnitesProduites;
    private int tauxCommiissionUnite;

    public Fabricant() {
        super();
        this.nbUnitesProduites = 0;
        this.tauxCommiissionUnite = 0;
    }

    public Fabricant(String name, int echelon, double base, double nbHeures, int nbUnitesProduites, int tauxCommiissionUnite) {
        super(name, echelon, base, nbHeures);
        this.nbUnitesProduites = nbUnitesProduites;
        this.tauxCommiissionUnite = tauxCommiissionUnite;
    }

    public void setNbUnitesProduites(int nbUnitesProduites) {
        this.nbUnitesProduites = nbUnitesProduites;
    }

    public int getNbUnitesProduites() {
        return this.nbUnitesProduites;
    }

    public void setTauxCommiissionUnite(int tauxCommiissionUnite) {
        this.tauxCommiissionUnite = tauxCommiissionUnite;
    }

    public int getTauxCommiissionUnite() {
        return this.tauxCommiissionUnite;
    }

    @Override
    public void afficher() {
        System.err.println(super.getName() + "Echelon : " + super.getEchelon() + " Base : " + super.getBase() + " Nombre d'heures : " + super.getNbHeure() + " Nombre d'unités produites : " + this.nbUnitesProduites + " Taux de commission par unité : " + this.tauxCommiissionUnite);
    }
}
