library(shiny)

source("Muggle.R")

ui <- fluidPage(
  h1("The Office Valentine Generator"),
  actionButton("go", "Create Valentine!"),
  plotOutput("valentine")
)

server <- function(input, output, session) {

  
  output$valentine <- renderPlot({
    input$go
    my_valentine <- love_data[sample(1:nrow(love_data),1),]
    img <- load.image(paste0("pics/",my_valentine$character, ".jpg"))
    plot(img, axes = F);
    title(my_valentine$text)
  })
  
  
}

shinyApp(ui, server)