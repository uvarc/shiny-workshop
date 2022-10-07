library(shiny)
library(mosaicData)
library(ggplot2)

source("UI.R")

server <- function(input, output, session) {
  source("Server.R", local=TRUE)
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)