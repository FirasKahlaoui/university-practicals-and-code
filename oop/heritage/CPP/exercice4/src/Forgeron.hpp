#ifndef FORGERON_HPP
#define FORGERON_HPP

#include "Personne.hpp"

class Forgeron : public Personne
{
private:
    std::string metier;

public:
    Forgeron();
    explicit Forgeron(const std::string &prenom);

    void affiche() const override;
};

#endif
