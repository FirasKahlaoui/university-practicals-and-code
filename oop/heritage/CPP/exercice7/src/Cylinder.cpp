#include "Cylinder.hpp"

Cylinder::Cylinder(double x, double y, double rayon, double hauteur)
    : Circle(x, y, rayon), hauteur(hauteur) {}

double Cylinder::surface() const
{
    return 2 * (3.14 * rayon * rayon) + 2 * 3.14 * rayon * hauteur;
}

void Cylinder::affiche() const
{
    std::cout << "Je suis un cylindre de surface " << surface() << '\n';
}
