#ifndef PERSON_HPP
#define PERSON_HPP

#include <string>

class Person {
private:
    static int nextId;
    const int id;

protected:
    std::string lastname;
    std::string firstname;

public:
    Person(const std::string& lastname, const std::string& firstname);
    virtual ~Person() = default;

    int getId() const;
    const std::string& getLastname() const;
    void setLastname(const std::string& lastname);
    const std::string& getFirstname() const;
    void setFirstname(const std::string& firstname);

    virtual std::string toString() const;
};

#endif
