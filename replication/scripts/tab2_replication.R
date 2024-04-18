#### Preamble ####
# Purpose: Table 2 replication
# Author: Shiji Zhang
# Date: 17 April 2024
# Contact: kane.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
if(!require(knitr)){install.packages('knitr', dependencies = TRUE)}
library(knitr)

cleaned_nba_data <- read.csv("inputs/data/cleaned_nba_data.csv")

head_data <- cleaned_nba_data[1:5, ]  # Selecting first 5 rows
head_data_rename <- head_data %>%
  rename(
    `Field Goals` = FG,
    `Field Goal Attempts` = FGA,
    Assist = AST,
    `FG Percentage` = FG_percent
  )

# Print the table using kable
kable(head_data_rename)

file_path <- "replication/tables/Table2.csv"
write.csv(head_data, file_path, row.names = FALSE)

