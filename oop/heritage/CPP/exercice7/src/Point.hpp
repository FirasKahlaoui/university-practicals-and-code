#ifndef POINT_HPP
#define POINT_HPP

#include <iostream>

class Point
{
protected:
    double x;
    double y;

public:
    Point(double x, double y);
    virtual ~Point() = default;

    virtual void affiche() const;
};

#endif
