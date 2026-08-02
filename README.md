# BlackOUT

Réseau de communication texte résilient, hors infrastructure, à l'échelle d'une ville.

Objectif : conserver un lien de messagerie de proximité quand les réseaux mobiles et Internet sont indisponibles (coupure électrique prolongée, panne opérateur, saturation lors d'un événement majeur). Ce dépôt rassemble les notes techniques, les choix d'architecture et les procédures de déploiement du projet.

Ce système est un complément, pas un substitut aux moyens d'alerte et de secours officiels.

## 1. Principe retenu

Radio LoRa dans la bande 868 MHz, pilotée par le firmware Meshtastic. Chaque nœud relaie les messages des autres par inondation contrôlée, avec 3 sauts par défaut et 7 au maximum. Aucune infrastructure, aucun abonnement, aucune licence : le réseau tient debout tant que les nœuds sont alimentés. Les messages sont chiffrés (AES256) sur un canal privé ; en revanche les en-têtes ne le sont pas, donc les métadonnées restent observables par un tiers à l'écoute de la bande.

## 2. Cadre réglementaire (région EU_868)

| Paramètre | Valeur |
| --- | --- |
| Bande utilisée | 869,40 à 869,65 MHz |
| Puissance maximale | +27 dBm ERP |
| Rapport cyclique | 10 % par heure glissante |
| Licence requise | aucune (bande ISM) |

Le firmware coupe l'émission de lui-même lorsque le quota horaire est atteint. Le paramètre de contournement du rapport cyclique doit rester désactivé.

## 3. Compromis portée / débit

Valeurs Meshtastic pour 22 dBm et une antenne 0 dB. Tous les nœuds du maillage doivent partager le même préréglage pour se voir.

| Préréglage | Débit | Bilan de liaison |
| --- | --- | --- |
| SHORT_FAST | 10,94 kbps | 143 dB |
| MEDIUM_FAST | 3,52 kbps | 148 dB |
| LONG_FAST (retenu) | 1,07 kbps | 153 dB |
| LONG_MODERATE | 0,34 kbps | 156 dB |
| LONG_SLOW | 0,18 kbps | 158,5 dB |

LONG_FAST est retenu comme compromis. Descendre plus bas gagne 3 à 5 dB de portée mais augmente fortement le temps d'antenne, ce qui sature le canal et consomme le quota de 10 % dès qu'il y a plusieurs nœuds actifs.

## 4. Portée réelle attendue en ville

Les records publiés par le projet, jusqu'à 331 km au sol, sont obtenus en ligne de vue dégagée entre sommets et ne sont pas transposables. En milieu urbain, au niveau de la rue et avec l'antenne d'origine, il faut compter de quelques centaines de mètres à 2 km. Le facteur déterminant n'est pas la puissance mais la hauteur : un seul nœud bien placé en toiture, avec une antenne colinéaire correcte et un câble court, peut couvrir une grande partie d'une ville moyenne et servir de colonne vertébrale au maillage.

## 5. Matériel

| Plateforme | Radio | Consommation | Usage visé |
| --- | --- | --- | --- |
| nRF52840 | SX1262 / LR11xx | très basse | terminaux portables et relais solaires |
| ESP32-S3 | SX1262 | élevée | nœuds sur secteur, passerelles Wi-Fi ou MQTT |

Préférer les puces SX126x ou LR11xx aux anciennes SX127x. Cartes envisagées : Seeed Card Tracker T1000-E, Heltec Mesh Node T114, RAK4631 sur base WisBlock, Seeed Wio Tracker L1, Nano G2 Ultra. Pour un relais extérieur prêt à l'emploi : Seeed SenseCAP Solar Node (nRF52840, SX1262, panneau 5 W, quatre emplacements 18650, boîtier et supports fournis).

## 6. Alimentation solaire

| Poste | Cible retenue |
| --- | --- |
| Consommation d'un relais nRF52840 | 15 à 30 mA, soit 2 à 3 Wh par jour |
| Panneau | 5 à 10 W crête, plein sud, inclinaison forte pour l'hiver |
| Batterie | 30 à 60 Wh utiles |
| Chimie | LiFePO4 de préférence |
| Autonomie sans soleil | 2 à 3 semaines |

En décembre sous nos latitudes, la récolte tombe à environ une heure d'équivalent plein soleil par jour : le panneau doit être largement surdimensionné par rapport au calcul d'été.

Point de vigilance : les cellules lithium-ion classiques ne doivent pas être chargées en dessous de 0 °C, sous peine de dégradation rapide et de risque réel. Utiliser soit un contrôleur de charge avec coupure basse température, soit du LiFePO4, qui supporte mieux le froid, la chaleur en boîtier exposé et les cycles longs.

Les émissions à 22 dBm tirent une centaine de milliampères mais sur des salves très brèves : leur contribution au bilan énergétique reste marginale.

## 7. Configuration de référence

| Réglage | Valeur |
| --- | --- |
| Région | EU_868 |
| Préréglage modem | LONG_FAST |
| Nombre de sauts | 3 |
| Puissance d'émission | 0 (maximum légal automatique) |
| Canal | privé, clé AES256 dédiée |
| Rôle des terminaux | CLIENT |
| Rôle du nœud domicile bien placé | CLIENT_BASE |
| Rôle du relais en hauteur | ROUTER ou ROUTER_LATE |
| Contournement du rapport cyclique | désactivé |
| Économie d'énergie | activée |
| GPS sur nœud fixe | désactivé, position saisie en dur |
| Écran | éteint ou carte sans écran |

Les intervalles de télémétrie et de position sont espacés au-delà des valeurs par défaut de 30 et 15 minutes. Attention : sur le rôle ROUTER, l'économie d'énergie coupe le Bluetooth. Prévoir un canal d'administration pour la maintenance à distance avant de sceller un boîtier en toiture.

## 8. Limites connues

Le transport est limité à du texte court, environ 200 octets utiles par paquet : pas de voix, pas d'image, pas d'accès Internet. La latence se compte en secondes, voire en dizaines de secondes sur plusieurs sauts. Les en-têtes de paquets circulent en clair, donc le graphe des échanges reste observable même si le contenu est chiffré. Enfin, un réseau à deux nœuds n'est pas un maillage : l'utilité réelle croît avec le nombre de participants, ce qui fait de la dimension humaine le principal facteur de réussite du projet.

## 9. Feuille de route

| Étape | Statut |
| --- | --- |
| Choix du matériel des deux premiers nœuds | à faire |
| Tests de portée au sol dans le quartier | à faire |
| Repérage des points hauts exploitables | à faire |
| Construction du relais solaire de toiture | à faire |
| Cartographie de la couverture obtenue | à faire |
| Recherche d'une communauté Meshtastic locale déjà active | à faire |
| Rédaction des procédures d'usage en cas de coupure | à faire |

## 10. Pistes à comparer

Antennes et stratégie de placement en hauteur, schéma d'alimentation LiFePO4 avec régulateur MPPT, et comparaison avec les alternatives radio de type PMR446 ou radioamateur.

## Sources

Documentation officielle Meshtastic : réglages radio, configuration LoRa, rôles des appareils, matériel supporté et tests de portée.

https://meshtastic.org/docs/overview/radio-settings/

https://meshtastic.org/docs/configuration/radio/lora/

https://meshtastic.org/docs/configuration/radio/device/

https://meshtastic.org/docs/hardware/devices/

https://meshtastic.org/docs/overview/range-tests/
