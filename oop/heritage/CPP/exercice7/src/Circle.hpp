#ifndef CIRCLE_HPP
#define CIRCLE_HPP

#include "Point.hpp"

class Circle : public Point
{
protected:
    double rayon;

public:
    Circle(double x, double y, double rayon);

    virtual double surface() const;
    void affiche() const override;
};

#endif
