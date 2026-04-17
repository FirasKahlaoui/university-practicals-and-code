R= 1.44;
L= 5.61*10^(-4);
J=1.29*10^(-4);
f= 7.2*10^(-5);
Kem= 0.10;

K= (Kem)/(R*f+Kem^2);
Zem=(R*J)/(R*f+Kem^2);
Zel= L/R;

G=tf([K],[Zel*Zem Zel+Zem 1]);

subplot(1,2,1);
step(G);
bode(G);
