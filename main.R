print("Install and load dependencies...")

packages <- c("tidyr", "tibble", "ggplot2", "rstudioapi")

lapply(
  packages,
  fun <- function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

setwd(dirname(getSourceEditorContext()$path))

source("./scripts/load_data.R")
source("./scripts/create_data_source_for_plot.R")
source("./scripts/create_plot.R")
