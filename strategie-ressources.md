# Stratégie ressources : 50 nœuds pour 20 000 habitants

Deux décisions sont actées ici. Le réseau est plafonné à **50 nœuds**, et sa
raison d'être première est de diffuser **où se trouvent les ressources, en quelle
quantité, et de quand date l'information**. Tout le reste — messagerie libre entre
voisins, suivi de position permanent, bavardage de test — est secondaire et ne doit
jamais mordre sur la capacité réservée à ce service. Ce document précise le
dimensionnement, la répartition des nœuds, le format des bulletins, la cadence, et
les limites que l'on accepte en connaissance de cause.

## 1. Pourquoi 50 nœuds et pas davantage

Le document `dimensionnement-maillage.md` aboutit à un résultat qui commande tout
le reste : avec les intervalles par défaut de Meshtastic, le canal LONG_FAST
commence à saturer aux alentours de **60 nœuds**. Passé ce seuil, le trafic de fond
que chaque nœud génère spontanément — NodeInfo, télémétrie, position — occupe à lui
seul une fraction du temps d'antenne telle que les messages utiles arrivent en
retard ou n'arrivent pas. Le plafond de 50 place le réseau à environ 20 % sous ce
point de rupture, ce qui est une marge de sécurité et non un confort de luxe :
en situation dégradée les retransmissions augmentent, les nœuds mal placés
répètent davantage, et la marge théorique se consomme vite.

| Grandeur | 50 nœuds, réglages par défaut | Seuil à ne pas franchir |
|---|---|---|
| Temps d'antenne du trafic de fond | environ 2 min par heure | — |
| Utilisation du canal, ChUtil | environ 3 % | rester sous 25 % |
| Émission par nœud, AirUtilTX | environ 1 % | rester sous 7 à 8 % |
| Marge disponible pour le trafic utile | environ 20 points de ChUtil | — |

Le plafond n'est pas une contrainte matérielle mais une règle d'exploitation. Rien
dans Meshtastic n'empêche un 51e nœud de rejoindre le canal ; c'est la discipline
d'attribution qui tient le chiffre. Elle doit donc être écrite, connue, et
appliquée par une personne identifiée.

Deux leviers permettront plus tard de relever le plafond si le besoin se confirme :
allonger les intervalles de télémétrie et de position, ce qui réduit
mécaniquement le trafic de fond, et segmenter en deux maillages reliés par une
passerelle. Les deux ont un coût, respectivement en fraîcheur d'information et en
complexité d'exploitation. Ni l'un ni l'autre ne sera engagé avant que le palier 2
soit réellement en service.

## 2. Répartition des 50 nœuds

Pour 20 000 habitants, 50 nœuds ne couvrent évidemment pas les foyers. Ce n'est pas
l'objectif. Le réseau relie des **points**, pas des personnes : un point d'eau, un
point de distribution, un poste de secours, un point de regroupement de quartier.
Un habitant n'a pas besoin de posséder un nœud, il a besoin de pouvoir se rendre au
point de regroupement le plus proche et d'y lire un bulletin à jour.

| Fonction | Nœuds | Rôle Meshtastic | Alimentation |
|---|---|---|---|
| Relais d'ossature en toiture | 6 | CLIENT_BASE | solaire, LiFePO4 |
| Points d'eau | 8 | CLIENT | solaire compact ou batterie |
| Distribution alimentaire | 6 | CLIENT | batterie, recharge quotidienne |
| Santé : pharmacie, cabinet, poste de secours | 5 | CLIENT | secteur si disponible, sinon batterie |
| Énergie : carburant, groupes, recharge | 4 | CLIENT | batterie |
| Points de regroupement de quartier | 8 | CLIENT | batterie |
| Poste de commandement et passerelle | 2 | CLIENT_BASE | secteur secouru |
| Équipes mobiles et reconnaissance | 6 | CLIENT_MUTE | batterie interne |
| Liaisons extérieures et point haut | 2 | CLIENT_BASE | solaire |
| Réserve de remplacement | 3 | — | stockés chargés |

Les six nœuds mobiles sont en CLIENT_MUTE volontairement : un nœud qui se déplace
et qui répète le trafic dégrade le maillage plus qu'il ne l'aide, parce qu'il
crée des chemins instables que l'algorithme de propagation doit sans cesse
recalculer. Ils émettent, ils reçoivent, ils ne relaient pas.

Les trois nœuds de réserve comptent dans les 50. Ils ne sont pas allumés en
permanence mais ils sont provisionnés, ce qui évite la tentation d'en commander
trois de plus le jour où deux tombent en panne.

## 3. Ce que le réseau transporte

Le canal principal ne transporte qu'une chose : des **bulletins de ressource**. Un
bulletin répond à trois questions et à rien d'autre. Où : quel point. Quoi et
combien : quelle ressource, en quel état, en quelle quantité. Depuis quand : à
quelle heure le relevé a été fait. Une information sans horodatage n'a aucune
valeur en situation de crise, parce que rien ne permet de distinguer un point
d'eau encore approvisionné d'un point d'eau vidé depuis quatre heures.

Un quatrième type de message est admis, symétrique du bulletin : le **besoin**. Un
point peut signaler qu'il lui manque quelque chose. C'est ce qui transforme le
réseau d'un tableau d'affichage en outil d'allocation.

Tout ce qui n'est ni un bulletin ni un besoin ni un message de service passe
ailleurs ou ne passe pas. Cette règle est la seule protection réelle contre la
saturation, parce qu'aucun mécanisme technique de Meshtastic ne hiérarchise le
trafic sur un canal partagé.

## 4. Format du bulletin

La charge utile d'un paquet Meshtastic est de 237 octets. Un bulletin en occupe
une trentaine, ce qui laisse une marge très confortable et surtout garantit que le
message tient dans un seul paquet : un message fragmenté double le temps d'antenne
et multiplie les risques de perte.

```
R|<ressource>|<point>|<etat>|<quantite>|<heure>
```

| Champ | Contenu | Exemple |
|---|---|---|
| Préfixe | `R` pour un bulletin, `B` pour un besoin | `R` |
| Ressource | code de 3 à 6 lettres, liste fermée | `EAU` |
| Point | identifiant court du point, listé dans le registre | `P07` |
| État | `OK`, `BAS`, `VIDE`, `FERME`, `HS` | `OK` |
| Quantité | nombre suivi d'une unité, ou nombre de parts | `1200L` |
| Heure | relevé en heure locale, format HHMM | `1405` |

Exemples réels :

```
R|EAU|P07|OK|1200L|1405
R|ALIM|D02|BAS|60PARTS|1410
R|MED|S01|FERME|0|1330
B|ENER|D02|BESOIN|2BIDONS|1415
```

Le format est volontairement lisible à l'œil nu. En situation dégradée, l'opérateur
lit le message brut sur l'écran du nœud ou dans l'application, sans passerelle ni
tableau de bord. Un format binaire compact serait plus économe mais illisible sans
outil, ce qui est exactement la situation que l'on cherche à éviter.

## 5. Codes ressource et états

La liste est fermée. Un code qui n'y figure pas ne doit pas être inventé en
cours de crise : il ne serait compris par personne et ne remonterait dans aucune
agrégation.

| Code | Ressource | Unité usuelle |
|---|---|---|
| `EAU` | eau potable | litres |
| `ALIM` | alimentation | parts ou rations |
| `MED` | soins, médicaments, premiers secours | places ou lots |
| `ENER` | carburant, gaz, recharge électrique | litres, bidons, postes |
| `ABRI` | hébergement, mise à l'abri | places |
| `INFO` | point d'information tenu par une personne | — |

| État | Signification opérationnelle |
|---|---|
| `OK` | ressource disponible, pas de restriction |
| `BAS` | disponible mais rationnée, tiendra moins de deux heures |
| `VIDE` | point ouvert mais ressource épuisée |
| `FERME` | point non tenu actuellement, réouverture prévue |
| `HS` | point hors service, ne pas s'y rendre |

La distinction entre `VIDE` et `HS` n'est pas cosmétique. `VIDE` signifie qu'il
est utile d'y acheminer quelque chose ; `HS` signifie qu'il ne faut y envoyer ni
ressource ni personne.

## 6. Cadence et coût en temps d'antenne

Trois règles suffisent. Tout changement d'état déclenche un bulletin immédiat. En
l'absence de changement, un point ouvert réémet un bulletin toutes les deux heures,
ce qui sert d'accusé de vie autant que d'information. Un point fermé ou hors
service se signale une fois par jour.

Le coût se calcule sans difficulté. Un bulletin d'une trentaine d'octets occupe
environ 0,56 s d'antenne en LONG_FAST. Avec une trentaine de points ouverts émettant
toutes les deux heures, soit une quinzaine de bulletins par heure, et en retenant un
facteur 4 pour les retransmissions du maillage, on obtient environ 34 s de temps
d'antenne par heure, soit moins de 1 % d'occupation du canal.

| Scénario | Bulletins par heure | Temps d'antenne, retransmissions comprises | ChUtil ajouté |
|---|---|---|---|
| Régime nominal | 15 | environ 34 s | moins de 1 % |
| Crise active, changements fréquents | 60 | environ 2 min 15 | environ 4 % |
| Cumul avec le trafic de fond des 50 nœuds | — | environ 4 min 15 | environ 7 % |

Même dans l'hypothèse haute, on reste très en dessous des 25 % au-delà desquels le
canal se dégrade. C'est cette marge qui justifie le plafond de 50 : elle absorbe
les pics sans arbitrage à chaud.

## 7. Un seul canal utile

Il faut lever une confusion fréquente : créer un second canal Meshtastic
**n'augmente pas la capacité**. Les canaux partagent la même radio, la même
fréquence et le même temps d'antenne ; ils séparent les conversations, pas les
ressources physiques. Multiplier les canaux revient à découper le même gâteau en
plus de parts en croyant l'avoir agrandi.

La configuration retenue est donc volontairement pauvre. Un canal primaire
`ressources`, avec sa clé partagée, qui porte les bulletins et les besoins. Un
canal secondaire `service`, réservé à la coordination technique du réseau, dont le
trafic doit rester marginal. Aucun canal libre : dès qu'un espace de discussion
sans objet existe, il se remplit, et il se remplit au détriment des bulletins.

## 8. Agrégation et tableau de bord

Un bulletin isolé renseigne sur un point. C'est leur accumulation qui donne une
vue de la ville. L'un des deux nœuds du poste de commandement sert de passerelle :
relié à un petit ordinateur, il consigne chaque bulletin reçu et tient un tableau
du dernier état connu de chaque point, avec l'âge de l'information. Une ligne dont
l'âge dépasse quatre heures doit être affichée comme périmée, pas comme absente.

Ce tableau ne dépend d'aucun service en ligne et fonctionne sans Internet. Sa
sortie utile est un document imprimable ou recopiable à la main, affiché aux points
de regroupement de quartier. C'est le maillon qui relie 50 nœuds à 20 000
habitants : le réseau radio transporte l'information, l'affichage de quartier la
distribue.

La passerelle est un point de défaillance unique et doit être traitée comme tel.
Si elle tombe, les bulletins continuent de circuler et restent lisibles nœud par
nœud ; seule la vue d'ensemble disparaît. Le second nœud du poste de commandement
existe pour reprendre ce rôle.

## 9. Règles d'exploitation

Un point, un émetteur désigné. Si deux personnes émettent pour le même point, les
états se contredisent et la confiance dans le canal s'effondre plus vite que ne
se dégrade la radio.

Un registre des points est tenu dans ce dépôt. Il associe chaque identifiant court,
`P07`, `D02`, `S01`, à une adresse, un responsable et un nœud. Sans ce registre, les
bulletins sont ininterprétables. Il sera créé au palier 1, lorsque les emplacements
seront réellement arrêtés.

L'attribution des 50 nœuds relève d'une personne identifiée, pas d'un consensus
de circonstance. C'est la seule façon de tenir le plafond.

Les horloges doivent être à l'heure. L'heure portée dans le bulletin est celle du
relevé, saisie par l'opérateur, et non l'heure de réception : un message qui met
vingt minutes à traverser le maillage reste exact si son horodatage est celui du
relevé.

## 10. Limites assumées

La diffusion Meshtastic n'offre **aucune garantie de livraison**. Un bulletin
émis peut ne jamais atteindre la passerelle, sans que l'émetteur en soit informé.
La réémission toutes les deux heures est la seule parade, et elle est
probabiliste.

L'information est périssable et le réseau ne le sait pas. C'est à l'affichage de
signaler l'âge, jamais au message de prétendre à l'actualité.

Le chiffrement repose sur une **clé de canal partagée**. Toute personne détenant
cette clé peut émettre un bulletin qui paraîtra légitime : il n'y a pas
d'authentification par nœud. Le réseau ne doit donc jamais être traité comme une
source de vérité unique, et aucune donnée personnelle ou médicale nominative ne
doit y transiter.

Les portées retenues jusqu'ici restent théoriques. Tant que la campagne de mesure
du palier 0 n'a pas eu lieu, la répartition géographique des 50 nœuds est une
hypothèse de travail, pas un plan d'implantation.

Enfin, le duty cycle de 1 % sur la bande 868 MHz s'impose à tous les nœuds. Les
cadences proposées le respectent très largement, mais toute augmentation devra
être vérifiée au regard de cette contrainte avant d'être adoptée.

## 11. Ce qui reste à trancher

Le registre des points n'existe pas encore et conditionne tout le reste. Le choix
entre un préfixe `B` distinct et un code ressource dédié pour les besoins mérite
d'être revu après un premier exercice. La rotation des clés de canal, sa fréquence
et sa procédure de diffusion, n'est pas définie. La procédure de bascule vers le
second nœud du poste de commandement doit être écrite et essayée. Enfin,
l'articulation avec le plan communal de sauvegarde, évoquée dans
`antennes-energie-alternatives.md`, déterminera qui détient légitimement le rôle
d'attributeur des 50 nœuds.
