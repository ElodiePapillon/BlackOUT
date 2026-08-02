# Antennes, énergie et alternatives radio

Instruction de la section 10 du README, jusque-là réduite à une liste de pistes.

## 1. Antennes

### 1.1 La hauteur avant le gain

En milieu urbain, passer une antenne de 1,5 m à 12 m au-dessus du sol change la portée d'un facteur bien supérieur à ce que procure n'importe quel gain d'antenne raisonnable. La raison est que l'obstacle dominant n'est pas la distance mais le bâti : dès que l'antenne dépasse la ligne de toiture, la propagation cesse d'être un problème de diffraction pour redevenir un problème d'espace libre. Toute dépense doit être arbitrée dans cet ordre : d'abord la hauteur, ensuite la qualité du câble, ensuite seulement le gain.

### 1.2 Gain et diagramme de rayonnement

Une antenne omnidirectionnelle ne crée pas d'énergie : elle aplatit le lobe de rayonnement. Une colinéaire de 5 à 6 dBi concentre l'énergie dans une tranche verticale d'une quinzaine de degrés. Sur une ville plate, c'est exactement ce que l'on veut. Sur un point très haut dominant des quartiers en contrebas, une antenne à fort gain peut littéralement survoler les nœuds les plus proches : dans ce cas, 3 dBi est un meilleur choix que 8 dBi.

### 1.3 Limite légale et calcul de la PIRE

La limite EU_868 est de 27 dBm de puissance apparente rayonnée, référencée au dipôle. Le gain des antennes du commerce est presque toujours donné en dBi, référencé à l'isotrope. La conversion est ERP = PIRE moins 2,15 dB.

| Configuration | Calcul | ERP |
| --- | --- | --- |
| Radio 22 dBm, fouet 2 dBi, 0,5 dB de perte | 22 + 2 - 0,5 - 2,15 | 21,4 dBm |
| Radio 22 dBm, colinéaire 5 dBi, 2 dB de câble | 22 + 5 - 2 - 2,15 | 22,9 dBm |
| Radio 22 dBm, colinéaire 8 dBi, 1,5 dB de câble | 22 + 8 - 1,5 - 2,15 | 26,4 dBm |

Aucune configuration raisonnable ne dépasse la limite tant que l'on reste sous 8 dBi avec une radio à 22 dBm. Laisser le réglage de puissance sur 0 : le firmware applique alors le maximum légal de la région.

### 1.4 Câble coaxial

| Câble | Perte à 868 MHz |
| --- | --- |
| RG58 ordinaire | 0,6 à 0,7 dB/m |
| H155 ou RG58 faible perte | environ 0,45 dB/m |
| LMR-240 ou équivalent | environ 0,35 dB/m |
| LMR-400 ou équivalent | environ 0,18 dB/m |

Dix mètres de RG58 coûtent 6 à 7 dB, soit davantage que tout le gain de l'antenne. La bonne pratique est de ne pas faire descendre le coaxial du tout : placer le nœud dans un boîtier étanche au pied de l'antenne et faire courir l'alimentation, qui elle ne souffre pas de la longueur.

### 1.5 Détails qui décident du résultat

Polarisation verticale sur l'ensemble du maillage, sans exception : une antenne posée à l'horizontale perd de l'ordre de 20 dB. Plan de masse correct pour toute antenne quart d'onde. Éloignement d'au moins une longueur d'onde, soit 35 cm à 868 MHz, de toute masse métallique et du bâti, et davantage si possible. Étanchéité du connecteur par bande auto-amalgamante, l'eau dans un connecteur détruit une liaison en une saison. Parafoudre coaxial et liaison équipotentielle à la terre du bâtiment pour toute antenne extérieure en hauteur. Ne jamais mettre la radio sous tension sans antenne connectée.

## 2. Énergie

### 2.1 Le besoin

Un relais nRF52840 consomme 15 à 30 mA en moyenne, soit 2 à 3 Wh par jour. Les émissions tirent une centaine de milliampères mais sur des salves de moins d'une seconde : leur part dans le bilan quotidien est marginale. C'est la veille de réception qui consomme.

### 2.2 Dimensionnement du panneau

En décembre, sous nos latitudes, avec un panneau incliné à 60 ou 70 degrés plein sud, on retient une heure d'équivalent plein soleil par jour. Le calcul strict donne 3 Wh divisés par une heure et par un rendement de chaîne de 0,7, soit environ 4,3 W crête. Ce minimum théorique ne tient compte ni de la salissure, ni de la neige, ni d'un ombrage partiel, ni du vieillissement, ni des séries de jours blancs. Un facteur 3 est raisonnable.

Correction par rapport au README : la fourchette de 5 à 10 W crête convient à l'été et à un hiver clément. Pour un relais que l'on ne veut pas avoir à visiter, retenir 15 à 20 W crête. Le surcoût d'un panneau est faible comparé au coût d'une intervention en toiture en janvier.

### 2.3 Batterie

Trois semaines d'autonomie à 3 Wh par jour demandent 63 Wh utiles. Une batterie LiFePO4 de 12,8 V et 6 Ah offre 77 Wh, dont environ 61 Wh exploitables à 80 % de profondeur de décharge : l'ordre de grandeur est bon, mais sans marge. Retenir 12,8 V et 7 à 10 Ah.

### 2.4 Correction importante sur le froid

Le README laissait entendre que le LiFePO4 résout le problème de la charge par temps froid. C'est inexact et il faut le corriger. Le LiFePO4 ne doit pas non plus être chargé sous 0 °C. Sa supériorité tient à trois autres choses : une bien meilleure tolérance à la chaleur d'un boîtier exposé en plein soleil, une durée de vie en cycles nettement supérieure, et une sécurité thermique bien plus favorable en cas de défaut. S'y ajoute le fait que la quasi-totalité des blocs LiFePO4 du commerce intègrent un circuit de protection avec coupure de charge basse température.

La vraie protection est donc la coupure basse température, pas la chimie. Exigence à inscrire au cahier des charges : le bloc batterie doit disposer d'un circuit de protection avec coupure de charge sous 0 °C, quelle que soit la chimie retenue. Le réchauffage actif de la batterie est à exclure : sa consommation est sans commune mesure avec un budget de 3 Wh par jour.

### 2.5 Régulateur : MPPT ou non

Sur une installation de quelques centaines de watts, un régulateur MPPT rapporte 10 à 30 % par faible ensoleillement, ce qui est exactement la situation hivernale que l'on cherche à couvrir. Mais un régulateur du commerce consomme 5 à 25 mA pour son propre fonctionnement, soit autant ou davantage que le nœud lui-même. Sur un budget de 3 Wh par jour, un régulateur mal choisi peut doubler la consommation totale de l'installation et annuler tout le bénéfice.

Règle : comparer la consommation propre du régulateur au budget du nœud avant toute chose, et exiger cette valeur en fiche technique. Deux voies acceptables. Soit un régulateur MPPT dont la consommation propre est spécifiée et inférieure à 5 mA. Soit un circuit de charge dédié intégré au boîtier, sans régulateur généraliste, ce que font déjà les nœuds solaires du commerce. Dans le doute, surdimensionner le panneau coûte moins cher, en euros comme en watts, que de courir après le rendement du MPPT.

### 2.6 Récapitulatif du poste énergie

| Poste | Cible révisée |
| --- | --- |
| Consommation du relais | 15 à 30 mA, soit 2 à 3 Wh par jour |
| Panneau | 15 à 20 W crête, plein sud, inclinaison 60 à 70 degrés |
| Batterie | LiFePO4 12,8 V, 7 à 10 Ah |
| Protection batterie | coupure de charge sous 0 °C obligatoire |
| Régulateur | consommation propre inférieure à 5 mA, ou circuit de charge dédié |
| Autonomie sans soleil | 3 semaines |

## 3. Alternatives radio

| Solution | Licence | Contenu | Portée urbaine | Relayage | Autonomie | Rôle vis-à-vis de BlackOUT |
| --- | --- | --- | --- | --- | --- | --- |
| LoRa 868 sous Meshtastic | aucune | texte court chiffré | 0,3 à 2 km au sol, davantage via relais | maillage automatique | semaines à mois | socle du projet |
| PMR446 | aucune | voix | 0,5 à 2 km | aucun | heures | complément naturel pour la voix de proximité |
| CB 27 MHz | aucune | voix | quelques km | aucun | heures | antennes encombrantes, peu adapté au piéton |
| Radioamateur VHF et UHF | licence, examen ANFR | voix, données, APRS, Winlink | ville entière via relais associatifs | relais existants | variable | ressource majeure pour sortir de la ville, mais chiffrement interdit |
| LoRaWAN et réseaux communautaires | aucune | télémétrie | dépend des passerelles | non | — | exige une liaison Internet, donc hors sujet ici |
| Messagerie satellite | abonnement | texte | mondiale | non | jours | fiable mais individuelle et payante |
| Téléphone satellite | abonnement | voix | mondiale | non | jours | pour une cellule de crise, pas pour la population |

Lecture : Meshtastic est la seule solution qui cumule absence de licence, faible consommation, relayage automatique, chiffrement du contenu et coût unitaire faible. Elle ne transporte pas la voix, ce que PMR446 fait bien sur quelques centaines de mètres : les deux sont complémentaires et non concurrents. Le radioamateur est la ressource à mobiliser pour la liaison vers l'extérieur du bassin de vie, en s'appuyant sur le réseau associatif local plutôt qu'en cherchant à le recréer.

Une combinaison réaliste : Meshtastic pour la coordination écrite entre points de contact à l'échelle de la ville, PMR446 pour la voix immédiate au sein d'un quartier ou d'une équipe, et un contact radioamateur identifié pour la liaison longue distance.

## 4. Articulation avec les dispositifs officiels

BlackOUT ne remplace ni FR-ALERT, ni les sirènes, ni les moyens des services de secours. Sa place naturelle est celle d'un moyen de liaison interne entre volontaires et points de contact, typiquement dans le cadre d'une réserve communale de sécurité civile et en cohérence avec le plan communal de sauvegarde. Le dire explicitement dès le premier contact avec la mairie évite la confusion avec un dispositif d'alerte à la population, et facilite considérablement l'obtention d'un accord d'installation sur un bâtiment public, qui est souvent le meilleur point haut disponible.

## 5. Ce qui reste à trancher

Le modèle précis d'antenne, qui dépend de la hauteur réelle du site retenu et du profil du terrain autour. Le choix entre boîtier au pied de l'antenne et coaxial descendant, qui dépend de l'accessibilité du site pour la maintenance. Le fournisseur du bloc batterie, qui doit être sélectionné sur la spécification de coupure basse température et non sur le prix.
