#include <iostream>
#include <string>
using namespace std;

class VoitureAutonome
{
private:
    string id;
    double position;
    double vitesse;
    double distanceTotale;
    double energie;

public:
    VoitureAutonome(string i = "", double p = 0, double v = 0, double d = 0, double e = 0)
        : id(i), position(p), vitesse(v), distanceTotale(d), energie(e) {}

    bool operator==(const VoitureAutonome &other) const
    {
        return position == other.position && vitesse == other.vitesse;
    }

    bool operator!=(const VoitureAutonome &other) const
    {
        return !(*this == other);
    }

    bool operator<(const VoitureAutonome &other) const
    {
        return vitesse < other.vitesse;
    }

    VoitureAutonome operator+(double distance) const
    {
        VoitureAutonome copie = *this;
        copie.distanceTotale += distance;
        return copie;
    }

    VoitureAutonome &operator++()
    {
        ++vitesse;
        return *this;
    }

    VoitureAutonome operator++(int)
    {
        VoitureAutonome temp = *this;
        ++(*this);
        return temp;
    }

    VoitureAutonome operator+(const VoitureAutonome &other) const
    {
        VoitureAutonome result = *this;
        result.energie += other.energie;
        return result;
    }

    VoitureAutonome operator-(const VoitureAutonome &other) const
    {
        VoitureAutonome result = *this;
        result.energie -= other.energie;
        return result;
    }

    VoitureAutonome &operator=(const VoitureAutonome &other)
    {
        if (this != &other)
        {
            id = other.id;
            position = other.position;
            vitesse = other.vitesse;
            distanceTotale = other.distanceTotale;
            energie = other.energie;
        }
        return *this;
    }

    friend ostream &operator<<(ostream &os, const VoitureAutonome &v)
    {
        os << "VoitureAutonome{id=" << v.id
           << ", position=" << v.position
           << ", vitesse=" << v.vitesse
           << ", distanceTotale=" << v.distanceTotale
           << ", energie=" << v.energie << "}";
        return os;
    }
};

int main()
{
    VoitureAutonome voiture1("VA-001", 10.0, 40.0, 120.0, 500.0);
    VoitureAutonome voiture2("VA-002", 12.0, 40.0, 80.0, 300.0);

    cout << "Voiture 1 : " << voiture1 << endl;
    cout << "Voiture 2 : " << voiture2 << endl;

    if (voiture1 == voiture2)
        cout << "Les deux voitures ont la meme position et la meme vitesse." << endl;
    else
        cout << "Les deux voitures sont differentes." << endl;

    cout << "voiture1 != voiture2 : " << (voiture1 != voiture2) << endl;
    cout << "voiture1 < voiture2 : " << (voiture1 < voiture2) << endl;

    voiture1 = voiture1 + 25.5;
    ++voiture1;
    voiture2++;

    VoitureAutonome energieTotale = voiture1 + voiture2;
    VoitureAutonome differenceEnergie = voiture1 - voiture2;

    cout << "Apres modifications :" << endl;
    cout << "Voiture 1 : " << voiture1 << endl;
    cout << "Voiture 2 : " << voiture2 << endl;
    cout << "Energie totale : " << energieTotale << endl;
    cout << "Difference d'energie : " << differenceEnergie << endl;

    VoitureAutonome copie = voiture1;
    cout << "Copie : " << copie << endl;

    return 0;
}