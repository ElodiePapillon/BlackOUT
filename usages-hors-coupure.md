# Dix usages hors coupure

Un réseau qui ne sert qu'en crise ne sert pas en crise. Les batteries se sulfatent,
les boîtiers prennent l'eau sans qu'on le sache, les firmwares vieillissent, les
référents oublient la procédure, et le jour venu la moitié des nœuds ne répond pas.
L'usage courant n'est pas un bonus, c'est la condition de fiabilité du dispositif.

Il remplit quatre fonctions que rien d'autre ne remplit. Il maintient le matériel en
état et révèle les pannes avant qu'elles ne comptent. Il entretient les gestes des
référents. Il produit des données de portée réelle qui affinent le dimensionnement.
Et il donne au projet une légitimité auprès de la commune, qui finance plus volontiers
un outil utilisé toute l'année qu'une assurance dormante.

Les dix usages ci-dessous sont classés du plus immédiatement réalisable au plus
exigeant.

## 1. Couverture radio des événements publics

Courses à pied, brocantes, feux d'artifice, marchés de Noël : le réseau mobile sature
précisément quand plusieurs milliers de personnes se rassemblent, et les bénévoles se
retrouvent sans liaison. Les six nœuds mobiles et les points de regroupement suffisent
à relier les postes bénévoles, le PC course et les points de secours.

C'est l'usage à démarrer en premier : coût additionnel nul, bénéfice immédiat et
visible, et répétition grandeur nature de la chaîne complète, y compris l'affichage.

## 2. Coordination des battues et des recherches en zone blanche

Une recherche de personne disparée en forêt, en bord de rivière ou dans un secteur
sans couverture mobile mobilise des dizaines de personnes qui se perdent de vue. Les
nœuds mobiles avec GPS permettent à chaque équipe de signaler sa position et sa zone
ratissée au poste de commandement.

Usage à mener strictement en appui des services officiels et à leur demande, jamais
en initiative autonome. La position diffusée est celle des équipes de recherche, pas
celle de la personne recherchée.

## 3. Surveillance hydrologique et alerte crue

Un capteur de niveau sur un cours d'eau, un pluviomètre en amont, et le réseau
remonte une mesure toutes les heures vers la mairie, sans abonnement et sans
couverture mobile. En période de vigilance, la cadence passe au quart d'heure.

C'est l'usage qui justifie le mieux le dispositif auprès d'une commune exposée au
risque d'inondation, parce qu'il produit une valeur mesurable en dehors de tout
scénario de coupure.

## 4. Relevé des sites communaux isolés

Stations de pompage, réservoirs d'eau potable, locaux techniques, gymnases,
refuges, aires de déchets verts : autant de sites où la commune paie soit des
abonnements de télérelève, soit des tournées d'agents. Un nœud avec capteur remonte
le niveau d'une cuve, l'état d'une pompe ou l'ouverture d'une porte technique.

L'économie d'abonnements peut, seule, financer l'entretien annuel du parc.

## 5. Chaîne du froid et locaux sensibles

Chambre froide de la cuisine centrale, réfrigérateurs de la pharmacie ou de la
cantine scolaire, salle serveur de la mairie : un capteur de température qui alerte
hors ligne évite des pertes coûteuses et parfois sanitaires. Le réseau fonctionne
quand le Wi-Fi du bâtiment est tombé, ce qui est précisément le moment où l'alerte
compte.

## 6. Patrouilles et vigie feux de forêt

En période estivale à risque, les patrouilles de vigie couvrent des secteurs sans
réseau. Les nœuds mobiles leur donnent une liaison texte avec le poste, et les points
hauts déjà équipés servent de relais. L'usage est saisonnier, intense, et il teste le
maillage dans les conditions les plus difficiles : chaleur, distance, terrain.

## 7. Stations météo et qualité de l'air de quartier

Quelques capteurs de température, d'humidité et de particules répartis dans la ville
alimentent un tableau public. L'intérêt n'est pas seulement scientifique : c'est un
usage visible par les habitants, qui rend le réseau concret et crée la familiarité
nécessaire pour que l'affichage de crise soit compris le jour venu.

Attention à la charge : la télémétrie est précisément ce qui sature un maillage. Une
mesure toutes les heures par capteur, pas davantage, et jamais plus de dix capteurs.

## 8. Liaison des chantiers et des interventions techniques

Interventions sur réseau d'eau, travaux en sous-sol, parkings souterrains, tunnels
techniques : autant d'endroits où le mobile ne passe pas. Une liaison texte entre
l'équipe en fouille et la surface ne remplace pas la radio de chantier, mais elle
coexiste avec elle et couvre les cas où la radio ne porte plus.

## 9. Support pédagogique et médiation

Ateliers en médiathèque, club au collège, initiation à la radio et à la
cryptographie, cartographie collaborative de la couverture. C'est le plus sûr moyen
de constituer la réserve de bénévoles dont le dispositif a besoin, et de former des
remplaçants avant que les titulaires ne se lassent.

Un réseau maintenu par trois passionnés meurt avec leur déménagement. Un réseau qui
passe par une médiathèque se renouvelle.

## 10. Exercices du plan communal de sauvegarde

Deux fois par an, le réseau sert de support à un exercice complet : déclenchement,
relève des points, synthèse, affichage, mode dégradé imposé. C'est l'usage le moins
spectaculaire et le plus utile, parce que c'est le seul qui teste la chaîne humaine
entière et pas seulement la radio.

Un exercice annuel minimum, avec au moins une panne simulée non annoncée : perte de
la passerelle, ou d'un relais d'ossature.

## Synthèse

| # | Usage | Entretient quoi | Charge du canal | Coût supplémentaire |
|---|---|---|---|---|
| 1 | Événements publics | la chaîne humaine entière | ponctuelle, forte | nul |
| 2 | Battues et recherches | les mobiles et le GPS | ponctuelle, forte | nul |
| 3 | Surveillance hydrologique | les relais et l'autonomie | faible, continue | 2 capteurs, 200 € |
| 4 | Sites communaux isolés | les nœuds fixes et l'étanchéité | faible, continue | 1 nœud par site |
| 5 | Chaîne du froid | l'alerte et l'astreinte | très faible | 50 € par capteur |
| 6 | Vigie feux de forêt | la portée en conditions dures | saisonnière | nul |
| 7 | Météo de quartier | la visibilité publique | faible mais à surveiller | 40 € par capteur |
| 8 | Chantiers et sous-sols | les mobiles | ponctuelle | nul |
| 9 | Pédagogie et médiation | la relève des bénévoles | nulle | temps |
| 10 | Exercices du plan communal | tout, y compris les modes dégradés | ponctuelle, forte | 400 € par an |

## Règles à ne pas enfreindre

La capacité réservée aux ressources reste prioritaire. Tout usage courant est
suspendu dès le déclenchement du profil de crise, sans discussion et sans exception.
Les capteurs permanents doivent pouvoir être coupés à distance en une seule opération.

La télémétrie est le principal danger. C'est elle qui sature un maillage, et les
usages 3, 4, 5 et 7 en produisent par construction. Plafond retenu : quinze capteurs
permanents au total, une mesure par heure chacun, ce qui représente environ 2 % de
charge supplémentaire. Au-delà, on ne rajoute pas de capteurs, on allonge les
intervalles.

Aucun usage de suivi de personnes. Ni horaires d'agents, ni présence, ni
déplacements individuels. La position n'est diffusée que par des équipes en mission,
pendant la mission, et à leur initiative. Cette ligne n'est pas négociable : un
réseau d'entraide qui devient un outil de surveillance perd en une fois la confiance
qui le rend utile.

Aucune donnée personnelle, en toute circonstance, quel que soit l'usage. La règle
vaut aussi pour les ateliers pédagogiques, où la tentation de faire une démonstration
avec de vraies données est forte.

Le rapport cyclique de 1 % sur la bande 868 MHz s'applique identiquement hors crise.
Un usage courant mal calibré peut consommer le quota et laisser le réseau muet au
mauvais moment.

## Par où commencer

Trois usages à lancer dans l'ordre, sans attendre le déploiement complet.

Le premier est la couverture d'un événement public, dès le palier 1. Il ne coûte
rien, il se voit, et il révèle en une journée ce que six mois d'étude ne montrent pas.

Le deuxième est un capteur hydrologique ou un site communal isolé, dès le palier 2.
C'est l'usage qui donne au dispositif une utilité chiffrable pour la commune, et donc
un argument budgétaire.

Le troisième est l'exercice annuel, dès que le palier 2 est en service. Il est le
seul à tester la chaîne humaine, qui reste le point faible du projet, très loin
devant la radio.
