library(shiny)
library(shinydashboard)

shinyServer(
  function (input,output){
    
    output$histogram <- renderPlot(
      hist(iris$Sepal.Length, breaks = input$bins)
    )
  }
)