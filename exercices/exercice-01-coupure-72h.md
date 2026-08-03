# Exercice 01 - Coupure générale de 72 heures

Scénario de simulation pour tester les grilles de ressources, la chaîne de diffusion et la tenue humaine du dispositif. Conçu pour être joué sur une journée réelle, en jouant trois créneaux qui représentent trois jours.

## 1. Objectifs

Vérifier que les bulletins remontent et sont authentifiés. Vérifier que la synthèse est produite à l'heure. Vérifier que les tableaux sont affichés à l'heure et lisibles. Vérifier que les grilles d'inventaire correspondent à la réalité du terrain. Et mesurer la charge réelle des personnes, qui est la vraie inconnue.

Ce qui n'est **pas** l'objectif : tester les secours, simuler des victimes, mobiliser les sapeurs-pompiers ou la préfecture. Cet exercice est interne à la commune et à ses bénévoles.

## 2. Cadre de jeu

| Paramètre | Valeur |
| --- | --- |
| Durée réelle | 1 journée, 8h - 19h |
| Durée simulée | 72 heures |
| Participants | 25 minimum, 60 en version complète |
| Périmètre | 6 points de ressource, 4 points d'affichage, 1 passerelle |
| Matériel | nœuds réels, gabarits A3 réels, grilles imprimées |
| Règle absolue | aucun téléphone entre participants pendant les phases |

Une cellule d'animation de deux personnes distribue les événements et note les observations. Elle dispose, elle, du téléphone.

## 3. Situation initiale

Coupure générale du réseau électrique sur le département depuis 5h du matin. Réseaux mobiles hors service depuis 9h, les relais ayant épuisé leurs batteries. Internet fixe indisponible. Aucune date de rétablissement annoncée. Température extérieure 4 degrés. Les services de secours fonctionnent normalement mais sont saturés.

Les participants découvrent la situation en arrivant. Les grilles d'inventaire sont sur la table, imprimées, dans leur état réel.

## 4. Déroulé

| Heure réelle | Heure jouée | Phase |
| --- | --- | --- |
| 08h00 | H+3 | ouverture, prise de rôles, allumage des nœuds |
| 08h30 | H+3 | premier relevé, premier bulletin |
| 09h15 | H+4 | première synthèse, premier affichage |
| 10h00 | J+1 matin | injection des événements 1 à 4 |
| 11h30 | J+1 midi | deuxième cycle complet |
| 12h30 | pause | déjeuner, hors jeu |
| 13h30 | J+2 | injection des événements 5 à 8, scénario dégradé |
| 15h00 | J+2 soir | troisième cycle complet |
| 16h00 | J+3 | injection des événements 9 et 10 |
| 17h00 | fin | dernière synthèse |
| 17h30 | - | retour d'expérience à chaud |

## 5. Événements à injecter

| N° | Événement | Ce qu'il teste |
| --- | --- | --- |
| 1 | Le point d'eau P07 tombe à 200 L | cadence de mise à jour, passage à l'état BAS |
| 2 | Un référent n'envoie aucun bulletin | détection du silence, mention non relevé |
| 3 | Un habitant signale une file d'attente de 40 personnes | boucle de retour terrain vers PC |
| 4 | Le groupe électrogène G03 tombe en panne sèche | lien entre grilles 01 et 04, rotation carburant |
| 5 | Un faux bulletin non signé annonce l'ouverture d'un point inexistant | vérification de signature, refus, traçabilité |
| 6 | La passerelle est déclarée HS pendant 45 minutes | mode dégradé synthèse manuscrite |
| 7 | Un établissement sensible demande de l'eau en urgence | priorisation, niveau de message |
| 8 | Une rumeur circule sur un rétablissement à minuit | règle de non-pronostic, réponse par le fait daté |
| 9 | Deux bénévoles se déclarent épuisés | relève, réduction du service |
| 10 | Une personne âgée non voyante se présente au tableau | limite de l'affichage écrit, relais de quartier |

L'événement 5 est le plus important : c'est le test grandeur nature de la solution d'authentification. La cellule d'animation émet un bulletin depuis un nœud non enrôlé et observe si l'opérateur le refuse.

## 6. Indicateurs mesurés

| Indicateur | Cible | Mesuré comment |
| --- | --- | --- |
| Bulletins reçus par créneau | 90 % des points | comptage passerelle |
| Âge médian de l'information affichée | moins de 4 h | écart entre relevé et affichage |
| Occupation du canal | moins de 10 % | relevé ChUtil |
| Signatures invalides acceptées | 0 | observation |
| Affichages à l'heure | 100 % | passage de l'animation |
| Délai de production de la synthèse | moins de 15 min | chronomètre |
| Charge ressentie des participants | à collecter | questionnaire de fin |

## 7. Fiche de rôle, modèle

```
EXERCICE BLACKOUT 01
RÔLE : ..............................
POINT AFFECTÉ : .....................
VOUS DISPOSEZ DE : ..................
VOS 3 CRÉNEAUX : 08h30 / 11h30 / 15h00
CE QUE VOUS DEVEZ FAIRE :
 1. ................................
 2. ................................
 3. ................................
CE QUE VOUS NE DEVEZ PAS FAIRE :
 - utiliser votre téléphone
 - inventer une donnée que vous n'avez pas vérifiée
EN CAS DE BLOCAGE : allez voir l'animation, gilet jaune.
```

## 8. Retour d'expérience

Une demi-heure à chaud le jour même, trois questions seulement : qu'est-ce qui a marché, qu'est-ce qui a bloqué, qu'est-ce qu'on change. Puis une note écrite dans les quinze jours, versée au dépôt dans ce dossier sous le nom exercice-01-retour.md, et une entrée au journal de bord.

Les corrections qui en découlent modifient les documents du dépôt, pas l'inverse. Un exercice qui ne change aucun document n'a rien appris.

## 9. Précautions

Prévenir la population par voie d'affichage que des tableaux d'exercice vont être posés : mentionner « EXERCICE » en très gros sur chaque gabarit, en rouge, et retirer tous les supports en fin de journée. Un tableau d'exercice oublié sur un panneau peut faire croire à une crise réelle. Ne jamais couper réellement une alimentation ou une distribution d'eau pour les besoins du jeu. Et informer la mairie et, par courtoisie, le centre d'incendie et de secours local, même si l'exercice ne les sollicite pas.

## 10. Version allégée

Si 60 participants ne sont pas réunissables, une version à 12 personnes sur trois heures reste utile : 3 points de ressource, 1 passerelle, 2 points d'affichage, 1 cycle complet, événements 1, 2, 5 et 8. Elle teste l'essentiel, dont l'authentification, et coûte une matinée.
