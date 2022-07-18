print("Create connectivity plot...")

connectivity_plot <- data_source %>% ggplot(
  aes(
    clients,
    beacon, fill = works
    )
  ) +
  geom_tile(
    color = "black",
    lwd = 1.5,
    linetype = 1
  ) +
  labs(
    x = "validators",
    y = "beacon nodes"
  ) +
  scale_fill_gradientn(
    guide = "legend",
    breaks = c(1.0, 0.5, 0),
    labels = c("TRUE", "NOT TESTED", "FALSE"),
    colours = c(
      "red",
      "white",
      "green"
    ),
    values = c(
      0,
      0.5,
      1
    )
  ) +
  theme(
    axis.text = element_text(size = 18),
    axis.title = element_text(size = 18, face = "bold")
  )

# store the plot to disk
file_path <- paste(getwd(), "/misc/connectivity.png", sep = "")
png(file = file_path, width = 1280, height = 866)
print(connectivity_plot)
dev.off()