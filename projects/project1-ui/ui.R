ui <- fluidPage(
  h1("The Office Valentine Generator"),
  actionButton("go", "Create Valentine!"),
  plotOutput("valentine")
)