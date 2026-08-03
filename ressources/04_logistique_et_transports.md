# 04 - Logistique et transports

Le volet oublié des premières notes. Sans transport, un inventaire de ressources ne sert à rien : savoir qu'il y a 3 000 litres d'eau au centre technique n'aide personne si rien ne peut les déplacer jusqu'au quartier qui en manque. Les véhicules récents, les portails automatiques et les pompes à carte bancaire tombent tous en même temps que le courant.

> Les valeurs ci-dessous sont **fictives**. Elles montrent le format attendu et doivent toutes être remplacées.

## 1. Véhicules municipaux

| Id | Type | Quantité | Carburant | Capacité utile | Clés de secours | Démarrage sans électronique | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| V01 | Camion-benne | 3 | gazole | 3,5 t | tableau mécanique CTM | oui | OK | 2026-01-11 |
| V02 | Véhicules légers | 5 | essence | 4 places | tableau mécanique CTM | oui | OK | 2026-01-11 |
| V03 | Fourgon 12 m3 | 2 | gazole | 1,2 t | tableau mécanique CTM | oui | BAS | 2026-01-11 |
| V04 | Minibus 9 places | 1 | gazole | 9 personnes | coffre mairie | oui | OK | 2026-01-11 |
| V05 | Tracteur avec remorque | 1 | gazole | 5 t | CTM | oui | OK | 2026-01-11 |
| V06 | Vélos cargo et VTT | 10 | humain | 80 kg | local police municipale | sans objet | OK | 2026-01-11 |

Les vélos cargo ne sont pas un gadget. Sur des trajets de moins de trois kilomètres, avec des carrefours éteints et des files d'attente aux stations, ils sont souvent plus rapides qu'un fourgon et ne consomment aucun carburant compté. Ils portent le papier, les piles, les relevés et les petites charges.

## 2. Accès au carburant

| Question | Réponse type attendue |
| --- | --- |
| La cuve municipale a-t-elle une pompe manuelle | oui ou non, sans nuance |
| Le portail du dépôt s'ouvre-t-il sans courant | oui, mécanique, ou non |
| Combien de jerricans de 20 L disponibles | nombre |
| Convention avec une station-service | référence et date |
| Priorité d'approvisionnement préfectorale | oui ou non |

Le renvoi vers la grille 01 est direct : les stocks eux-mêmes y figurent. Ici on ne note que la capacité à y accéder.

## 3. Outillage d'ouverture de voie et de transfert

| Id | Matériel | Quantité | Énergie | Consommable prêt | État | Vérifié le |
| --- | --- | --- | --- | --- | --- | --- |
| O01 | Tronçonneuses thermiques | 4 | mélange 2 temps | 4 jerricans prêts | OK | 2026-01-11 |
| O02 | Motopompes thermiques | 2 | essence | tuyaux et crepines | OK | 2026-01-11 |
| O03 | Groupe de soudure et disqueuse | 1 | groupe G04 | disques en stock | HS | 2025-09-30 |
| O04 | Signalisation mobile | 40 barrières, 20 panneaux | aucune | sans objet | OK | 2026-01-11 |
| O05 | Éclairage autonome de chantier | 6 mâts | batterie et solaire | sans objet | BAS | 2025-12-05 |
| O06 | Diables, transpalettes, sangles | lot | humain | sans objet | OK | 2026-01-11 |

## 4. Points durs de circulation

| Id | Point | Nature du blocage possible | Contournement | Manoeuvre manuelle possible |
| --- | --- | --- | --- | --- |
| B01 | Parking souterrain centre | barrière électrique | accès piste pompiers | oui, manivelle |
| B02 | Pont bascule CTM | commande électrique | pesée estimée | non |
| B03 | Passage à niveau est | signalisation à l'arrêt | déviation nord, 4 km | sans objet |
| B04 | Portail dépôt communal | serrure électrique | sans objet | oui, clé mécanique en coffre |

Cette table est celle qu'on regrette de ne pas avoir faite à froid. Un seul portail bloqué peut immobiliser la moitié du parc.

## 5. Rotations prévues en coupure

| Rotation | Fréquence | Moyen | Charge type |
| --- | --- | --- | --- |
| Portage des synthèses vers les points d'affichage | 3 fois par jour | vélo cargo | papier |
| Ravitaillement en eau des points | 2 fois par jour | tracteur et citerne | 3 000 L |
| Tournée des établissements sensibles | 1 fois par jour | véhicule léger | personnel |
| Appoint carburant des groupes | selon autonomie | fourgon | jerricans |
| Relevé des nœuds radio en défaut | à la demande | vélo ou VL | batterie de rechange |

Les rotations sont calées sur les trois créneaux définis dans conduite-en-coupure.md. Regrouper les déplacements est le premier poste d'économie de carburant.

## 6. Points de vigilance

Les véhicules électriques du parc municipal deviennent inutilisables dès que les bornes s'arrêtent : les compter séparément et ne pas les inclure dans la capacité de crise. Les réservoirs doivent être gardés au-dessus de la moitié en période de risque, règle simple et efficace. Les clés centralisées dans un local fermé par badge posent le même problème que les portails. Enfin la conduite de nuit sans éclairage public change tout : réduire les rotations nocturnes au strict nécessaire, ce qui rejoint la règle de concentration de l'activité sur les heures de jour.

## 7. À compléter par la commune

L'inventaire réel du parc et son âge. La localisation exacte des clés hors heures ouvrables. Les conventions de mise à disposition avec les entreprises et les agriculteurs locaux, qui détiennent souvent le matériel lourd et les cuves. Et le recensement des points durs de circulation, qui demande une demi-journée de terrain et évite des heures perdues le jour venu.
