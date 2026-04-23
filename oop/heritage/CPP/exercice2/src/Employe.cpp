#include "Employe.hpp"

Employe::Employe(const std::string& lastname, const std::string& firstname, double salary)
    : Person(lastname, firstname), salary(salary) {}

double Employe::getSalary() const {
    return salary;
}

void Employe::setSalary(double newSalary) {
    salary = newSalary;
}

std::string Employe::toString() const {
    return Person::toString() + "Employe [salary=" + std::to_string(salary) + "]";
}
