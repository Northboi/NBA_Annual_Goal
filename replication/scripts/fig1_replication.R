if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
if(!require(tidyr)){install.packages('tidyr', dependencies = TRUE)}

library(ggplot2)
library(tidyr)

long_nba_data <- cleaned_nba_data %>%
  gather(key = "Statistic", value = "Value", FG, FGA, AST)

ggplot(long_nba_data, aes(x = Season, y = Value, fill = Statistic)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "NBA Field Goals, Attempts, and Assists by Season",
       x = "Season",
       y = "Count",
       fill = "Statistic") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave(
  "replication/plots/figure1.png",
  height = 12,
  width = 16,
  units = "in",
  dpi = 300
)

