library(ggplot2)

server <- function(input, output, session) {
  variables_dict <- c(
    "Miles per gallon" = "mpg",
    "Cylinders" = "cyl",
    "Displacement" = "disp",
    "Horsepower" = "hp",
    "Rear axle ratio" = "drat",
    "Weight" = "wt",
    "1/4 mile time" = "qsec",
    "Engine (0 = V-shaped, 1 = straight)" = "vs",
    "Transmission (0 = automatic, 1 = manual)" = "am",
    "Gears" = "gear"
  )
  
  v <- reactiveValues(
    var_label_x = NA,
    var_label_y = NA,
    var_x = NA,
    var_y = NA
  )
  
  observeEvent(input$show, {
    v$var_x <- input$variable_x
    v$var_y <- input$variable_y
    
    v$var_label_x <- names(variables_dict[variables_dict == v$var_x])
    v$var_label_y <- names(variables_dict[variables_dict == v$var_x])
  })
  
  output$plot <- renderPlot({
    req(v$var_x, v$var_y)
    ggplot(mtcars, aes_string(v$var_x, v$var_y)) +
      geom_point(colour = "royalblue", alpha = 0.7, size = 4) +
      theme_classic() + 
      theme(axis.text = element_text(size = 15),
            axis.title = element_text(size = 20)) +
      xlab(v$var_label_x)+
      ylab(v$var_label_y)
  })
  
  output$title <- renderText({
    req(v$var_label_x, v$var_label_y)
    paste0(v$var_label_y, " by ", v$var_label_x)
  })
}
