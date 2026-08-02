# Dimensionnement du maillage à l'échelle de la ville

Document de travail complémentaire au README. Objectif : passer de « on sait faire un lien radio » à « on sait combien de nœuds il faut, où les placer, et jusqu'où le canal tient ».

## 1. Ville de référence

Hypothèses de travail, à remplacer par les valeurs réelles dès le repérage effectué.

| Paramètre | Hypothèse |
| --- | --- |
| Population | 20 000 habitants |
| Densité du tissu urbanisé | environ 2 000 hab/km2 |
| Emprise urbanisée continue | environ 10 km2 |
| Diamètre du tissu continu | 3 à 4 km |
| Relief | supposé peu marqué |
| Hauteur du bâti courant | R+2 à R+4, soit 9 à 15 m |
| Points hauts candidats | château d'eau, clocher, silo, immeuble collectif, bâtiment public |

## 2. Deux dimensionnements à ne pas confondre

La couverture est un problème de géométrie : combien de relais pour que tout point de la ville entende au moins un nœud. La capacité est un problème de partage du canal : combien de nœuds peuvent coexister avant que le canal ne sature. La conclusion de ce document est que la couverture est le problème facile, et la capacité le problème dur.

## 3. Couverture

| Type de lien | Portée retenue |
| --- | --- |
| Rue vers rue, antenne d'origine | 300 à 600 m en tissu dense, jusqu'à 1 km en pavillonnaire |
| Rue vers toiture 12 à 15 m, antenne colinéaire côté toiture | 1 à 2,5 km |
| Toiture vers toiture, quasi ligne de vue | 3 à 8 km |
| Intérieur de bâtiment vers toiture | diviser les valeurs ci-dessus par 2 à 3 |

Ces chiffres sont des hypothèses. Ils sont exactement ce que l'étape « tests de portée au sol » doit confirmer ou corriger.

Calcul : un relais en toiture dessert un disque d'environ 1 km de rayon, soit 3,1 km2 théoriques. En maillage hexagonal, avec le recouvrement nécessaire pour tolérer les masques du bâti, compter 2 km2 réellement utiles par relais. Pour 10 km2 urbanisés, il faut donc de l'ordre de cinq relais. On retient 4 à 6 relais pour le tissu continu, plus 1 à 2 pour les écarts, hameaux et zones d'activité.

| Palier | Composition | Ce que cela apporte |
| --- | --- | --- |
| 0 — amorçage | 2 nœuds | valide le matériel, la configuration et la portée réelle du quartier ; ce n'est pas encore un maillage |
| 1 — ossature | 3 relais hauts et 10 à 20 terminaux | couvre le centre et deux quartiers, premier usage réel |
| 2 — ville | 6 relais et 60 à 150 terminaux | couvre le tissu continu |
| 3 — bassin de vie | 8 relais et liaisons vers les communes voisines | sort de la ville |

## 4. Capacité du canal : la vraie limite

Tous les nœuds partagent une seule fréquence. Trois contraintes s'empilent.

### 4.1 Rapport cyclique

En EU_868, 10 % par heure glissante, recalculé chaque minute par le firmware, soit 360 secondes d'émission par heure et par nœud. C'est une contrainte individuelle, rarement atteinte en pratique : le canal sature bien avant.

### 4.2 Occupation du canal

Les seuils de bon fonctionnement retenus par le projet Meshtastic sont une occupation du canal (ChUtil) inférieure à 25 % et un temps d'antenne propre (AirUtilTX) inférieur à 7 ou 8 % pour un nœud d'infrastructure. À 25 % de 3 600 secondes, le maillage entier dispose donc d'environ 900 secondes d'antenne par heure, toutes émissions confondues.

### 4.3 Temps d'antenne d'un paquet

En LONG_FAST (bande passante 250 kHz, facteur d'étalement 11, codage 4/5, préambule de 16 symboles), le temps symbole vaut 8,2 ms.

| Taille totale du paquet | Temps d'antenne |
| --- | --- |
| 40 octets (télémétrie, position, texte très court) | environ 0,56 s |
| 100 octets (texte de 80 caractères) | environ 1,0 s |
| 253 octets (charge utile maximale de 237 octets) | environ 2,1 s |

Chaque message diffusé est de plus réémis par plusieurs voisins, puisque le protocole fonctionne par inondation contrôlée. Dans un tissu correctement maillé, compter un facteur de réplication de 3 à 5 émissions par message émis.

### 4.4 Budget de trafic de fond

Avec les réglages par défaut, chaque nœud produit spontanément de la télémétrie toutes les 30 minutes, une position toutes les 15 minutes et un NodeInfo toutes les 3 heures, soit environ 6 paquets par heure. Avec un facteur de réplication de 4 et 0,6 s par émission, cela représente environ 15 secondes d'antenne par heure et par nœud. Rapporté aux 900 secondes disponibles : une soixantaine de nœuds suffit à saturer un maillage LONG_FAST, avant même le premier message utile. C'est le résultat le plus important de ce document.

Avec des réglages disciplinés (position désactivée sur les nœuds fixes et fortement espacée sur les mobiles, télémétrie à 2 heures, NodeInfo à 6 heures, appareils secondaires en CLIENT_MUTE), on descend à environ 1 paquet par heure et par nœud, soit 2,4 secondes d'antenne.

| Nombre de nœuds actifs | Antenne de fond | ChUtil de fond | Marge pour les messages |
| --- | --- | --- | --- |
| 50 | 120 s/h | environ 3 % | large |
| 100 | 240 s/h | environ 7 % | confortable |
| 150 | 360 s/h | environ 10 % | acceptable |
| 250 | 600 s/h | environ 17 % | tendue |
| 400 | 960 s/h | supérieure à 25 % | maillage inexploitable |

À 150 nœuds, il reste environ 540 secondes d'antenne par heure pour le trafic utile. À 0,8 s par émission et 4 réplications par message, cela représente de l'ordre de 150 à 170 messages par heure pour la ville entière, tous émetteurs confondus.

### 4.5 Ce que le firmware corrige tout seul

Au-delà de 40 nœuds vus dans les deux dernières heures, le firmware étire automatiquement les intervalles accessoires selon la formule ScaledInterval = Interval x (1 + (N - 40) x 0,075). À 100 nœuds actifs, un intervalle de 30 minutes devient 2 h 15. Ce garde-fou est utile mais ne dispense pas de régler correctement : il ne touche pas au trafic utile ni au facteur de réplication.

## 5. Conséquence de conception

Un nœud par habitant est hors de portée du canal, d'un facteur cent. Le bon ordre de grandeur est de 100 à 200 nœuds pour 20 000 habitants, soit un nœud pour 100 à 200 personnes.

Cela change la nature du projet. BlackOUT n'est pas une messagerie grand public : c'est un réseau de points de contact. Un nœud par immeuble, par commerce ouvert, par équipement public, par référent de quartier, autour desquels les habitants se regroupent physiquement. La capacité du canal impose la sociologie du dispositif, et non l'inverse. Toute rédaction de procédure d'usage doit partir de là.

## 6. Nombre de sauts

On conserve 3 sauts. Avec une ossature de relais espacés de 1,5 à 2 km sur un tissu de 3 à 4 km, un message atteint n'importe quel point de la ville en 2 à 3 sauts. Monter à 5 ou 7 ne compense jamais une ossature mal placée : cela multiplie les réémissions, consomme le budget d'antenne et dégrade le maillage pour tout le monde, y compris pour les autres utilisateurs de la bande.

## 7. Rôles : correction par rapport à la note initiale

La documentation Meshtastic déconseille explicitement les rôles ROUTER et ROUTER_LATE pour un simple nœud de toiture. Un rôle d'infrastructure réémet systématiquement tout ce qu'il entend et préempte les autres nœuds ; mal placé, il consomme les sauts avant que le paquet n'atteigne un site réellement dominant, crée des liaisons asymétriques et augmente les collisions. Le rôle prévu pour une toiture est CLIENT_BASE.

| Nœud | Rôle retenu |
| --- | --- |
| Terminal personnel principal | CLIENT |
| Appareils secondaires d'une même personne | CLIENT_MUTE |
| Nœud de toiture ou de combles d'un particulier | CLIENT_BASE, avec les nœuds personnels en favoris |
| Relais d'ossature sur point haut dominant la ville | ROUTER |
| Relais comblant un creux, sans vue dégagée sur le reste du maillage | ROUTER_LATE |
| Nœud de mesure environnementale | SENSOR |

Le rôle REPEATER est déprécié depuis le firmware 2.7.11 et ne doit plus être utilisé.

Règle de déploiement : pas plus d'un rôle d'infrastructure par zone de visibilité mutuelle. Après chaque mise en service, relever ChUtil et AirUtilTX pendant 48 heures ; si ChUtil dépasse 25 % ou AirUtilTX 8 %, repasser le nœud en CLIENT_BASE.

## 8. Segmentation

Ouvrir un canal secondaire n'apporte aucune capacité supplémentaire : tous les canaux d'un même préréglage partagent le même créneau de fréquence et donc le même temps d'antenne. La seule segmentation réelle consiste à affecter des créneaux de fréquence distincts à des zones distinctes, ce qui les isole complètement l'une de l'autre. À garder en réserve si la ville venait à dépasser la capacité d'un maillage unique, avec une passerelle bifréquence entre zones.

## 9. Grandeurs à mesurer lors des tests

| Grandeur | Où la lire | Pourquoi |
| --- | --- | --- |
| SNR et RSSI par lien | application cliente, page du nœud | valider les portées hypothétiques du point 3 |
| ChUtil | écran ou télémétrie du nœud | surveiller la saturation globale |
| AirUtilTX | idem | détecter un rôle d'infrastructure mal placé |
| Nombre de sauts effectifs | traceroute | vérifier que 3 sauts suffisent |
| Taux de perte sur accusé de réception | envoi de messages test | mesurer la fiabilité réelle |
| Nombre de nœuds vus sur 2 h | liste des nœuds | anticiper l'étirement automatique des intervalles |

## 10. Ce que ce document ne tranche pas

La position exacte des points hauts, qui dépend d'un repérage de terrain et d'une étude de visibilité. Le facteur de réplication réel, qui dépend de la densité du maillage et ne se connaîtra qu'après mesure. Le comportement du canal en situation de crise, où le trafic utile explose au moment même où la discipline des réglages se relâche.
