# 02 - Eau et alimentation

Première priorité du dispositif. Sans électricité, les pompes s'arrêtent et les réservoirs se vident par gravité en quelques heures à un jour selon la topographie. C'est la ressource dont l'état change le plus vite, donc celle que le réseau radio suit le plus étroitement.

> Les valeurs ci-dessous sont **fictives**. Elles montrent le format attendu et doivent toutes être remplacées.

## 1. Points de distribution d'eau potable

| Id | Lieu | Type de ressource | Capacité ou débit | Potabilisation | Horaires prévus | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- | --- |
| P01 | Parc municipal | source gravitaire | 10 m3 par jour | distribution directe, analyse mensuelle | 8h - 18h | OK | 2026-01-12 |
| P03 | Stade | forage avec pompe manuelle | 2 m3 par jour | pastilles de chlore | 8h - 12h | BAS | 2026-01-12 |
| P07 | Place du marché | cuves mobiles, 3 x 2 000 L | 6 000 L | eau du réseau embouteillée avant coupure | 8h - 18h | OK | 2026-01-12 |
| P12 | École Jean Moulin | citerne souple | 5 000 L | pastilles de chlore | 8h - 12h | VIDE | 2025-12-18 |

Chaque identifiant de cette table est celui qui apparaît dans les bulletins radio et sur les tableaux d'affichage. Ne jamais le changer sans mettre à jour les deux autres supports.

## 2. Moyens de potabilisation

| Id | Moyen | Quantité en stock | Capacité de traitement | Péremption | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| T01 | Pastilles de chlore | 4 000 unités | 4 000 L | 2028-06 | OK | 2026-01-12 |
| T02 | Filtres céramique gravitaires | 6 | 30 L par heure chacun | cartouches 2027 | OK | 2026-01-12 |
| T03 | Bouilloires à gaz | 4 | 20 L par heure | sans objet | BAS | 2025-11-05 |

Faire bouillir reste la méthode la plus sûre et la plus coûteuse en énergie. Les pastilles sont le moyen de masse ; les filtres servent les points fixes.

## 3. Contenants et transport de l'eau

| Id | Matériel | Quantité | Capacité unitaire | Lieu | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| K01 | Jerricans alimentaires 20 L | 60 | 20 L | centre technique | OK | 2026-01-10 |
| K02 | Citernes souples 1 000 L | 4 | 1 000 L | centre technique | OK | 2026-01-10 |
| K03 | Remorque citerne tractée | 1 | 3 000 L | centre technique | HS | 2025-08-22 |

Le besoin de référence usuel est de trois à cinq litres par personne et par jour pour la boisson et l'hygiène minimale. Pour 20 000 habitants cela représente 60 à 100 m3 par jour, très au-delà de ce que les moyens ci-dessus couvrent. Le dispositif ne prétend pas alimenter la ville : il indique où se trouve ce qui existe.

## 4. Stocks alimentaires et cuisson

| Id | Lieu | Type de vivres | Capacité estimée | Cuisson sans électricité | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| A01 | Cuisine centrale | produits secs et conserves | 4 000 repas | brûleurs à gaz professionnels | OK | 2026-01-08 |
| A02 | Banque alimentaire locale | denrées non périssables | 1 500 rations | aucune, rations froides | OK | 2026-01-08 |
| A03 | Cantine école nord | conserves | 600 repas | réchauds camping | BAS | 2025-12-01 |

## 5. Chaîne du froid

| Id | Lieu | Volume | Source de secours | Autonomie sans courant | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| F01 | Chambre froide cuisine centrale | 30 m3 | groupe G01 en report | 6 h portes fermées | OK | 2026-01-08 |
| F02 | Congélateurs banque alimentaire | 4 x 400 L | aucune | 24 h portes fermées | OK | 2026-01-08 |

La chaîne du froid est le poste où l'on perd le plus de valeur en silence. C'est l'un des dix usages courants identifiés pour le réseau : des sondes de température qui remontent une alerte avant que le stock ne soit perdu.

## 6. Points de vigilance

Un château d'eau plein ne veut pas dire un robinet qui coule : la distribution dépend souvent de surpresseurs électriques dans les étages. Une source gravitaire est un trésor précisément parce qu'elle ne dépend de rien. Les cuves mobiles doivent être remplies **avant** la perte de pression, donc la décision de remplissage se prend tôt, sur signal faible. Enfin l'eau non potable a aussi une valeur : sanitaires, nettoyage, lutte contre l'incendie. La recenser séparément évite de gaspiller de l'eau traitée.

## 7. À compléter par la commune

Le temps réel de vidange des réservoirs sans pompage, donnée que seul l'exploitant du réseau connaît. L'existence de sources et de puits privés recensés. Les conventions avec les grandes surfaces et la banque alimentaire. Et la capacité réelle de cuisson en collectif, souvent surestimée.
