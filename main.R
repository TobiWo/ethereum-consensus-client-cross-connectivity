print("Install and load dependencies...")

packages <- c("tidyr", "tibble", "ggplot2", "rstudioapi", "lintr")

lapply(
  packages,
  fun <- function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)

if (Sys.getenv("RSTUDIO") == "1") {
  setwd(dirname(getSourceEditorContext()$path))
}

try_result <- try(source("./scripts/load_data.R"))
if (class(try_result) == "try-error") {
  print("You did not set the working directory (with 'setwd()') to the root folder of the repository!")
  print("Please do so and execute again!")
} else {
  source("./scripts/create_data_source_for_plot.R")
  source("./scripts/create_plot.R")
}
