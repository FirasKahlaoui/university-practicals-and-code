# Correction

Définitions:

- Fonction 1: `template <class T, class U> void fct(T a, U b)`
- Fonction 2: `template <class T, class U> void fct(T* a, U b)`
- Fonction 3: `template <class T> void fct(T, T, T)`
- Fonction 4: `void fct(int a, float b)`

Déclarations:

- `int n, p, q;`
- `float x, y;`
- `double z;`

##

### Appel 1

`fct(n, p)` avec `(int, int)`

- Fonctions candidates valides: 1 et 4
- 1 est une correspondance exacte: `T=int, U=int`
- 4 demande une conversion `int -> float` sur le 2e argument

Fonction choisie: 1

Prototype instancié: `void fct(int, int)`

### Appel 2

`fct(x, y)` avec `(float, float)`

- Fonctions candidates valides: 1 et 4
- 1 est exacte: `T=float, U=float`
- 4 demande une conversion `float -> int` sur le 1er argument

Fonction choisie: 1

Prototype instancié: `void fct(float, float)`

### Appel 3

`fct(n, x)` avec `(int, float)`

- Fonctions candidates valides: 1 et 4
- 1 est exacte: `T=int, U=float`
- 4 est exacte aussi: `void fct(int, float)`
- À qualité égale, la fonction non template est préférée

Fonction choisie: 4

Prototype instancié: aucun (fonction non template)

### Appel 4

`fct(n, z)` avec `(int, double)`

- Fonctions candidates valides: 1 et 4
- 1 est exacte: `T=int, U=double`
- 4 demande une conversion `double -> float` sur le 2e argument

Fonction choisie: 1

Prototype instancié: `void fct(int, double)`

### Appel 5

`fct(&n, p)` avec `(int*, int)`

- Fonctions candidates valides: 1 et 2
- 1: `T=int*, U=int`
- 2: `T=int, U=int`
- Les deux sont exactes, mais 2 est plus spécialisée (elle impose un pointeur en 1er argument)

Fonction choisie: 2

Prototype instancié: `void fct(int*, int)`

### Appel 6

`fct(&n, x)` avec `(int*, float)`

- Fonctions candidates valides: 1 et 2
- 1: `T=int*, U=float`
- 2: `T=int, U=float`
- Les deux sont exactes, 2 est plus spécialisée

Fonction choisie: 2

Prototype instancié: `void fct(int*, float)`

### Appel 7

`fct(&n, &p, &q)` avec `(int*, int*, int*)`

- Seule la fonction 3 a 3 paramètres
- Déduction: `T=int*`

Fonction choisie: 3

Prototype instancié: `void fct(int*, int*, int*)`

## Résumé rapide

- Appel 1 -> fonction 1 -> `void fct(int, int)`
- Appel 2 -> fonction 1 -> `void fct(float, float)`
- Appel 3 -> fonction 4 -> non template
- Appel 4 -> fonction 1 -> `void fct(int, double)`
- Appel 5 -> fonction 2 -> `void fct(int*, int)`
- Appel 6 -> fonction 2 -> `void fct(int*, float)`
- Appel 7 -> fonction 3 -> `void fct(int*, int*, int*)`
