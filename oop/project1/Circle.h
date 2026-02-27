#ifndef CIRCLE_H
#define CIRCLE_H

#include "Point.h"

class Circle {
private:
    double radius;
    Point center;
    static constexpr double PI = 3.14;

public:
    Circle();
    Circle(double radiusValue, const Point& centerPoint);

    void display() const;
    double getRadius() const;
    void setRadius(double radius);
    Point getCenter() const;
    double area() const;
    double perimeter() const;
    bool compare(const Circle& other) const;
    void enlarge(double value);
};

#endif
