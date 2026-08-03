# Exporter le dépôt en un document imprimable

En coupure, GitHub n'est pas accessible. Ce dépôt n'a de valeur opérationnelle que si son contenu existe sur papier, dans un classeur, avant la coupure. Cette notice explique comment produire ce classeur, à quelle fréquence le refaire, et ce qu'il faut plastifier.

## 1. Le principe : deux objets différents

Il ne faut pas confondre deux besoins distincts qui appellent deux impressions différentes.

Le premier est le **classeur de référence** : l'intégralité du dépôt, relié, un exemplaire en mairie, un au centre technique, un chez le référent radio. On le consulte pour comprendre, décider, configurer. Il est imprimé recto-verso en noir et blanc, il fait entre 80 et 120 pages, il n'a pas besoin d'être plastifié.

Le second est le **jeu de fiches de terrain** : quelques feuilles seulement, plastifiées, écrites au feutre effaçable, emportées sur le terrain ou punaisées. Il contient les grilles de ressources vierges, le tableau A3, la fiche de conduite en coupure et les fiches de rôle de l'exercice. C'est ce jeu que l'on utilise réellement pendant la crise.

## 2. Ce qui va dans le classeur de référence

| Ordre | Fichier | Pourquoi il y est |
| --- | --- | --- |
| 1 | README.md | Porte d'entrée, dit ce que le dispositif est et n'est pas |
| 2 | conduite-en-coupure.md | Le seul document que l'on ouvre en premier le jour J |
| 3 | diffusion-sans-electricite.md | La chaîne relevé, synthèse, affichage, mégaphone |
| 4 | affichage-a3.md | Le gabarit et les règles de remplissage |
| 5 | ressources/README.md puis 01 à 05 | Les six grilles, dans l'ordre |
| 6 | strategie-ressources.md | Le raisonnement derrière les grilles |
| 7 | reference-technique.md | Radio, portée, matériel, préréglages |
| 8 | securite-authentification.md | Signature des bulletins, enrôlement des clés |
| 9 | dimensionnement-maillage.md | Pourquoi 50 nœuds et pas 500 |
| 10 | materiel-premiers-noeuds.md | Ce qu'il faut commander |
| 11 | antennes-energie-alternatives.md | Alimentation des relais |
| 12 | budget.md | Coût d'investissement et de fonctionnement |
| 13 | cadre-institutionnel.md | PCS, SGDSN, sapeurs-pompiers |
| 14 | exercices/exercice-01-coupure-72h.md | Le scénario et ses fiches de rôle |
| 15 | usages-hors-coupure.md | Ce qui fait vivre le réseau le reste du temps |
| 16 | partager-le-projet.md | À qui parler du projet |

Le journal de bord et la licence ne vont pas dans le classeur. Le journal est un objet de travail, la licence un objet juridique ; ni l'un ni l'autre ne sert en coupure.

## 3. Méthode simple, sans outil à installer

Cette méthode ne demande qu'un navigateur. Elle convient si l'on produit le classeur une ou deux fois par an.

Ouvrir chaque fichier de la liste ci-dessus dans son affichage rendu sur GitHub, dans l'ordre du tableau. Utiliser l'impression du navigateur, choisir « Enregistrer au format PDF », décocher les en-têtes et pieds de page du navigateur, régler les marges sur « par défaut ». On obtient un PDF par fichier. Les assembler ensuite en un seul document avec n'importe quel outil de fusion de PDF hors ligne, puis imprimer.

Le défaut de cette méthode est qu'elle emporte l'interface de GitHub dans la marge et qu'elle produit des tableaux parfois coupés en deux pages. Elle reste acceptable pour le classeur de référence, pas pour les fiches de terrain.

## 4. Méthode propre, avec Pandoc

Pandoc convertit du Markdown en PDF sans interface parasite, respecte les tableaux et génère une table des matières. Il est libre, disponible sur les trois systèmes, et ne demande pas de droits particuliers sur un poste de mairie une fois installé.

La commande à retenir, exécutée à la racine du dépôt cloné, enchaîne les fichiers dans l'ordre du tableau de la section 2 et produit un seul PDF paginé avec sommaire. Le principe est d'énumérer les fichiers dans l'ordre voulu, de demander une table des matières à deux niveaux, une taille de police de 11 points, un format A4, et un titre de document explicite portant la date d'export. La date dans le titre est ce qui permet, six mois plus tard, de savoir si le classeur posé sur l'étagère est encore à jour.

Un script d'export est à écrire et à déposer dans le dépôt. Il n'existe pas encore : c'est une tâche ouverte, inscrite au journal. Tant qu'il n'existe pas, la méthode de la section 3 fait le travail.

## 5. Les fiches de terrain à plastifier

| Fiche | Format | Nombre | Où |
| --- | --- | --- | --- |
| Tableau d'affichage A3 vierge | A3 portrait, 120 g | 600 pré-imprimés, 3 plastifiés | Mairie, centre technique, référent |
| Grilles ressources 01 à 05 vierges | A4 paysage | 3 jeux plastifiés | Un jeu par bâtiment |
| Fiche de conduite en coupure, page 1 | A4 recto-verso | 10 plastifiés | Un par référent de quartier |
| Liste des points d'eau et établissements sensibles | A4 | 10 plastifiés | Un par référent de quartier |
| Plan de la commune avec les points d'affichage | A3 | 3 plastifiés | Mairie, centre technique, CIS |
| Fiches de rôle de l'exercice | A5 | 1 jeu | Classeur exercice |

Les fiches plastifiées s'écrivent au feutre effaçable à sec. Prévoir les feutres et un chiffon avec les fiches : une fiche plastifiée sans feutre ne sert à rien.

## 6. Fréquence de réédition

Le classeur de référence est réédité à chaque modification substantielle du dispositif, et au minimum une fois par an. La réédition annuelle est calée sur la révision du PCS pour éviter deux exercices séparés.

Les fiches de terrain sont rééditées dès qu'une donnée structurante change : ouverture ou fermeture d'un point d'eau, changement d'un point d'affichage, modification de la liste des établissements sensibles. Ces changements sont rares mais une fiche fausse est pire qu'une fiche absente.

Chaque exemplaire porte au feutre, sur la couverture, la date d'impression et le nom de celui qui l'a imprimé. Les exemplaires périmés sont retirés physiquement, sinon ils circulent.

## 7. Ce qui ne doit jamais être imprimé

Aucune fiche, aucun classeur, aucun tableau ne comporte de nom de personne, d'adresse de personne vulnérable, ni d'information de santé. La règle est la même sur le papier que sur la radio et que dans le dépôt. Le registre communal des personnes vulnérables reste sous la responsabilité de la mairie, dans son circuit propre, et n'entre pas dans ce classeur.

Les clés de canal et les clés privées des nœuds ne sont jamais imprimées dans un document diffusé. Leur conservation relève de la procédure d'enrôlement décrite dans securite-authentification.md.

## 8. À trancher

Qui détient les trois exemplaires du classeur et qui est responsable de leur retrait quand ils sont périmés. Le budget d'impression et de plastification, qui n'est pas encore chiffré dans budget.md. L'écriture du script d'export Pandoc, aujourd'hui absente du dépôt. Le choix du prestataire d'impression pour les 600 A3, qui conditionne le délai avant le premier exercice.
