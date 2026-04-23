#ifndef ETUDIANT_HPP
#define ETUDIANT_HPP

#include "Person.hpp"

class Etudiant : public Person {
private:
    long long numCard;

public:
    Etudiant(const std::string& lastname, const std::string& firstname, long long numCard);

    long long getNumCard() const;
    void setNumCard(long long numCard);

    std::string toString() const override;
};

#endif
