library(knitr)
library(kableExtra)

# Define your table data
table_data <- data.frame(
  Column = c("Season", "Field Goals", "Field Goal Attempts", "Assist", "Field Goal percentage"),
  Type = c("str", "num", "num", "num", "num"),
  Description = c(
    "Representing the NBA season when each overall league data statistic occurred.",
    "Named 'FG' in the original dataset.Representing the total number of goals scored in the NBA league during a specified season.",
    "Named 'FGA' in the original dataset. Representing the total number of field goal attempts made by players in the entire NBA league during a specified season.",
    "Named 'AST' in the original dataset.Representing the total number of assists generated in the entire NBA league during a specified season. An assist is counted when one player passes the ball to another player, resulting in a score.",
    "Named 'FG_percent' in the original dataset.Representing the ratio between field goals and field goal attempts. A higher Field Goal percentage indicates a higher shooting accuracy in the entire league during a specified season."
  )
)

# Convert the data frame to a markdown table
kable(table_data, caption = "Variable Description for raw data", booktabs = TRUE) %>%
  kable_styling(full_width = FALSE, position = "center") %>%
  column_spec(1, width = "3em") %>% 
  column_spec(2, width = "3em") %>% 
  column_spec(3, width = "33em")

file_path <- "replication/tables/Table1.csv"
write.csv(table_data, file_path, row.names = FALSE)

