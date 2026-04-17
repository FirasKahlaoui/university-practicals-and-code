#include "point.h"

int main()
{
    Point p(3, 5);
    Point p1;

    cout << "**********Incrementation ***********" << endl;
    cout << "p : ";
    p.afficher();

    p1 = ++p;

    cout << "p1 : ";
    p1.afficher();

    cout << endl;
    cout << "**********Decrementation ***********" << endl;
    cout << "p1 : ";
    p1.afficher();

    --p1;

    cout << "p1 apres decrementation : ";
    p1.afficher();

    return 0;
}
