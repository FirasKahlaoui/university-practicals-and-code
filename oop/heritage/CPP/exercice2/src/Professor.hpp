#ifndef PROFESSOR_HPP
#define PROFESSOR_HPP

#include "Employe.hpp"

class Professor : public Employe {
private:
    std::string speciality;

public:
    Professor(const std::string& lastname, const std::string& firstname, double salary, const std::string& speciality);

    const std::string& getSpeciality() const;
    void setSpeciality(const std::string& speciality);

    std::string toString() const override;
};

#endif
