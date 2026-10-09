% --- SYNTHÈSE ET TRACÉ DU RÉSEAU DE TCHEBYCHEV N=5 ---

% 1. Paramètres initiaux
SLL_dB = 26; % Niveau des lobes secondaires (SLL) ciblé en dB
R0 = 10^(SLL_dB / 20); % Ratio linéaire (Slide 51)
n = 4; % Ordre du polynôme pour N=5

% 2. Calcul du facteur d'échelle z0 (Slide 49, éq. 58)
z0 = 0.5 * ( (R0 + sqrt(R0^2 - 1))^(1/n) + (R0 - sqrt(R0^2 - 1))^(1/n) );

% 3. Calcul des amplitudes a1, a2, a3 par identification (Slide 48 & 52)
a3 = 0.5 * z0^4;                       % Antennes aux extrémités
a2 = 2 * z0^4 - 2 * z0^2;              % Antennes intermédiaires
deux_a1 = 3 * z0^4 - 4 * z0^2 + 1;     % Antenne centrale complète (2*a1)

% 4. Calcul du Facteur de Réseau (Array Factor)
theta = linspace(0, 180, 1000);        % Angle theta de 0 à 180 degrés
theta_rad = deg2rad(theta);            % Conversion en radians
d_lambda = 0.5;                        % Espacement d = lambda/2
% Formule de 'u' selon le cours pour la symétrie autour de z (Slide 46)
u = pi * d_lambda * cos(theta_rad); 

% Formule exacte du facteur de réseau (Slide 46 : AF = 2a1 + 2a2*cos(2u) + 2a3*cos(4u))
AF = deux_a1 + 2 * a2 * cos(2*u) + 2 * a3 * cos(4*u);

% 5. Normalisation et passage en décibels (dB)
AF_norm = abs(AF) / max(abs(AF));      % Normalisation pour avoir 0 dB au max
AF_dB = 20 * log10(AF_norm);

% On limite l'affichage à -40 dB en bas pour que le graphe soit propre
AF_dB(AF_dB < -40) = -40;

% 6. Tracé du graphique
figure;
plot(theta, AF_dB, 'b-', 'LineWidth', 2);
hold on;
% Ajout de la ligne limite pour le SLL
yline(-SLL_dB, 'r--', 'LineWidth', 1.5, 'Label', '-26 dB SLL');

% Mise en forme
grid on;
xlabel('Angle \theta (degrés)');
ylabel('Facteur de Réseau Normalisé (dB)');
title(['Diagramme de rayonnement (Tchebychev N=5, SLL = -' num2str(SLL_dB) ' dB)']);
ylim([-40 0]);
xlim([0 180]);
xticks(0:15:180);