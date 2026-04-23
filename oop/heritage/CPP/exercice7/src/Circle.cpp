#include "Circle.hpp"

Circle::Circle(double x, double y, double rayon) : Point(x, y), rayon(rayon) {}

double Circle::surface() const
{
    return 3.14 * rayon * rayon;
}

void Circle::affiche() const
{
    std::cout << "Je suis un cercle de surface " << surface() << '\n';
}
