library(ggplot2)

server <- function(input, output, session) {
  v <- reactiveValues(
    var_label = NA
  )

  output$plot <- renderPlot({
    v$var_label <- gsub(".", " ", input$variable, fixed = TRUE)
    ggplot(iris, aes_string("Species", input$variable)) +
      geom_boxplot(fill = "royalblue") +
      theme_classic() + 
      theme(axis.text = element_text(size = 15),
            axis.title = element_text(size = 20)) +
      ylab(v$var_label)
  })
  
  output$title <- renderText({
    paste0(v$var_label, " by Species")
  })
}