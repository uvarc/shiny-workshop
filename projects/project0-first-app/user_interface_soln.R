user_interface_soln <- tagList(
  h2("A very basic Shiny App"),
  p("This app demonstrates the split between the Muggle and Wizard worlds"),
  actionButton("go", "Go!"),
  plotOutput("main"),
  textOutput("button_message"),
  selectInput("xvar", "X Variable", choices = colnames(diamonds)),
  selectInput("yvar", "Y Variable", choices = colnames(diamonds))
)