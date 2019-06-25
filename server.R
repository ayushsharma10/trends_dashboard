library(shiny)
library(shinydashboard)

shinyServer(
  function (input,output){
    
    output$histogram <- renderPlot(
      hist(iris$Sepal.Length, breaks = input$bins, main = "Job Applies W.R.T. Years of Experience",
           xlab = "Years of Experience",
           ylab = "Total Applies")
    )
  }
)