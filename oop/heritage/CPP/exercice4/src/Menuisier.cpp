#include "Menuisier.hpp"

Menuisier::Menuisier() : Personne(), metier("") {}

Menuisier::Menuisier(const std::string &prenom) : Personne(prenom), metier("Menuisier") {}

void Menuisier::affiche() const
{
    Personne::affiche();
    std::cout << " le " << metier;
}
