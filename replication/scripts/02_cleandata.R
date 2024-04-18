#### Preamble ####
# Purpose: Cleaning the nba dataset
# Author: Shiji Zhang
# Date: 17 April 2024
# Contact: kane.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####

# Load the dplyr library
if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}
library(dplyr)
if(!require(readr)){install.packages('readr', dependencies = TRUE)}
library(readr)
if(!require(arrow)){install.packages('arrow', dependencies = TRUE)}
library(arrow)
# Read the dataset
nba_data <- read.csv("inputs/data/NBA_raw.csv")

write_csv(
  x = nba_data,
  file = "inputs/data/NBA_raw.parquet"
)

# Filter rows and select specific columns
cleaned_nba_data <- nba_data %>%
  filter(G >= 1229) %>%
  select(Season, FG, FGA, AST, FG_percent) %>%
  mutate(FG_percent = FG_percent * 100)

# Write the cleaned data to a CSV file
write_csv(
  x = cleaned_nba_data,
  file = "inputs/data/cleaned_nba_data.csv"
)
write_csv(
  x = cleaned_nba_data,
  file = "shiny/cleaned_nba_data.csv"
)

write_parquet(x = nba_data,
              sink = "inputs/data/cleaned_nba_data.parquet")

