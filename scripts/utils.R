create_beacon_client_vectors <- function(client_combinations, clients) {
  for (client_combination in client_combinations) {
    last_beacon <- strsplit(
      x = client_combination,
      split = "_", fixed = TRUE
    )[[1]][1]
    if (!exists("current_beacon") || last_beacon != current_beacon) {
      current_beacon <- last_beacon
    }
    if (!exists(current_beacon)) {
      assign(current_beacon, get(client_combination))
    } else {
      assign(current_beacon, c(get(current_beacon), get(client_combination)))
    }
  }
  client_vectors <- list()
  for (client in clients) {
    client <- strsplit(x = client, split = "_", fixed = TRUE)[[1]][1]
    client_vectors <- append(client_vectors, list(get(client)))
    names(client_vectors)[length(client_vectors)] <- client
  }
  return(client_vectors)
}


create_plot_data_source <- function(client_vectors) {
  client_matrix_expression <- "tibble(clients"
  counter <- 1
  for (item in client_vectors) {
    client <- names(client_vectors)[counter]
    item <- as.integer(item)
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
