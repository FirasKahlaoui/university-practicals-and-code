#include "Professor.hpp"

Professor::Professor(const std::string& lastname, const std::string& firstname, double salary, const std::string& speciality)
    : Employe(lastname, firstname, salary), speciality(speciality) {}

const std::string& Professor::getSpeciality() const {
    return speciality;
}

void Professor::setSpeciality(const std::string& newSpeciality) {
    speciality = newSpeciality;
}

std::string Professor::toString() const {
    return Employe::toString() + "Professor [speciality=" + speciality + "]";
}
