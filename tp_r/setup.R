# Run this script once to initialise the reproducible environment.
# After cloning, run: source("setup.R")

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

renv::init()
renv::install(c("dplyr", "readxl", "pheatmap", "knitr", "rmarkdown",
                "lintr", "styler", "oysteR", "testthat"))
renv::snapshot()
