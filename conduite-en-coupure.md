# Conduite du réseau en cas de coupure prolongée

Ce document décrit comment on se sert réellement du réseau quand l'électricité est
coupée depuis plusieurs jours. Il part d'un constat simple : un maillage à 1 kbps
partagé entre 50 nœuds ne permet pas de fonctionner comme on fonctionne d'habitude.
Ce n'est pas le réseau qui doit s'adapter aux habitudes, ce sont les habitudes qui
doivent s'adapter au réseau. Toute la conduite proposée découle de ce renversement.

## 1. Hypothèse de référence

Coupure électrique généralisée sur la commune et sa région, durée supérieure à
soixante-douze heures, sans certitude sur la date de rétablissement. Les réseaux
mobiles tiennent de quelques dizaines de minutes à quelques heures sur les batteries
des relais, puis tombent. Internet disparaît avec eux. La radio FM peut subsister si
l'émetteur régional est secouru, mais elle ne dit rien de ce qui se passe rue par rue.

| Moment | Ce qui lâche | Conséquence pour la population |
|---|---|---|
| H+0 à H+2 | éclairage, chauffage et cuisson électriques, caisses des commerces | désorganisation immédiate, réseaux mobiles encore partiellement debout |
| H+2 à H+12 | relais mobiles, surpresseurs d'eau des immeubles | plus de téléphone, plus d'eau dans les étages |
| J+1 | froid domestique, chauffage collectif, stations-service | perte des réserves alimentaires, carburant inaccessible |
| J+2 à J+3 | autonomie des groupes électrogènes des sites sensibles | l'eau et les soins deviennent des points de rassemblement |
| J+4 à J+7 | la fiabilité de l'information | rumeur, déplacements inutiles, épuisement |

C'est à partir de J+2 que le réseau vaut le plus. Les premières heures relèvent des
moyens officiels et du bon sens ; ce qui manque ensuite, c'est de savoir où aller
sans y aller pour rien.

## 2. Services vitaux, par ordre de priorité

Le réseau n'assure aucun service. Il rend visible l'état des services que d'autres
assurent. L'ordre ci-dessous fixe les arbitrages quand la capacité manque.

| Rang | Service | Ce que le réseau apporte concrètement |
|---|---|---|
| 1 | Eau potable | localiser les citernes, annoncer le volume restant, éviter les déplacements pour rien |
| 2 | Santé | dire quel point de soins est ouvert et avec quels moyens |
| 3 | Alimentation | localiser les distributions, annoncer les quantités, lisser les files d'attente |
| 4 | Énergie | recharge de lampes et de téléphones, carburant pour les groupes électrogènes |
| 5 | Mise à l'abri | salles chauffées en hiver, fraîches en été, places disponibles |
| 6 | Information | contrer la rumeur par un état des lieux daté et vérifiable |

L'eau passe avant tout le reste parce que c'est la ressource dont l'absence tue le
plus vite et dont la distribution génère le plus de déplacements inutiles.

## 3. Le principe directeur : l'activité s'aligne sur le rythme de l'information

Quatre règles, qui commandent tout le reste.

On ne cherche pas l'information en continu, on la consulte à heure fixe. Un réseau
lent supporte très bien trois relevés par jour et très mal une interrogation
permanente. La régularité vaut mieux que la fraîcheur : mieux vaut une information de
quatre heures d'âge dont chacun sait à quelle heure elle a été prise, qu'une
information récente mais imprévisible.

On déplace l'information, pas les gens. Chaque trajet à pied coûte de l'énergie
humaine, du temps et du risque. Le réseau existe pour supprimer les trajets
infructueux, pas pour organiser des trajets supplémentaires.

On concentre l'activité sur les heures de jour. Sans éclairage public, la nuit
redevient une contrainte forte. Le silence radio nocturne économise les batteries, le
temps d'antenne et surtout les personnes.

On réduit le nombre de décisions à prendre. En situation dégradée, des règles simples
applicables par tous valent mieux que des arbitrages fins que personne n'a le temps
de faire.

## 4. Le rythme quotidien

Trois créneaux, tous les jours, aux mêmes heures, même quand il ne se passe rien.
C'est la colonne vertébrale du dispositif.

| Créneau | Horaire | Contenu |
|---|---|---|
| Relève du matin | 07h00 à 07h30 | chaque point ouvert émet son bulletin d'ouverture |
| Synthèse du matin | 07h45 | la passerelle diffuse la synthèse signée |
| Affichage | 08h00 | les points de regroupement affichent le tableau du jour |
| Point de mi-journée | 12h30 à 13h00 | réactualisation des quantités, réallocation des moyens |
| Affichage | 13h15 | mise à jour de l'affichage |
| Clôture | 18h00 à 18h30 | état de fin de journée, prévisions et consignes pour la nuit |
| Affichage | 18h45 | dernier affichage, valable jusqu'au lendemain 08h00 |
| Silence radio | 19h30 à 06h30 | urgences vitales uniquement |

Entre les créneaux, seuls circulent les changements d'état et les besoins urgents.
Un point qui passe de disponible à vide n'attend pas le créneau suivant : c'est
précisément l'information qui évite le plus de trajets inutiles.

Les horaires sont publics et affichés en permanence, y compris quand le réseau tombe.
Une population qui sait qu'il y aura un tableau à jour à 08h00 devant l'école ne
passe pas sa journée à chercher de l'information.

## 5. Le profil radio de crise

Un second profil de configuration est préparé à froid et chargé au déclenchement.
Son objet est unique : libérer du temps d'antenne et de la batterie pour les
bulletins, en supprimant tout ce qui est confortable mais inutile.

| Paramètre | Profil nominal | Profil de crise |
|---|---|---|
| Télémétrie de l'appareil | 30 min | 2 h |
| Télémétrie d'environnement | 30 min | désactivée |
| Diffusion de position | désactivée sur les fixes | désactivée partout sauf mobiles en mission |
| Annonce de nœud | par défaut | 3 h |
| Bluetooth | à la demande | coupé hors créneaux |
| Écran | éteint | éteint, allumé uniquement à la consultation |
| Nombre de sauts | 3 | 3, inchangé |
| Préréglage modem | LONG_FAST | LONG_FAST, inchangé |

Les deux dernières lignes sont volontaires. Changer de préréglage ou de nombre de
sauts en pleine crise fractionne le maillage, puisque tous les nœuds doivent partager
les mêmes valeurs pour se voir. C'est l'erreur la plus tentante et la plus coûteuse.

## 6. Les rôles humains

Le dispositif ne fonctionne pas sans des personnes nommées à l'avance. Un rôle sans
titulaire désigné est un rôle qui ne sera pas tenu.

| Rôle | Effectif | Mission |
|---|---|---|
| Référent de point | 1 par point ouvert, environ 27 | relève, saisie du bulletin, affichage local |
| Opérateur de passerelle | 2 en alternance | vérifie les signatures, tient le tableau, rédige la synthèse |
| Coordinateur | 1, plus une doublure | arbitre les allocations, valide les messages à fort impact |
| Équipes mobiles | 6 | vérification de terrain, confirmation par second canal, portage |
| Administrateur réseau | 1, plus une doublure | clés, révocations, remplacement des nœuds en panne |

Avec les doublures, l'ordre de grandeur est d'une soixantaine de personnes mobilisées
par rotation. Pour une commune de 20 000 habitants dotée d'une réserve communale de
sécurité civile, c'est atteignable, mais ce n'est pas acquis : c'est le vrai facteur
limitant du projet, bien avant la radio.

Deux règles de santé opérationnelle. Personne ne tient un poste plus de huit heures
d'affilée, et le silence radio nocturne s'applique aussi aux opérateurs. Un
coordinateur épuisé au jour trois est une défaillance aussi sérieuse qu'un relais à
plat.

## 7. La boucle d'information vers la population

Le réseau relie 50 nœuds ; c'est l'affichage qui relie 20 000 habitants. Le maillon
final est du papier.

Un format unique, un tableau au format A3, affiché aux huit points de regroupement,
en mairie et aux points de distribution. Une ligne par point de ressource, avec le
type, l'adresse, l'état, la quantité, l'heure du relevé et la distance approximative
depuis le lieu d'affichage. L'heure du relevé figure en gros caractères : c'est la
seule façon de faire comprendre qu'une information vieillit.

La distance est calculée depuis le point d'affichage, pas depuis la mairie. Une
personne qui lit un tableau veut savoir si elle peut y aller à pied, pas où se situe
le point sur un plan.

Trois affichages par jour, aux horaires annoncés, sans exception. Si le réseau est
tombé, on affiche quand même, avec la mention de l'heure du dernier relevé connu et
du fait que le réseau est indisponible. Un tableau périmé et honnête vaut infiniment
mieux qu'un panneau vide.

## 8. Priorisation quand la capacité manque

Aucun mécanisme du firmware ne hiérarchise le trafic. La priorisation est donc une
discipline, appliquée par les opérateurs.

| Priorité | Type de message | Règle |
|---|---|---|
| 1 | besoin vital, notamment sanitaire | immédiat, sans attendre le créneau |
| 2 | changement d'état d'un point | immédiat |
| 3 | bulletin de routine | dans le créneau uniquement |
| 4 | coordination logistique | dans le créneau uniquement |
| 5 | tout le reste | ne passe pas |

Règle chiffrée pour l'opérateur de passerelle : si l'occupation du canal dépasse 15 %,
les priorités 3 et 4 sont suspendues jusqu'au créneau suivant et l'information est
donnée sur le canal de service. Le seuil est volontairement bas, largement en dessous
des 25 % de dégradation, pour garder de la marge à l'imprévu.

## 9. Modes dégradés

Chaque défaillance a une parade écrite, essayée à froid, et un délai cible.

| Défaillance | Parade | Délai cible |
|---|---|---|
| Perte de la passerelle | bascule vers le second poste de commandement, dont la clé publique est déjà enrôlée dans tous les points | 30 min |
| Perte d'un relais d'ossature | le maillage se recompose avec un saut de plus ; si un quartier décroche, liaison par messager aux horaires de créneau | 2 h |
| Brouillage ou saturation durable | passage complet au rythme messager, affichage maintenu, horaires inchangés | immédiat |
| Batteries en tension | extinction dans l'ordre : mobiles, puis points fermés, jamais les relais ni la passerelle | — |
| Signature invalide répétée | révocation de la clé, vérification physique du point par une équipe mobile | 4 h |

La parade au brouillage mérite d'être soulignée, parce qu'elle explique le reste du
document. Si les horaires d'affichage sont fixes et connus à l'avance, la perte du
réseau ne désorganise pas la population : elle dégrade la fraîcheur de l'information,
pas le lieu ni l'heure où on va la chercher. Un dispositif conçu autour d'horaires
fixes survit à la panne de sa propre technique.

La liaison par messager n'est pas un pis-aller folklorique. Un cycliste couvre une
ville moyenne en vingt minutes, transporte un carnet de bulletins et ne dépend
d'aucune batterie. Deux messagers désignés font partie des six équipes mobiles.

## 10. Ce que le réseau ne doit pas faire

Pas d'appel à l'aide individuel. Tant que les numéros d'urgence fonctionnent, ils
restent la voie ; quand ils ne fonctionnent plus, la voie est le messager vers le
point de secours, pas un message texte dans un maillage sans garantie de livraison.
Laisser croire qu'un appel à l'aide sera reçu serait dangereux.

Pas de données médicales nominatives, pas de listes de personnes vulnérables, pas de
noms. Le réseau annonce des ressources et des lieux ; il ne gère pas des personnes.
Cette limite n'est pas seulement réglementaire, elle est de sécurité : une liste de
personnes isolées circulant sur un canal à clé partagée serait un danger créé de
toutes pièces.

Pas de coordination de sécurité publique. Ce n'est ni le rôle ni la compétence du
dispositif, et l'interférence avec les services officiels serait contre-productive.

Enfin, rappel constant : ce réseau est un complément aux moyens d'alerte et de secours
officiels, jamais un substitut. Il s'articule avec le plan communal de sauvegarde et
la réserve communale de sécurité civile, il ne s'y substitue pas.

## 11. Indicateurs de bonne conduite

Cinq mesures suffisent à savoir si le dispositif tient. Elles sont relevées chaque
soir par l'opérateur de passerelle et reportées au journal.

| Indicateur | Cible |
|---|---|
| Points ayant émis leur bulletin d'ouverture avant 07h30 | plus de 90 % |
| Âge médian de l'information affichée | moins de 4 h |
| Occupation moyenne du canal | moins de 10 % |
| Bulletins refusés pour signature invalide | zéro |
| Affichages réalisés à l'heure annoncée | 100 % |

Le dernier indicateur est le plus important et c'est le seul qui ne dépende pas de la
technique. Un dispositif qui affiche à l'heure, même une information imparfaite, crée
de la confiance ; un dispositif qui affiche quand il peut la détruit en trois jours.

## 12. Ce qui reste à trancher

Les horaires proposés valent pour un épisode hivernal ; en été, la clôture à 18h30 est
trop précoce et les créneaux devront glisser. Le nombre de points ouverts dès le
premier jour n'est pas arrêté : ouvrir les 27 d'un coup est probablement irréaliste,
une montée en puissance sur 48 heures est à étudier. Le format papier A3 doit être
maquetté et testé sur des lecteurs réels avant d'être figé. Enfin, l'articulation
avec la réserve communale conditionne la disponibilité des soixante personnes, et
c'est de loin l'inconnue la plus lourde.
