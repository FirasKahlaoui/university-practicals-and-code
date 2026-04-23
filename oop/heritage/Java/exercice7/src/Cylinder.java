public class Cylinder extends Circle {
    protected double hauteur;

    public Cylinder(double x, double y, double rayon, double hauteur) {
        super(x, y, rayon);
        this.hauteur = hauteur;
    }

    @Override
    public double surface() {
        return 2 * (3.14 * rayon * rayon) + 2 * 3.14 * rayon * hauteur;
    }

    @Override
    public void affiche() {
        System.out.println("Je suis un cylindre de surface " + surface());
    }
}
