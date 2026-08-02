# Journal de bord — BlackOUT

Ce fichier retrace l'avancement du projet : ce qui est fait, ce qui est décidé, ce qui reste ouvert. Le README demeure le document de référence technique ; le journal n'en trace que l'histoire.

Tenue du journal : une entrée à chaque étape franchie, et au minimum une par session de travail. Entrées classées de la plus récente à la plus ancienne.

## 2026-08-02 — Reprise du projet et état des lieux

Le dépôt ne contenait que le README. Le cadrage technique y est solide : principe LoRa 868 MHz sous Meshtastic, cadre réglementaire EU_868, arbitrage du préréglage modem sur LONG_FAST, ordres de grandeur de portée urbaine, familles de matériel, dimensionnement solaire, configuration de référence et limites connues. En revanche la feuille de route était entièrement à l'état de projet : aucune des sept étapes n'était engagée, et la section 10 ne contenait qu'une liste de pistes non instruites.

Manque principal identifié : le document décrit un système mais ne le dimensionne pas. Rien n'indiquait combien de nœuds sont nécessaires pour couvrir une ville de 20 000 habitants, ni comment les répartir.

Ouvert ce jour : le présent journal de bord.

Objectifs de la session : dimensionner le maillage à l'échelle de la ville, arbitrer le matériel des deux premiers nœuds et du relais de toiture, instruire la section 10 (antennes, alimentation, alternatives radio), puis mettre à jour la feuille de route en conséquence.
