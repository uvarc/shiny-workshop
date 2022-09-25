library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  skin = "purple",
  
  dashboardHeader(title = "My First Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("tachometer-alt")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of Observations", 1, 100, 50)
                )
                
              )),
      tabItem(tabName = "widgets",
              h2("Widgets go here :)"))
      
      
      
      
    )
    
    
    
    
  )
  
)

server <- function(input, output, session) {
  
  output$plot1 <- renderPlot({
    data <- rnorm(input$slider)
    hist(data)
    
  })
}

shinyApp(ui, server)