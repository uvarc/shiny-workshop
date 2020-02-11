dataPanel <- tabPanel(
  title = "Data",
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
  tableOutput("show_df")
)

graphPanel <- tabPanel(
  title= "Graph",
  plotOutput("graph_data"),
)


statsPanel <- tabPanel(
  title= "Stats",
  verbatimTextOutput("regression_table")
)



ui <- fluidPage(
  tabsetPanel(
    dataPanel,
    graphPanel,
    statsPanel
  )
)