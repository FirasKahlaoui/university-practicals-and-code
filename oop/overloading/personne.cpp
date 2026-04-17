#include "personne.h"

Personne::Personne(string n, int a) : nom(n), age(a) {}

void Personne::afficher() const
{
    cout << "Le nom de la personne est :" << nom << endl;
    cout << "L'age de la personne est :" << age << endl;
}

Personne &Personne::operator=(const Personne &other)
{
    if (this != &other)
    {
        nom = other.nom;
        age = other.age;
    }
    return *this;
}
