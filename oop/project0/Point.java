package com.java.project0;

public class Point {
    private char name;
    private double x;
    private double y;

    public Point() {
        this.name = 'O';
        this.x = 0;
        this.y = 0;
    }

    public Point(char name, double x, double y) {
        this.name = name;
        this.x = x;
        this.y = y;
    }

    public void affiche() {
        System.out.println(name + "(" + x + ", " + y + ")");
    }

    public void translation(double dx, double dy) {
        this.x += dx;
        this.y += dy;
    }

    public Point milieu(Point autre) {
        double mx = (this.x + autre.x) / 2;
        double my = (this.y + autre.y) / 2;
        return new Point('M', mx, my);
    }

    public Point symetrique() {
        return new Point('S', -this.x, -this.y);
    }

    public double distance(Point autre) {
        return Math.sqrt(Math.pow(autre.x - this.x, 2) + Math.pow(autre.y - this.y, 2));
    }

    public boolean comparer(Point autre) {
        return (this.x == autre.x && this.y == autre.y);
    }
}