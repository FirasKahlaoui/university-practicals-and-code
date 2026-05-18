% Extraction des signaux
entree_systeme = out.y(:,2);
sortie_systeme = out.y(:,1);

% Calcul des informatios
info = stepinfo(entree_systeme, "SettlingTimeThreshold", 0.05, "RiseTimeLimits", [0 1]);

% Temps de réponse 
temps_de_reponse = info.SettlingTime * 600 / length(out.y(:,1));

% Temps de montée 
temps_de_montee = info.RiseTime * 600 / length(out.y(:,1));

% Valeurs finales 
valeur_finale_entree = sortie_systeme(end);
valeur_finale_sortie = entree_systeme(end);

% Gain statique 
gain_statique = valeur_finale_sortie / valeur_finale_entree * 100;

% Erreur statique 
erreur_statique = (valeur_finale_entree - valeur_finale_sortie) / valeur_finale_entree * 100;

% Affichage des resultats
disp(" Performance du Système: ")
disp("Temps de réponse : " + temps_de_reponse)
disp("Temps de montée : " + temps_de_montee)
disp("Gain statique : " + gain_statique + " %")
disp("Erreur statique : " + erreur_statique + " %")
