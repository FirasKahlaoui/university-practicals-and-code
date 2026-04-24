#include <iostream>

template <class T>
class point
{
    T x, y;

public:
    point(T abs, T ord) : x(abs), y(ord) {}

    void affiche();
};

template <class T>
void point<T>::affiche()
{
    std::cout << "Coordonnees : " << x << " " << y << "\n";
}

template <>
class point<char>
{
    char x, y;

public:
    point(char abs, char ord) : x(abs), y(ord) {}

    void affiche()
    {
        std::cout << "Coordonnees : " << static_cast<int>(x) << " " << static_cast<int>(y) << "\n";
    }
};

int main()
{
    point<char> p(60, 65);
    p.affiche();

    point<int> q(60, 65);
    q.affiche();

    return 0;
}
