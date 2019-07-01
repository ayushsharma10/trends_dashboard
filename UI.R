#install.packages("shinydashboard")
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Team David",
                    dropdownMenu(type = "message", 
                                 
                                 
                                 #Messages
                                 messageItem(from = "Hello User", message = "Welcome to our dynamic dashboard"),
                                 messageItem(from = "Alert", message = "7+ Work Ex users have least applies", icon = icon("exclamation-circle"), time = "14:30"),
                                 messageItem(from = "Review Meeting", message = "Meeting at 2 PM on Friday ", icon = icon("handshake-o"), time = "15:00")),
                    
                    dropdownMenu(type = "notification",
                                 
                                 
                                 #Notifications
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

                                  
                                  #Targets
                                  taskItem(
                                    value = 80,
                                    color = "aqua",
                                    "Current CV accquisitions", #Monthly target completion
                                  ),
                                  
                                  taskItem(
                                    value = 55,
                                    color = "red",
                                    "Current Job accquisitions", #Monthly target completion 
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
                       br(),
                      # sidebarSearchForm(" searchText", "buttonSearch", "Search"), br(),
                     menuItem("Jobseeker Info", tabName = "JSinfo", icon = icon("user-circle")), 
                     
                     menuItem("Job Info", tabName = "jobs", icon = icon("briefcase")),
                     
                     #menuItem("Domain", tabName = "domain", icon= icon("search")), 
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
      tags$style(".small-box.bg-yellow { background-color: #FFFF00 !important; color: #000000 !important; }"),
      tabItems(
        
        
        #Jobseeker Tab
        tabItem(tabName = "JSinfo", 
                h1("Job Seeker Related Information"), br(),
                fluidRow(
                  tabBox(width = 400,
                  tabPanel(title= 'Jobseekers Information', icon = icon("user"),box(title = "Jobseeker Mandate",width = 400, status = "primary", solidHeader = T, DT::dataTableOutput('js_info'))),
                  tabPanel(title= "Views and Applies",icon = icon("check-circle"),box(title = "Status of Viewed and Applied Jobs by Jobseeker",width = 400, status = "primary", solidHeader = T, DT::dataTableOutput('views_applies')))
                  
                  ))
        
        ),
                
        
        #Jobs Tab
        tabItem(tabName = "jobs", 
                
                fluidRow(
                  valueBox(paste0(BE, ' Active Jobs'), "Backend", color = "blue", icon = icon('python'), width = 3 ),
                  valueBox(paste0(FE, ' Active Job') , "FrontEnd", color = "orange", icon = icon('js'), width = 3 ),
                  valueBox(paste0(FS, ' Active Jobs') , "Full Stack", color = "green", icon = icon('file-code'), width = 3 ),
                  valueBox(paste0(Mob, ' Active Jobs') , "Mobile", color = "teal", icon = icon('android'), width = 3 )
                  #,
                  #valueBox( '0 Active Jobs' , "DevOps", color = "red", icon = icon('aws'), width = 3 ),
                  #valueBox( '0 Active Jobs' , "Datawarehousing", color = "maroon", icon = icon('database'), width = 3 )
                ),
                fluidRow(
                  tabBox(width = 400,
                         tabPanel(title= 'Jobs Information', icon = icon("building"),
                                  box(title = "Job Mandate",width = 700, status = "primary", solidHeader = T, DT::dataTableOutput('jobsinfo')))
                
                
              ))),
        
        
        
        #Domain Tab
        # tabItem(tabName = "JS Info",
        #         h1("Domain Summary"),
        #         fluidRow(
        #           valueBox(paste0(BE, ' Active Jobs') , "Backend", color = "blue", icon = icon('python'), width = 3 ),
        #           valueBox(paste0(FE, ' Active Job') , "FrontEnd", color = "yellow", icon = icon('js'), width = 3 ),
        #           valueBox(paste0(FS, ' Active Jobs') , "Full Stack", color = "green", icon = icon('file-code'), width = 3 ),
        #           valueBox(paste0(Mob, ' Active Jobs') , "Mobile", color = "teal", icon = icon('android'), width = 3 )
        #         )),
        
        
        #Trends Tab
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
