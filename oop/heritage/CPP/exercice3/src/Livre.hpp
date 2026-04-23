#ifndef LIVRE_HPP
#define LIVRE_HPP

#include "Document.hpp"

class Livre : public Document {
private:
    std::string auteur;
    int nbPages;

public:
    Livre();
    Livre(int num, const std::string& titre, const std::string& auteur, int nbPages);

    const std::string& getAuteur() const;
    void setAuteur(const std::string& auteur);

    int getNbPages() const;
    void setNbPages(int nbPages);

    std::string toString() const override;
};

#endif
