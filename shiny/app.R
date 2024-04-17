# Load necessary libraries
library(shiny)
library(ggplot2)
library(DT)

cleaned_nba_data <- read.csv("../shiny/cleaned_nba_data.csv", stringsAsFactors = FALSE)


# Helper function to get the full name of the variable
getFullVariableName <- function(abbreviation) {
  names <- c(FG = "Field Goals", FGA = "Field Goal Attempts", 
             AST = "Assists", FG_percent = "Field Goal Percentage")
  names[abbreviation]
}

# Define UI
ui <- fluidPage(
  titlePanel("NBA Season Data Explorer"),
  
  # Dropdown menu for selecting one or more seasons
  selectizeInput("selected_seasons", "Choose seasons:", 
                 choices = unique(cleaned_nba_data$Season), 
                 multiple = TRUE),
  
  # Dropdown menu for selecting a variable to plot with full names
  selectInput("selected_variable", "Choose a variable to plot:", 
              choices = list("Field Goals" = "FG", 
                             "Field Goal Attempts" = "FGA", 
                             "Assists" = "AST", 
                             "Field Goal Percentage" = "FG_percent")),
  
  # Output: Plot
  plotOutput("season_plot"),
  
  # Output: DataTable
  dataTableOutput("season_table")
)

# Define Server Logic
server <- function(input, output) {
  
  # Reactive expression to filter data based on selected seasons
  filtered_data <- reactive({
    if (length(input$selected_seasons) == 0) {
      return(data.frame())
    } else {
      cleaned_nba_data[cleaned_nba_data$Season %in% input$selected_seasons,]
    }
  })
  
  # Render Bar Graph for Multiple Seasons
  output$season_plot <- renderPlot({
    validate(
      need(length(input$selected_seasons) > 0, "Please select at least one season first.")
    )
    
    data <- filtered_data()
    if (nrow(data) == 0) {
      return()
    }
    
    ggplot(data, aes_string(x = "Season", y = input$selected_variable, fill = "Season")) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = paste("Selected Variables Across Seasons"),
           x = "Season",
           y = getFullVariableName(input$selected_variable)) +
      theme(legend.position = "bottom")
  })
  
  # Render DataTable
  output$season_table <- renderDataTable({
    validate(
      need(length(input$selected_seasons) > 0, "Please select at least one season first.")
    )
    
    data <- filtered_data()
    if (nrow(data) == 0) {
      return()
    }
    
    datatable(data[, c("Season", "FG", "FGA", "AST", "FG_percent")],
              options = list(pageLength = 10))
  })
}

# Run the app
shinyApp(ui = ui, server = server)

