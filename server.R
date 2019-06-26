library(shiny)
library(shinydashboard)

shinyServer(
  function (input,output){
    
    output$histogram <- renderPlot(
      hist(iris$Sepal.Length, breaks = input$bins, main = "Job Applies W.R.T. Years of Experience",
           xlab = "Years of Experience",
           ylab = "Total Applies")
    )
    
    output$items_dt = DT::renderDataTable(
      JS360view,
      filter = 'top',
      options = list(scrollX = TRUE), editable = T , colnames = c('Email Id','Job ID','Company Name','Job Title','View Date','Apply Date', 'Application Status')
    )
    
    }
)