print("Create data source...")

source("./scripts/utils.R")

client_vectors <- create_beacon_client_vectors(client_combinations, clients)
data_source <- create_plot_data_source(client_vectors)
