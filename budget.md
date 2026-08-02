# Budget du dispositif

Chiffrage complet des 50 nœuds, de la chaîne d'agrégation et de l'exploitation. Les
montants sont en euros toutes taxes comprises, aux ordres de grandeur constatés
auprès de revendeurs européens. **Ce sont des estimations de cadrage, pas des devis.**
La vérification des prix réels figure déjà à la feuille de route et doit être faite
avant tout engagement.

## 1. Périmètre et hypothèses

Le chiffrage couvre le matériel, l'outillage, la chaîne d'affichage et le
fonctionnement annuel. Il ne couvre pas les travaux de bâtiment, les autorisations
d'occupation de toiture, ni la valorisation du temps bénévole, qui fait l'objet d'une
section séparée parce qu'il ne s'agit pas d'un décaissement.

Trois hypothèses structurent les chiffres. Les relais d'ossature sont achetés en
solution solaire prête à l'emploi plutôt que construits sur mesure, pour aller vite
et limiter les aléas. Les points de ressource utilisent une carte simple avec antenne
extérieure et alimentation rechargeable, sans solaire. Les postes de commandement
comprennent un petit ordinateur et une alimentation secourue, puisque c'est là que se
tient le tableau de bord.

## 2. Coût unitaire par type de nœud

| Type | Composition | Coût unitaire |
|---|---|---|
| Relais d'ossature solaire | nœud solaire prêt à l'emploi 250 €, antenne colinéaire 60 €, câble faible perte 40 €, fixations et mât 50 € | **400 €** |
| Point de ressource fixe | carte nRF52840 45 €, antenne extérieure 25 €, câble et adaptateur 15 €, boîtier étanche 20 €, batterie tampon 25 € | **130 €** |
| Poste de commandement | nœud 130 €, petit ordinateur 120 €, alimentation secourue 150 € | **400 €** |
| Nœud mobile | carte portable avec écran et GPS, batterie interne | **55 €** |

Le rapport de un à sept entre un nœud mobile et un relais d'ossature est normal : ce
qui coûte, ce n'est pas la radio, c'est l'autonomie énergétique et la hauteur.

## 3. Investissement matériel des 50 nœuds

| Fonction | Nombre | Prix unitaire | Total |
|---|---|---|---|
| Relais d'ossature en toiture | 6 | 400 € | 2 400 € |
| Points d'eau | 8 | 130 € | 1 040 € |
| Distribution alimentaire | 6 | 130 € | 780 € |
| Santé | 5 | 130 € | 650 € |
| Énergie | 4 | 130 € | 520 € |
| Points de regroupement de quartier | 8 | 130 € | 1 040 € |
| Postes de commandement et passerelle | 2 | 400 € | 800 € |
| Équipes mobiles | 6 | 55 € | 330 € |
| Liaisons extérieures et point haut | 2 | 400 € | 800 € |
| Réserve de remplacement | 3 | 130 € | 390 € |
| **Sous-total nœuds** | **50** | — | **8 750 €** |

## 4. Chaîne d'agrégation et d'affichage

C'est le maillon qui relie 50 nœuds à 20 000 habitants, et il coûte moins cher qu'on
ne le croit.

| Poste | Détail | Total |
|---|---|---|
| Impression | imprimante laser A3, toner de départ, rame de papier | 400 € |
| Panneaux d'affichage | 10 vitrines extérieures verrouillables, 120 € pièce | 1 200 € |
| Équipement des référents | chasubles, lampes frontales, carnets de relève | 300 € |
| **Sous-total** | | **1 900 €** |

## 5. Outillage, rechange et consommables

| Poste | Total |
|---|---|
| Analyseur d'antenne pour la mise au point | 150 € |
| Multimètre, outillage, connectique | 200 € |
| Lot de rechange : batteries, un panneau, connecteurs | 200 € |
| Étiquetage, scellés, marquage des boîtiers | 100 € |
| Clés de sauvegarde et support de stockage hors ligne | 150 € |
| **Sous-total** | **800 €** |

## 6. Mise en place et exercices, première année

| Poste | Total |
|---|---|
| Formation initiale, supports et logistique de salle | 500 € |
| Deux exercices grandeur nature la première année | 400 € |
| **Sous-total** | **900 €** |

## 7. Récapitulatif de l'investissement

| Poste | Montant |
|---|---|
| Les 50 nœuds | 8 750 € |
| Chaîne d'agrégation et d'affichage | 1 900 € |
| Outillage, rechange, consommables | 800 € |
| Mise en place et exercices, première année | 900 € |
| **Total investissement** | **12 350 €** |

L'ordre de grandeur à retenir est **12 000 à 13 000 €** pour un dispositif complet
couvrant une ville de 20 000 habitants.

## 8. Coût de fonctionnement annuel

| Poste | Montant |
|---|---|
| Remplacement des batteries, un cinquième du parc par an | 250 € |
| Casse, vol et vandalisme, provision de 5 % | 450 € |
| Consommables d'affichage, papier et toner | 150 € |
| Deux exercices annuels | 400 € |
| **Total annuel** | **1 250 €** |

Soit environ 10 % de l'investissement par an, ce qui est le ratio habituel d'un parc
d'équipements extérieurs soumis aux intempéries.

## 9. Étalement par palier

Le dispositif n'a pas besoin d'être financé d'un coup. Les paliers définis dans le
dimensionnement donnent un échelonnement naturel, et chaque palier produit un
résultat vérifiable avant d'engager le suivant.

| Palier | Contenu | Coût | Cumul |
|---|---|---|---|
| Palier 0 | 2 nœuds de test et l'outillage de mesure | 550 € | 550 € |
| Palier 1 | 3 relais d'ossature, 1 poste de commandement, 5 points, 2 vitrines | 2 500 € | 3 050 € |
| Palier 2 | 3 relais, 10 points, 2 liaisons extérieures, second poste, impression | 4 600 € | 7 650 € |
| Palier 3 | solde des points, mobiles, réserve, formation, exercices | 4 700 € | 12 350 € |

Le palier 0 coûte moins de 600 € et répond à la seule question qui compte pour la
suite : quelle portée obtient-on réellement dans cette ville, avec ce matériel. Tant
que cette réponse n'est pas mesurée, tout le reste du budget est théorique.

## 10. Coût rapporté à la population

| Indicateur | Valeur |
|---|---|
| Investissement par habitant, une fois | 0,62 € |
| Fonctionnement par habitant et par an | 0,06 € |
| Investissement par nœud déployé | 247 € |
| Investissement par point de ressource desservi | 457 € |

Soixante-deux centimes par habitant, une seule fois. C'est l'ordre de grandeur d'un
panneau de signalisation routière, ou d'une journée de location de nacelle. Le coût
matériel n'est pas ce qui empêchera ce projet d'exister.

## 11. Le coût réel : le temps humain

Ce poste n'est pas un décaissement, mais l'ignorer serait malhonnête. C'est de loin
la ressource la plus rare du dispositif.

| Phase | Heures estimées |
|---|---|
| Étude, repérage des points hauts, tests de portée | 80 h |
| Montage, configuration et enrôlement des 50 nœuds | 120 h |
| Rédaction des procédures, registres et supports d'affichage | 40 h |
| Formation de la soixantaine de participants | 60 h |
| **Total de mise en place** | **300 h** |
| Entretien, exercices, tenue des registres | **120 h par an** |

Valorisé à 25 € de l'heure, cela représente environ 7 500 € pour la mise en place et
3 000 € par an ensuite, soit plus du double du budget matériel en régime annuel. Un
porteur qui ne dispose pas de ces heures n'a pas besoin de chercher un financement :
le projet ne tiendra pas.

## 12. Ce qui peut faire déraper le budget

| Risque | Effet | Parade |
|---|---|---|
| Pose en hauteur confiée à une entreprise | 500 à 900 € par journée de nacelle | grouper les poses, privilégier les toitures accessibles par escalier |
| Hausse ou rupture d'approvisionnement des cartes | 20 à 40 % sur le poste nœuds | commander par lots, conserver la réserve de trois |
| Vandalisme sur les vitrines d'affichage | 120 € par vitrine | modèles verrouillables, emplacements fréquentés |
| Assurance et responsabilité des installations | non chiffré à ce stade | à traiter avec la commune avant toute pose |
| Obsolescence à cinq ans | renouvellement partiel du parc | provisionner 10 % par an dès la première année |

## 13. Pistes de financement à instruire

Aucune n'est acquise et chacune suppose un dossier. Elles sont listées pour être
examinées avec la commune, pas pour être choisies ici : ligne sécurité civile du
budget communal, dotations d'équipement des collectivités, subventions régionales sur
la prévention des risques et la résilience, appels à projets de fondations, mécénat
d'entreprises locales, portage par une association support habilitée à recevoir des
dons.

Le montant en jeu, de l'ordre de 12 000 €, est modeste au regard des seuils de la
plupart de ces dispositifs. C'est plutôt favorable : un petit budget se décide vite.
C'est aussi un piège, parce qu'un petit budget mobilise moins d'attention et se
retrouve facilement dépriorisé.

## 14. Ce qui reste à trancher

Les prix réels chez un revendeur européen, qui conditionnent tout le tableau. Le
statut du porteur, commune ou association, qui détermine la récupération de la TVA et
donc jusqu'à 20 % du budget. La propriété du matériel et l'assurance des
installations en toiture. Enfin l'arbitrage entre relais prêt à l'emploi et relais
sur mesure : l'écart de prix est faible, l'écart de temps de montage ne l'est pas, et
c'est le temps qui manque.
