#### Preamble ####
# Purpose: Figure 3 replication
# Author: Shiji Zhang
# Date: 17 April 2024
# Contact: kane.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}
if(!require(tidyr)){install.packages('tidyr', dependencies = TRUE)}
if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
library(dplyr)
library(tidyr)
library(ggplot2)

cleaned_nba_data <- read.csv("inputs/data/cleaned_nba_data.csv")
nba_long <- cleaned_nba_data %>%
  gather(key = "variable", value = "value", AST, FG_percent, FGA) %>%
  mutate(variable = factor(variable, levels = c("AST", "FG_percent", "FGA"),
                           labels = c("Assists", "Field Goal Percentage", "Field Goal Attempts")))

# Creating the plot with specified order of variable names
p <- ggplot(nba_long, aes(x = value, y = FG)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~variable, scales = 'free_x') +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5)) +  # Rotate x-axis labels to avoid overlap
  labs(x = "Value",
       y = "Field Goals (FG)")

# Print the plot
print(p)


ggsave(
  "replication/plots/figure3.png",
  height = 12,
  width = 16,
  units = "in",
  dpi = 300
)

