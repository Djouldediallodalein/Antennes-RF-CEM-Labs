% --- SYNTHÈSE RÉSEAU DE TCHEBYCHEV N=5 (Basé sur le cours) ---

% 1. Paramètres
SLL_dB = 26; % Niveau des lobes secondaires souhaité (en positif)
R0 = 10^(SLL_dB / 20); % Conversion en ratio linéaire (Slide 51)

% 2. Calcul du facteur d'échelle z0 (Slide 49, équation 58)
% Pour N=5, on utilise le polynôme T4, donc n = 4.
n = 4;
z0 = 0.5 * ( (R0 + sqrt(R0^2 - 1))^(1/n) + (R0 - sqrt(R0^2 - 1))^(1/n) );

% 3. Identification avec le polynôme T4(z) (Slides 48 et 52)
% T4(z) = 8*z^4 - 8*z^2 + 1
% On remplace z par z0*cos(u) et on développe avec les formules trigo :
% cos^2(u) = (1 + cos(2u))/2   et   cos^4(u) = (3 + 4*cos(2u) + cos(4u))/8
%
% Le facteur de réseau symétrique (Slide 46) est : 
% AF = 2*a1 + 2*a2*cos(2u) + 2*a3*cos(4u)
%
% Par identification terme à terme, on obtient les amplitudes a1, a2, a3 :

a3 = 0.5 * z0^4;
a2 = 2 * z0^4 - 2 * z0^2;
% Attention: l'antenne centrale est 2*a1 dans la formule de l'AF (Slide 46)
antenne_centrale = 3 * z0^4 - 4 * z0^2 + 1; 

% 4. Tableau des amplitudes brutes (Symétrie: a3, a2, centre, a2, a3)
amplitudes = [a3, a2, antenne_centrale, a2, a3];

% 5. Normalisation pour avoir "1" aux extrémités
amplitudes_norm = amplitudes / amplitudes(1);

% Affichage
disp('Voici les amplitudes (Magnitude) à rentrer dans FEKO :');
fprintf('VoltageSource1 : %.3f\n', amplitudes_norm(1));
fprintf('VoltageSource2 : %.3f\n', amplitudes_norm(2));
fprintf('VoltageSource3 : %.3f\n', amplitudes_norm(3));
fprintf('VoltageSource4 : %.3f\n', amplitudes_norm(4));
fprintf('VoltageSource5 : %.3f\n', amplitudes_norm(5));