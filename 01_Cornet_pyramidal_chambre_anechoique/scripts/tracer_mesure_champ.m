close all
data1 = load('../donnees_mesure/crospol_plan_H.mat');
matrice1 = data1
whos('-file', '../donnees_mesure/crospol_plan_H.mat')


angles1 = matrice1.angles;
frequences1 = matrice1.frequences
S1 = matrice1.s21;

data2 = load('../donnees_mesure/crospol_plan_E.mat');
matrice2 = data2
whos('-file', '../donnees_mesure/crospol_plan_E.mat')

angles2 = matrice2.angles;
frequences2 = matrice2.frequences
S2 = matrice2.s21;

size(S1)
size(S2)

freq_index =41;
frequence=frequences1(freq_index)*1e-9
S1_cut = abs(S1(:, freq_index));
S1_norm = S1_cut / max(S1_cut);

S2_cut = abs(S2(:, freq_index));
S2_norm = S2_cut / max(S2_cut);

% plot(angles, 20*log10(abs(S(:, freq_index))));

plot(angles1,20*log10(S1_norm),'b');
hold on;
plot(angles2,20*log10(S2_norm),'g');
xticks(0:10:180);
yticks(-50:5:5);
grid on;
xlabel('Angle (°)');
ylabel('Amplitude (dB)');
title(['Coupe à la fréquence ', num2str(frequence) 'GHz']);



