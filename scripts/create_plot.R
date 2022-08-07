print("Create connectivity plot...")

connectivity_plot <- data_source %>% ggplot(
  aes(
    clients,
    beacon,
    fill = works
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
    breaks = c(1.0, 0.75, 0.5, 0),
    labels = c("TRUE", "TRUE WITH WARNINGS\nOR ERRORS", "NOT TESTED", "FALSE"),
    colours = c(
      "red",
      "white",
      "yellow",
      "green"
    ),
    values = c(
      0,
      0.5,
      0.75,
      1
    )
  ) +
  theme(
    axis.text = element_text(size = 18),
    axis.title = element_text(size = 22, face = "bold"),
    legend.text = element_text(size = 18),
    legend.title = element_text(size = 20, face = "bold"),
    legend.key.size = unit(1, "cm"),
  ) +
  guides(
    fill = guide_legend(title = "WORKS")
  )

# store the plot to disk
file_path <- paste(getwd(), "/misc/connectivity.png", sep = "")
png(file = file_path, width = 1280, height = 866)
print(connectivity_plot)
dev.off()
