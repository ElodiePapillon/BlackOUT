#!/usr/bin/env bash
# export-pdf.sh - Script d'export du classeur de référence BlackOUT
# Concatène les fichiers Markdown de la documentation et génère le PDF via Pandoc si disponible.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

DATE="$(date +%Y-%m-%d)"
OUTPUT_MD="blackout-classeur-reference.md"
OUTPUT_PDF="blackout-classeur-reference.pdf"

FILES=(
  "README.md"
  "conduite-en-coupure.md"
  "diffusion-sans-electricite.md"
  "affichage-a3.md"
  "ressources/README.md"
  "ressources/01_energie_et_carburants.md"
  "ressources/02_eau_et_alimentation.md"
  "ressources/03_sante_et_vulnerabilites.md"
  "ressources/04_logistique_et_transports.md"
  "ressources/05_humain_et_competences.md"
  "strategie-ressources.md"
  "reference-technique.md"
  "securite-authentification.md"
  "dimensionnement-maillage.md"
  "materiel-premiers-noeuds.md"
  "antennes-energie-alternatives.md"
  "budget.md"
  "cadre-institutionnel.md"
  "exercices/exercice-01-coupure-72h.md"
  "usages-hors-coupure.md"
  "partager-le-projet.md"
)

echo "=== Assemblage du classeur de référence BlackOUT ==="

# Vérification de l'existence des fichiers
missing=0
for file in "${FILES[@]}"; do
  if [ ! -f "$file" ]; then
    echo "Erreur: fichier manquant -> $file" >&2
    missing=1
  fi
done

if [ "$missing" -eq 1 ]; then
  echo "Échec de l'assemblage : des fichiers requis sont introuvables." >&2
  exit 1
fi

# Création du Markdown concaténé
echo "Génération de $OUTPUT_MD..."
{
  echo "---"
  echo "title: 'BlackOUT — Classeur de référence'"
  echo "subtitle: 'Dispositif communal d’information de crise hors réseau'"
  echo "date: '$DATE'"
  echo "lang: 'fr-FR'"
  echo "toc-title: 'Table des matières'"
  echo "---"
  echo ""

  for file in "${FILES[@]}"; do
    echo "<!-- Debut de $file -->"
    cat "$file"
    echo ""
    echo -e "\n\n\\pagebreak\n\n"
  done
} > "$OUTPUT_MD"

echo "Fichier Markdown assemblé avec succès : $OUTPUT_MD"

# Génération du PDF via Pandoc si installé
if command -v pandoc &>/dev/null; then
  echo "Pandoc détecté. Génération de $OUTPUT_PDF..."

  # Sélection du moteur PDF si xelatex/pdflatex/weasyprint est disponible
  PDF_ENGINE_OPT=()
  if command -v xelatex &>/dev/null; then
    PDF_ENGINE_OPT=(--pdf-engine=xelatex)
  elif command -v pdflatex &>/dev/null; then
    PDF_ENGINE_OPT=(--pdf-engine=pdflatex)
  elif command -v weasyprint &>/dev/null; then
    PDF_ENGINE_OPT=(--pdf-engine=weasyprint)
  elif command -v typst &>/dev/null; then
    PDF_ENGINE_OPT=(--pdf-engine=typst)
  fi

  pandoc "$OUTPUT_MD" \
    --toc \
    --toc-depth=2 \
    -V fontsize=11pt \
    -V geometry:margin=2cm \
    -V papersize=a4 \
    "${PDF_ENGINE_OPT[@]}" \
    -o "$OUTPUT_PDF"

  echo "PDF généré avec succès : $OUTPUT_PDF"
else
  echo ""
  echo "Note : Pandoc n'est pas installé sur ce système."
  echo "Le fichier Markdown combiné '$OUTPUT_MD' a été généré."
  echo "Pour produire le PDF ultimate avec Pandoc, installez-le et lancez :"
  echo "  pandoc $OUTPUT_MD --toc --toc-depth=2 -V fontsize=11pt -V geometry:margin=2cm -V papersize=a4 -o $OUTPUT_PDF"
fi

echo "=== Export terminé ==="
