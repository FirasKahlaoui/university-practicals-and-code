#include "Point.hpp"

Point::Point(double x, double y) : x(x), y(y) {}

void Point::affiche() const
{
    std::cout << "Je suis un point de coordonnee " << x << " ," << y << '\n';
}
