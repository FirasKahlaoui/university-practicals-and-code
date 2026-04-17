#include "point.h"

Point::Point(int px, int py) : x(px), y(py) {}

void Point::afficher()
{
    cout << "x = " << x << " et y = " << y << endl;
}

Point &operator++(Point &p)
{
    p.x++;
    p.y++;
    return p;
}

Point &operator--(Point &p)
{
    p.x--;
    p.y--;
    return p;
}
