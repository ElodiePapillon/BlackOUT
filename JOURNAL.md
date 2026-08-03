# Journal de bord — BlackOUT

Ce fichier retrace l'avancement du projet : ce qui est fait, ce qui est décidé, ce qui reste ouvert. Le README demeure le document de référence technique ; le journal n'en trace que l'histoire.

Tenue du journal : une entrée à chaque étape franchie, et au minimum une par session de travail. Entrées classées de la plus récente à la plus ancienne.
## 2026-08-03 — Authentification des bulletins, conduite en coupure, budget et usages courants

### Le problème de sécurité est fermé

La faille signalée était réelle et bloquante : sur un canal Meshtastic, la clé AES256 est partagée par tous les membres, elle n'apporte que de la confidentialité, aucun contrôle d'intégrité et aucune authentification. Le champ expéditeur n'est qu'indicatif : quiconque détient la clé peut forger un bulletin « il reste 1 200 litres au point P07 » sous l'identité d'un autre nœud. Pour un réseau dont la seule raison d'être est de dire où sont les ressources, c'était rédhibitoire.

La solution retenue tient en trois décisions, détaillées dans securite-authentification.md. Les bulletins ne sont plus postés sur le canal : ils partent en messages directs vers la passerelle, donc chiffrés avec la clé publique du destinataire et signés avec la clé privée de l'émetteur, ce que le firmware fait nativement depuis la 2.5.0. La synthèse rediffusée à tout le monde, elle, reste un message de canal, mais elle porte désormais une signature applicative calculée avec une clé de synthèse distincte de la clé de canal, tronquée à huit caractères pour le courant et complète en Ed25519 pour les messages à fort impact. Un compteur monotone par émetteur empêche le rejeu d'un ancien bulletin encore valide. Enfin les relais de toiture, matériel exposé et non surveillé, ne détiennent aucune clé privée de canal : ils relaient sans lire.

Ce que cela ne résout pas est écrit noir sur blanc : un nœud volé déverrouillé reste légitime jusqu'à révocation, il n'y a pas de confidentialité persistante, les en-têtes circulent en clair et rien ne protège du brouillage. Le coût du dispositif a été chiffré : environ cinquante secondes d'air par heure, soit 1,4 % d'occupation du canal, ce qui reste très en deçà du seuil.

### La conduite en coupure part de l'humain, pas de la radio

conduite-en-coupure.md pose le principe demandé : c'est l'activité humaine qui s'adapte au réseau. Un maillage de 50 nœuds ne peut pas absorber un flux continu, donc la ville passe à trois créneaux fixes par jour — relève 07h00, mi-journée 12h30, clôture 18h00 — suivis chacun d'une synthèse et d'un affichage papier A3 dans les quartiers, avec silence radio de 19h30 à 06h30 pour économiser les batteries. Quatre règles gouvernent le reste : on consulte à heure dite au lieu d'interroger en continu, on déplace l'information plutôt que les personnes, on concentre l'activité sur les heures de jour, on réduit le nombre de décisions à prendre.

Six services vitaux sont hiérarchisés dans cet ordre : eau, santé, alimentation, énergie, abri, information. Le document fixe un profil radio de crise, cinq niveaux de priorité de message avec suspension des niveaux bas au-delà de 15 % d'occupation, des modes dégradés, et cinq indicateurs de bonne santé. Il chiffre aussi la ressource la plus rare : environ soixante personnes mobilisées, dont vingt-sept référents de point, deux opérateurs passerelle et un coordinateur doublé.

### Le budget

budget.md chiffre l'ensemble à environ 12 350 euros en investissement initial, soit 0,62 euro par habitant, et 1 250 euros de fonctionnement annuel. Les 50 nœuds représentent 8 750 euros, l'affichage et l'outillage le reste. Le déploiement est découpé en quatre paliers, du premier essai à 550 euros jusqu'au maillage complet, pour pouvoir s'arrêter ou continuer à chaque étape. La vraie contrainte n'est pas l'argent : c'est 300 heures de travail humain pour la mise en place et 120 heures par an ensuite.

### Dix usages hors coupure

usages-hors-coupure.md répond à la dernière demande, avec une intention précise : un réseau qui ne sert qu'en cas de crise ne fonctionne pas le jour de la crise. Les dix usages retenus vont de la couverture d'événements publics aux battues et recherches de personne, à la surveillance hydrologique, aux sites communaux isolés, à la chaîne du froid, à la vigie feux, à la météo de quartier, aux chantiers et sous-sols, à la pédagogie et à l'exercice annuel du plan communal. Trois règles encadrent le tout : la stratégie ressources reste prioritaire, le profil de crise suspend tous les usages courants, et aucun usage ne doit servir à suivre des personnes.

### À faire

Enrôler les clés publiques en présentiel et publier le registre signé, maquetter le tableau d'affichage A3, puis monter le premier exercice grandeur nature sur trois créneaux. Côté matériel, la commande des deux premiers nœuds et les tests de portée au sol restent en attente.


## 2026-08-02 — Automatisation du journal, plafond de 50 nœuds, stratégie ressources

### Automatisation de la tenue du journal

Le workflow `.github/workflows/journal.yml` prend désormais en charge la tenue du journal. Deux usages : le bouton « Run workflow » ajoute une entrée datée en tête de fichier à partir d'un titre et d'un contenu saisis, et une vérification hebdomadaire ouvre un ticket de rappel si le journal n'a pas bougé depuis sept jours. Le premier essai a réussi en douze secondes, et c'est lui qui a produit la première version de la présente entrée.

La cadence de quinze minutes initialement demandée a été écartée, pour trois raisons inscrites en commentaire dans le fichier lui-même. GitHub n'exécute les tâches planifiées qu'au mieux, avec des retards fréquents et parfois des exécutions sautées. Chaque exécution consomme le quota d'Actions du dépôt privé, soit près de 2 900 exécutions par mois pour un intervalle de quinze minutes. Et le résultat serait un historique de milliers de commits vides, sans aucune valeur documentaire. Le rappel est donc hebdomadaire et les entrées réelles sont ajoutées à la demande.

### Décisions prises

| Décision | Contenu |
|---|---|
| Plafond du réseau | 50 nœuds, ferme, soit environ 20 % de marge sous le point de saturation |
| Finalité première | diffuser où sont les ressources, en quelle quantité, et depuis quand l'information date |
| Unité desservie | des points et non des foyers : eau, alimentation, santé, énergie, regroupement de quartier |
| Diffusion vers la population | affichage tenu aux points de regroupement, alimenté par le tableau de bord de la passerelle |
| Canaux | un seul canal utile ; un second canal ne crée aucune capacité supplémentaire |
| Cadence des bulletins | immédiate à tout changement d'état, sinon toutes les deux heures |

### Correction apportée aux notes précédentes

| Sujet | Correction |
|---|---|
| Cible de déploiement | 50 nœuds, et non 100 à 200 comme écrit à l'entrée précédente. Le chiffre de 100 à 200 supposait des réglages disciplinés jamais vérifiés sur le terrain ; celui de 50 tient avec les intervalles par défaut, ce qui est la seule hypothèse prudente. |

### Travaux menés

Création de `strategie-ressources.md` : justification du plafond, répartition des 50 nœuds par fonction, format de bulletin tenant dans un seul paquet de 237 octets, codes ressource et états, calcul du coût en temps d'antenne, règles d'exploitation et limites assumées.

Mise à jour du README : ajout du document à l'index, énoncé de la finalité opérationnelle dès l'introduction, réécriture de la limite de capacité en section 8, cinq lignes ajoutées à la feuille de route.

### Résultat marquant de la session

Le plafond de 50 nœuds n'est pas une contrainte technique mais une règle d'exploitation, et c'est là sa fragilité : rien dans Meshtastic n'empêche un cinquante-et-unième nœud de rejoindre le canal. Tenir le chiffre suppose une personne identifiée qui attribue les nœuds. C'est un problème d'organisation, pas de radio.

### À faire à la prochaine session

Constituer le registre des points de ressource, qui conditionne tout usage réel du format de bulletin. Écrire et essayer la procédure de bascule vers le second nœud du poste de commandement. Trancher la rotation des clés de canal. Reprendre les tâches déjà listées : prix réels des cartes chez un revendeur européen, protocole de test de portée, repérage des points hauts, recherche d'un maillage déjà actif dans le département.

## 2026-08-02 — Session de reprise

### État des lieux à l'ouverture

Le dépôt ne contenait que le README. Le cadrage technique y était solide : principe LoRa 868 MHz sous Meshtastic, cadre réglementaire EU_868, arbitrage du préréglage modem sur LONG_FAST, ordres de grandeur de portée urbaine, familles de matériel, dimensionnement solaire, configuration de référence et limites connues. En revanche la feuille de route était entièrement à l'état de projet : aucune des sept étapes n'était engagée, et la section 10 ne contenait qu'une liste de pistes non instruites.

Manque principal identifié : le document décrivait un système mais ne le dimensionnait pas. Rien n'indiquait combien de nœuds sont nécessaires pour couvrir une ville de 20 000 habitants, ni comment les répartir, ni quelle charge le canal peut réellement supporter.

### Travaux menés

Ouverture du présent journal de bord.

Relecture de la documentation Meshtastic à jour : configuration LoRa, configuration des appareils, algorithme de diffusion, billet sur le choix des rôles, billet sur ROUTER_LATE. Trois de ces sources n'étaient pas encore référencées dans le README.

Rédaction de trois documents de travail : dimensionnement-maillage.md, materiel-premiers-noeuds.md et antennes-energie-alternatives.md.

Mise à jour du README : index des documents, corrections de fond, feuille de route révisée, sources complétées.

### Décisions prises

| Décision | Contenu |
| --- | --- |
| Cible de déploiement | 100 à 200 nœuds pour 20 000 habitants, soit un nœud pour 100 à 200 personnes |
| Nature du réseau | réseau de points de contact entre référents, pas messagerie grand public |
| Ossature | 4 à 6 relais en hauteur pour le tissu continu, plus 1 à 2 pour les écarts |
| Paliers | amorçage à 2 nœuds, ossature à 3 relais, ville à 6 relais, bassin de vie à 8 |
| Nœud A | carte nRF52840 avec GPS et écran, mobile de test puis terminal personnel |
| Nœud B | carte nRF52840 avec antenne externe, nœud fixe du domicile en CLIENT_BASE |
| Premier relais | solution clé en main pour aller vite, relais sur mesure ensuite |
| Bande | 868 MHz confirmé, le 433 MHz écarté après calcul |
| Nombre de sauts | 3, sans augmentation |

### Corrections apportées aux notes initiales

| Sujet | Correction |
| --- | --- |
| Rôle du nœud de toiture | CLIENT_BASE et non ROUTER ou ROUTER_LATE, que la documentation déconseille explicitement pour ce cas |
| Rôle REPEATER | déprécié depuis le firmware 2.7.11 |
| Charge par temps froid | le LiFePO4 ne se charge pas davantage sous 0 °C ; la vraie protection est la coupure basse température, pas la chimie |
| Panneau solaire | 15 à 20 W crête et non 5 à 10, après calcul du gisement de décembre |
| Régulateur MPPT | sa consommation propre peut dépasser celle du nœud ; à spécifier avant achat |
| Charge utile | 237 octets et non environ 200 |

### Résultat marquant de la session

Le facteur limitant du projet n'est pas la portée mais la capacité du canal. Avec les intervalles par défaut, une soixantaine de nœuds saturent déjà un maillage LONG_FAST, avant même le premier message utile. C'est ce calcul qui fixe la cible de 100 à 200 nœuds et qui impose la nature du dispositif : coordination entre référents plutôt que messagerie ouverte.

### À faire à la prochaine session

Vérifier la disponibilité et les prix réels des cartes retenues chez un revendeur européen, puis arrêter la commande du palier 0. Préparer le protocole de test de portée : itinéraire, points de mesure, grille de relevé. Lister les points hauts candidats de la commune à partir des vues aériennes avant tout déplacement. Vérifier l'existence d'un maillage Meshtastic déjà actif dans le département.
