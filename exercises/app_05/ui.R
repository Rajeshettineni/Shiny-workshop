ui <- fluidPage(
  title = "Data Explorer",
  
  # Application title
  titlePanel("Mtcars Data Explorer"),
  
  # Sidebar Layout
  sidebarLayout(
    
    # Sidebar Panel
    sidebarPanel(
      h3("Settings panel"),
      p("Select variables to be displayed on the x and y axes."),
      hr(),
      selectInput("variable_x", "Variable X", choices = c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
      selectInput("variable_y", "Variable Y", choices = c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
      actionButton("show", "Update plot")
    ),
    
    # Main Panel
    mainPanel(
      h3(textOutput("title")),
      plotOutput("plot")
    )
  )
)
