create_beacon_client_vectors <- function(client_combinations, clients) {
  client_vectors <- list()
  current_beacon_name <- strsplit(x = client_combinations[1], split = "_", fixed = TRUE)[[1]][1]
  client_vector_to_add <- NA
  current_client_vector <- c()
  for (client_combination in client_combinations) {
    last_beacon_name <- strsplit(x = client_combination, split = "_", fixed = TRUE)[[1]][1]
    if (
      last_beacon_name != current_beacon_name ||
      client_combination == client_combinations[length(client_combinations)]
    ) {
      client_vector_to_add <- current_beacon_name
      current_beacon_name <- last_beacon_name
      if (client_combination == client_combinations[length(client_combinations)]) {
        current_client_vector <- c(current_client_vector, get(client_combination))
      }
      client_vectors <- append(client_vectors, list(current_client_vector))
      names(client_vectors)[length(client_vectors)] <- client_vector_to_add
      current_client_vector <- c()
    }
    current_client_vector <- c(current_client_vector, get(client_combination))
  }
  return(client_vectors)
}

create_plot_data_source <- function(client_vectors) {
  client_matrix_expression <- "tibble(clients"
  counter <- 1
  for (item in client_vectors) {
    client <- names(client_vectors)[counter]
    warning_indices <- which(item == WARNING)
    item <- replace(item, warning_indices, TRUE)
    item <- as.logical(item)
    item <- as.integer(item)
    item <- replace(item, warning_indices, 0.75)
    na_indices <- which(is.na(item))
    item <- replace(item, na_indices, 0.5)
    assign(client, item)
    client_matrix_expression <- paste(
      client_matrix_expression,
      client, sep = ","
    )
    counter <- counter + 1
  }
  client_matrix_expression <- paste(client_matrix_expression, ")", sep = "")
  client_matrix <- eval(parse(text = client_matrix_expression))
  colnames(client_matrix)[2:ncol(client_matrix)] <- names(client_vectors)
  client_matrix_long <- client_matrix %>% gather(
    -clients,
    key = "beacon",
    value = "works"
  )
  return(client_matrix_long)
}
