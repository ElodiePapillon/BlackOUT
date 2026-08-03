# 01 - Énergie et carburants

Capacité de la commune à maintenir en vie ses services critiques sans réseau électrique : pompage de l'eau, poste de commandement, établissements sensibles, abris.

> Les valeurs ci-dessous sont **fictives**. Elles montrent le format attendu et doivent toutes être remplacées.

## 1. Groupes électrogènes

| Id | Emplacement | Puissance | Carburant | Autonomie réservoir plein | Équipements secourus | Test de démarrage | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| G01 | Mairie, PC de crise | 40 kVA | gazole | 48 h | éclairage, prises, passerelle radio | mensuel | OK | 2026-01-15 |
| G02 | Station de pompage nord | 110 kVA | gazole | 24 h | pompes principales | mensuel | OK | 2026-01-15 |
| G03 | Gymnase centre, abri | 20 kVA | essence | 12 h | éclairage minimum | trimestriel | BAS | 2025-11-02 |
| G04 | Centre technique | 15 kVA | gazole | 20 h | atelier, recharge outillage | trimestriel | HS | 2025-09-30 |

L'autonomie annoncée est celle d'un réservoir plein à charge nominale. En charge partielle elle augmente, mais on ne planifie jamais sur l'optimiste. La colonne test de démarrage est la plus importante du tableau : un groupe non démarré depuis un an ne démarrera pas.

## 2. Stocks de carburant

| Id | Lieu de stockage | Type | Capacité | Stock au dernier relevé | Pompe de secours manuelle | Accès sans électricité | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| C01 | Centre technique municipal | gazole | 5 000 L | 3 800 L | oui | oui, portail mécanique | OK | 2026-01-10 |
| C02 | Station-service conventionnée | SP95 | 15 000 L | inconnu | non | non, nécessite groupe mobile | BAS | 2025-12-20 |
| C03 | Bidons gymnase | essence | 200 L | 120 L | sans objet | oui | OK | 2026-01-10 |

Un stock de carburant sans moyen de le sortir de la cuve n'est pas un stock. La colonne pompe de secours manuelle décide de tout. Le carburant vieillit : le gazole se conserve environ un an, l'essence bien moins ; prévoir une rotation.

## 3. Points de recharge pour la population

| Id | Lieu | Source | Nombre de prises | Plage horaire prévue | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| R01 | Gymnase centre | groupe G03 | 12 | 9h - 12h et 14h - 17h | OK | 2026-01-15 |
| R02 | Mairie, hall | groupe G01 | 6 | 9h - 12h | OK | 2026-01-15 |
| R03 | Salle des fêtes est | solaire mobile | 8 | selon ensoleillement | HS | 2025-10-04 |

La recharge de téléphones est une demande massive et une consommation dérisoire. C'est probablement le meilleur rapport entre l'énergie dépensée et l'apaisement obtenu.

## 4. Alimentation des nœuds du réseau

| Élément | Valeur retenue |
| --- | --- |
| Consommation d'un nœud fixe | 0,3 à 0,6 W selon rôle et écran |
| Autonomie sur batterie interne | 1 à 3 jours |
| Autonomie relais solaire | indéfinie hors hiver prolongé sans soleil |
| Recharge d'appoint | USB depuis groupe ou batterie nomade |
| Réserve prévue | 2 batteries nomades de 20 000 mAh par secteur |

Le détail du calcul solaire et le dimensionnement des panneaux figurent dans antennes-energie-alternatives.md.

## 5. Points de vigilance

Les groupes installés en sous-sol peuvent être inaccessibles si l'ouverture des portes dépend du courant. Les cuves enterrées se remplissent d'eau par condensation quand elles restent à moitié vides. Une prise de recharge publique attire du monde : prévoir un cheminement et une file, pas une cohue. Enfin la réquisition d'une station-service privée ne s'improvise pas le jour venu ; c'est une convention à préparer à froid.

## 6. À compléter par la commune

La liste réelle des groupes, leur date de dernière révision et le nom du prestataire de maintenance. Le volume réel des cuves et la date du dernier appoint. L'existence ou non d'un contrat de fourniture prioritaire. Et la question rarement posée : qui détient les clés des locaux techniques en dehors des heures ouvrables.
