if(!require(broom)){install.packages('broom', dependencies = TRUE)}
if(!require(knitr)){install.packages('knitr', dependencies = TRUE)}
library(broom)
library(knitr)

# Assuming your model is already fitted
# model <- lm(FG ~ FG_percent, data = cleaned_nba_data)
model <- lm(FG ~ FG_percent, data = cleaned_nba_data)
# Use `broom::tidy` to get a tidy summary
tidy_summary <- tidy(model)

# Now, use `kable` to create a Markdown table
kable(tidy_summary, format = "markdown")

file_path <- "replication/tables/Table3.csv"
write.csv(tidy_summary, file_path, row.names = FALSE)

