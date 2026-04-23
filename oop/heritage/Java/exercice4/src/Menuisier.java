

public class Menuisier extends Personne {
    private String metier;

    public Menuisier() {
        super();
    }

    public Menuisier(String prenom) {
        super(prenom);
        metier = "Menuisier";
    }

    @Override
    public void affiche() {
        super.affiche();
        System.out.print(" le " + this.metier);
    }
}
