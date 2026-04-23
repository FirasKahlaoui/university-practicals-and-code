#include "Forgeron.hpp"

Forgeron::Forgeron() : Personne(), metier("") {}

Forgeron::Forgeron(const std::string &prenom) : Personne(prenom), metier("Forgeron") {}

void Forgeron::affiche() const
{
    Personne::affiche();
    std::cout << " le " << metier;
}
