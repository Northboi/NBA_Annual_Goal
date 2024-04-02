if(!require(dplyr)){install.packages('dplyr', dependencies = TRUE)}
library(dplyr)

# Calculate ranks for each variable
cleaned_nba_data <- mutate(cleaned_nba_data,
                           Rank_FG = dense_rank(desc(FG)),
                           Rank_FGA = dense_rank(desc(FGA)),
                           Rank_AST = dense_rank(desc(AST)),
                           Rank_FG_percent = dense_rank(desc(FG_percent)))

# Sort the dataset by FG in descending order
sorted_data <- cleaned_nba_data[order(-cleaned_nba_data$FG), ]

# Select the top 5 seasons with the most FG and their ranks
top_5_seasons <- sorted_data[1:5, c("Season", "FG", "Rank_FG", "FGA", "Rank_FGA", "AST", "Rank_AST", "FG_percent", "Rank_FG_percent")]

# Print the table using kable
kable(top_5_seasons)

file_path <- "replication/tables/Table2.csv"
write.csv(top_5_seasons, file_path, row.names = FALSE)

