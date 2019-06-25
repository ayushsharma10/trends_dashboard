#install.packages("shinydashboard")
library(shiny)
library(shinydashboard)
iris1 <- data(iris)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "Team David",
                    dropdownMenu(type = "message",
                                 messageItem(from = "Hello User", message = "Welcome to our dynamic dashboard"))
                    ),
    
    
    dashboardSidebar(sliderInput("bins", "Years of experience", 1,50,10),br(),
                     
                     sidebarMenu(
                     menuItem("Jobseeker Info", tabName = "JSinfo", icon = icon("user-circle")), 
                     
                     menuItem("Job Info", tabName = "jobs", icon = icon("briefcase")),
                     
                     menuItem("Domain", tabName = "domain", icon= icon("search")), 
                     menuSubItem("Trends", icon = icon("chart-line"))
                     )),
    dashboardBody(
      
      tabItems(
        tabItem(tabName = "JSinfo", 
                fluidRow(
                  box(plotOutput("histogram"))
                )),
        tabItem(tabName = "jobs", 
                h1("Job Related Information Here")),
        tabItem(tabName = "domain",
                h1("Domain Specific Information Here"))
           
        )
      )
    
    )
  )
