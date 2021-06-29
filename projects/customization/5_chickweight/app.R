library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)


ui <- dashboardPage(
  dashboardHeader(title = "Chick Weight"),
  dashboardSidebar(sliderInput('time', 'Days Since Birth', 0, 20, 10, step=2),
                   sidebarMenu(
                     menuItem("Dashboard", tabName = "dashboard"),
                     menuItem("Raw Data", tabName = "rawdata")
                   )),
  dashboardBody(
    tabItems(
    tabItem('dashboard',
            fluidRow(
              valueBoxOutput('chicks'),
              valueBoxOutput('days'),
              valueBoxOutput('avg_weight')
            ),
            fluidRow(
              box(img(src='chicks.jpg', width="100%")),
              box(plotOutput('weight_plot'))
            )),
    
    tabItem('rawdata',
            fluidRow(
              box(tableOutput('show_df'))
            ))
  )
  )
)

server <- function(input, output, session) {
  df <- reactive({
    datasets::ChickWeight
  })
  
  time_df <- reactive({
    filter(df(), Time == input$time)
  })
  
  output$show_df <- renderTable({
    time_df()
  })
  
  output$chicks <- renderValueBox({
    numChicks <- nrow(time_df())
    
    valueBox(
      value = numChicks,
      subtitle = "Number of Chicks",
      icon = icon("kiwi-bird"),
      color = "aqua"
    )
  })
  
  output$days <- renderValueBox({
    daysSinceBirth <- input$time
    
    valueBox(
      value = daysSinceBirth,
      subtitle = "Days Since Birth",
      icon = icon("calendar"),
      color = "aqua"
    )
  })
  
  output$avg_weight <- renderValueBox({
    avg_weight <- mean(time_df()$weight)
    
    valueBox(
      value = formatC(avg_weight, digits=1, format='f'),
      subtitle = "Average Weight (grams)",
      icon = icon('weight'),
      color = if (avg_weight < 75) "red" else if (avg_weight >= 75 && avg_weight < 150) "yellow" else "green"
    )
  })
  
  output$weight_plot <- renderPlot({
    ggplot(time_df(), aes(x=Chick, y=weight, color=Diet)) + geom_point() + ylim(0,400)
  })
}

shinyApp(ui, server)