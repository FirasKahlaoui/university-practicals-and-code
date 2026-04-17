#include "personne.h"

int main()
{
    Personne p1("Alex", 25);
    Personne p2("Bob", 30);

    cout << "****** Personne 1 ******" << endl;
    p1.afficher();

    cout << "****** Personne 2 ******" << endl;
    p2.afficher();

    p1 = p2;

    cout << "****** Aprés l'affectation ******" << endl;
    p1.afficher();

    return 0;
}
