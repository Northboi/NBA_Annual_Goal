if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
library(ggplot2)

cleaned_nba_data <- read.csv("inputs/data/cleaned_nba_data.csv")

ggplot(cleaned_nba_data, aes(x = Season, y = FG_percent, group = 1)) +
  geom_line() + # Adds the line graph
  geom_point() + # Optionally, add points to mark each data point
  theme_minimal() + # Use a minimal theme for a clean look
  labs(title = "Field Goal Percentage by Season",
       x = "Season",
       y = "Field Goal Percentage (%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Improve label readability

ggsave(
  "replication/plots/figure2.png",
  height = 12,
  width = 16,
  units = "in",
  dpi = 300
)

