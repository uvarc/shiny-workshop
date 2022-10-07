# These are components of the reactive logic

output$main <- renderPlot(
  muggle_plot(as.name(input$xvar), as.name(input$yvar))
)

output$button_message <- renderText(
  if (input$go >= 3) {
  paste("You have pressed the button", input$go, "times.")
  }
)