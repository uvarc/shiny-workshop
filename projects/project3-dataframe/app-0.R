library(shiny)
library(mosaicData)
library(ggplot2)

ui <- fluidPage(
  selectInput("frame", "Data frame:", 
              choices = c("Choose data frame"= "", 
                          "datasets::mtcars", 
                          "datasets::iris", 
                          "mosaicData::CPS85"),
              selected = character()),
  selectInput("response", "Response var:", 
              choices = c("Waiting for you to choose frame" = "")),
  selectInput("explanatory", "Explan var:",
              choices = c("Waiting for you to choose response var" = "")),
  tableOutput("show_df"),
  plotOutput("graph_data"),
  verbatimTextOutput("regression_table"),
)

server <- function(input, output, session) {
  Raw_data <- reactive({
    req(input$frame)
    switch(input$frame, 
           `datasets::mtcars` = datasets::mtcars,
           `datasets::iris` = datasets::iris,
           `mosaicData::CPS85` = mosaicData::CPS85,
    )
  })
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)