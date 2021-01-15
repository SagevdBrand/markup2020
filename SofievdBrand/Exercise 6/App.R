library(shiny)
library(tidyverse)
source("Functions.R")
data <- read_csv("data/appdata.csv")
genres <- read_rds("data/genres.Rds") 


ui <- fluidPage(
  h1("Random movie generator"),
  ("Tired of endless searching on the Google for a movie to watch?"),
  ("Select two genres and hit the button below to get a movie-suggestion"),
  
  ##Input
  selectInput(inputId = "choice1",
              label = "Genre 1",
              choices = c(paste0(genres))), 
  
  selectInput(inputId = "choice2",
              label = "Genre 2",
              choices = c(paste0(genres))),
  
  ## Button
  submitButton(text = "Get me a movie!", icon = icon("refresh")),
  
  ## Output
  textOutput(outputId = "movie")
  
  )

server <- function(input, output) {
  output$movie <- renderText({
    choices <- c(as.character(input$choice1), as.character(input$choice2))
  find_movie(input = input )
    })
  
  
}

shinyApp(ui = ui, server = server)
