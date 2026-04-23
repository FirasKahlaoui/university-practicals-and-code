public class App {
    public static void main(String[] args) throws Exception {
        int n = (args.length > 0) ? Integer.parseInt(args[0]) : 1;
        Point forme = switch (n) {
            case 1 -> new Point(1, 2);
            case 2 -> new Circle(5, 2, 3);
            case 3 -> new Cylinder(5, 2, 3, 10);
            default -> new Point(0, 0);
        };
        forme.affiche();
        }
}
