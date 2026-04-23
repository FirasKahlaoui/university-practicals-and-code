#include "Dictionnaire.hpp"

Dictionnaire::Dictionnaire() : Document(), langue(""), nbArticles(0) {}

Dictionnaire::Dictionnaire(int num, const std::string& titre, const std::string& langue, int nbArticles)
    : Document(num, titre), langue(langue), nbArticles(nbArticles) {}

const std::string& Dictionnaire::getLangue() const {
    return langue;
}

void Dictionnaire::setLangue(const std::string& newLangue) {
    langue = newLangue;
}

int Dictionnaire::getNbArticles() const {
    return nbArticles;
}

void Dictionnaire::setNbArticles(int newNbArticles) {
    nbArticles = newNbArticles;
}

std::string Dictionnaire::toString() const {
    return "Dictionnaire [langue=" + langue + ", nbArticles=" + std::to_string(nbArticles) + ", base=" + Document::toString() + "]";
}
