#include <cstddef>
#include <iostream>
#include <string>

template <typename T, std::size_t N>
T sommeTableau(const T (&tab)[N])
{
    T somme{};
    for (std::size_t i = 0; i < N; ++i)
    {
        somme += tab[i];
    }
    return somme;
}

int main()
{
    int t1[] = {1, 2, 3, 4, 5};
    double t2[] = {1.5, 2.0, 3.25};
    std::string t3[] = {"Bonjour", " ", "tout", " ", "le", " ", "monde"};

    std::cout << "Somme t1 = " << sommeTableau(t1) << '\n';
    std::cout << "Somme t2 = " << sommeTableau(t2) << '\n';
    std::cout << "Somme t3 = " << sommeTableau(t3) << '\n';

    return 0;
}
