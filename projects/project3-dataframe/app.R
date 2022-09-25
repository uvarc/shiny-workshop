library(shiny)
library(mosaicData)
library(ggplot2)

source("UI-solution.R")

server <- function(input, output, session) {
  source("Server-solution.R", local=TRUE)
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)