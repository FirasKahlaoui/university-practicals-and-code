#include <iostream>
#include <string>

template <typename TCoord, typename TCouleur>
class pointcol
{
private:
    TCoord x;
    TCoord y;
    TCouleur couleur;

public:
    pointcol(TCoord abs, TCoord ord, TCouleur col) : x(abs), y(ord), couleur(col) {}

    void affiche() const
    {
        std::cout << "Point(" << x << ", " << y << ") - Couleur: " << couleur << '\n';
    }
};

int main()
{
    pointcol<int, std::string> p1(2, 5, "rouge");
    pointcol<double, char> p2(3.5, 7.2, 'V');

    p1.affiche();
    p2.affiche();

    return 0;
}
