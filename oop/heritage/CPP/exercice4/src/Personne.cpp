#include "Personne.hpp"

Personne::Personne() = default;

Personne::Personne(const std::string& prenom) : prenom(prenom) {}

void Personne::affiche() const {
    std::cout << "\nJe suis " << prenom;
}
