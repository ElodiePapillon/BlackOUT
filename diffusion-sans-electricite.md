# Diffuser l'information sans électricité

Protocole pas à pas qui va du relevé de terrain jusqu'à l'habitant. Le réseau radio ne couvre que le premier tiers du chemin ; les deux autres tiers sont du papier, de la voix et des jambes.

## 1. La chaîne complète en une image

```
  Référent de point            Passerelle              Agent mobile
  (relevé terrain)   --radio-->  (synthèse)  --papier-->  (portage)
                                                              |
                                                              v
  Habitant  <--voix--  Relais de quartier  <--  Tableau d'affichage A3
            <--lecture-------------------------------
```

Quatre maillons, quatre points de rupture possibles. Chacun a un mode dégradé décrit plus bas.

## 2. Étape 1 : le relevé

Le référent d'un point de ressource constate l'état réel : combien reste-t-il, jusqu'à quelle heure, est-ce ouvert. Il saisit un bulletin au format défini dans strategie-ressources.md, signé par sa clé privée, et l'envoie en message direct à la passerelle.

Trois règles. On relève ce qu'on voit, pas ce qu'on suppose. On envoie même quand rien n'a changé, parce qu'un silence ne se distingue pas d'une panne. Et on envoie **avant** l'heure de synthèse, pas pendant, pour ne pas saturer le canal au moment où tout le monde émet.

Fenêtres de relevé : 07h00-07h30, 12h30-13h00, 18h00-18h30.

## 3. Étape 2 : la synthèse

À la fin de chaque fenêtre, l'opérateur de passerelle assemble les bulletins reçus en une page unique, classée dans l'ordre des zones du tableau A3 : eau, alimentation et santé, énergie et abri. Il vérifie les signatures, marque les points dont le bulletin manque avec la mention « non relevé », et arrête l'heure.

La synthèse est ensuite rediffusée sur le canal, signée, pour ceux qui ont un nœud, et **imprimée ou recopiée en autant d'exemplaires que de points d'affichage**. En coupure, l'impression suppose que le PC de crise soit sur groupe électrogène ; sinon on recopie à la main, ce qui prend vingt minutes à deux personnes.

Heures d'arrêt : 07h45, 13h00, 18h30.

## 4. Étape 3 : le portage

Les agents mobiles partent avec les exemplaires. À vélo cargo pour le centre, en véhicule pour les écarts, en tournée groupée pour économiser le carburant. Un agent couvre trois à cinq points d'affichage selon la densité.

Ils repartent avec quelque chose : les demandes et corrections notées au dos de la feuille précédente par le référent du point. La boucle de retour compte autant que l'aller.

## 5. Étape 4 : l'affichage

Le référent recopie sur le gabarit A3, affiche, barre l'ancien. Tout est décrit dans affichage-a3.md. Heures d'affichage : 08h00, 13h15, 18h45.

## 6. Étape 5 : la voix

Le papier ne suffit pas. Il faut que les gens sachent qu'il y a quelque chose à lire et où. C'est le rôle du relais de quartier.

### 6.1 Le relais de quartier

Une personne par immeuble, par rue ou par hameau, qui fait trois choses : elle passe devant le tableau après chaque mise à jour, elle transmet l'essentiel de vive voix à ceux qui ne se déplacent pas, et elle fait remonter au référent ce qu'elle constate. Ce n'est pas un rôle technique, il ne demande aucun matériel.

Un relais de quartier couvre en pratique quinze à quarante foyers. Pour une ville de 20 000 habitants, la couverture complète supposerait plusieurs centaines de personnes : ce n'est pas atteignable et ce n'est pas l'objectif. On vise les immeubles collectifs, les résidences de personnes âgées et les hameaux isolés, là où le déficit d'information coûte le plus cher.

### 6.2 Le mégaphone

Un mégaphone à batterie, une tournée à pied ou en véhicule lent, un message de trois phrases répété deux fois à chaque arrêt. Il ne sert **jamais** à transmettre le détail : il sert à dire où lire et à quelle heure.

Modèle d'annonce, à lire lentement :

> « Information municipale. Le tableau d'affichage de la place du marché a été mis à jour à huit heures. Vous y trouverez les points d'eau ouverts et leurs horaires. Prochaine mise à jour à treize heures quinze. »

Règles du mégaphone : pas plus de trois phrases, pas de chiffres complexes, pas de consigne nouvelle qui ne serait pas déjà affichée, un débit lent, et jamais avant 8h ni après 20h. Une tournée mégaphone à six heures du matin produit de l'angoisse, pas de l'information.

### 6.3 Le porte-à-porte

Réservé aux personnes identifiées comme isolées ou dépendantes, par binômes, avec liste papier remise au départ et restituée au retour. C'est le maillon le plus coûteux en personnes et le plus utile. Voir ressources/03 pour les règles de confidentialité.

## 7. Règles de rédaction des messages

Un message destiné à la population n'est pas un bulletin radio. Il obeit à d'autres règles.

| Règle | Mauvais | Bon |
| --- | --- | --- |
| Dire l'heure | « de l'eau est disponible » | « à 8h ce matin, de l'eau était disponible » |
| Dire où | « plusieurs points ouverts » | « place du marché, 400 m d'ici » |
| Une action par phrase | « prenez vos bidons et allez au stade avant midi si vous pouvez » | « apportez un bidon. Le stade ferme à midi. » |
| Pas de conditionnel | « il devrait y avoir » | « il y avait à 8h » |
| Pas de pronostic non sourcé | « ça devrait revenir demain » | « aucune information sur le rétablissement » |
| Nommer la source | « on dit que » | « information mairie du 3 août 8h » |

La phrase « aucune information sur le rétablissement » est difficile à écrire et indispensable. Ne pas savoir, dit clairement, vaut mieux qu'une espérance inventée qui se retourne le lendemain.

## 8. Modes dégradés

| Maillon rompu | Symptôme | Mode dégradé |
| --- | --- | --- |
| Un référent ne relève plus | bulletin manquant | mention « non relevé », agent mobile passe au créneau suivant |
| La passerelle est HS | pas de synthèse | synthèse manuscrite au PC de crise, portée à vélo |
| Le réseau radio est HS | rien ne remonte | relevés portés à vélo, deux créneaux au lieu de trois |
| Plus de papier | pas d'affichage | tableau à la craie ou ardoise, même ordre de zones |
| Plus d'agents mobiles | pas de portage | affichage centralisé en mairie, mégaphone renforcé |
| Rupture totale | plus rien | rassemblement quotidien 8h devant la mairie, annonce de vive voix |

Le dernier mode dégradé est le socle : même sans radio, sans papier et sans véhicule, un rendez-vous quotidien connu de tous à heure fixe devant un bâtiment identifiable continue de fonctionner. Tout le reste n'est qu'une amélioration de ce socle.

## 9. Lutter contre la rumeur

En coupure, la rumeur circule plus vite que l'information officielle parce qu'elle est gratuite et émotionnelle. Trois contre-mesures. La régularité : trois rendez-vous par jour, toujours tenus, créent une habitude que la rumeur ne peut pas concurrencer. L'horodatage : une information datée se vérifie, une rumeur non. Et l'aveu d'ignorance : une source qui dit ce qu'elle ne sait pas gagne la crédibilité qu'elle perdrait à tout prétendre savoir.

On ne dément pas une rumeur en la répétant. On affiche le fait daté, sans mentionner ce qu'il contredit.

## 10. Ce qui reste à trancher

Le nombre de relais de quartier atteignable réellement, qui dépend du tissu associatif local. La détention et la charge des mégaphones. L'articulation avec les moyens d'alerte officiels de la commune, qui relèvent d'une autre chaîne et d'une autre autorité. Et la question de la langue, qui se pose différemment à l'oral et à l'écrit.
