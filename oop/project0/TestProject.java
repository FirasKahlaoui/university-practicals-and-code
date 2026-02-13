package com.java.project0;

public class TestProject {
    public static void main(String[] args) {
        Point p1 = new Point('A', 3, 4);
        Point p2 = new Point();

        p1.display();
        p2.display();

        p1.translate(2, -1);
        p1.display();

        System.out.println(p1.distance(p2));

        Point m = p1.midpoint(p2);
        m.display();

        Point s = p1.symmetric();
        s.display();

        System.out.println(p1.compare(p2));

        Circle c1 = new Circle();
        Circle c2 = new Circle(5, p1);
        
        c1.display();
        c2.display();
        
        c1.setRadius(4);
        double r1 = c1.getRadius();
        System.out.println(r1);
        
        Point p = c1.getCenter();
        p.display();
        
        System.out.println();
        double surface = c1.area();
        System.out.println("Surface of c1 = " + surface);
        
        double per = c1.perimeter();
        System.out.println("Perimeter of c1 = " + per);

        System.out.println(c1.compare(c2));

        c1.enlarge(3);
        c1.display();
    }
}