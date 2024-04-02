if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
library(ggplot2)

# Create a scatter plot with a regression line
ggplot(cleaned_nba_data, aes(x = FG_percent, y = FG)) +
  geom_point(alpha = 0.5) +                           # Add scatter plot points
  geom_smooth(method = "lm", se = FALSE, color = "black") + # Add regression line
  theme_minimal() +                                   # Minimal theme
  labs(x = "Field Goal Percentage (FG_percent)",
       y = "Field Goals (FG)")


ggsave(
  "replication/plots/figure3.png",
  height = 12,
  width = 16,
  units = "in",
  dpi = 300
)

