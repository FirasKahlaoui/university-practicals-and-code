clear all;
clc;

%% ── CONSTANTES GLOBALES ──────────────────────────────────────────────────
f1  = 1000;     % Fréquence signal Gauche (Hz)
f2  = 3000;     % Fréquence signal Droite (Hz)
f3  = 38000;    % Fréquence porteuse DSB-SC (Hz)
f4  = 19000;    % Fréquence pilote (Hz)
fc  = 100000;   % Fréquence porteuse FM (Hz)
kf  = 500000;   % Déviation de fréquence FM
Ap  = 0.2;      % Amplitude du signal pilote
duration = 0.005;


%% ════════════════════════════════════════════════════════════════════════
%% PARTIE 1 : MODULATION STÉRÉOPHONIQUE
%% ════════════════════════════════════════════════════════════════════════

%% 1. Génération des signaux audio
fs = 1000 * f2;
T  = 0 : 1/fs : duration;
G  = cos(2*pi*f1*T);
D  = cos(2*pi*f2*T);

% 1. Tracé des signaux G et D (Temporel)
figure('Name', '1_Signaux Audio Gauche & Droit', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, G, T, D, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signaux Audio Gauche (1 kHz) et Droit (3 kHz) — Domaine Temporel')
grid on
legend('Signal Gauche (1kHz)', 'Signal Droite (3kHz)')

% 2. Spectre FFT des signaux G et D (Fréquentiel)
L         = length(G);
freq_axis = (0:L-1) * (fs/L);
mask      = freq_axis <= 40000;
TFG = abs(fft(G)/L);
TFD = abs(fft(D)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFG(mask), freq_axis(mask), TFD(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signaux Audio Gauche (1 kHz) et Droit (3 kHz) — Domaine Fréquentiel')
grid on


%% 2. Construction des signaux stéréo
S = G + D;
d = G - D;

% 1. Tracé des signaux S et d (Temporel)
figure('Name', '2_Signaux Somme & Différence (G+D, G-D)', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, S, T, d, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signal Somme S = G+D et Signal Différence d = G-D — Domaine Temporel')
grid on
legend('Signal S (G+D)', 'Signal d (G-D)')

% 2. Spectre FFT des signaux S et d (Fréquentiel)
TFS = abs(fft(S)/L);
TFd = abs(fft(d)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFS(mask), freq_axis(mask), TFd(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signal Somme S = G+D et Signal Différence d = G-D — Domaine Fréquentiel')
grid on


%% 3. Modulation du signal G-D
fs = 1000 * f3;
T  = 0 : 1/fs : duration;
G  = cos(2*pi*f1*T);
D  = cos(2*pi*f2*T);
x3 = (G-D) .* cos(2*pi*f3*T);

% 1. Tracé de x3(t) (Temporel)
figure('Name', '3_Signal G-D Modulé DSB-SC à 38 kHz', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, x3, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signal (G-D) Modulé DSB-SC à 38 kHz — Domaine Temporel')
grid on
legend('Signal (G-D) modulé')

% 2. Spectre FFT du signal (G-D) modulé (Fréquentiel)
L         = length(G);
freq_axis = (0:L-1) * (fs/L);
mask      = freq_axis <= 48000;
TFx3      = abs(fft(x3)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFx3(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signal (G-D) Modulé DSB-SC à 38 kHz — Domaine Fréquentiel')
grid on


%% 4. Ajout du signal pilote
x4 = Ap * cos(2*pi*f4*T);   % fs et T identiques à la section 3

% 1. Tracé du signal pilote (Temporel)
figure('Name', '4_Signal Pilote 19 kHz', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, x4, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signal Pilote 19 kHz — Domaine Temporel')
grid on
legend('Signal pilote')

% 2. Spectre FFT du signal pilote (Fréquentiel)
TFx4 = abs(fft(x4)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFx4(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signal Pilote 19 kHz — Domaine Fréquentiel')
grid on


%% 5. Construction du multiplex x(t) = S(t) + x3(t) + x4(t)
fs = 1000 * f3;
T  = 0 : 1/fs : 0.002;     % durée réduite pour lisibilité
G  = cos(2*pi*f1*T);
D  = cos(2*pi*f2*T);
S  = G + D;
x3 = (G-D) .* cos(2*pi*f3*T);
x4 = Ap * cos(2*pi*f4*T);
x  = S + x3 + x4;

% 1. Tracé de x(t) (Temporel)
figure('Name', '5_Signal Multiplex Stéréo x(t)', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, x, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signal Multiplex Stéréo x(t) = S + DSB-SC + Pilote — Domaine Temporel')
grid on
legend('Signal x(t)')

% 2. Spectre FFT du multiplex (Fréquentiel)
L         = length(G);
freq_axis = (0:L-1) * (fs/L);
mask      = freq_axis <= 48000;
TFx       = abs(fft(x)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFx(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signal Multiplex Stéréo x(t) = S + DSB-SC + Pilote — Domaine Fréquentiel')
grid on


%% 6. Modulation FM
%% s(t) = cos(2π·fc·t + kf·∫x(t)dt), avec fc = 1 MHz

% 1. Implémentation de la modulation FM
fs = 1000 * f3;
T  = 0 : 1/fs : duration;
G  = cos(2*pi*f1*T);
D  = cos(2*pi*f2*T);
S  = G + D;
x3 = (G-D) .* cos(2*pi*f3*T);
x4 = Ap * cos(2*pi*f4*T);
x  = S + x3 + x4;

integral_x = cumtrapz(T, x);
s = cos(2*pi*fc*T + kf*integral_x);

% Vérification : fréquence instantanée toujours positive
fi_min = fc - kf * max(abs(x)) / (2*pi);
fi_max = fc + kf * max(abs(x)) / (2*pi);
fprintf('Déviation max : %.1f kHz\n', kf*max(abs(x))/(2*pi*1000));
fprintf('fi : [%.1f kHz  →  %.1f kHz]  (toujours positif : %d)\n', ...
        fi_min/1000, fi_max/1000, fi_min > 0);

% 2. Tracé de s(t) (Temporel)
figure('Name', '6_Signal FM Modulé s(t) — Porteuse 1 MHz', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, s, 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Amplitude')
title('Signal FM Modulé s(t) — Porteuse 1 MHz — Domaine Temporel')
grid on;  legend('Signal s(t)')

% 3. Spectre de s(t) (Fréquentiel)
L         = length(G);
freq_axis = (0:L-1) * (fs/L);
mask      = freq_axis <= 2000000;          % affichage jusqu'à 2 MHz
TFs       = abs(fft(s)/L);

subplot(2,1,2)
plot(freq_axis(mask), TFs(mask), 'LineWidth', 1.5)
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Signal FM Modulé s(t) — Porteuse 1 MHz — Domaine Fréquentiel')
grid on


%% ════════════════════════════════════════════════════════════════════════
%% PARTIE 2 : DÉMODULATION STÉRÉOPHONIQUE
%% ════════════════════════════════════════════════════════════════════════

%% 1. Démodulation FM (Discriminateur de phase amélioré)

% Amélioration 1 : Pré-filtrage BPF autour de fc = 1 MHz
% Bande de Carson : B = 2*(deviation + f_max) = 2*(246k + 38k) ≈ 568 kHz
% Fenêtre : [fc - 400kHz … fc + 400kHz] = [600 kHz … 1.4 MHz]
N_pre   = 200;
bpf_pre = fir1(N_pre, [600000 1400000] / (fs/2), 'bandpass');
s_filt  = filtfilt(bpf_pre, 1, s);

% Amélioration 2 : Discriminateur de phase
analytic_s = hilbert(s_filt);
inst_phase = unwrap(angle(analytic_s));
inst_omega = diff(inst_phase) * fs;

% Amélioration 3 : Filtre médian → supprime les pics de déphasage
inst_omega_clean = medfilt1(inst_omega, 7);

% Amélioration 4 : Post-filtrage LPF → supprime bruit > 60 kHz
lpf_post         = fir1(N_pre, 60000 / (fs/2), 'low');
inst_omega_clean = filtfilt(lpf_post, 1, inst_omega_clean);

x_demod = (inst_omega_clean - 2*pi*fc) / kf;
T_demod = T(1:end-1);

% 2. Comparer avec le signal multiplex original
L1    = length(x);
TFx   = abs(fft(x) / L1);
freq1 = (0:L1-1) * (fs / L1);

L2      = length(x_demod);
TFx_dem = abs(fft(x_demod) / L2);
freq2   = (0:L2-1) * (fs / L2);

mask1 = freq1 <= 200000;
mask2 = freq2 <= 200000;

figure('Name', '7_Démodulation FM — x(t) Original vs Récupéré', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T, x, 'LineWidth', 1.5, 'DisplayName', 'x(t) original')
hold on
plot(T_demod, x_demod, 'LineWidth', 1.2, 'DisplayName', 'x(t) démodulé')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Multiplex x(t) Original vs Démodulé FM — Domaine Temporel')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(freq1(mask1), TFx(mask1), 'LineWidth', 1.5, 'DisplayName', 'X(f) original')
hold on
plot(freq2(mask2), TFx_dem(mask2), 'LineWidth', 1.2, 'DisplayName', 'X(f) démodulé')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Multiplex X(f) Original vs Démodulé FM — Domaine Fréquentiel')
grid on;  legend('Location', 'best')


%% 2. Extraction des composantes

%% ── Sous-échantillonnage de x_demod ────────────────────────────────────
fs_down      = 400000;
decim_factor = round(fs / fs_down);          % = 95
x_down       = resample(x_demod, 1, decim_factor);
T_down       = T_demod(1:decim_factor:end);
n_min        = min(length(x_down), length(T_down));
x_down       = x_down(1:n_min);
T_down       = T_down(1:n_min);

% Fonction utilitaire : spectre + axe fréquentiel
get_spectrum = @(sig, f_s) deal(abs(fft(sig)/length(sig)), ...
                                (0:length(sig)-1) * (f_s/length(sig)));

Fn = fs_down / 2;    % Fréquence de Nyquist = 200 kHz
N  = 300;            % Ordre filtre — donne 3×300=900 < 2000 échantillons ✓

% 1. Extraire G+D avec un filtre passe-bas (coupure à 8 kHz)
lpf_coeffs    = fir1(N, 10000/Fn, 'low');
GpD_extracted = filtfilt(lpf_coeffs, 1, x_down);
GpD_ref       = G + D;

% 2. Extraire G-D avec un filtre passe-bande (35–41 kHz)
bpf_coeffs    = fir1(N, [32000 44000]/Fn, 'bandpass');
GmD_extracted = filtfilt(bpf_coeffs, 1, x_down);
GmD_ref       = (G - D) .* cos(2*pi*f3*T);

% 3. Extraire le pilote 19 kHz (18.5–19.5 kHz)
pilot_coeffs    = fir1(N, [18950 19050]/Fn, 'bandpass');
pilot_extracted = filtfilt(pilot_coeffs, 1, x_down);
pilot_ref       = Ap * cos(2*pi*f4*T);

% Calcul des spectres (signaux extraits à fs_down, refs à fs)
[TF_GpD_ext,  F1] = get_spectrum(GpD_extracted,  fs_down);
[TF_GpD_ref,  ~ ] = get_spectrum(GpD_ref,         fs);
[TF_GmD_ext,  F2] = get_spectrum(GmD_extracted,  fs_down);
[TF_GmD_ref,  ~ ] = get_spectrum(GmD_ref,         fs);
[TF_pilot_ext,F3] = get_spectrum(pilot_extracted, fs_down);
[TF_pilot_ref,~ ] = get_spectrum(pilot_ref,        fs);
F_ref = (0:length(T)-1) * (fs/length(T));

cap = [15000, 60000, 30000];

% Figure 8 — G+D
figure('Name', '8_Extraction G+D — Filtre Passe-Bas', 'NumberTitle', 'off')
subplot(2,1,1)
mask_e = F1 <= cap(1);   mask_r = F_ref <= cap(1);
plot(F_ref(mask_r), TF_GpD_ref(mask_r), 'b',   'LineWidth', 1.5, 'DisplayName', 'G+D original')
hold on
plot(F1(mask_e),    TF_GpD_ext(mask_e),  'r--', 'LineWidth', 1.2, 'DisplayName', 'G+D extrait (LPF)')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Extraction G+D par Filtre Passe-Bas — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T,      GpD_ref,       'b',   'LineWidth', 1.5, 'DisplayName', 'G+D original')
hold on
plot(T_down, GpD_extracted, 'r--', 'LineWidth', 1.2, 'DisplayName', 'G+D extrait (LPF)')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Extraction G+D par Filtre Passe-Bas — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Extraction de G+D par Filtre Passe-Bas', 'FontSize', 13)

% Figure 9 — G-D
figure('Name', '9_Extraction G-D — Filtre Passe-Bande 38 kHz', 'NumberTitle', 'off')
subplot(2,1,1)
mask_e = F2 <= cap(2);   mask_r = F_ref <= cap(2);
plot(F_ref(mask_r), TF_GmD_ref(mask_r), 'b',   'LineWidth', 1.5, 'DisplayName', 'G-D original')
hold on
plot(F2(mask_e),    TF_GmD_ext(mask_e),  'r--', 'LineWidth', 1.2, 'DisplayName', 'G-D extrait (BPF 38 kHz)')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Extraction G-D par Filtre Passe-Bande (38 kHz) — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T,      GmD_ref,       'b',   'LineWidth', 1.5, 'DisplayName', 'G-D original')
hold on
plot(T_down, GmD_extracted, 'r--', 'LineWidth', 1.2, 'DisplayName', 'G-D extrait (BPF 38 kHz)')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Extraction G-D par Filtre Passe-Bande (38 kHz) — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Extraction de G-D par Filtre Passe-Bande (38 kHz)', 'FontSize', 13)

% Figure 10 — Pilote 19 kHz
figure('Name', '10_Extraction Pilote — Filtre Passe-Bande 19 kHz', 'NumberTitle', 'off')
subplot(2,1,1)
mask_e = F3 <= cap(3);   mask_r = F_ref <= cap(3);
plot(F_ref(mask_r), TF_pilot_ref(mask_r), 'b',   'LineWidth', 1.5, 'DisplayName', 'Pilote original')
hold on
plot(F3(mask_e),    TF_pilot_ext(mask_e),  'r--', 'LineWidth', 1.2, 'DisplayName', 'Pilote extrait (BPF 19 kHz)')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Extraction Signal Pilote 19 kHz par Filtre Passe-Bande — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T,      pilot_ref,       'b',   'LineWidth', 1.5, 'DisplayName', 'Pilote original')
hold on
plot(T_down, pilot_extracted, 'r--', 'LineWidth', 1.2, 'DisplayName', 'Pilote extrait (BPF 19 kHz)')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Extraction Signal Pilote 19 kHz par Filtre Passe-Bande — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Extraction du Signal Pilote 19 kHz par Filtre Passe-Bande', 'FontSize', 13)


%% 3. Reconstruction du signal 38 kHz

% ── Principe : Doubleur de phase (Hilbert) ──────────────────────────────
% Au lieu de p²(t) → BPF (qui conserve mal la phase après filtrage),
% on extrait la phase instantanée du pilote via Hilbert puis on la double :
%   pilote(t) = A·cos(2π·f4·t + φ(t))
%   → phase_pilote = unwrap(angle(hilbert(pilote)))  ≈ 2π·f4·t + φ(t)
%   → carrier_38k  = cos(2 × phase_pilote)           = cos(2π·f3·t + 2φ(t))
% Cela garantit que la porteuse reconstruite est parfaitement synchrone
% avec le signal G-D qui avait été modulé avec le même cos(2π·f3·t).

% 1. Ré-extraction du pilote avec filtre d'ordre plus élevé (à fs_down)
%    On peut monter à N=500 car 3×500=1500 < length(x_down)≈2000
N_hi = 500;
pilot_coeffs_hi = fir1(N_hi, [18200 19800] / (fs_down/2), 'bandpass');
pilot_clean     = filtfilt(pilot_coeffs_hi, 1, x_down);

% 2. Générer le signal 38 kHz à partir de la phase instantanée du pilote
pilot_analytic  = hilbert(pilot_clean);
pilot_phase     = unwrap(angle(pilot_analytic));
carrier_38k     = cos(2 * pilot_phase);          % doublement de phase

% Référence idéale (pour comparaison)
carrier_38k_ref = cos(2*pi*f3*T_down);

% Spectres
[TF_carrier,     F_c] = get_spectrum(carrier_38k,     fs_down);
[TF_carrier_ref, ~  ] = get_spectrum(carrier_38k_ref, fs_down);
[TF_pilot_clean, ~  ] = get_spectrum(pilot_clean,     fs_down);
[TF_pilot_raw,   ~  ] = get_spectrum(pilot_extracted, fs_down);

% Tracé — Reconstruction 38 kHz
figure('Name', '11_Reconstruction Porteuse 38 kHz — Doublement de Phase', 'NumberTitle', 'off')
subplot(2,1,1)
mask_e = F_c <= 60000;
plot(F_c(mask_e), TF_carrier_ref(mask_e), 'b',   'LineWidth', 1.5, ...
     'DisplayName', 'cos(38kHz) idéal')
hold on
plot(F_c(mask_e), TF_carrier(mask_e),     'r--', 'LineWidth', 1.2, ...
     'DisplayName', 'cos(38kHz) reconstruit')
plot(F_c(mask_e), TF_pilot_clean(mask_e), 'g:',  'LineWidth', 1.0, ...
     'DisplayName', 'pilote extrait (BPF ordre 500)')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Reconstruction Porteuse 38 kHz par Doublement de Phase — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
n_show = round(0.0002 * fs_down);    % afficher 0.2 ms pour voir les cycles
plot(T_down(1:n_show), carrier_38k_ref(1:n_show), 'b',   'LineWidth', 1.5, ...
     'DisplayName', 'cos(38kHz) idéal')
hold on
plot(T_down(1:n_show), carrier_38k(1:n_show),     'r--', 'LineWidth', 1.2, ...
     'DisplayName', 'cos(38kHz) reconstruit')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Reconstruction Porteuse 38 kHz par Doublement de Phase — Comparaison Temporelle (zoom 0.2 ms)')
grid on;  legend('Location', 'best')
sgtitle('Reconstruction de la Porteuse 38 kHz par Doublement de Phase (Hilbert)', 'FontSize', 13)


%% 4. Démodulation du signal G-D

% 1. Multiplier par cos(2π·38 kHz·t) reconstruit
GmD_demod_raw = GmD_extracted .* carrier_38k;
% → (G-D)·cos²(38k) = (G-D)/2 · [1 + cos(76kHz)]

% 2. Appliquer un filtre passe-bas ordre élevé (coupure 8 kHz)
lpf_GmD   = fir1(N_hi, 8000 / (fs_down/2), 'low');
GmD_demod = filtfilt(lpf_GmD, 1, GmD_demod_raw);

% Facteur ×2 : la multiplication par cos² réduit l'amplitude de moitié
GmD_demod = 2 * GmD_demod;

% Correction d'amplitude résiduelle par normalisation sur signal de référence
GmD_ref_down = cos(2*pi*f1*T_down) - cos(2*pi*f2*T_down);
amp_ratio    = rms(GmD_ref_down) / rms(GmD_demod);
GmD_demod    = GmD_demod * amp_ratio;

fprintf('Correction amplitude G-D : facteur = %.4f\n', amp_ratio);

% 3. Vérifier que l'on récupère G-D
[TF_GmD_demod, F_gmd] = get_spectrum(GmD_demod,    fs_down);
[TF_GmD_ideal, ~    ] = get_spectrum(GmD_ref_down, fs_down);
mask_gmd = F_gmd <= 10000;

% Tracé — Démodulation G-D
figure('Name', '12_Démodulation G-D — × Porteuse 38 kHz + FPB', 'NumberTitle', 'off')
subplot(2,1,1)
plot(F_gmd(mask_gmd), TF_GmD_ideal(mask_gmd), 'b',   'LineWidth', 1.5, ...
     'DisplayName', 'G-D original')
hold on
plot(F_gmd(mask_gmd), TF_GmD_demod(mask_gmd), 'r--', 'LineWidth', 1.2, ...
     'DisplayName', 'G-D démodulé (LPF)')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Démodulation G-D (× Porteuse 38 kHz Reconstruite + FPB) — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T_down, GmD_ref_down, 'b',   'LineWidth', 1.5, 'DisplayName', 'G-D original')
hold on
plot(T_down, GmD_demod,    'r--', 'LineWidth', 1.2, 'DisplayName', 'G-D démodulé (LPF)')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Démodulation G-D (× Porteuse 38 kHz Reconstruite + FPB) — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Démodulation du Signal G-D (× Porteuse 38 kHz Reconstruite + FPB)', 'FontSize', 13)


%% 5. Reconstruction des canaux
%% G = (S + Δ)/2,   D = (S - Δ)/2

% Aligner les longueurs (GpD_extracted et GmD_demod sont sur T_down)
n_min2    = min(length(GpD_extracted), length(GmD_demod));
S_rec     = GpD_extracted(1:n_min2);
Delta_rec = GmD_demod(1:n_min2);
T_rec     = T_down(1:n_min2);

% 1. Reconstituer G(t) et D(t)
G_rec = (S_rec + Delta_rec) / 2;
D_rec = (S_rec - Delta_rec) / 2;

G_ref_down = cos(2*pi*f1*T_rec);
D_ref_down = cos(2*pi*f2*T_rec);

% Spectres
[TF_G_rec, F_g] = get_spectrum(G_rec,      fs_down);
[TF_G_ref, ~  ] = get_spectrum(G_ref_down, fs_down);
[TF_D_rec, F_d] = get_spectrum(D_rec,      fs_down);
[TF_D_ref, ~  ] = get_spectrum(D_ref_down, fs_down);
mask_audio = F_g <= 10000;

% Figure 13 — Canal Gauche G
figure('Name', '13_Reconstruction Canal Gauche G(t)', 'NumberTitle', 'off')
subplot(2,1,1)
plot(F_g(mask_audio), TF_G_ref(mask_audio), 'b',   'LineWidth', 1.5, ...
     'DisplayName', 'G original')
hold on
plot(F_g(mask_audio), TF_G_rec(mask_audio), 'r--', 'LineWidth', 1.2, ...
     'DisplayName', 'G reconstruit')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Canal Gauche G Reconstruit — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T_rec, G_ref_down, 'b',   'LineWidth', 1.5, 'DisplayName', 'G original')
hold on
plot(T_rec, G_rec,      'r--', 'LineWidth', 1.2, 'DisplayName', 'G reconstruit')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Canal Gauche G Reconstruit — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Reconstruction du Canal Gauche G(t)', 'FontSize', 13)

% Figure 14 — Canal Droit D
figure('Name', '14_Reconstruction Canal Droit D(t)', 'NumberTitle', 'off')
subplot(2,1,1)
plot(F_d(mask_audio), TF_D_ref(mask_audio), 'b',   'LineWidth', 1.5, ...
     'DisplayName', 'D original')
hold on
plot(F_d(mask_audio), TF_D_rec(mask_audio), 'r--', 'LineWidth', 1.2, ...
     'DisplayName', 'D reconstruit')
hold off
xlabel('Fréquence (Hz)');  ylabel('Amplitude')
title('Canal Droit D Reconstruit — Comparaison Spectrale')
grid on;  legend('Location', 'best')

subplot(2,1,2)
plot(T_rec, D_ref_down, 'b',   'LineWidth', 1.5, 'DisplayName', 'D original')
hold on
plot(T_rec, D_rec,      'r--', 'LineWidth', 1.2, 'DisplayName', 'D reconstruit')
hold off
xlabel('Temps (s)');  ylabel('Amplitude')
title('Canal Droit D Reconstruit — Comparaison Temporelle')
grid on;  legend('Location', 'best')
sgtitle('Reconstruction du Canal Droit D(t)', 'FontSize', 13)

% 3. Calcul de l'erreur
err_G  = G_rec - G_ref_down;
err_D  = D_rec - D_ref_down;
MSE_G  = mean(err_G.^2);
MSE_D  = mean(err_D.^2);
RMSE_G = sqrt(MSE_G);
RMSE_D = sqrt(MSE_D);
SNR_G  = 10 * log10(mean(G_ref_down.^2) / MSE_G);
SNR_D  = 10 * log10(mean(D_ref_down.^2) / MSE_D);

fprintf('\n── Erreur de reconstruction ──────────────────\n')
fprintf('Canal G :  RMSE = %.4f   SNR = %.1f dB\n', RMSE_G, SNR_G)
fprintf('Canal D :  RMSE = %.4f   SNR = %.1f dB\n', RMSE_D, SNR_D)
fprintf('──────────────────────────────────────────────\n')

% Figure 15 — Erreur temporelle G et D
figure('Name', '15_Erreur de Reconstruction G & D', 'NumberTitle', 'off')
subplot(2,1,1)
plot(T_rec, err_G, 'r', 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Erreur')
title(sprintf('Erreur de Reconstruction G(t)  —  RMSE = %.4f  |  SNR = %.1f dB', RMSE_G, SNR_G))
grid on

subplot(2,1,2)
plot(T_rec, err_D, 'r', 'LineWidth', 1)
xlabel('Temps (s)');  ylabel('Erreur')
title(sprintf('Erreur de Reconstruction D(t)  —  RMSE = %.4f  |  SNR = %.1f dB', RMSE_D, SNR_D))
grid on
sgtitle('Erreur de Reconstruction des Canaux Gauche G et Droit D', 'FontSize', 13)