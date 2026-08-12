# Matériel : deux premiers nœuds et relais de toiture

Document de travail complémentaire au README. Il tranche l'étape 1 de la feuille de route.

## Réponse courte

Pour qui pose la question sans lire la suite : deux modèles, un mobile et un fixe, plus un relais solaire.

| Rôle | Modèle | Ce qu'il apporte |
| --- | --- | --- |
| Balise mobile de test, puis terminal personnel | **Seeed Wio Tracker L1, variante Pro** | nRF52840, SX1262, GPS multi-constellations L76K, écran OLED 1,3 pouce, boîtier et batterie intégrés. Seule variante de la série prête à l'emploi : c'est elle qui sert à marcher la ville et à mesurer la portée réelle. |
| Balise fixe du domicile, préfiguration du relais | **Heltec Mesh Node T114, révision 2.0** | nRF52840, SX1262, connecteur d'antenne externe, écran et GPS en option. C'est le nœud du point le plus haut du logement. |
| Relais solaire de toiture | **Seeed SenseCAP Solar Node, version P1 Pro** | nRF52840, SX1262, panneau 5 W, connecteur RP-SMA, quatre accus 18650 et module GPS inclus. La version P1, moins chère, est livrée sans accus. |

Les trois modèles figurent sur la liste officielle du matériel supporté par Meshtastic et disposent d'un entrepôt européen. Vérifications faites le 13 août 2026 sur cette liste et sur les fiches produits des fabricants.

## 1. Ce que doivent faire les deux premiers nœuds

Trois fonctions, dans cet ordre. Valider la chaîne complète : flash du firmware, réglage de la région, création du canal privé chiffré, appairage à l'application, échange d'un premier message. Mesurer la portée réelle du quartier, ce qui suppose un GPS et un journal de mesures exploitable. Rester utiles ensuite, une fois le maillage constitué, l'un comme terminal personnel, l'autre comme nœud fixe du domicile.

## 2. Critères d'arbitrage

| Critère | Exigence | Raison |
| --- | --- | --- |
| Puce radio | SX1262, LR1110 ou LR1121 | meilleure sensibilité et détection d'activité canal fiable |
| Microcontrôleur | nRF52840 pour tout ce qui fonctionne sur batterie | l'ESP32 consomme un ordre de grandeur de plus |
| Connecteur d'antenne externe | indispensable côté fixe | l'antenne et sa hauteur pilotent la portée, pas la puissance |
| GPS | indispensable sur le nœud mobile de test | sans position, les mesures de portée ne valent rien |
| Écran | souhaitable pendant la phase de test | lire SNR, RSSI et ChUtil sans téléphone |
| Boîtier et batterie | intégrés de préférence | on veut mesurer, pas bricoler |

## 3. Bande : pourquoi 868 et non 433

L'idée de descendre en fréquence pour gagner en portée est juste sur le principe mais fausse dans ce cadre réglementaire. En EU_433, la puissance autorisée tombe à 10 dBm contre 27 dBm en EU_868, soit 17 dB perdus, alors que le gain de propagation dû à la fréquence plus basse ne représente qu'environ 6 dB. Le bilan net est nettement défavorable au 433 MHz, sans compter l'encombrement de la bande et la taille des antennes. Le 868 MHz reste le bon choix. Descendre réellement en fréquence supposerait un cadre radioamateur, avec licence et sans chiffrement : c'est un autre projet, traité dans le document sur les alternatives.

## 4. Arbitrage retenu

### Nœud A, mobile de test puis terminal personnel

Retenu : **Seeed Wio Tracker L1, variante Pro**. nRF52840 associé à un SX1262, GPS multi-constellations L76K, écran OLED 1,3 pouce, batterie et boîtier fournis. Il permet de marcher la ville en journalisant les positions et la qualité de liaison.

La variante compte : les versions L1 Lite, L1 et L1 e-ink sont des cartes nues, sans boîtier ni batterie. Seule la Pro est prête à l'emploi, et c'est ce qu'on veut pour arpenter la ville.

Correction du 13 août 2026 : une version antérieure de ce document annonçait un LR1110 sur cette carte. C'est faux, le Wio Tracker L1 embarque un SX1262. Le LR1110 équipe le SenseCAP Card Tracker T1000-E et les ThinkNode M3 et M4 d'Elecrow. Le critère d'arbitrage reste satisfait, mais l'argument du gain de réception amélioré propre aux LR11xx ne s'applique pas ici et a été retiré du tableau des critères.

Solution de repli si le budget le permet : Nano G2 Ultra, nRF52840 et SX1262, antenne externe, GPS et écran, mieux fini mais nettement plus cher.

### Nœud B, nœud fixe du domicile et préfiguration du relais

Retenu : **Heltec Mesh Node T114, révision 2.0**. nRF52840 associé à un SX1262, connecteur d'antenne externe, écran 1,14 pouce et GPS proposés en option, entrée batterie et entrée panneau solaire. Rôle CLIENT_BASE, antenne colinéaire placée au point le plus haut accessible du logement.

C'est la carte nRF52840 à antenne externe la moins chère : si elle est finalement mal placée ou remplacée, la perte est faible.

À la commande, trois choix ne sont pas cochés par défaut : la bande, l'écran et le GPS. Cocher **863-870 MHz**, prendre l'écran, et prendre le GPS si ce nœud doit pouvoir servir de second mobile.

### Connecteurs d'antenne et adaptateurs

Point à ne pas manquer, il fait rater une commande sur deux. Le Wio Tracker L1 et le Mesh Node T114 sortent tous les deux en **U.FL/IPEX**, pas en SMA. Toute antenne extérieure suppose donc une queue de cochon U.FL vers SMA, à commander en même temps que les cartes : sans elle, l'antenne colinéaire reste inutilisable.

Le SenseCAP Solar Node fait exception : il est en **RP-SMA** et livré avec une antenne 2 dBi. Monter une colinéaire du commerce, en SMA, demande là aussi un adaptateur.

### Matériel écarté

| Matériel | Raison de l'écart |
| --- | --- |
| Cartes à SX1276 ou RF95 (Heltec V2, anciens TTGO) | sensibilité et détection d'activité canal inférieures |
| ESP32 sur batterie (Heltec V3, T-Beam) | consommation incompatible avec un fonctionnement solaire durable ; à réserver aux nœuds sur secteur et aux passerelles |
| RAK4631 sur base WisBlock | excellent, mais demande assemblage et boîtier ; gardé pour le relais sur mesure |
| Cartes 433 MHz | voir le point 3 |

## 5. Relais solaire de toiture

Deux voies possibles, et il n'y a pas lieu de choisir la même pour le premier relais et pour les relais définitifs.

### Voie A, clé en main

**Seeed SenseCAP Solar Node** : nRF52840 et SX1262, panneau 5 W, quatre emplacements 18650, boîtier étanche, supports de fixation, antenne 2 dBi et connecteur RP-SMA. On installe en une après-midi.

Deux versions, et la différence n'est pas cosmétique. La **P1** est livrée sans accus. La **P1 Pro** comprend quatre accus 18650 de 3 350 mAh et un module GPS. Acheter quatre accus de qualité séparément coûte à peu près l'écart de prix : prendre la P1 Pro.

Réserve importante, toujours d'actualité : les cellules 18650 sont du lithium-ion classique, dont la charge est à proscrire sous 0 °C. Vérification faite le 13 août 2026, ni la fiche Meshtastic ni la fiche produit ne mentionnent de coupure de charge basse température. La question doit être posée au support de Seeed avant la commande. Si la coupure existe, l'autonomie hivernale sera amputée pendant les périodes de gel, ce qui reste acceptable avec une batterie dimensionnée large. Si elle n'existe pas, la batterie se dégradera vite et il faudra passer à des accus mieux adaptés au froid.

### Voie B, sur mesure

RAK4631 ou Heltec T114 dans un boîtier IP66, batterie LiFePO4 12 V, régulateur solaire à très faible consommation propre, convertisseur 12 V vers 5 V, panneau largement surdimensionné, antenne colinéaire séparée et parafoudre coaxial. Maîtrise complète, batterie plus tolérante à la chaleur d'un boîtier exposé et à des cycles longs, éléments remplaçables un par un. En contrepartie : temps de fabrication et étanchéité à réussir, notamment au passage de câble.

### Choix retenu

Voie A pour le premier relais, afin d'apprendre vite et de disposer rapidement d'un point haut réel. Voie B pour les relais d'ossature définitifs, une fois les emplacements validés par la cartographie de couverture.

## 6. Budget indicatif

Prix relevés le 13 août 2026 sur les boutiques des fabricants, en dollars, hors taxes, port et droits de douane. Les deux fabricants disposent d'un entrepôt européen, ce qui réduit délais et douane. Ces prix varient fortement : les revérifier au moment de commander.

| Poste | Ordre de grandeur |
| --- | --- |
| Nœud A, Wio Tracker L1 Pro (boîtier et batterie inclus) | 48 dollars, contre 31 dollars pour la carte nue |
| Nœud B, Mesh Node T114 rev. 2.0 | 18 à 34 dollars selon les options retenues |
| Queues de cochon U.FL vers SMA, une par nœud | 10 à 20 euros les deux |
| Antenne colinéaire 868 MHz, 5 à 6 dBi | 25 à 60 euros |
| Câble faible perte et adaptateurs | 20 à 40 euros |
| Parafoudre coaxial | 20 à 40 euros |
| Relais clé en main, SenseCAP Solar Node P1 Pro | 94 dollars, contre 73 dollars pour la P1 sans accus |
| Relais sur mesure, voie B | 200 à 350 euros |

Palier 0, les deux premiers nœuds, leurs adaptateurs et une antenne : de l'ordre de 150 à 250 euros. Palier 1, ossature de trois relais : de l'ordre de 700 à 1 200 euros. Ces montants situent d'emblée le projet dans le champ d'un financement collectif ou d'un soutien communal, pas d'un achat individuel.

## 7. À vérifier avant toute commande

| Point | Pourquoi |
| --- | --- |
| Bande 863-870 MHz explicitement sélectionnée | le T114 est aussi vendu en 433, 470-510 et 902-928 MHz ; une carte 915 est inutilisable ici |
| Options écran et GPS du T114 | elles ne sont pas incluses par défaut |
| Variante Pro pour le Wio Tracker L1 | les autres variantes sont des cartes nues, sans boîtier ni batterie |
| Version P1 Pro pour le Solar Node | la P1 est livrée sans accus |
| Queues de cochon U.FL vers SMA commandées avec les cartes | les deux nœuds sortent en U.FL, pas en SMA |
| Coupure de charge basse température du Solar Node | durée de vie de la batterie en hiver ; question à poser au support avant commande |
| Carte officiellement supportée par le firmware, et version minimale requise | éviter une carte orpheline |
| Disponibilité en entrepôt européen | délais et douane |
| Possibilité d'un canal d'administration à distance | indispensable avant de sceller un boîtier en toiture |

## 8. Ce que ce document ne tranche pas

Le modèle exact d'antenne, traité dans le document sur les antennes et l'énergie. Le nombre final de relais, qui dépend du repérage. Le choix des accus du relais solaire, qui dépend de la réponse du fabricant sur la charge par temps froid. Le choix entre achat groupé et acquisition progressive, qui relève de l'organisation du collectif plutôt que de la technique.
