if(!require(broom)){install.packages('broom', dependencies = TRUE)}
if(!require(knitr)){install.packages('knitr', dependencies = TRUE)}
library(broom)
library(knitr)

cleaned_nba_data <- read.csv("inputs/data/cleaned_nba_data.csv")

nba_model <-
  stan_glm(
    formula = FG ~ FGA + AST + FG_percent,
    data = cleaned_nba_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5),
    prior_intercept = normal(location = 0, scale = 2.5),
    prior_aux = cauchy(0, 2.5),  # Set a Cauchy prior for demonstration; adjust as needed
    seed = 900)

posterior_summary_df <- as.data.frame(posterior_summary(nba_model))

# Rename the columns appropriately
colnames(posterior_summary_df) <- c("Estimate", "Est.Error", "Q2.5", "Q97.5")

# Now use kable to create a table suitable for PDF output
kable_styled <- kable(posterior_summary_df, caption = "Posterior Summary of Model Coefficients",format = "latex", digits = 2,booktabs = TRUE) %>%
  kable_styling(font_size = 10)

# To ensure the table is rendered in your R Markdown PDF output, just include kable_styled in an R chunk.
kable_styled

file_path <- "replication/tables/Table4.csv"
write.csv(kable_styled, file_path, row.names = FALSE)

