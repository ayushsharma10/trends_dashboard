library(shiny)
library(shinydashboard)
library(DT)


FE <- as.numeric(length(which(jobMandate$Role == "Frontend")))
BE <- as.numeric(length(which(jobMandate$Role == "Backend")))
FS <- as.numeric(length(which(jobMandate$Role == "Full Stack")))
Mob <- as.numeric(length(which(jobMandate$Role == "Mobile")))



shinyServer(
  function (input,output){
    
    output$histogram <- renderPlot(
      hist(iris$Sepal.Length, breaks = input$bins, main = "Job Applies W.R.T. Years of Experience",
           xlab = "Years of Experience",
           ylab = "Total Applies")
    )

    output$views_applies = DT::renderDataTable(
      views_applies, extensions = 'Buttons',
      filter = 'top',
      options = list(scrollX = TRUE, processing = F,
                     dom = 'Bfrtip', buttons = I('colvis')
                     ),
      editable = T ,rownames = F , colnames = c('Email Id','Job ID','Company Name','Job Title','View Date','Apply Date', 'Application Status')
    )

    output$js_info = DT::renderDataTable(
      jsprofile,
      filter = 'top', rownames = F , extensions = 'Buttons',
      options = list(scrollX = TRUE
                     , dom = 'Bfrtip',process = F , buttons = I('colvis')),
      editable = T)
    
    
    
    output$jobsinfo = DT::renderDataTable(
      jobMandate,
      filter = 'top',extensions = 'Buttons',
      options = list( columnDefs = list(list(className = 'dt-center', targets = c(3:6, 13,14))),
                      dom = 'Bfrtip', buttons = I('colvis'),scrollX = TRUE
                      ),
      
        
      editable = T, rownames = F ,
      colnames = c('Company','Job Title','Domain','Min CTC','Max CTC','Min Work Ex', 'Max Work Ex',
                                                                  'Location', 'Category', 'Status','Date', 'Spoc', 'Mandatory Skills', 'Veiws','Applies'))
    
    }
)
