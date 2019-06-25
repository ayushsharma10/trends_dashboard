#install.packages("shinydashboard")
library(shiny)
library(shinydashboard)
iris1 <- data(iris)
shinyUI(
  dashboardPage(
    dashboardHeader(title = "Team David",
                    dropdownMenu(type = "message",
                                 messageItem(from = "Hello User", message = "Welcome to our dynamic dashboard"),
                                 messageItem(from = "Alert", message = "7+ Work Ex users have least applies", icon = icon("exclamation-circle"), time = "14:30"),
                                 messageItem(from = "Review Meeting", message = "Meeting at 2 PM on Friday ", icon = icon("handshake-o"), time = "15:00")),
                    
                    dropdownMenu(type = "notification",
                                 notificationItem(
                                   text = "New Tabs added to Dashboard",
                                   icon = icon("dashboard"),
                                   status = "success"),
                                 
                                 notificationItem(
                                   text = "More jobs accquisitions required",
                                   icon = icon("warning"),
                                   status = "warning"
                                 )
                                 ),
                    dropdownMenu( type = "tasks",
                                  taskItem(
                                    value = 80,
                                    color = "aqua",
                                    "Current CV accquisitions", #Monthly target completion
                                  ),
                                  
                                  taskItem(
                                    value = 55,
                                    color = "red",
                                    "Current Job accquisitions", ##Monthly target completion 
                                  ),
                                  
                                  taskItem(
                                    value = 30,
                                    color = "green",
                                    "Engagement Activities"
                                    
                                  )
                                  
                      
                    )  
                    
                  ),
    
    
    dashboardSidebar(
                     sidebarMenu(
                       
                       sidebarSearchForm(" searchText", "buttonSearch", "Search"), br(),
                     menuItem("Jobseeker Info", tabName = "JSinfo", icon = icon("user-circle")), 
                     
                     menuItem("Job Info", tabName = "jobs", icon = icon("briefcase")),
                     
                     menuItem("Domain", tabName = "domain", icon= icon("search")), 
                     menuItem("Trends",tabName = "trend", icon = icon("chart-line"), badgeLabel = "beta", badgeColor = "yellow")
                     ),br(),
                     
               
                           sliderInput("bins", "Years of experience", 1,50,10),
                           textInput("text_input","Search User", value = "")),
    dashboardBody(
      
      tabItems(
        tabItem(tabName = "JSinfo", 
                h1("Job Seeker Related Information Here")),
        tabItem(tabName = "jobs", 
                h1("Job Related Information Here")),
        tabItem(tabName = "domain",
                h1("Domain Specific Information Here")),
        tabItem(tabName = "trend", 
                fluidRow(
                  box(plotOutput("histogram"))
                ))
           
        )
      )
    
    )
  )
