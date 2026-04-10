

public class Personne {
    public String prenom;

    public Personne() {
    }

    public Personne(String prenom) {
        this.prenom = prenom;
    }

    public void affiche() {
        System.out.println();
        System.out.print("Je suis " + prenom);
    }
}
