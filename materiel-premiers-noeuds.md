# Matériel : deux premiers nœuds et relais de toiture

Document de travail complémentaire au README. Il tranche l'étape 1 de la feuille de route.

## 1. Ce que doivent faire les deux premiers nœuds

Trois fonctions, dans cet ordre. Valider la chaîne complète : flash du firmware, réglage de la région, création du canal privé chiffré, appairage à l'application, échange d'un premier message. Mesurer la portée réelle du quartier, ce qui suppose un GPS et un journal de mesures exploitable. Rester utiles ensuite, une fois le maillage constitué, l'un comme terminal personnel, l'autre comme nœud fixe du domicile.

## 2. Critères d'arbitrage

| Critère | Exigence | Raison |
| --- | --- | --- |
| Puce radio | SX1262, LR1110 ou LR1121 | meilleure sensibilité, détection d'activité canal fiable, gain de réception amélioré disponible |
| Microcontrôleur | nRF52840 pour tout ce qui fonctionne sur batterie | l'ESP32 consomme un ordre de grandeur de plus |
| Connecteur d'antenne externe | indispensable côté fixe | l'antenne et sa hauteur pilotent la portée, pas la puissance |
| GPS | indispensable sur le nœud mobile de test | sans position, les mesures de portée ne valent rien |
| Écran | souhaitable pendant la phase de test | lire SNR, RSSI et ChUtil sans téléphone |
| Boîtier et batterie | intégrés de préférence | on veut mesurer, pas bricoler |

## 3. Bande : pourquoi 868 et non 433

L'idée de descendre en fréquence pour gagner en portée est juste sur le principe mais fausse dans ce cadre réglementaire. En EU_433, la puissance autorisée tombe à 10 dBm contre 27 dBm en EU_868, soit 17 dB perdus, alors que le gain de propagation dû à la fréquence plus basse ne représente qu'environ 6 dB. Le bilan net est nettement défavorable au 433 MHz, sans compter l'encombrement de la bande et la taille des antennes. Le 868 MHz reste le bon choix. Descendre réellement en fréquence supposerait un cadre radioamateur, avec licence et sans chiffrement : c'est un autre projet, traité dans le document sur les alternatives.

## 4. Arbitrage retenu

### Nœud A, mobile de test puis terminal personnel

Retenu : Seeed Wio Tracker L1. nRF52840 associé à un LR1110, GPS intégré, écran, batterie et boîtier fournis. Il permet de marcher la ville en journalisant les positions et la qualité de liaison.

Solution de repli si le budget le permet : Nano G2 Ultra, plus sensible, avec antenne externe, GPS et écran, mais nettement plus cher.

### Nœud B, nœud fixe du domicile et préfiguration du relais

Retenu : Heltec Mesh Node T114. nRF52840 associé à un SX1262, connecteur d'antenne externe, écran, alimentation secteur avec batterie de secours. Rôle CLIENT_BASE, antenne colinéaire placée au point le plus haut accessible du logement.

C'est la carte nRF52840 à antenne externe la moins chère : si elle est finalement mal placée ou remplacée, la perte est faible.

### Matériel écarté

| Matériel | Raison de l'écart |
| --- | --- |
| Cartes à SX1276 ou RF95 (Heltec V2, anciens TTGO) | sensibilité et détection de canal inférieures, pas de gain de réception amélioré |
| ESP32 sur batterie (Heltec V3, T-Beam) | consommation incompatible avec un fonctionnement solaire durable ; à réserver aux nœuds sur secteur et aux passerelles |
| RAK4631 sur base WisBlock | excellent, mais demande assemblage et boîtier ; gardé pour le relais sur mesure |
| Cartes 433 MHz | voir le point 3 |

## 5. Relais solaire de toiture

Deux voies possibles, et il n'y a pas lieu de choisir la même pour le premier relais et pour les relais définitifs.

### Voie A, clé en main

Seeed SenseCAP Solar Node : nRF52840 et SX1262, panneau 5 W, quatre emplacements 18650, boîtier étanche et supports fournis. On installe en une après-midi.

Réserve importante : les cellules 18650 sont du lithium-ion classique, dont la charge est à proscrire sous 0 °C. Il faut vérifier avant commande que le contrôleur de charge dispose bien d'une coupure basse température. S'il en a une, l'autonomie hivernale sera amputée pendant les périodes de gel, ce qui est acceptable si la batterie est dimensionnée large. S'il n'en a pas, la batterie se dégradera rapidement et il faudra en ajouter une.

### Voie B, sur mesure

RAK4631 ou Heltec T114 dans un boîtier IP66, batterie LiFePO4 12 V, régulateur solaire à très faible consommation propre, convertisseur 12 V vers 5 V, panneau largement surdimensionné, antenne colinéaire séparée et parafoudre coaxial. Maîtrise complète, batterie plus tolérante à la chaleur d'un boîtier exposé et à des cycles longs, éléments remplaçables un par un. En contrepartie : temps de fabrication et étanchéité à réussir, notamment au passage de câble.

### Choix retenu

Voie A pour le premier relais, afin d'apprendre vite et de disposer rapidement d'un point haut réel. Voie B pour les relais d'ossature définitifs, une fois les emplacements validés par la cartographie de couverture.

## 6. Budget indicatif

Ordres de grandeur en euros, à vérifier au moment de la commande : les prix de ces cartes varient fortement et les frais de port et de douane ne sont pas négligeables.

| Poste | Ordre de grandeur |
| --- | --- |
| Nœud A, carte nRF52840 avec GPS et écran | 40 à 90 |
| Nœud B, carte nRF52840 avec antenne externe | 35 à 50 |
| Antenne colinéaire 868 MHz, 5 à 6 dBi | 25 à 60 |
| Câble faible perte et adaptateurs | 20 à 40 |
| Parafoudre coaxial | 20 à 40 |
| Relais clé en main, voie A | 150 à 220 |
| Relais sur mesure, voie B | 200 à 350 |

Palier 0, les deux premiers nœuds et une antenne : de l'ordre de 150 à 250 euros. Palier 1, ossature de trois relais : de l'ordre de 700 à 1 200 euros. Ces montants situent d'emblée le projet dans le champ d'un financement collectif ou d'un soutien communal, pas d'un achat individuel.

## 7. À vérifier avant toute commande

| Point | Pourquoi |
| --- | --- |
| Carte officiellement supportée par le firmware, et version minimale requise | éviter une carte orpheline |
| Type de connecteur d'antenne, SMA ou IPEX, et adaptateur nécessaire | éviter une commande incomplète |
| Présence d'une coupure de charge basse température | durée de vie de la batterie en hiver |
| Version 868 MHz explicitement, et non 915 MHz | une carte 915 est inutilisable ici |
| Disponibilité d'un revendeur européen | délais et douane |
| Possibilité d'un canal d'administration à distance | indispensable avant de sceller un boîtier en toiture |

## 8. Ce que ce document ne tranche pas

Le modèle exact d'antenne, traité dans le document sur les antennes et l'énergie. Le nombre final de relais, qui dépend du repérage. Le choix entre achat groupé et acquisition progressive, qui relève de l'organisation du collectif plutôt que de la technique.
