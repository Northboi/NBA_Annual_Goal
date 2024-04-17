if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}
library(dplyr)

# Define the number of seasons
seasons <- seq(as.Date("2004-01-01"), as.Date("2023-01-01"), by="years")

# Create season labels
season_labels <- paste(format(seasons[-length(seasons)], "%Y"), format(seasons[-1], "%y"), sep="-")

# Simulate data for each season
set.seed(123) # for reproducibility
nba_simulation_data <- data_frame(
  Season = season_labels,
  FieldGoal = sample(80000:110000, length(season_labels), replace = TRUE),
  FieldGoalAttempts = sample(140000:160000, length(season_labels), replace = TRUE),
  Assists = sample(50000:60000, length(season_labels), replace = TRUE),
  FieldGoalPercentage = runif(length(season_labels), 40, 50)
)

# Show the first few rows of the data
print(head(nba_simulation_data))

