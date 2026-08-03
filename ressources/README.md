# Grilles d'inventaire des ressources

Ce dossier contient les grilles vierges qu'une commune remplit pour recenser ce dont elle dispose réellement. C'est la matière première du réseau : sans inventaire, les bulletins radio n'ont rien à annoncer.

## Mode d'emploi

Cloner ou télécharger le dépôt, remplir les tableaux avec les données de la commune, versionner. Les valeurs présentes dans les fichiers sont des **exemples fictifs** destinés à montrer le format attendu : elles doivent toutes être remplacées. Aucune n'est vraie.

Le format Markdown a été choisi pour trois raisons. Il se lit tel quel dans un éditeur de texte, sans logiciel particulier. Il se compare ligne à ligne d'une version à l'autre, donc on voit ce qui a changé et quand. Et il s'imprime proprement, ce qui compte : le jour de la coupure, personne n'ouvrira GitHub.

## Les cinq grilles

| Fichier | Objet | Priorité en coupure |
| --- | --- | --- |
| 01_energie_et_carburants.md | groupes électrogènes, stocks de carburant, recharge | 4 |
| 02_eau_et_alimentation.md | points d'eau, potabilisation, vivres, cuisson | 1 et 3 |
| 03_sante_et_vulnerabilites.md | établissements sensibles, soins, effectifs | 2 |
| 04_logistique_et_transports.md | véhicules, carburant, outillage, voies | transversal |
| 05_humain_et_competences.md | rôles de crise, bénévoles, compétences | transversal |

L'ordre des numéros est celui de la lecture, pas celui de la priorité. La hiérarchie opérationnelle reste celle de conduite-en-coupure.md : eau, santé, alimentation, énergie, abri, information.

## Règles de remplissage

**Un identifiant court par ligne.** Chaque ressource reçoit un identifiant de trois à quatre caractères, du type P07 ou G03, qui sera repris tel quel dans les bulletins radio et sur les tableaux d'affichage. C'est ce qui permet d'annoncer un état en quelques octets. Un identifiant n'est jamais réutilisé après suppression.

**Une date de vérification par ligne.** Une quantité sans date de vérification ne vaut rien. La colonne existe dans toutes les grilles et se remplit au format AAAA-MM-JJ.

**Des états normalisés.** Cinq valeurs et pas d'autres : OK, BAS, VIDE, FERME, HS. Elles correspondent aux codes utilisés par le format de bulletin décrit dans strategie-ressources.md.

**Des ordres de grandeur plutôt que de la fausse précision.** Mieux vaut « environ 1 200 L » vérifié hier que « 1 247 L » daté de l'an dernier.

## Ce qui ne doit jamais entrer dans ces fichiers

Aucun nom de particulier, aucune adresse personnelle, aucun numéro de téléphone privé, aucune donnée de santé individuelle, aucune information sur l'état de vulnérabilité d'une personne identifiable. Le registre communal des personnes vulnérables est nominatif, confidentiel et tenu sous la responsabilité du maire : il reste dans l'annexe confidentielle du plan communal de sauvegarde et **ne figure jamais ici**, même si le dépôt est privé.

Les grilles ne retiennent donc que des lieux, des effectifs agrégés, des capacités et des rôles. Pour les personnels, on écrit la fonction et non le nom : « directeur des services techniques » et pas « M. Untel ». L'annuaire nominatif vit ailleurs.

Deuxième prudence, plus rarement énoncée : un inventaire complet des stocks de carburant, de vivres et de matériel d'une commune est un document sensible en soi. Avant toute publication ouverte, il faut arbitrer avec la commune ce qui reste interne. La structure des grilles peut être publique ; leur contenu rempli ne l'est pas forcément.

## Fréquence de mise à jour

| Grille | Revue complète | Vérification légère |
| --- | --- | --- |
| Énergie et carburants | annuelle | trimestrielle |
| Eau et alimentation | annuelle | semestrielle |
| Santé et vulnérabilités | annuelle | semestrielle |
| Logistique et transports | annuelle | trimestrielle |
| Humain et compétences | annuelle | à chaque mouvement de personnel |

La revue complète se cale sur la mise à jour du plan communal de sauvegarde. Les vérifications légères sont l'occasion de tester les identifiants radio.

## Version imprimable

En coupure, le dépôt est inaccessible. Trois exemplaires papier des cinq grilles remplies, reliés et datés, doivent être déposés dans trois bâtiments différents : mairie, centre technique, et un troisième site à choisir. Ils sont réimprimés à chaque revue annuelle et les anciens sont détruits pour éviter de faire circuler des chiffres périmés.
