clear all;
clc;

%% 1. Etude d'un moteur à courant continu
R = 1.44;
L = 5.610 * 10^-4;
J = 1.29 * 10^-4;
f = 7.2 * 10^-5;
Kem = 0.1;
K = Kem / (R * f + Kem^2);
Tem = (R*J)/ (R*f + Kem ^ 2);
Tel = L / R;
Kw = 10 / 3000;
Kp = 100;

%% 2. Asservissement un moteur à courant continu équipé d'un hacheur et un régulateur

Kf = 1.007;
Kh = 2.170;

Ra = 3.58;
L = 83.9;
Ke = 1.1;
f = 1.9e-3;
J = 0.411;

%%
Kf=1.007;
Kh=2.170;
Ra=3.58;
L=83.9;
Ke=1.1;
J = 0.411;
f = 1.9e-3;