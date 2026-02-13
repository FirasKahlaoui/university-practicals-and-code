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
    }
}