#ifndef EMPLOYE_HPP
#define EMPLOYE_HPP

#include "Person.hpp"

class Employe : public Person {
protected:
    double salary;

public:
    Employe(const std::string& lastname, const std::string& firstname, double salary);

    double getSalary() const;
    void setSalary(double salary);

    std::string toString() const override;
};

#endif
