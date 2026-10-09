# Antennes, radiofréquence et CEM – Travaux pratiques

Travaux pratiques de l'UE **UM4EE205 – Antennes** (M1 Systèmes Communicants, Sorbonne Université), réalisés en binôme ou en groupe. Ils relient la simulation et la théorie à la mesure sur banc et en chambre anéchoïque.

Ce dépôt regroupe les mesures, les scripts de traitement et les figures. Les énoncés et supports de cours ne sont pas inclus.

## 1. Antenne cornet pyramidale en chambre anéchoïque – `01_Cornet_pyramidal_chambre_anechoique`

Caractérisation expérimentale d'un cornet pyramidal large bande (2–4 GHz, gain nominal 15 dBi) dans la chambre anéchoïque de Saint-Cyr-l'École.

- **Adaptation** : paramètre S11 et TOS mesurés à l'analyseur de réseau vectoriel (Keysight N5222A, étalonnage deux ports, 1,8–2,8 GHz, 201 points). Au-dessous de ~2 GHz le mode TE10 du guide n'est plus propagé et l'antenne n'est plus adaptée ; dans la bande nominale S11 reste inférieur à −10 dB.
- **Champ lointain** : distance minimale d = 2D²/λ, de 1,34 m à 1,8 GHz à 2,08 m à 2,8 GHz, très inférieure à la longueur utile de la chambre (8,8 m).
- **Diagrammes de rayonnement** : plans E et H, polarisations principale et croisée, à 2 ; 2,4 et 2,8 GHz, comparés au modèle analytique (théorème de Huygens et intégrales de Fresnel) programmé sous MATLAB.
- **Résultat** : bon accord sur le lobe principal ; isolation en polarisation croisée supérieure à 40 dB près de l'axe.

Contenu : `donnees_mesure/` (fichiers `.mat` : S11, co- et cross-polarisation en plans E et H), `scripts/` (modèle théorique et tracés), `figures/`.

## 2. Compatibilité électromagnétique : efficacité de blindage – `02_CEM_efficacite_de_blindage`

Mesure de l'efficacité de blindage SE = P₀ − P_mesurée d'un boîtier métallique entre 0,9 et 2 GHz, pour quatre configurations : boîtier fermé, une grande ouverture, une petite ouverture, neuf petites ouvertures. Le script Python trace les courbes de SE en fonction de la fréquence ; les résonances de cavité se lisent sur les courbes.

## 3. Réseau d'antennes : synthèse de Tchebychev – `03_Reseau_antennes_Tchebychev`

Synthèse d'un réseau uniforme de 5 sources espacées de λ/2 avec un niveau de lobes secondaires de −26 dB : calcul des amplitudes d'alimentation (à reporter dans FEKO) et tracé du facteur de réseau.

## Outils

Analyseur de réseau vectoriel, chambre anéchoïque, sonde électro-optique, MATLAB, Python (Matplotlib), Altair FEKO.

Les scripts MATLAB se lancent depuis leur dossier ; pour les scripts de tracé, les données sont lues dans `donnees_mesure/`.
