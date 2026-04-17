#ifndef PERSONNE_H
#define PERSONNE_H

#include <string>
#include <iostream>

using namespace std;

class Personne
{
private:
    string nom;
    int age;

public:
    Personne(string n = "", int a = 0);

    void afficher() const;

    Personne &operator=(const Personne &other);
};

#endif