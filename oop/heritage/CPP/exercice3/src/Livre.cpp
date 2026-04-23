#include "Livre.hpp"

Livre::Livre() : Document(), auteur(""), nbPages(0) {}

Livre::Livre(int num, const std::string& titre, const std::string& auteur, int nbPages)
    : Document(num, titre), auteur(auteur), nbPages(nbPages) {}

const std::string& Livre::getAuteur() const {
    return auteur;
}

void Livre::setAuteur(const std::string& newAuteur) {
    auteur = newAuteur;
}

int Livre::getNbPages() const {
    return nbPages;
}

void Livre::setNbPages(int newNbPages) {
    nbPages = newNbPages;
}

std::string Livre::toString() const {
    return "Livre [auteur=" + auteur + ", nbPages=" + std::to_string(nbPages) + ", base=" + Document::toString() + "]";
}
