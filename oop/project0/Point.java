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

    public void display() {
        System.out.println(name + "(" + x + ", " + y + ")");
    }

    public void translate(double dx, double dy) {
        this.x += dx;
        this.y += dy;
    }

    public Point midpoint(Point other) {
        double mx = (this.x + other.x) / 2;
        double my = (this.y + other.y) / 2;
        return new Point('M', mx, my);
    }

    public Point symmetric() {
        return new Point('S', -this.x, -this.y);
    }

    public double distance(Point other) {
        return Math.sqrt(Math.pow(other.x - this.x, 2) + Math.pow(other.y - this.y, 2));
    }

    public boolean compare(Point other) {
        return (this.x == other.x && this.y == other.y);
    }
}