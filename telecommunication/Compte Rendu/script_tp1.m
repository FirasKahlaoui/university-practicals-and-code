clear all;
clc;

%% 2. Definition des constants
R = 1.44;
L = 5.610 * 10^-4;
f = 7.2 * 10^-5;
J = 1.29 * 10^-4;
Kem = 0.1;

%% 3. Calcul de gain K et constants de temps
K = Kem / (R * f + Kem^2)
Tem = (R*J)/ (R*f + Kem ^ 2)
Tel = L / R

%% 4. Verification des valeurs des poles
G = tf([K], [Tel*Tem Tem+Tel 1])
pole(G)
1/Tel
1/Tem

%% 5. HELP commands

%% 6. Figures
figure(1)
subplot(121)
step(G)
grid on;

subplot(122)
bode(G)
grid on;

%% 7. Calcul de Kw et initialisation de Kp
Kw = 10 / 3000
Kp = 10;

%% 8. Définition des fonctions de transfert du système en boucle ouverte et en boucle fermée
Go = Kp * G * Kw
Gf = feedback(Kp * G, Kw)

%% 9. Tracer les figures
figure(2)
subplot(121)
step(Go)

subplot(122)
step(Gf)
