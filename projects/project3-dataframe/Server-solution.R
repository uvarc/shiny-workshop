Raw_data <- reactive({
  req(input$frame)
  switch(input$frame, 
         `datasets::mtcars` = datasets::mtcars,
         `datasets::iris` = datasets::iris,
         `mosaicData::CPS85` = mosaicData::CPS85,
  )
})

observeEvent(Raw_data(),
             updateSelectInput(session, "explanatory", choices=names(Raw_data()))
)

observeEvent(Raw_data(),
             updateSelectInput(session, "response", choices=names(Raw_data()))
)

vars <- reactive({
  Raw_data()[c(input$response, input$explanatory)]
})

output$show_df <- renderTable({
  head(vars())
})

output$graph_data <- renderPlot({
  ggplot(vars(),
         aes_string(
           x = input$explanatory,
           y = input$response
         )) +
  geom_point()
})

fitted_model <- reactive({
  formula <- paste(input$response, "~", input$explanatory)
  lm(formula, data = vars())
})

output$regression_table <- renderPrint({
  summary(fitted_model())
})

