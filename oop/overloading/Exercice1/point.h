#ifndef POINT_H
#define POINT_H

#include <iostream>
using namespace std;

class Point
{
private:
    int x, y;

public:
    Point(int = 0, int = 0);
    void afficher();

    friend Point &operator++(Point &p);
    friend Point &operator--(Point &p);
};

#endif
