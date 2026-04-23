#ifndef CYLINDER_HPP
#define CYLINDER_HPP

#include "Circle.hpp"

class Cylinder : public Circle
{
protected:
    double hauteur;

public:
    Cylinder(double x, double y, double rayon, double hauteur);

    double surface() const override;
    void affiche() const override;
};

#endif
