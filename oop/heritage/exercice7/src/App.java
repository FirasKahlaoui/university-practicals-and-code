public class App {
    public static void main(String[] args) throws Exception {
        int n = (args.length > 0) ? Integer.parseInt(args[0]) : 1;
        Point forme = null;
        
        switch(n) {
            case 1:
                forme = new Point(1, 2);
                break;
            case 2:
                
                forme = new Circle(5, 2, 3);
                break;
            case 3:
                
                forme = new Cylinder(5, 2, 3, 10);
                break;
            default:
                forme = new Point(0, 0);
            }
            forme.affiche();
        }
}
