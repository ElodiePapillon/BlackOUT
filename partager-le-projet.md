# Partager le projet

Où diffuser le lien, à qui, et avec quels mots. Ce document ne déclenche rien tout seul : la publication est une décision qui appartient à la personne qui tient le dépôt.

## 1. Ce qu'il faut régler avant de partager quoi que ce soit

**Le dépôt est privé.** Le rendre public est un changement de visibilité à effectuer soi-même, en conscience, dans les paramètres du dépôt. Tant que ce n'est pas fait, aucun lien partagé ne s'ouvrira.

**Arbitrer ce qui reste interne.** La structure des grilles peut être publique. Leur contenu rempli par une commune réelle ne l'est pas : un inventaire des stocks de carburant, des cuves et des accès aux locaux techniques est un document sensible. La bonne pratique est de publier le modèle vide et de garder l'inventaire rempli dans un dépôt séparé, privé, ou hors ligne.

**Vérifier qu'aucune donnée personnelle ne traîne.** Pas de nom, pas d'adresse, pas de numéro, pas de donnée de santé. La règle est déjà écrite dans ressources/README.md ; il faut la vérifier ligne à ligne avant publication, pas après.

**Avoir une licence.** C'est fait : Apache 2.0. Une collectivité ne réutilise pas un travail dont elle ignore le statut juridique.

**Avoir une version imprimable.** Le jour de la coupure, personne n'ouvre GitHub. Un export PDF de l'ensemble, daté, imprimé et déposé en trois exemplaires, fait partie du produit et pas des options.

## 2. Les quatre publics

| Public | Ce qui l'intéresse | Ce qui le fait fuir |
| --- | --- | --- |
| Élus et directions générales | coût, responsabilité, inscription au PCS | jargon radio, promesse de miracle |
| Services techniques et sécurité civile | grilles, exercices, modes dégradés | discours militant |
| Communautés techniques radio | authentification, dimensionnement, mesures | approximations sur la propagation |
| Citoyens engagés en résilience | usages concrets, budget accessible | complexité inutile |

Un seul message ne parlera pas aux quatre. Les modèles ci-dessous sont donc séparés.

## 3. Canaux à viser

| Canal | Nature | Pourquoi | Comment approcher |
| --- | --- | --- | --- |
| code.gouv.fr | plateforme de l'État qui référence les codes sources publics | crédibilité institutionnelle | vérifier les critères de référencement avant de solliciter |
| Communauté Meshtastic francophone | forums, Discord, groupes locaux | relecture technique, retours de terrain | poser une question précise, pas une annonce |
| Associations de radioamateurs | clubs locaux et fédérations | compétence radio et culture de l'exercice | contact direct, en présentiel |
| Réseaux professionnels du secteur public | groupes DGS, sécurité civile, résilience territoriale | accès aux décideurs | publication sobre, chiffrée |
| Associations de résilience locale | groupes citoyens, tiers-lieux | bénévoles et expérimentation | proposer un atelier, pas un discours |
| Forums low-tech et numérique frugal | communautés techniques | audit critique bienvenu | accepter la contradiction |
| Association des maires du département | réseau d'élus | diffusion horizontale entre communes | passer par sa propre commune |

Un conseil sur l'ordre : commencer par les communautés techniques, qui vont trouver les erreurs, avant les élus, qui ne pardonnent pas les erreurs trouvées par d'autres.

## 4. Messages types

### 4.1 Publication professionnelle courte

> Une ville de 20 000 habitants perd l'électricité et les télécoms pendant trois jours. Comment dire aux habitants où trouver de l'eau, en quelle quantité, et à quelle heure l'information a été vérifiée ?
>
> BlackOUT est un dispositif communal ouvert qui répond à cette question et à celle-là seulement : 50 nœuds radio LoRa autonomes, trois créneaux de relevé par jour, et un tableau d'affichage papier dans chaque quartier.
>
> Ce qu'il y a dans le dépôt : le dimensionnement du maillage, l'authentification des bulletins par clé publique pour qu'un faux message ne puisse pas circuler, la conduite de crise heure par heure, le budget complet à 12 350 euros soit 0,62 euro par habitant, les grilles d'inventaire prêtes à remplir, un scénario d'exercice et dix usages hors crise.
>
> Ce que ce n'est pas : un moyen d'alerte, un réseau de secours, un substitut au 112. C'est de la logistique d'information, rien d'autre.
>
> Licence Apache 2.0, tout est réutilisable. Les retours critiques m'intéressent plus que les partages.

### 4.2 Message à une communauté technique

> Bonjour, je travaille sur un maillage Meshtastic à l'échelle d'une commune de 20 000 habitants, plafonné à 50 nœuds, dédié à la diffusion de l'état des ressources en cas de coupure longue.
>
> Deux points sur lesquels j'aimerais un regard critique. D'abord le dimensionnement : je retiens 50 nœuds comme plafond d'exploitation avec LONG_FAST et 3 sauts, en visant moins de 10 % d'occupation du canal. Est-ce cohérent avec vos mesures de terrain ?
>
> Ensuite l'authentification. La clé de canal étant partagée, n'importe qui peut forger un bulletin. J'ai basculé les remontées en messages directs signés par clé publique vers une passerelle, et ajouté une signature applicative sur la synthèse rediffusée, avec une clé distincte de la clé de canal et un compteur anti-rejeu. Est-ce que je passe à côté de quelque chose ?
>
> Tout est documenté et ouvert. Je cherche des erreurs, pas des étoiles.

### 4.3 Courriel à une direction générale des services

> Objet : dispositif communal d'information des habitants en cas de coupure longue
>
> Madame, Monsieur,
>
> Je vous propose un dispositif documente et libre de droits qui répond à une question précise : pendant une coupure électrique et téléphonique prolongée, comment la commune continue-t-elle de dire aux habitants où se trouvent l'eau, les vivres, les soins et les abris.
>
> Le dispositif repose sur 50 boitiers radio autonomes et sur un affichage papier tenu trois fois par jour. L'investissement est de l'ordre de 12 000 euros, le fonctionnement d'environ 1 250 euros par an. La contrainte réelle n'est pas financière mais humaine : environ 300 heures de mise en place et 120 heures par an.
>
> Il s'insère dans les rubriques existantes du plan communal de sauvegarde sans en créer de nouvelle, et il ne se substitue à aucun moyen d'alerte ou de secours.
>
> Je peux vous présenter l'ensemble en trente minutes, ou faire une démonstration lors d'un événement communal déjà prévu, ce qui reste la meilleure entrée en matière.

### 4.4 Une phrase, pour un couloir

> Cinquante boitiers radio autonomes et des feuilles A3 dans les quartiers, pour que la ville sache où est l'eau quand plus rien ne marche. Douze mille euros, et surtout soixante personnes.

## 5. Ce qu'il ne faut jamais écrire

Que le dispositif est agréé, validé ou conforme à une doctrine nationale : il ne l'est pas. Qu'il remplace le 15, le 18, le 112 ou les moyens d'alerte : il ne les remplace pas. Qu'il fonctionne à coup sûr : aucun réseau radio non protégé contre le brouillage ne peut le promettre. Qu'il couvre 20 000 habitants : il couvre 50 points et informe par affichage. Et surtout, aucun chiffre de portée ou de couverture qui n'aurait pas été mesuré sur le terrain concerné.

La crédibilité de ce type de projet se joue entièrement sur la modération des promesses.

## 6. Comment savoir si ça marche

Les étoiles ne mesurent rien. Trois signaux valent quelque chose : une communauté technique qui signale une erreur de fond, une commune qui demande le modèle de grille, et une invitation à présenter. Le reste est du bruit.

## 7. Ce qui reste à faire

Décider de la visibilité du dépôt. Vérifier les critères de référencement des plateformes publiques avant de les solliciter. Produire l'export PDF imprimable. Et identifier une première commune volontaire, ce qui vaut mieux que cent partages.
