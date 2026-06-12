# Reproduction de la figure 2A — *Saccharomyces cerevisiae* periodic genes

Ce dépôt a été produit dans le cadre de l'atelier **"Utilisation des IA génératives comme appui à la programmation et au scripting pour la biologie"**, organisé par l'[Institut Français de Bioinformatique (IFB)](https://www.france-bioinformatique.fr/), l'Université Paris Cité ([plateforme iPOP-UP](https://ipop.u-paris.fr/)) et le [Réseau métier en bioinformatique (MERIT)](https://merit.cnrs.fr/).

## Contexte

L'objectif était d'utiliser une IA générative pour produire un script R capable de reproduire la **figure 2A** de l'article :

> Kelliher CM, Leman AR, Sierra CS, Haase SB (2016) *Investigating Conservation of the Cell-Cycle-Regulated Transcriptional Program in the Fungal Pathogen, Cryptococcus neoformans.* PLoS Genet 12(12): e1006453. doi:[10.1371/journal.pgen.1006453](https://doi.org/10.1371/journal.pgen.1006453)

Le script a ensuite été retravaillé pour respecter les bonnes pratiques de développement logiciel en R.

## Données

Les données utilisées se trouvent dans le dossier [`data/`](./data/) :

| Fichier | Description |
|---------|-------------|
| [`article_TP_2026_bioscripting2.pdf`](./data/article_TP_2026_bioscripting2.pdf) | Article scientifique source |
| [`pgen.1006453.s002.xlsx`](./data/pgen.1006453.s002.xlsx) | Table supplémentaire S1 — profils d'expression normalisés et scores de périodicité pour *S. cerevisiae* |

## Résultat

La figure reproduite est un heatmap des **1246 gènes périodiques** de *S. cerevisiae*, z-scorés et ordonnés par temps de pic d'expression (`Figure2A_order_peaktime`), avec une palette cyan → noir → jaune.

Les 1246 gènes sont sélectionnés selon deux critères issus de l'article : `normalized_per_rank <= 1600` ET `LS_cutoff == "Yes"`.

## Code R

Le script se trouve dans [`tp_r/vignettes/heatmap_cerevisiae.Rmd`](./tp_r/vignettes/heatmap_cerevisiae.Rmd).

Il est packagé sous la forme d'un **package R** (`heatmapcerevisiae`). Le répertoire `tp_r/` contient la structure standard d'un package R : `DESCRIPTION`, `NAMESPACE`, `R/`, `vignettes/`.

Pour générer le rapport HTML depuis R :

```r
rmarkdown::render("tp_r/vignettes/heatmap_cerevisiae.Rmd")
```

Ou, après installation du package :

```r
# Initialiser l'environnement renv (une seule fois)
source("tp_r/setup.R")

# Construire et installer le package
devtools::install("tp_r", build_vignettes = TRUE)

# Ouvrir la vignette
vignette("heatmap_cerevisiae", package = "heatmapcerevisiae")
```

### Dépendances R

- `readxl` — lecture du fichier Excel
- `dplyr` — manipulation des données avec le pipe `%>%`
- `pheatmap` — visualisation en heatmap
- `grid` — ajout des labels d'axes

## Bonnes pratiques appliquées

- Format R Markdown avec chunks nommés et texte explicatif en langage naturel
- Convention `package::function()` pour toutes les fonctions
- Paramètres nommés explicitement dans tous les appels de fonctions
- Utilisation du pipe `%>%` (magrittr / dplyr)
- `utils::sessionInfo()` en fin de document
- CI GitHub Actions : contrôle qualité (lintr, oysteR) et release automatique (git-cliff)
- `CITATION.cff` et `codemeta.json` pour la citabilité et l'archivage
- Templates d'issues et de Pull Request dans `.github/`

## Session

| Paramètre | Valeur |
|-----------|--------|
| Outil utilisé | GitHub Copilot (VS Code) |
| Modèle utilisé | Claude Sonnet 4.6 |
| Nombre de requêtes réalisées | ~50 |

## Contributor Code of Conduct

Ce projet est publié avec le [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/). En participant, vous acceptez d'en respecter les termes. Voir le fichier [CODE_OF_CONDUCT](code_of_conduct.md).

## Licence

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
