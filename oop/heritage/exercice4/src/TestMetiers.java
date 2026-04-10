

public class TestMetiers {
    public static void main(String[] args) {
        Personne[] personnes = new Personne[4];
        personnes[0] = new Personne("Moez");
        personnes[1] = new Forgeron("Ali");
        personnes[2] = new Menuisier("Mohammed");
        personnes[3] = new Agriculteur("Amor");
        for (Personne e : personnes)
            e.affiche();
    }
}
