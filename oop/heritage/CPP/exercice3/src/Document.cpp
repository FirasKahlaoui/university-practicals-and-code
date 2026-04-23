#include "Document.hpp"

Document::Document() : numEnregistrement(0), titre("") {}

Document::Document(int num, const std::string& titre) : numEnregistrement(num), titre(titre) {}

int Document::getNumEnregistrement() const {
    return numEnregistrement;
}

void Document::setNumEnregistrement(int newNumEnregistrement) {
    numEnregistrement = newNumEnregistrement;
}

const std::string& Document::getTitre() const {
    return titre;
}

void Document::setTitre(const std::string& newTitre) {
    titre = newTitre;
}

std::string Document::toString() const {
    return "Document [numEnregistrement=" + std::to_string(numEnregistrement) + ", titre=" + titre + "]";
}
