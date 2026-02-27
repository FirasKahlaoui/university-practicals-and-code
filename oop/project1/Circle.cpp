#include "Circle.h"

#include <iostream>

Circle::Circle() : radius(1), center(Point()) {}

Circle::Circle(double radiusValue, const Point& centerPoint)
    : radius(radiusValue), center(centerPoint) {}

void Circle::display() const {
    std::cout << "center: ";
    center.display();
    std::cout << "and radius: " << radius << std::endl;
}

double Circle::getRadius() const {
    return radius;
}

void Circle::setRadius(double radius) {
    this->radius = radius;
}

Point Circle::getCenter() const {
    return center;
}

double Circle::area() const {
    return PI * radius * radius;
}

double Circle::perimeter() const {
    return 2 * PI * radius;
}

bool Circle::compare(const Circle& other) const {
    return radius == other.radius && center.compare(other.center);
}

void Circle::enlarge(double value) {
    radius += value;
}
