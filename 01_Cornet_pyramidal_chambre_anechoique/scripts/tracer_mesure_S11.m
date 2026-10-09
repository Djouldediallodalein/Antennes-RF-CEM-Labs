close all
data1 = load('../donnees_mesure/mesure_S11.mat');
matrice1 = data1
whos('-file', '../donnees_mesure/mesure_S11.mat')
frequences1 = matrice1.frequences;
S11 = matrice1.s11

 size(S11)
 
 freq_index =201;
 frequence=frequences1(freq_index)*1e-9

 S11_cut = abs(S11);
 S11_norm = S11_cut / max(S11_cut);

 
 plot(frequences1, 20*log10(S11_norm));
 grid on;

 xlabel('frequence (GHz)');
 ylabel('Amplitude (dB)');
 title(['S11 en fonction de f ']);



