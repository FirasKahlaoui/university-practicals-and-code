package com.java.project0;

public class Cercle{
    private double rayon;
    private Point center;
    private static final double PI =3.14;

    public Cercle(){

        this.rayon = 1;
        this.center = new Point();
    }

    public Cercle(double rayon_value, Point center_point){

        this.rayon = rayon_value;
        this.center = center_point;
    }

    public void Display(){

        System.out.print("center :");
        center.affiche();
        System.out.println(" and rayon :" + rayon);
    }

    public double getRayon() {
        return rayon;
    }

    public void setRayon(double rayon) {
        this.rayon = rayon;
    }

    public Point getCenter() {
        return center;
    }

    public double surface() {
        return PI * rayon * rayon;
    }

    public double perimetre() {
        return 2 * PI * rayon;
    }

    public boolean comparer(Cercle autre) {
        return (this.rayon == autre.rayon && this.center.comparer(autre.center));
    }

    public void agrandir(double value) {
        this.rayon += value;
    }



}