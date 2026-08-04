# Diffusion institutionnelle et dépôt pérenne

Ce document fixe une chose : où déposer le projet pour qu'il soit citable, conservé et référencé. Il ne comporte aucune donnée nominative et n'entre pas dans le classeur de crise décrit dans export-imprimable.md.

## 1. Pourquoi le dépôt pérenne passe avant tout le reste

Un travail cité sans référence stable devient introuvable en quelques mois. Un lien vers un dépôt privé renvoie une page d'erreur au premier lecteur qui clique. Un projet sans licence lisible ne peut pas être repris par un service public, même quand il le voudrait.

D'où l'ordre suivant, qui ne se raccourcit pas : rendre le dépôt public, figer une version, obtenir un identifiant pérenne, puis demander le référencement aux plateformes.

| Étape | Ce qu'elle produit | Qui la fait |
| --- | --- | --- |
| 1 | Relecture des exemples fictifs et des noms | La propriétaire, avant tout le reste |
| 2 | Passage du dépôt en public | La propriétaire du dépôt, elle seule |
| 3 | Version 0.1.0 et publication d'une release | La propriétaire |
| 4 | Archivage Zenodo et obtention du DOI | La propriétaire, avec son compte Zenodo |
| 5 | Déclaration à Software Heritage | Conservation longue durée du contenu |
| 6 | Dépôt sur HAL | Référencement dans l'archive ouverte française |
| 7 | BlueHats et code.gouv.fr | Visibilité dans l'écosystème du secteur public |

Les étapes 2 à 4 ne se délèguent pas : changer la visibilité d'un dépôt et publier de manière irréversible sont des décisions de la propriétaire, et elles supposent une authentification personnelle.

## 2. Ce qui doit être relu avant de rendre public

Toutes les valeurs des grilles du dossier ressources sont fictives et doivent le rester dans la version publique. Une grille remplie par une commune réelle est une cartographie de ses points faibles : emplacement et débit des points d'eau, position des groupes électrogènes, établissements sensibles et leur autonomie exacte. Ce type de document n'a pas sa place dans un dépôt public. La version publique ne contient que des gabarits vierges ; les inventaires réels vivent dans le circuit interne de la commune.

Vérifier aussi qu'aucun nom de personne n'apparaît, y compris dans le journal de bord et dans les messages de commit, car l'historique reste lisible après publication.

## 3. Zenodo, pas à pas

Zenodo attribue un identifiant pérenne au dépôt. C'est ce qui permet à un service public de citer le travail dans une note interne sans dépendre de la survie d'un compte GitHub. Le chemin le plus court passe par l'intégration GitHub de Zenodo.

Se connecter à Zenodo, ouvrir la page des dépôts GitHub liés, activer l'interrupteur en face de BlackOUT, puis revenir sur GitHub et publier une release, par exemple v0.1.0, avec un titre en français. Zenodo récupère l'archive et lit CITATION.cff pour le titre, l'auteur, la licence et les mots-clés.

Deux points ne se rattrapent pas. Un enregistrement Zenodo publié ne se supprime pas, c'est le principe même d'un dépôt pérenne, donc la relecture de la section 2 se fait avant et non après. Et c'est l'identifiant de concept, celui qui désigne toutes les versions, qu'il faut citer partout, pas celui d'une version précise qui vieillira.

Deux réglages ajoutent de la crédibilité sans rien coûter : ouvrir un identifiant ORCID et le déclarer dans CITATION.cff, et décrire le dépôt comme une documentation technique plutôt que comme un logiciel, ce qui correspond à la réalité du contenu. Une fois le DOI obtenu, l'inscrire dans CITATION.cff et dans le README.

## 4. Software Heritage, HAL, code.gouv.fr et BlueHats

| Plateforme | Ce qu'elle apporte | Prérequis | Limite à connaître |
| --- | --- | --- | --- |
| Software Heritage | Conservation longue durée du contenu et de son historique | Dépôt public, déclaration de l'adresse | N'attribue pas de référence citable au sens des administrations |
| HAL | Référencement dans l'archive ouverte française | Compte, dépôt de type logiciel ou rapport | L'affiliation à un laboratoire facilite mais n'est pas exigée |
| code.gouv.fr | Catalogue des codes sources du secteur public | En principe un dépôt porté par un organisme public | Un dépôt personnel est probablement hors périmètre ; à vérifier auprès de l'équipe |
| BlueHats | Communauté des agents publics autour du logiciel libre, lettre d'information, rencontres | Ouvert à tous | Fait connaître, ne référence pas et ne valide pas |

Une nuance qui évite un malentendu : ce projet n'est pas un logiciel mais une documentation d'ingénierie territoriale accompagnée de configurations radio. Il faut le présenter ainsi, sans quoi la première question reçue sera de savoir où est le code.

## 5. Ce qu'il ne faut jamais écrire

Ni conforme SGDSN, ni agréé, ni homologué : aucun de ces mots ne correspond à une procédure existante pour un outil communal de ce type, et leur emploi suffit à disqualifier un dossier auprès d'un lecteur compétent. Ne jamais présenter le dispositif comme un moyen d'alerte des populations ni comme un réseau de secours. Ne jamais publier un inventaire rempli. Ne promettre ni couverture radio ni disponibilité qui n'ait été mesurée sur le terrain. Ne pas annoncer de calendrier de déploiement tant que la commande du premier palier n'est pas passée.

## 6. À trancher

Le nom sous lequel l'autrice signe le dépôt pérenne, qui doit être identique partout, faute de quoi la trace se disperse. L'ouverture d'un identifiant ORCID. Le périmètre exact de ce qui devient public. Et la question de fond : demander le référencement dès maintenant, ou attendre qu'une commune ait conduit l'exercice de 72 heures décrit dans le dossier exercices.
