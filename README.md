# BlackOUT

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21787515.svg)](https://doi.org/10.5281/zenodo.21787515)
[![Licence](https://img.shields.io/badge/licence-Apache%202.0-lightgrey.svg)](LICENSE)

**Quand il n'y a plus d'électricité, plus de réseau et plus d'Internet, une ville de 20 000 habitants doit encore savoir où est l'eau.**

BlackOUT est un dispositif communal, ouvert et documenté, qui répond à cette question et à celle-là seulement : **où sont les ressources, en quelle quantité, et à quelle heure l'information a été vérifiée.**

Cinquante boîtiers radio LoRa autonomes relient les points d'eau, de vivres, de soins et d'abri à un poste de commandement. Trois fois par jour, une synthèse part vers les quartiers et s'affiche sur une feuille A3 sous pochette. Pas de voix, pas d'image, pas d'Internet. Du texte court, daté, signé, et du papier.

---

## Les chiffres

| | |
| --- | --- |
| Bande radio | LoRa 868 MHz, ISM, sans licence ni abonnement |
| Taille du réseau | 50 nœuds, plafond ferme |
| Autonomie | solaire pour les relais, plusieurs jours pour les terminaux |
| Rythme | 3 créneaux par jour, silence radio la nuit |
| Investissement | environ 12 350 euros, soit **0,62 euro par habitant** |
| Fonctionnement | environ 1 250 euros par an |
| Vraie contrainte | 300 heures de mise en place, 120 heures par an, 60 personnes |
| Licence | Apache 2.0 |

## Ce que ce n'est pas

Ce n'est **pas un moyen d'alerte**, **pas un réseau de secours**, **pas un substitut au 15, au 18 ou au 112**. Ce n'est pas non plus une messagerie pour 20 000 personnes : le réseau relie des points, et c'est l'affichage papier qui touche les habitants. Il n'est agréé par aucune administration et ne prétend pas l'être.

Ce qu'il est : de la logistique d'information, en coupure longue, quand tout le reste est tombé.

## Ce qui a été résolu et qui compte

Sur un canal radio partagé, n'importe qui détenant la clé peut forger un faux bulletin : « il reste 1 200 litres au point P07 », signé de n'importe qui. Pour un réseau dont la seule raison d'être est de dire où sont les ressources, c'était rédhibitoire.

Les bulletins partent désormais en messages directs **chiffrés par clé publique et signés par la clé privée** de l'émetteur. La synthèse rediffusée porte une signature applicative calculée avec une clé distincte de la clé de canal, avec compteur anti-rejeu. Les relais de toiture, matériel exposé, ne détiennent aucune clé privée. Coût : 1,4 % d'occupation du canal.

## Par où commencer

**Vous êtes élu ou en collectivité ?** Lisez [budget.md](budget.md) puis [cadre-institutionnel.md](cadre-institutionnel.md) : ce que ça coûte, et comment ça entre dans un plan communal de sauvegarde sans créer de rubrique nouvelle.

**Vous êtes aux services techniques ou à la sécurité civile ?** Clonez le dépôt et remplissez le dossier [ressources/](ressources) : cinq grilles d'inventaire prêtes à l'emploi, énergie, eau, santé, transports, humain. Puis jouez [exercices/](exercices).

**Vous êtes technicien ou radioamateur ?** [reference-technique.md](reference-technique.md) et [securite-authentification.md](securite-authentification.md). Les erreurs que vous trouverez sont les bienvenues.

**Vous voulez juste comprendre ?** [conduite-en-coupure.md](conduite-en-coupure.md), puis [affichage-a3.md](affichage-a3.md).

## Carte du dépôt

### Concevoir

| Document | Contenu |
| --- | --- |
| [reference-technique.md](reference-technique.md) | radio, matériel, énergie, configuration, limites |
| [dimensionnement-maillage.md](dimensionnement-maillage.md) | combien de nœuds, où les placer, jusqu'où le canal tient |
| [materiel-premiers-noeuds.md](materiel-premiers-noeuds.md) | choix des deux premiers nœuds et du relais de toiture |
| [antennes-energie-alternatives.md](antennes-energie-alternatives.md) | antennes, solaire, comparaison avec les autres solutions radio |
| [securite-authentification.md](securite-authentification.md) | authentification des bulletins, durcissement, révocation des clés |

### Exploiter

| Document | Contenu |
| --- | --- |
| [strategie-ressources.md](strategie-ressources.md) | plafond de 50 nœuds, format des bulletins, cadence |
| [conduite-en-coupure.md](conduite-en-coupure.md) | rythme, rôles, priorités, modes dégradés |
| [diffusion-sans-electricite.md](diffusion-sans-electricite.md) | du relevé à l'habitant : portage, affichage, mégaphone, relais de quartier |
| [affichage-a3.md](affichage-a3.md) | gabarit du tableau papier, zones, typographie, stock |
| [ressources/](ressources) | cinq grilles d'inventaire à remplir par la commune |
| [export-imprimable.md](export-imprimable.md) | produire le classeur papier et les fiches plastifiées avant la coupure |

### Inscrire et faire vivre

| Document | Contenu |
| --- | --- |
| [budget.md](budget.md) | chiffrage complet, paliers, fonctionnement annuel |
| [cadre-institutionnel.md](cadre-institutionnel.md) | PCS, résilience nationale, utilité pour les sapeurs-pompiers |
| [usages-hors-coupure.md](usages-hors-coupure.md) | dix usages courants qui maintiennent le dispositif en vie |
| [exercices/](exercices) | scénarios de simulation et retours d'expérience |
| [partager-le-projet.md](partager-le-projet.md) | à qui parler, où, et avec quels mots |
| [JOURNAL.md](JOURNAL.md) | journal de bord du projet |

## Le principe en trois lignes

Radio LoRa 868 MHz pilotée par le firmware Meshtastic, préréglage LONG_FAST, 3 sauts, canal privé. Chaque nœud relaie les messages des autres : aucune infrastructure, le réseau tient tant que les nœuds sont alimentés. Le plafond de 50 nœuds n'est pas un objectif mais une règle : au-delà, le canal partagé sature avant même le premier message utile.

## État d'avancement

| Étape | Statut |
| --- | --- |
| Dimensionnement du maillage à l'échelle de la ville | fait |
| Choix du matériel des deux premiers nœuds | fait |
| Antennes, énergie et alternatives radio | fait |
| Stratégie ressources, plafond de 50 nœuds, format des bulletins | fait |
| Automatisation de la tenue du journal de bord | fait |
| Authentification des bulletins et durcissement des nœuds | fait |
| Conduite du réseau pendant une coupure | fait |
| Budget complet et échelonnement en paliers | fait |
| Dix usages du réseau hors coupure | fait |
| Gabarit du tableau d'affichage A3 | fait |
| Protocole de diffusion sans électricité | fait |
| Grilles d'inventaire des ressources | fait |
| Cadre institutionnel et scénario d'exercice | fait |
| Licence et préparation au partage | fait |
| Commande des deux premiers nœuds | à faire |
| Tests de portée au sol dans le quartier | à faire |
| Repérage des points hauts et contact avec la commune | à faire |
| Enrôlement en présentiel des clés publiques | à faire |
| Maquette imprimée du tableau A3 | à faire |
| Premier exercice grandeur nature | à faire |
| Export imprimable de l'ensemble | notice écrite, script à faire  |

## Trois règles qui ne se négocient pas

Aucune donnée nominative ni de santé dans ce dépôt, sur la radio ou sur un affichage. Aucun usage permettant de suivre des personnes. Et jamais de présentation du dispositif comme un moyen d'alerte ou de secours.

## Licence

Apache 2.0. Tout est réutilisable, modifiable et redistribuable, y compris par une collectivité, à condition de conserver les mentions de licence et de documenter les modifications. Voir [LICENSE](LICENSE).

**Pourquoi Apache 2.0 et non CC BY 4.0 comme les autres dossiers ?** Parce que ce dépôt contient de la configuration logicielle et des spécifications matérielles : une licence logicielle y est mieux adaptée, et elle offre en outre une protection explicite contre les revendications de brevet.

Les exemples chiffrés dans les grilles d'inventaire sont **fictifs** et doivent tous être remplacés. Les références réglementaires citées doivent être vérifiées dans leur version en vigueur avant tout usage officiel.

## Contribuer

Les retours critiques valent mieux que les étoiles. Les plus utiles portent sur le dimensionnement réel du canal, la solidité du schéma d'authentification, et tout ce qui rendrait le dispositif plus simple à tenir par des bénévoles fatigués au troisième jour.
