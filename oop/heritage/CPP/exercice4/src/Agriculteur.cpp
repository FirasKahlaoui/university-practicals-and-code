#include "Agriculteur.hpp"

Agriculteur::Agriculteur() : Personne(), metier("") {}

Agriculteur::Agriculteur(const std::string &prenom) : Personne(prenom), metier("Agriculteur") {}

void Agriculteur::affiche() const
{
    Personne::affiche();
    std::cout << " le " << metier;
}
