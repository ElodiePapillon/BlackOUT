# Cadre institutionnel : PCS, SGDSN, sapeurs-pompiers

Réponse à trois questions : ce dispositif peut-il s'inscrire dans un Plan Communal de Sauvegarde, a-t-il un sens au regard de la doctrine nationale de résilience portée par le SGDSN, et sert-il à quelque chose aux sapeurs-pompiers.

## 1. Avertissement préalable

Ce document est un travail de projet, pas un avis juridique. Les références de textes citées doivent être revérifiées dans leur version en vigueur sur Legifrance avant tout usage officiel : la matière bouge, et une partie des textes cités a pu être modifiée depuis leur rédaction. Aucun élément ci-dessous ne vaut validation par une administration. Le seul chemin valable pour faire reconnaître le dispositif passe par la commune, puis par le service interministériel de défense et de protection civile de la préfecture.

## 2. Ce que BlackOUT est, juridiquement

Un moyen communal de transmission d'information logistique, exploité sur la bande ISM 868 MHz, sans licence et sans droit de protection contre les brouillages. Ce n'est ni un réseau de sécurité civile, ni un moyen d'alerte des populations, ni un service de communications électroniques au sens réglementaire. Il ne reçoit pas d'appels d'urgence et n'en émet pas.

Cette qualification modeste est un atout. Elle évite d'entrer dans les obligations lourdes qui pèsent sur les réseaux d'alerte et de secours, et elle rend le dispositif déployable par une commune sans autorisation particulière. En contrepartie, il ne faut jamais le présenter comme autre chose que ce qu'il est.

## 3. Adaptation au Plan Communal de Sauvegarde

### 3.1 Ce qu'est le PCS

Le PCS est l'outil de planification du maire pour la sauvegarde de la population. Il relève de l'article L731-3 du code général des collectivités territoriales, issu de la loi de modernisation de la sécurité civile de 2004, dont le champ a été élargi par la loi du 25 novembre 2021 dite loi Matras, laquelle a aussi créé le plan intercommunal de sauvegarde. Un décret d'application de 2022 précise le contenu attendu.

Schématiquement, un PCS comporte un diagnostic des risques et des vulnérabilités, un recensement des moyens communaux mobilisables, l'organisation de l'alerte et de l'information de la population, les dispositions de mise à l'abri, d'évacuation, de ravitaillement et d'hébergement, l'organisation du poste de commandement communal, les modalités d'emploi de la réserve communale de sécurité civile lorsqu'elle existe, et des annexes opérationnelles dont l'annuaire de crise et la cartographie. Il est testé par un exercice périodique.

### 3.2 Où BlackOUT s'insère, rubrique par rubrique

La réponse courte est oui, et sans forcer : le dispositif ne crée pas une rubrique nouvelle, il alimente des rubriques qui existent déjà.

| Rubrique du PCS | Ce que BlackOUT apporte | Document du dépôt |
| --- | --- | --- |
| Recensement des moyens | inventaire structuré et tenu à jour des ressources communales | dossier ressources/ |
| Moyens de transmission de crise | 50 nœuds radio autonomes indépendants du réseau électrique et téléphonique | dimensionnement-maillage.md |
| Information de la population | affichage papier tenu à heure fixe sur points de regroupement | affichage-a3.md |
| Organisation du PCC | passerelle, coordinateur, opérateurs, agents mobiles, référents | conduite-en-coupure.md |
| Ravitaillement et hébergement | localisation et état des points d'eau, de vivres et d'abri en temps quasi réel | strategie-ressources.md |
| Réserve communale de sécurité civile | rôles définis, environ soixante personnes, formation et exercice | conduite-en-coupure.md |
| Exercices | scénario prêt, indicateurs mesurables | exercices/ |
| Continuité des données | grilles en Markdown, versionnées, imprimables | ressources/ |

### 3.3 Ce qu'il faut écrire dans le PCS

Trois insertions suffisent. Dans la fiche des moyens de transmission, une ligne décrivant le réseau, son plafond de 50 nœuds, sa dépendance à rien d'autre qu'à ses propres batteries, et sa fonction limitée à la logistique des ressources. Dans la fiche information de la population, la description des trois créneaux quotidiens et de la liste des points d'affichage. Dans l'annuaire opérationnel, l'identification des porteurs de nœuds par rôle et non par nom, la liste nominative restant dans l'annexe confidentielle du PCS et **jamais dans le dépôt**.

### 3.4 Ce que le PCS impose en retour

L'insertion dans le PCS n'est pas gratuite. Elle emporte trois obligations qu'il faut accepter dès le départ. Le dispositif devient un moyen communal recensé, donc il doit être maintenu en condition opérationnelle et vérifié périodiquement, ce qui justifie les 120 heures annuelles inscrites au budget. Il entre dans le champ de l'exercice périodique, donc il doit être testé pour de vrai et pas seulement décrit. Et il engage la responsabilité de la commune sur ce qui est affiché, ce qui rend obligatoires l'horodatage systématique et la mention de non-substitution aux numéros d'urgence.

Un point de vigilance particulier : le registre communal des personnes vulnérables est nominatif et confidentiel, tenu sous la responsabilité du maire. Il ne doit jamais transiter par la radio, ni figurer dans le dépôt, ni apparaître sur un affichage. La grille santé du dossier ressources ne contient que des effectifs et des lieux.

## 4. Lecture au regard du SGDSN et de la résilience nationale

Le Secrétariat général de la défense et de la sécurité nationale, placé auprès du Premier ministre, ne valide pas d'outils communaux. Il n'y a donc aucun « agrément SGDSN » à chercher, et toute présentation qui le laisserait croire serait fausse. En revanche le dispositif s'inscrit sans difficulté dans les orientations que cette maison porte.

Le premier point d'accroche est la culture de la résilience et la préparation des citoyens, thème constant des travaux de stratégie nationale de résilience. Un réseau tenu par une soixantaine d'habitants formés, exercé une fois par an, est exactement le type de capacité locale que cette orientation appelle. Le second est la continuité d'activité en cas de défaillance d'infrastructures critiques : le dispositif traite le cas où l'électricité et les télécommunications tombent ensemble, scénario que la planification interministérielle prend au sérieux. Le troisième est la lutte contre la désinformation en situation de crise, et c'est là que l'authentification par clé publique prend tout son sens : un canal où n'importe qui pouvait forger un bulletin n'aurait eu aucune valeur institutionnelle.

Il faut aussi voir les limites de l'analogie. Le dispositif de sécurité des activités d'importance vitale, avec ses opérateurs désignés, ses points d'importance vitale et ses plans de sécurité, ne concerne pas une commune de 20 000 habitants en tant que telle. Une commune peut en revanche héberger des installations qui en relèvent, et dans ce cas la coordination passe par la préfecture, pas par le dépôt.

En résumé, la bonne formulation est : dispositif communal cohérent avec les orientations nationales de résilience. Pas : dispositif conforme au SGDSN.

## 5. Utilité pour les sapeurs-pompiers

### 5.1 Ce que le réseau ne fera jamais

Il ne remplace pas ANTARES. Les services d'incendie et de secours et les SAMU disposent d'un réseau radio numérique national, chiffré, redondé et conçu pour l'opérationnel, avec une chaîne de commandement. Un maillage LoRa à quelques centaines d'octets par message et à la seconde de latence n'a rien à y voir. Il ne reçoit pas d'appel d'urgence, il ne déclenche pas de départ de secours, il ne porte pas d'ordre opérationnel. Le 18 et le 112 restent la seule voie d'alerte.

### 5.2 Ce qu'il apporte quand même

Quatre apports concrets, tous du côté de la connaissance de situation et non du commandement.

| Apport | Détail | Valeur pour le COS |
| --- | --- | --- |
| Carte des ressources à jour | points d'eau ouverts, cuves, groupes électrogènes, stocks de carburant | gain de temps sur la logistique longue durée |
| État des établissements sensibles | Ehpad, foyers, autonomie des groupes | priorisation des reconnaissances |
| Points d'eau incendie | état et pression des poteaux, réserves et points d'aspiration | complément de la base départementale entre deux campagnes |
| Filtrage du bruit | la population trouve l'information logistique sur les tableaux | moins d'appels non urgents au CTA |

Ce dernier point est probablement le plus utile. Lors d'une coupure longue, une part importante des appels au centre de traitement de l'alerte ne relève pas du secours mais de la recherche d'information : où trouver de l'eau, jusqu'à quand ça dure, où recharger un appareil. Chaque appel de ce type détourne une ressource. Un affichage fiable, tenu à heure fixe et connu de tous, absorbe cette demande en amont.

### 5.3 Comment articuler proprement

L'articulation se fait au niveau de la commune, pas du réseau. Le centre d'incendie et de secours local n'a pas à recevoir de bulletins radio : il reçoit, du poste de commandement communal, une synthèse écrite aux mêmes heures que l'affichage. Un nœud peut être placé au CIS à titre de courtoisie pour recevoir la synthèse, mais il reste en réception et ne crée aucune obligation. Toute intégration plus poussée relève d'une convention avec le service départemental, et d'une décision qui n'appartient ni au projet ni à la commune seule.

Les usages hors coupure déjà identifiés recoupent leurs préoccupations : vigie feux de forêt en période de risque, surveillance hydrologique en amont des zones inondables, couverture d'événements publics, exercices. Ce sont autant de portes d'entrée pour un premier contact.

## 6. Les trois lignes rouges

Pas de données nominatives ni de données de santé dans le dépôt, sur la radio ou sur un affichage. Pas de présentation du dispositif comme un moyen d'alerte ou de secours. Pas d'usage permettant de suivre des personnes. Ces trois règles sont déjà inscrites dans les autres documents ; elles sont ici parce que ce sont précisément celles qu'une administration vérifiera.

## 7. Chemin réaliste vers la reconnaissance

Première étape, un dossier de deux pages pour le directeur général des services et l'élu chargé de la sécurité civile : ce que c'est, ce que ça coûte, ce que ça ne fait pas. Deuxième étape, une démonstration sur un événement public déjà prévu, où le réseau tourne sans enjeu. Troisième étape, l'inscription au PCS lors de sa mise à jour, avec les trois insertions décrites plus haut. Quatrième étape seulement, la présentation au service interministériel de la préfecture et au service départemental d'incendie et de secours, avec un retour d'exercice à l'appui.

L'ordre compte. Un dispositif présenté à la préfecture avant d'avoir jamais fonctionné un jour de fête communale n'a aucune chance.

## 8. Ce qui reste à vérifier

L'état en vigueur des textes cités. L'existence et le contenu du PCS de la commune concernée. L'existence d'une réserve communale de sécurité civile, qui changerait le modèle de mobilisation. La position du service départemental sur l'implantation d'un nœud dans un centre d'incendie et de secours. Et la couverture assurantielle des bénévoles porteurs de nœuds, question sans réponse à ce stade.
