#ifndef PERSONNE_HPP
#define PERSONNE_HPP

#include <iostream>
#include <string>

class Personne {
public:
    std::string prenom;

    Personne();
    explicit Personne(const std::string& prenom);
    virtual ~Personne() = default;

    virtual void affiche() const;
};

#endif
