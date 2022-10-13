library(ggplot2)

server <- function(input, output, session) {
  v <- reactiveValues(
    var_label = NA,
    input_variable = NA
  )
  
  observeEvent(input$show, {
    v$var_label <- gsub(".", " ", v$input_variable, fixed = TRUE)
    v$input_variable <- input$variable
  })

  output$plot <- renderPlot({
    req(v$input_variable)
    ggplot(iris, aes_string("Species", v$input_variable)) +
      geom_boxplot(fill = "royalblue") +
      theme_classic() + 
      theme(axis.text = element_text(size = 15),
            axis.title = element_text(size = 20)) +
      ylab(v$var_label)
  })
  
  output$title <- renderText({
    req(v$var_label)
    paste0(v$var_label, " by Species")
  })
}