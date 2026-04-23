#include "Etudiant.hpp"

Etudiant::Etudiant(const std::string& lastname, const std::string& firstname, long long numCard)
    : Person(lastname, firstname), numCard(numCard) {}

long long Etudiant::getNumCard() const {
    return numCard;
}

void Etudiant::setNumCard(long long newNumCard) {
    numCard = newNumCard;
}

std::string Etudiant::toString() const {
    return Person::toString() + "Etudiant [num_card=" + std::to_string(numCard) + "]";
}
