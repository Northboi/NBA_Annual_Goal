

# Test for Season format: 'YYYY~YY'
all(grepl("^\\d{4}~\\d{2}$", cleaned_nba_data$Season), na.rm = TRUE)

# Test that FG (Field Goals) are positive integers
all(cleaned_nba_data$FG > 0 & cleaned_nba_data$FG == floor(cleaned_nba_data$FG), na.rm = TRUE)

# Test that FGA (Field Goal Attempts) are positive integers
all(cleaned_nba_data$FGA > 0 & cleaned_nba_data$FGA == floor(cleaned_nba_data$FGA), na.rm = TRUE)

# Test that AST (Assists) are positive integers
all(cleaned_nba_data$AST > 0 & cleaned_nba_data$AST == floor(cleaned_nba_data$AST), na.rm = TRUE)

# Test that FG_percent is positive and smaller than 100
all(cleaned_nba_data$FG_percent > 0 & cleaned_nba_data$FG_percent < 100, na.rm = TRUE)

