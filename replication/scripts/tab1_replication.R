if(!require(knitr)){install.packages('knitr', dependencies = TRUE)}
library(knitr)

# Assuming 'cleaned_nba_data' is your dataset
head_data <- cleaned_nba_data[1:5, ]  # Selecting first 5 rows

# Print the table using kable
kable(head_data)

file_path <- "replication/tables/Table1.csv"
write.csv(head_data, file_path, row.names = FALSE)

