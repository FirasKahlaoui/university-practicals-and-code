#include <cstdlib>
#include <memory>

#include "Circle.hpp"
#include "Cylinder.hpp"
#include "Point.hpp"

int main(int argc, char *argv[])
{
    int n = (argc > 1) ? std::atoi(argv[1]) : 1;
    std::unique_ptr<Point> forme;

    switch (n)
    {
    case 1:
        forme = std::make_unique<Point>(1, 2);
        break;
    case 2:
        forme = std::make_unique<Circle>(5, 2, 3);
        break;
    case 3:
        forme = std::make_unique<Cylinder>(5, 2, 3, 10);
        break;
    default:
        forme = std::make_unique<Point>(0, 0);
        break;
    }

    forme->affiche();
    return 0;
}
