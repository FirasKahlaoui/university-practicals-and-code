#include <memory>
#include <vector>

#include "Agriculteur.hpp"
#include "Forgeron.hpp"
#include "Menuisier.hpp"
#include "Personne.hpp"

int main()
{
    std::vector<std::shared_ptr<Personne>> personnes;
    personnes.push_back(std::make_shared<Personne>("Moez"));
    personnes.push_back(std::make_shared<Forgeron>("Ali"));
    personnes.push_back(std::make_shared<Menuisier>("Mohammed"));
    personnes.push_back(std::make_shared<Agriculteur>("Amor"));

    for (const auto &e : personnes)
    {
        e->affiche();
    }

    return 0;
}
