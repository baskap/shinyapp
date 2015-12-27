irisCols <- colnames(iris)[1:4]

shinyUI(pageWithSidebar(
  headerPanel("Iris dataset"),
  sidebarPanel(selectInput("x",
                           "x-axis:",
                           irisCols,
                           selected = irisCols[1]),
               selectInput("y",
                           "y-axis:",
                           irisCols,
                           selected = irisCols[2]),
               checkboxInput("showXMean", "Show x mean line", value = FALSE),
               checkboxInput("showYMean", "Show y mean line", value = FALSE),
               checkboxInput("showlm", "Show lm line", value = FALSE)),
  mainPanel (
    tabsetPanel(type = "tabs", 
                tabPanel("Plot", plotOutput('irisPlot')),
                tabPanel("Iris dataset", p(tableOutput("data"))),
                tabPanel("Iris datatable", p(fluidRow(dataTableOutput(outputId="table")))),
                tabPanel("Documentation", 
               h1("Documentation"),        
               p("Application presents data from famous Edgar Anderson's Iris Dataset."),
               p("Iris dataset contains 150 observations and gives the  measurement in centimeter of 
                the sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. 
                 The species are Iris setosa, versicolor, and virginica."),
               h2("Plot"),
               p("Application shows scatter plot that displays relations between two variables from iris dataset chosen by user."),
               p("User can choose variables from select lists:"),
               HTML('<ul><li>x-axis - user choose one variable from select list to be plotted on x-axis</li>
                         <li>y-axis - user choose one variable from select list to be plotted on y-axis</li></ul>'),
               p("Observation are colored by species."),
               p("User can also choose from options:"),
               HTML("<ul><li>show x mean line - plot shows vertical line passing through the mean value of the x-axis variable </li>
                         <li>show y mean line - plot shows horizontal line passing through the mean value of the y-axis variable</li>
                         <li>show lm line - plot show lm line</li></ul>"),
               h2("Iris dataset"),
               p("This panel shows all observations from iris dataset."),
               h2("Iris datatable"),
               p("This panel shows all observations from iris dataset in user friendly format allowing searching and sorting observations.")
               
  )))
))

