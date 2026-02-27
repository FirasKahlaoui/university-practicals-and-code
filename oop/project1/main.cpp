#include <iostream>

#include "Circle.h"
#include "Point.h"

int main() {
    Point p1('A', 3, 4);
    Point p2;

    p1.display();
    p2.display();

    p1.translate(2, -1);
    p1.display();

    std::cout << p1.distance(p2) << std::endl;

    Point m = p1.midpoint(p2);
    m.display();

    Point s = p1.symmetric();
    s.display();

    std::cout << p1.compare(p2) << std::endl;

    Circle c1;
    Circle c2(5, p1);

    c1.display();
    c2.display();

    c1.setRadius(4);
    double r1 = c1.getRadius();
    std::cout << r1 << std::endl;

    Point p = c1.getCenter();
    p.display();

    std::cout << std::endl;
    double surface = c1.area();
    std::cout << "Surface of c1 = " << surface << std::endl;

    double per = c1.perimeter();
    std::cout << "Perimeter of c1 = " << per << std::endl;

    std::cout << c1.compare(c2) << std::endl;

    c1.enlarge(3);
    c1.display();

    return 0;
}
