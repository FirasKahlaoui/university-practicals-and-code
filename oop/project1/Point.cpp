#include "Point.h"

#include <cmath>
#include <iostream>

Point::Point() : name('O'), x(0), y(0) {}

Point::Point(char name, double x, double y) : name(name), x(x), y(y) {}

void Point::display() const {
    std::cout << name << "(" << x << ", " << y << ")" << std::endl;
}

void Point::translate(double dx, double dy) {
    x += dx;
    y += dy;
}

Point Point::midpoint(const Point& other) const {
    double mx = (x + other.x) / 2;
    double my = (y + other.y) / 2;
    return Point('M', mx, my);
}

Point Point::symmetric() const {
    return Point('S', -x, -y);
}

double Point::distance(const Point& other) const {
    return std::sqrt(std::pow(other.x - x, 2) + std::pow(other.y - y, 2));
}

bool Point::compare(const Point& other) const {
    return x == other.x && y == other.y;
}
