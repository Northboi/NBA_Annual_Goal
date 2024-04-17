# The Impact of NBA Rule Changes and Improved Player Talents on Increased Goal Numbers in Games.

## Overview of Paper

As teams gradually adapt to the modifications in NBA game rules and the influx of talented players from around the world into the league, the total number of goals in each NBA season seems to be on the rise. In this report, we chose to study 16 seasons in NBA history with a total of 1229 or more games played. We used a Gaussian multiple linear regression model to examine the impact of field goal attempts, assists, and field goal percentage on the number of field goals. The study results indicate that increases in field goal attempts and assists have a greater impact on the increase in field goals compared to field goal percentage. This suggests that changes in game rules may bring more entertainment value to the game than the addition of more talented players to the NBA. NBA and other overseas leagues can focus on this conclusion to improve the entertainment value of their leagues and progress accordingly.

inputs
- data - contains all the data files to be used for analysis and in the tables and figures
  - NBA_raw.csv - dataset includes 78 observations and 32 variables.
  - NBA_raw.parquet
  - cleaned_nba_data.csv - A cleaned version of NBA_raw.csv that only include the game numbers at least of 1229 games. The variables in this dataset are 'Season', 'FG', 'FGA', 'AST', 'FG_percent'
  - cleaned_nba_data.parquet
- llm
  - usage.txt - The conversation history with ChatGPT
- sketches
  - dataset_sketch.png
  - figure1_sketch.png
  - figure2_sketch.png
  - figure3_sketch.png
  - table1_sketch.png
  - table2_sketch.png
  - table3_sketch.png
  - table4_sketch.png
  
model
  - Gaussian_multiple_linear_regression_model.rds - A rds file of the Gaussian multiple linear regression model that built to examine the impact of field goal attempts, assists, and field goal percentage on the number of field goals 
  
outputs
  - NBA_Annual_Goal.pdf
  - NBA_Annual_Goal.qmd 
  - references.bib - reference list for paper
  
replication

- plots - stores the replicated figures
  -figure1.png
  -figure2.png
  -figure3.png
- scripts - stores the code of simulating data, downloading the original dataset, cleaning process, testing process and the code to replicate each of the figure and table.
  - 00_simulation.R
  - 01_download.R
  - 02_cleandata.R
  - 03_tests.R
  - fig1_replication.R
  - fig2_replication.R
  - fig3_replication.R
  - tab1_replication.R
  - tab2_replication.R
  - tab3_replication.R
  - tab4_replication.R
- tables - stores the replicated tables
  - Table1.csv
  - Table2.csv
  - Table3.csv
  - Table4.csv

Shiny

- app.R - The code for the shiny application (Interactive table and graph)
- cleaned_nba_data.csv - the dataset for the shiny application
- nba_annual_goal 
  - nba_annual_goal.dcf
- rsconnect
  - shinyapps.io
    - wrpn7n-who0asked
      - shiny.dcf
      
## LLMs statement

Most of the code in the paper and in R markdown is written by ChatGPT. And all conversations I had with ChatGPT can be viewed from inputs/llm/usage.txt

## Reproducibility

Download all files and open the R project NBA_Annual_Goal.Rproj in R Studio.

To reproduce the paper, render to pdf NBA_Annual_Goal.qmd found at outputs/NBA_Annual_Goal.qmd.

To replicate a figure, run the corresponding R file stored in replication/scripts/fig{number}_replication.R. The output will be saved as an image in replication/plots/figure{number}.png .

To replicate a table, run the corresponding R file stored in replication/scripts/tab{number}_replication.R. The output will be saved as an image in replication/plots/tab{number}.csv .