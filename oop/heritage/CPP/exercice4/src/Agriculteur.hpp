#ifndef AGRICULTEUR_HPP
#define AGRICULTEUR_HPP

#include "Personne.hpp"

class Agriculteur : public Personne {
private:
    std::string metier;

public:
    Agriculteur();
    explicit Agriculteur(const std::string& prenom);

    void affiche() const override;
};

#endif
