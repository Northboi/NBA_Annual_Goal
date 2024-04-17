if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
if(!require(tidyr)){install.packages('tidyr', dependencies = TRUE)}
if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}

library(dplyr)
library(tidyr)
library(ggplot2)

# Assuming 'cleaned_nba_data' is your original dataframe
long_nba_data <- cleaned_nba_data %>%
  gather(key = "Statistic", value = "Value", FG, FGA, AST) %>%
  mutate(Statistic = factor(Statistic,
                            levels = c("AST", "FG", "FGA"),
                            labels = c("Assists", "Field Goal", "Field Goal Attempts")))

# Creating the plot with the renamed variables
p <- ggplot(long_nba_data, aes(x = Season, y = Value, fill = Statistic)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(x = "Season",
       y = "Count",
       fill = "Statistic") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels to avoid overlap

# Print the plot
print(p)


ggsave(
  "replication/plots/figure1.png",
  height = 12,
  width = 16,
  units = "in",
  dpi = 300
)

