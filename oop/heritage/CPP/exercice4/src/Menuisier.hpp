#ifndef MENUISIER_HPP
#define MENUISIER_HPP

#include "Personne.hpp"

class Menuisier : public Personne
{
private:
    std::string metier;

public:
    Menuisier();
    explicit Menuisier(const std::string &prenom);

    void affiche() const override;
};

#endif
