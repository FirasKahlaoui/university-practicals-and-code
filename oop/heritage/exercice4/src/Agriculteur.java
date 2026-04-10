

public class Agriculteur extends Personne {
    private String metier;

    public Agriculteur() {
        super();
    }

    public Agriculteur(String prenom) {
        super(prenom);
        metier = "Agriculteur";
    }

    @Override
    public void affiche() {
        super.affiche();
        System.out.print(" le " + this.metier);
    }
}
