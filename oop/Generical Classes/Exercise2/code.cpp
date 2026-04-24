#include <iostream>

template <class T, class U>
void fct(T a, U b)
{
    (void)a;
    (void)b;
    std::cout << "fonction 1 : template <class T, class U> void fct(T a, U b)" << '\n';
}

template <class T, class U>
void fct(T *a, U b)
{
    (void)a;
    (void)b;
    std::cout << "fonction 2 : template <class T, class U> void fct(T* a, U b)" << '\n';
}

template <class T>
void fct(T a, T b, T c)
{
    (void)a;
    (void)b;
    (void)c;
    std::cout << "fonction 3 : template <class T> void fct(T, T, T)" << '\n';
}

void fct(int a, float b)
{
    (void)a;
    (void)b;
    std::cout << "fonction 4 : void fct(int a, float b)" << '\n';
}

int main()
{
    int n = 1, p = 2, q = 3;
    float x = 4.0f, y = 5.0f;
    double z = 6.0;

    std::cout << "appel 1: fct(n, p) -> ";
    fct(n, p);

    std::cout << "appel 2: fct(x, y) -> ";
    fct(x, y);

    std::cout << "appel 3: fct(n, x) -> ";
    fct(n, x);

    std::cout << "appel 4: fct(n, z) -> ";
    fct(n, z);

    std::cout << "appel 5: fct(&n, p) -> ";
    fct(&n, p);

    std::cout << "appel 6: fct(&n, x) -> ";
    fct(&n, x);

    std::cout << "appel 7: fct(&n, &p, &q) -> ";
    fct(&n, &p, &q);

    return 0;
}
