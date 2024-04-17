if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}
library(dplyr)

cleaned_nba_data <- read.csv("inputs/data/cleaned_nba_data.csv")

cleaned_nba_data <- mutate(cleaned_nba_data,
                           Rank_FG = dense_rank(desc(FG)),
                           Rank_FGA = dense_rank(desc(FGA)),
                           Rank_AST = dense_rank(desc(AST)),
                           Rank_FG_percent = dense_rank(desc(FG_percent)))

# Sort the dataset by FG in descending order
sorted_data <- cleaned_nba_data[order(-cleaned_nba_data$FG), ]

# Select the top 5 seasons with the most FG and their ranks
top_5_seasons <- sorted_data[1:5, c("Season", "FG", "Rank_FG", "FGA", "Rank_FGA", "AST", "Rank_AST", "FG_percent", "Rank_FG_percent")]

# Your existing code for calculating ranks and sorting data goes here...

# Rename the columns
top_5_seasons_renamed <- top_5_seasons %>%
  rename(
    `Rank (FG)` = Rank_FG,
    `Field Goals` = FG,
    `Rank (FGA)` = Rank_FGA,
    `Field Goal Attempts` = FGA,
    `Rank (AST)` = Rank_AST,
    Assist = AST,
    `FG Percentage` = FG_percent,
    `Rank (FG%)` = Rank_FG_percent
  )

# Now only one 'Rank' column will be shown, assuming the ranks for FG, FGA, AST, FG% are all the same.
# If they are different, you'll need to keep them separate or decide how to combine them.

# Print the table using kable
kable(top_5_seasons_renamed, caption = "Top 5 NBA Seasons Ranked by Field Goals", row.names = FALSE)

file_path <- "replication/tables/Table3.csv"
write.csv(top_5_seasons, file_path, row.names = FALSE)

