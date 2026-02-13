package com.java.project0;

public class Circle {
    private double radius;
    private Point center;
    private static final double PI = 3.14;

    public Circle() {
        this.radius = 1;
        this.center = new Point();
    }

    public Circle(double radiusValue, Point centerPoint) {
        this.radius = radiusValue;
        this.center = centerPoint;
    }

    public void display() {
        System.out.print("center: ");
        center.display();
        System.out.println("and radius: " + radius);
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public Point getCenter() {
        return center;
    }

    public double area() {
        return PI * radius * radius;
    }

    public double perimeter() {
        return 2 * PI * radius;
    }

    public boolean compare(Circle other) {
        return (this.radius == other.radius && this.center.compare(other.center));
    }

    public void enlarge(double value) {
        this.radius += value;
    }
}