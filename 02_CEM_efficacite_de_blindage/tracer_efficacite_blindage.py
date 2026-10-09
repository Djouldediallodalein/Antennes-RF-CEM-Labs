import matplotlib.pyplot as plt

# -------------------------------------------------------------------
# 1. Données de mesure
# -------------------------------------------------------------------
# Fréquences mesurées (en GHz)
frequences = [0.9, 1, 1.2, 1.5, 1.8, 2]

# Efficacités de blindage calculées (en dB) pour chaque fréquence
# Rappel : S = P0 - P_mesure
S_F =   [21, 9, -2, 30, 23, 20]  # Boîtier totalement fermé
S_BO =  [21, 10, -1,  32,  24,  19]  # Boîtier avec 1 grande ouverture
S_9SO = [15, 4, -3, 27, 20, 21]  # Boîtier avec 9 petites ouvertures
S_1SO = [17, 5, -1, 31, 21, 21]  # Boîtier avec 1 petite ouverture

# -------------------------------------------------------------------
# 2. Tracé des courbes
# -------------------------------------------------------------------
plt.figure(figsize=(10, 6))

# Une courbe par configuration du boîtier
plt.plot(frequences, S_F,   marker='o', linestyle='-',  color='blue',   label='Boîtier fermé ($S_F$)')
plt.plot(frequences, S_BO,  marker='s', linestyle='--', color='red',    label='1 Grande ouverture ($S_{BO}$)')
plt.plot(frequences, S_9SO, marker='^', linestyle='-.', color='orange', label='9 Petites ouvertures ($S_{9SO}$)')
plt.plot(frequences, S_1SO, marker='d', linestyle=':',  color='green',  label='1 Petite ouverture ($S_{1SO}$)')

# Mise en forme du graphique
plt.title('Efficacité de blindage en fonction de la fréquence', fontsize=14, fontweight='bold')
plt.xlabel('Fréquence (GHz)', fontsize=12)
plt.ylabel('Efficacité de blindage SE (dB)', fontsize=12)

# Grille
plt.grid(True, which='both', linestyle='--', linewidth=0.5)

# Légende
plt.legend(loc='best', fontsize=10)

# Affichage et sauvegarde
plt.tight_layout()
plt.savefig('efficacite_blindage.png', dpi=300)
plt.show()