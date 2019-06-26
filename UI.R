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
    
    
    dashboardSidebar(width = 275,
                     
                     #SideBar Menu begins
                     sidebarMenu(
                       
                       sidebarSearchForm(" searchText", "buttonSearch", "Search"), br(),
                     menuItem("Jobseeker Info", tabName = "JSinfo", icon = icon("user-circle")), 
                     
                     menuItem("Job Info", tabName = "jobs", icon = icon("briefcase")),
                     
                     menuItem("Domain", tabName = "domain", icon= icon("search")), 
                     menuItem("Trends",tabName = "trend", icon = icon("chart-line"), badgeLabel = "beta", badgeColor = "yellow")
                     
                     #Sidebar Menu Ends
                     )
                     # ,
                     # br(),
                     # 
                     #       #Slider Input for Work Experience
                     #       sliderInput("exp", "Years of experience", 0,20 ,value = c(5,10), step = 0.5)

                           #Text Input
                          # textInput("text_input","Search User", value = "")
                          
                          #Slider Input for bins in histogram
                          
                          
                     ),
    dashboardBody(
      
      tabItems(
        tabItem(tabName = "JSinfo", 
                h1("Job Seeker Related Information"), br(),
                fluidRow(
                  tabBox(width = 400,
                  tabPanel(title= 'Jobseekers Information', icon = icon("user")),
                  tabPanel(title= "Views and Applies",icon = icon("check-circle"),box(title = "Status of Viewed and Applied Jobs by Jobseeker",width = 400, status = "primary", solidHeader = T, DT::dataTableOutput('items_dt')))
                  
                  ))
        
        ),
                tabItem(tabName = "jobs", 
                h1("Job Related Information"), h3("Coming soon...")),
        tabItem(tabName = "domain",
                h1("Domain Specific Information"), h3("Coming soon...")),
        tabItem(tabName = "trend", 
                fluidRow(
                  box(plotOutput("histogram"), title = 'Applies to Work Experience', status = 'primary', background = "aqua"  ,solidHeader = T),
                  box(title = "Controls for Histogram", 'Use these controls to fine tune the Histogram', br(),br(),
                      status = "warning", solidHeader = T , sliderInput("bins", "Number of bins", 0,30, 15 , step = 0.5) )
                ))
           
        )
      )
    
    )
  )
