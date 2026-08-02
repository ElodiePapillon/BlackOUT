# Authentification des bulletins et durcissement des nœuds

Le document `strategie-ressources.md` s'achevait sur une faiblesse assumée : la clé
de canal étant partagée par les 50 nœuds, quiconque la détient peut émettre un
bulletin qui paraîtra légitime. Ce document résout ce problème. Il s'appuie sur des
mécanismes déjà présents dans le firmware Meshtastic depuis la version 2.5, plus une
couche applicative minimale là où le firmware ne couvre pas le besoin.

## 1. Le problème, énoncé précisément

La documentation Meshtastic est explicite sur trois points, et il faut les distinguer
soigneusement parce que la réponse n'est pas la même pour chacun.

| Propriété | État sur un canal partagé | Conséquence concrète |
|---|---|---|
| Confidentialité | assurée, AES256-CTR par canal | un tiers sans la clé ne lit pas le contenu |
| Intégrité | **absente** | un message peut être modifié sans que rien ne le signale |
| Authentification | **absente** | le champ expéditeur est purement indicatif |

Le projet précise que les identifiants de nœud dérivent de l'adresse matérielle et
qu'il est trivial d'usurper l'identité d'un autre nœud dès lors qu'on a la clé du
canal. Il mentionne également qu'une attaque à texte clair connu permet d'injecter
des messages sur un canal même quand la clé reste secrète. Pour un réseau dont la
raison d'être est d'annoncer où trouver de l'eau, c'est disqualifiant : un faux
bulletin annonçant un point d'eau approvisionné envoie des gens vers une citerne
vide, et un faux message hors service ferme un point de distribution qui
fonctionnait.

Il faut aussi nommer le vecteur le plus probable, qui n'est pas l'attaque savante
mais la perte de matériel. Un nœud volé ou égaré livre la clé du canal à qui le
ramasse, et les relais de toiture sont par construction accessibles physiquement.

## 2. Ce que le firmware apporte déjà

Depuis la version 2.5, Meshtastic dispose d'une cryptographie à clé publique par
nœud. Chaque appareil détient une paire de clés. Un **message direct** est chiffré
avec la clé publique du destinataire et **signé avec la clé privée de l'émetteur** :
le destinataire vérifie l'identité de l'émetteur et l'intégrité du message. Les
messages d'administration bénéficient du même traitement, avec en plus un
identifiant de session qui protège contre le rejeu.

C'est exactement l'authentification par nœud qui manquait. Elle existe, mais
uniquement sur les messages directs, pas sur les diffusions de canal.

## 3. Décision d'architecture : le bulletin devient un message direct

Les bulletins ne sont plus diffusés sur le canal. **Chaque point émet son bulletin en
message direct vers le nœud passerelle.** La signature du firmware garantit alors que
le bulletin vient bien du nœud déclaré, et la passerelle refuse tout bulletin dont la
clé publique ne figure pas au registre.

Ce basculement change la nature du réseau et il faut l'assumer : le canal cesse
d'être un tableau d'affichage lu par tous, il devient une collecte vers un point
d'agrégation qui, lui, rediffuse une synthèse. C'est un peu moins pair à pair, c'est
nettement plus sûr, et cela correspond de toute façon à l'usage réel décrit dans la
stratégie ressources, où l'information est redistribuée par affichage aux points de
regroupement.

Conditions à respecter, sans quoi la protection tombe silencieusement :

| Condition | Pourquoi |
|---|---|
| Tous les nœuds en firmware 2.5 ou plus récent | un échange avec un nœud plus ancien retombe sur l'ancien schéma, sans authentification |
| Échange de clés effectué avant la crise | la protection suppose que les clés publiques sont déjà connues |
| Clés publiques enrôlées en présentiel | un premier contact par radio est exposé à l'interception |
| Sauvegarde des clés privées | un effacement de firmware les régénère et rompt tous les liens établis |

## 4. La synthèse rediffusée : signature applicative

La passerelle rediffuse une synthèse sur le canal, à destination des points de
regroupement. Cette diffusion, elle, n'est pas authentifiée par le firmware. On y
ajoute donc une couche applicative, ce que la documentation Meshtastic recommande
explicitement aux développeurs tiers.

Deux niveaux sont retenus selon la criticité.

| Niveau | Mécanisme | Ce que cela protège | Coût |
|---|---|---|---|
| Courant | HMAC-SHA256 tronqué à 8 caractères, sur le contenu et un compteur, avec une clé de synthèse distincte de la clé du canal | un attaquant qui n'a que la clé du canal ne peut pas forger une synthèse | 9 octets |
| Renforcé | signature Ed25519 de la passerelle, encodée en base64 | personne ne peut forger, même en détenant la clé de vérification | 88 octets |

Le niveau renforcé est réservé aux messages à fort impact : fermeture d'un point,
consigne de ne pas se déplacer, changement de doctrine de rationnement. Une signature
Ed25519 fait 64 octets, soit 88 caractères en base64 ; ajoutée à une synthèse
compacte, le message reste dans un seul paquet de 237 octets. Le niveau courant suffit
pour les synthèses de routine et ne coûte presque rien.

La clé de synthèse du niveau courant ne doit surtout pas être la clé du canal. Elle
n'est détenue que par les deux postes de commandement et les huit points de
regroupement, soit dix appareils au lieu de cinquante. Le niveau renforcé n'a pas ce
défaut : la clé publique de vérification peut être distribuée partout sans risque,
puisqu'elle ne permet que de vérifier, jamais de signer.

## 5. Formats révisés

Bulletin émis par un point, en message direct vers la passerelle. Le compteur `S` est
monotone et permet à la passerelle de rejeter un rejeu ou un message arrivé dans le
désordre.

```
R|EAU|P07|OK|1200L|1405|S142
```

Synthèse diffusée par la passerelle, niveau courant, avec compteur et empreinte :

```
SYN|1500|S078|EAU P07 OK 1200L 1405; EAU P12 BAS 300L 1450; ALIM D02 VIDE 0 1440|A7K2QM4X
```

Message à fort impact, niveau renforcé, avec signature complète :

```
ORD|1512|S079|Fermeture du point S01 jusqu a nouvel ordre|[88 caracteres base64]
```

## 6. Registre des clés et enrôlement

Le registre des points, déjà inscrit à la feuille de route, s'enrichit de deux
colonnes : l'identifiant de nœud et la clé publique. Les clés publiques peuvent
figurer sans risque dans ce dépôt ; les clés privées n'y figurent jamais, et cette
règle ne souffre aucune exception, pas même pour un dépôt privé.

L'enrôlement se fait en présentiel, appareil contre appareil, avant tout usage
opérationnel. C'est contraignant et c'est le prix de la confiance : un enrôlement par
radio au moment de la crise n'aurait aucune valeur, puisque c'est précisément le
moment où un attaquant a intérêt à se présenter comme un point d'eau.

Les clés privées sont sauvegardées hors ligne, une fois, à la mise en service. Un
effacement de firmware les régénère et rompt tous les liens établis : sans
sauvegarde, un simple dépannage oblige à refaire l'enrôlement du nœud concerné.

## 7. Révocation

Révoquer un nœud perdu ou volé consiste à retirer sa clé publique du registre de la
passerelle. L'effet est immédiat et l'opération ne demande de toucher qu'un seul
appareil.

Si l'appareil perdu détenait la clé privée du canal, il faut en plus faire tourner
cette clé, ce qui suppose de reconfigurer les nœuds un par un. C'est l'opération la
plus lourde du dispositif, et c'est la raison de la règle de la section suivante.

## 8. Durcissement des nœuds

La documentation Meshtastic recommande de ne pas configurer de canal privé sur des
nœuds laissés sans surveillance, en rappelant qu'un nœud relaie le trafic même
lorsqu'il ne peut pas le déchiffrer. On applique la règle strictement.

| Type de nœud | Clé privée du canal | Rôle |
|---|---|---|
| Relais d'ossature en toiture | **non** | relayer uniquement, sans jamais déchiffrer |
| Points de ressource | oui | émettre des bulletins, lire les synthèses |
| Postes de commandement | oui, plus la clé de synthèse | agréger, signer, rediffuser |
| Nœuds mobiles | oui | émettre et recevoir, sans relayer |

Conséquence directe : le vol d'un relais de toiture, qui est le matériel le plus
exposé, ne compromet plus rien. Il ne contient aucun secret.

Point technique à vérifier au banc avant déploiement : le créneau de fréquence se
déduit du nom du canal primaire et du préréglage modem. Un relais dépourvu de la clé
privée doit donc se voir imposer explicitement le même numéro de créneau que le reste
du maillage, faute de quoi il émettra à côté et sera invisible. Ce point doit figurer
dans la procédure de mise en service et être vérifié avant tout scellement de
boîtier.

Réglages de sécurité à appliquer sur tous les nœuds fixes :

| Réglage | Valeur | Effet |
|---|---|---|
| Clé d'administration | clé publique du poste d'administration | seuls les messages signés par cette clé peuvent reconfigurer le nœud |
| Mode géré | activé | les applications clientes ne peuvent plus écrire la configuration, seulement la lire |
| Console série | désactivée | supprime un accès local à la configuration |
| Canal d'administration hérité | désactivé | ferme l'ancien mécanisme d'administration, réputé peu sûr |
| Journaux de débogage | désactivés | évite de laisser fuiter des éléments de configuration |

Avertissement important : le mode géré doit être activé **après** avoir vérifié que
l'administration à distance fonctionne réellement, sinon le nœud devient
inadministrable et il faut le rouvrir physiquement. Sur un boîtier scellé en toiture,
l'erreur se paie en location de nacelle.

## 9. Rotation des clés

La clé du canal est renouvelée une fois par an en routine, et immédiatement en cas de
perte d'un nœud qui la détenait. La clé de synthèse suit le même rythme. Les paires
de clés par nœud ne tournent pas : les renouveler imposerait de refaire tous les
enrôlements, pour un gain nul tant qu'aucune clé privée n'est compromise.

Chaque rotation est précédée d'une sauvegarde de configuration et suivie d'un essai de
bout en bout : un bulletin émis depuis un point, reçu et vérifié par la passerelle,
puis une synthèse rediffusée et vérifiée par un point de regroupement. Une rotation
non testée est une panne programmée.

## 10. Coût de la solution

Le passage en message direct coûte un peu de temps d'antenne, parce qu'un message
direct est acquitté alors qu'une diffusion ne l'est pas.

| Poste | Avant, en diffusion | Après, en message direct signé |
|---|---|---|
| Émissions par bulletin | environ 4, retransmissions comprises | environ 6, accusés compris |
| Temps d'antenne pour 15 bulletins par heure | environ 34 s | environ 50 s |
| Occupation du canal ajoutée | moins de 1 % | environ 1,4 % |
| Synthèse diffusée toutes les 30 minutes | — | environ 10 s par heure |

On reste très loin des 25 % au-delà desquels le canal se dégrade. La sécurité coûte
ici moins d'un point d'occupation : il n'y a aucune raison de s'en priver.

Le coût réel n'est pas radio, il est humain. Enrôlement en présentiel, tenue du
registre, sauvegarde des clés, essai après chaque rotation : c'est du travail
d'administration, et c'est lui qui décidera si le dispositif tient dans la durée.

## 11. Ce que cela ne résout pas

L'authentification prouve qu'un message vient d'un appareil donné, pas qu'il dit la
vérité. Un nœud volé, allumé et déverrouillé permet d'émettre des bulletins
parfaitement authentifiés au nom du point qu'il dessert. D'où la règle des deux
sources pour toute décision à fort impact : un point de santé déclaré hors service ou
une consigne de déplacement de population se confirment par un second canal, radio de
service ou messager, avant d'être affichés.

Il n'y a pas de confidentialité persistante. Un trafic capturé aujourd'hui devient
lisible si la clé du canal fuit plus tard. Rien de sensible au sens des données
personnelles ne doit donc transiter, ce que la stratégie ressources posait déjà.

Les en-têtes restent en clair : qui parle à qui, et à quelle fréquence, demeure
observable par un tiers à l'écoute de la bande. Pour un dispositif d'entraide
municipale, c'est acceptable.

Enfin, le brouillage reste possible et aucune cryptographie n'y répond. La parade est
organisationnelle : des points de regroupement connus à l'avance, des horaires
d'affichage fixes, et une procédure dégradée par messager. Elle est détaillée dans
`conduite-en-coupure.md`.
