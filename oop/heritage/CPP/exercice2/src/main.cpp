#include <iostream>

#include "Employe.hpp"
#include "Etudiant.hpp"
#include "Professor.hpp"

int main() {
    Etudiant e1("Smith", "John", 123456);
    Etudiant e2("Brown", "Alice", 654321);
    Employe e3("Johnson", "Emily", 40000);
    Employe e4("Davis", "Michael", 45000);
    Professor p1("Doe", "Jane", 50000, "Computer Science");
    Professor p2("Miller", "David", 55000, "Mathematics");

    std::cout << e1.toString() << '\n';
    std::cout << e2.toString() << '\n';
    std::cout << e3.toString() << '\n';
    std::cout << e4.toString() << '\n';
    std::cout << p1.toString() << '\n';
    std::cout << p2.toString() << '\n';

    return 0;
}
