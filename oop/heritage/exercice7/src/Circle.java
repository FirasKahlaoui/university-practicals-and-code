public class Circle extends Point {
    protected double rayon;

    public Circle(double x, double y, double rayon) {
        super(x, y);
        this.rayon = rayon;
    }

    public double surface() {
        return 3.14 * rayon * rayon;
    }

    @Override
    public void affiche() {
        System.out.println("Je suis un cercle de surface " + surface());
    }
}
