# Journal de bord — BlackOUT

Ce fichier retrace l'avancement du projet : ce qui est fait, ce qui est décidé, ce qui reste ouvert. Le README demeure le document de référence technique ; le journal n'en trace que l'histoire.

Tenue du journal : une entrée à chaque étape franchie, et au minimum une par session de travail. Entrées classées de la plus récente à la plus ancienne.

## 2026-08-02 — Session de reprise

### État des lieux à l'ouverture

Le dépôt ne contenait que le README. Le cadrage technique y était solide : principe LoRa 868 MHz sous Meshtastic, cadre réglementaire EU_868, arbitrage du préréglage modem sur LONG_FAST, ordres de grandeur de portée urbaine, familles de matériel, dimensionnement solaire, configuration de référence et limites connues. En revanche la feuille de route était entièrement à l'état de projet : aucune des sept étapes n'était engagée, et la section 10 ne contenait qu'une liste de pistes non instruites.

Manque principal identifié : le document décrivait un système mais ne le dimensionnait pas. Rien n'indiquait combien de nœuds sont nécessaires pour couvrir une ville de 20 000 habitants, ni comment les répartir, ni quelle charge le canal peut réellement supporter.

### Travaux menés

Ouverture du présent journal de bord.

Relecture de la documentation Meshtastic à jour : configuration LoRa, configuration des appareils, algorithme de diffusion, billet sur le choix des rôles, billet sur ROUTER_LATE. Trois de ces sources n'étaient pas encore référencées dans le README.

Rédaction de trois documents de travail : dimensionnement-maillage.md, materiel-premiers-noeuds.md et antennes-energie-alternatives.md.

Mise à jour du README : index des documents, corrections de fond, feuille de route révisée, sources complétées.

### Décisions prises

| Décision | Contenu |
| --- | --- |
| Cible de déploiement | 100 à 200 nœuds pour 20 000 habitants, soit un nœud pour 100 à 200 personnes |
| Nature du réseau | réseau de points de contact entre référents, pas messagerie grand public |
| Ossature | 4 à 6 relais en hauteur pour le tissu continu, plus 1 à 2 pour les écarts |
| Paliers | amorçage à 2 nœuds, ossature à 3 relais, ville à 6 relais, bassin de vie à 8 |
| Nœud A | carte nRF52840 avec GPS et écran, mobile de test puis terminal personnel |
| Nœud B | carte nRF52840 avec antenne externe, nœud fixe du domicile en CLIENT_BASE |
| Premier relais | solution clé en main pour aller vite, relais sur mesure ensuite |
| Bande | 868 MHz confirmé, le 433 MHz écarté après calcul |
| Nombre de sauts | 3, sans augmentation |

### Corrections apportées aux notes initiales

| Sujet | Correction |
| --- | --- |
| Rôle du nœud de toiture | CLIENT_BASE et non ROUTER ou ROUTER_LATE, que la documentation déconseille explicitement pour ce cas |
| Rôle REPEATER | déprécié depuis le firmware 2.7.11 |
| Charge par temps froid | le LiFePO4 ne se charge pas davantage sous 0 °C ; la vraie protection est la coupure basse température, pas la chimie |
| Panneau solaire | 15 à 20 W crête et non 5 à 10, après calcul du gisement de décembre |
| Régulateur MPPT | sa consommation propre peut dépasser celle du nœud ; à spécifier avant achat |
| Charge utile | 237 octets et non environ 200 |

### Résultat marquant de la session

Le facteur limitant du projet n'est pas la portée mais la capacité du canal. Avec les intervalles par défaut, une soixantaine de nœuds saturent déjà un maillage LONG_FAST, avant même le premier message utile. C'est ce calcul qui fixe la cible de 100 à 200 nœuds et qui impose la nature du dispositif : coordination entre référents plutôt que messagerie ouverte.

### À faire à la prochaine session

Vérifier la disponibilité et les prix réels des cartes retenues chez un revendeur européen, puis arrêter la commande du palier 0. Préparer le protocole de test de portée : itinéraire, points de mesure, grille de relevé. Lister les points hauts candidats de la commune à partir des vues aériennes avant tout déplacement. Vérifier l'existence d'un maillage Meshtastic déjà actif dans le département.
