#include "Person.hpp"

int Person::nextId = 1;

Person::Person(const std::string& lastname, const std::string& firstname)
    : id(nextId++), lastname(lastname), firstname(firstname) {}

int Person::getId() const {
    return id;
}

const std::string& Person::getLastname() const {
    return lastname;
}

void Person::setLastname(const std::string& newLastname) {
    lastname = newLastname;
}

const std::string& Person::getFirstname() const {
    return firstname;
}

void Person::setFirstname(const std::string& newFirstname) {
    firstname = newFirstname;
}

std::string Person::toString() const {
    return "Person [Id=" + std::to_string(id) + ", lastname=" + lastname + ", firstname=" + firstname + "]";
}
