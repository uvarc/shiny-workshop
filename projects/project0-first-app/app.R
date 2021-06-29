# A very basic shiny app
library(shiny)

source("muggle.R")         # our regular R code
source("user_interface_soln.R") # defines the user interface
 

# Set up the bridge to the Wizarding World
reactive_logic <- function(input, output, session) {
  source("reactive_logic_soln.R", local = TRUE)
}

# Invoke the app!
shinyApp(user_interface_soln, reactive_logic)
