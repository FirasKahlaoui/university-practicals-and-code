package com.java.project0;

public class TestPoint {
    public static void main(String[] args) {
        Point p1 = new Point('A', 3, 4);
        Point p2 = new Point();

        p1.affiche();
        p2.affiche();

        p1.translation(2, -1);
        p1.affiche();

        System.out.println(p1.distance(p2));

        Point m = p1.milieu(p2);
        m.affiche();

        Point s = p1.symetrique();
        s.affiche();

        System.out.println(p1.comparer(p2));

        Cercle c1 = new Cercle();
        Cercle c2 = new Cercle(5, p1);
        c1.Display();
        c2.Display();
        c1.setRayon(4);
        double r1 = c1.getRayon();
        System.out.println(r1);
        Point p = c1.getCenter();
        p.affiche();
        System.out.println();
        double surface = c1.surface();
        System.out.println("Surface of c1 = "+ surface);
        double per = c1.perimetre();
        System.out.println("Preimetre of c1 = "+ per);

        System.out.println(c1.comparer(c2));

        c1.agrandir(3);
        c1.Display();


    }
}