

public class Forgeron extends Personne {
    private String metier;

    public Forgeron() {
        super();
    }

    public Forgeron(String prenom) {
        super(prenom);
        metier = "Forgeron";
    }

    @Override
    public void affiche() {
        super.affiche();
        System.out.print(" le " + this.metier);
    }
}
