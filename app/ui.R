library(shiny)

ui <- fluidPage(
  titlePanel("r"),
  
  sidebarLayout(
    sidebarPanel(
      
      
      selectInput("Race",
                  label = "Choose a Race:",
                  choices = c(race),
                  selected = "White"
      ),
      
      hr(),
      
      sliderInput("Num", label = "Choose a number of crime you want ",
                  min = 1, max = 30, value = 5
                   )
      )
      
      
      
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

