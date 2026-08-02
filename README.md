# BlackOUT

Réseau de communication texte résilient, hors infrastructure, à l'échelle d'une ville.

Objectif : conserver un lien de messagerie de proximité quand les réseaux mobiles et Internet sont indisponibles (coupure électrique prolongée, panne opérateur, saturation lors d'un événement majeur). Ce dépôt rassemble les notes techniques, les choix d'architecture et les procédures de déploiement du projet.

Ce système est un complément, pas un substitut aux moyens d'alerte et de secours officiels.

## Documents du dépôt

| Document | Contenu |
| --- | --- |
| [dimensionnement-maillage.md](dimensionnement-maillage.md) | combien de nœuds, où les placer, et jusqu'où le canal tient |
| [materiel-premiers-noeuds.md](materiel-premiers-noeuds.md) | choix des deux premiers nœuds et du relais de toiture |
| [antennes-energie-alternatives.md](antennes-energie-alternatives.md) | antennes, alimentation solaire, comparaison avec les autres solutions radio |
| [JOURNAL.md](JOURNAL.md) | journal de bord du projet |

## 1. Principe retenu

Radio LoRa dans la bande 868 MHz, pilotée par le firmware Meshtastic. Chaque nœud relaie les messages des autres par inondation contrôlée, avec 3 sauts par défaut et 7 au maximum. Aucune infrastructure, aucun abonnement, aucune licence : le réseau tient debout tant que les nœuds sont alimentés. Les messages sont chiffrés (AES256) sur un canal privé ; en revanche les en-têtes ne le sont pas, donc les métadonnées restent observables par un tiers à l'écoute de la bande.

## 2. Cadre réglementaire (région EU_868)

| Paramètre | Valeur |
| --- | --- |
| Bande utilisée | 869,40 à 869,65 MHz |
| Puissance maximale | +27 dBm ERP |
| Rapport cyclique | 10 % par heure glissante, recalculé chaque minute |
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

L'arbitrage des deux premiers nœuds et du relais de toiture est instruit dans materiel-premiers-noeuds.md.

## 6. Alimentation solaire

| Poste | Cible retenue |
| --- | --- |
| Consommation d'un relais nRF52840 | 15 à 30 mA, soit 2 à 3 Wh par jour |
| Panneau | 15 à 20 W crête, plein sud, inclinaison forte pour l'hiver |
| Batterie | LiFePO4 12,8 V, 7 à 10 Ah, soit environ 60 Wh utiles |
| Protection de charge | coupure basse température obligatoire |
| Régulateur | consommation propre inférieure à 5 mA, ou circuit de charge dédié |
| Autonomie sans soleil | 3 semaines |

En décembre sous nos latitudes, la récolte tombe à environ une heure d'équivalent plein soleil par jour : le panneau doit être largement surdimensionné par rapport au calcul d'été. Le calcul strict donne 4,3 W crête, ce qui ne laisse aucune marge pour la salissure, la neige, un ombrage partiel ou une série de jours blancs : d'où la révision de 5-10 W à 15-20 W crête.

Point de vigilance corrigé : aucune chimie lithium ne se charge sans dommage sous 0 °C, LiFePO4 compris. La protection efficace est un circuit de coupure de charge basse température, et non le choix de la chimie. Le LiFePO4 reste préférable, mais pour d'autres raisons : meilleure tolérance à la chaleur d'un boîtier exposé, durée de vie en cycles supérieure, sécurité thermique plus favorable, et présence quasi systématique de cette coupure sur les blocs du commerce.

Les émissions à 22 dBm tirent une centaine de milliampères mais sur des salves très brèves : leur contribution au bilan énergétique reste marginale. C'est la veille de réception qui consomme.

Détail des calculs et arbitrage MPPT dans antennes-energie-alternatives.md.

## 7. Configuration de référence

| Réglage | Valeur |
| --- | --- |
| Région | EU_868 |
| Préréglage modem | LONG_FAST |
| Nombre de sauts | 3 |
| Puissance d'émission | 0 (maximum légal automatique) |
| Canal | privé, clé AES256 dédiée |
| Rôle des terminaux | CLIENT |
| Rôle des appareils secondaires d'une même personne | CLIENT_MUTE |
| Rôle du nœud domicile bien placé | CLIENT_BASE, nœuds personnels en favoris |
| Rôle d'un relais sur point haut dominant la ville | ROUTER |
| Rôle d'un relais comblant un creux | ROUTER_LATE |
| Contournement du rapport cyclique | désactivé |
| Économie d'énergie | activée |
| Gain de réception amélioré (SX126x) | activé sur les nœuds fixes |
| GPS sur nœud fixe | désactivé, position saisie en dur |
| Écran | éteint ou carte sans écran |

Correction par rapport aux premières notes : un nœud de toiture ordinaire ne doit pas être configuré en ROUTER ni en ROUTER_LATE. Ces rôles réémettent systématiquement tout ce qu'ils entendent et préemptent les autres nœuds ; mal placés, ils consomment les sauts avant qu'un site réellement dominant ne soit atteint, créent des liaisons asymétriques et augmentent les collisions. Le rôle prévu pour une toiture est CLIENT_BASE. Le rôle REPEATER est déprécié depuis le firmware 2.7.11.

Les intervalles de télémétrie et de position sont espacés bien au-delà des valeurs par défaut de 30 et 15 minutes : c'est la principale variable d'ajustement de la capacité du réseau. Attention : sur le rôle ROUTER, l'économie d'énergie coupe le Bluetooth. Prévoir un canal d'administration pour la maintenance à distance avant de sceller un boîtier en toiture.

## 8. Limites connues

Le transport est limité à du texte court, au plus 237 octets utiles par paquet : pas de voix, pas d'image, pas d'accès Internet. La latence se compte en secondes, voire en dizaines de secondes sur plusieurs sauts. Les en-têtes de paquets circulent en clair, donc le graphe des échanges reste observable même si le contenu est chiffré. Enfin, un réseau à deux nœuds n'est pas un maillage : l'utilité réelle croît avec le nombre de participants, ce qui fait de la dimension humaine le principal facteur de réussite du projet.

S'y ajoute une limite de capacité, établie depuis : le canal est unique et partagé, et avec les intervalles par défaut une soixantaine de nœuds suffit à le saturer avant même le premier message utile. Avec des réglages disciplinés, l'ordre de grandeur soutenable est de 100 à 200 nœuds pour la ville, soit un nœud pour 100 à 200 habitants, et de l'ordre de 150 messages par heure pour l'ensemble du réseau. BlackOUT est donc un réseau de points de contact entre référents, et non une messagerie grand public. Le calcul figure dans dimensionnement-maillage.md.

## 9. Feuille de route

| Étape | Statut |
| --- | --- |
| Dimensionnement du maillage à l'échelle de la ville | fait |
| Choix du matériel des deux premiers nœuds | fait |
| Instruction des antennes, de l'énergie et des alternatives radio | fait |
| Commande des deux premiers nœuds | à faire |
| Tests de portée au sol dans le quartier | à faire |
| Repérage des points hauts exploitables | à faire |
| Prise de contact avec la commune pour un point haut | à faire |
| Construction du relais solaire de toiture | à faire |
| Cartographie de la couverture obtenue | à faire |
| Recherche d'une communauté Meshtastic locale déjà active | à faire |
| Rédaction des procédures d'usage en cas de coupure | à faire |

## 10. Questions encore ouvertes

Le modèle précis d'antenne et la stratégie de placement, qui dépendent du repérage de terrain. Le comportement réel du canal en situation de crise, quand le trafic utile explose au moment même où la discipline des réglages se relâche. La segmentation par créneaux de fréquence si la ville dépasse la capacité d'un maillage unique. L'articulation concrète avec la commune et sa réserve de sécurité civile, qui conditionne l'accès aux meilleurs points hauts.

## Sources

Documentation et blog officiels Meshtastic : réglages radio, configuration LoRa, configuration des appareils, algorithme de diffusion, choix des rôles, matériel supporté et tests de portée.

https://meshtastic.org/docs/overview/radio-settings/

https://meshtastic.org/docs/configuration/radio/lora/

https://meshtastic.org/docs/configuration/radio/device/

https://meshtastic.org/docs/overview/mesh-algo/

https://meshtastic.org/docs/hardware/devices/

https://meshtastic.org/docs/overview/range-tests/

https://meshtastic.org/blog/choosing-the-right-device-role/

https://meshtastic.org/blog/demystifying-router-late/
