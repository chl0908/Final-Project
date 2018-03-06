library(shiny)
library(googleCharts)
xlim <- list(
  min =100,
  max =500
)
ylim <- list(
  min =1,
  max =  3
)
shinyUI(fluidPage(
  
  googleChartsInit(),
  
  # Use the Google webfont "Source Sans Pro"
  tags$link(
    href=paste0("http://fonts.googleapis.com/css?",
                "family=Source+Sans+Pro:300,600,300italic"),
    rel="stylesheet", type="text/css"),
  tags$style(type="text/css",
             "body {font-family: 'Source Sans Pro'}"
  ),
  
  h2("Google Charts demo"),
  
  googleBubbleChart("chart",
                    width="100%", height = "475px",
                    # Set the default options for this chart; they can be
                    # overridden in server.R on a per-update basis. See
                    # https://developers.google.com/chart/interactive/docs/gallery/bubblechart
                    # for option documentation.
                    options = list(
                      fontName = "Source Sans Pro",
                      fontSize = 13,
                      # Set axis labels and ranges
                      hAxis = list(
                        title = "Health expenditure, per capita ($USD)",
                        viewWindow = xlim
                      ),
                      vAxis = list(
                        title = "Life expectancy (years)",
                        viewWindow = ylim
                      ),
                      # The default padding is a little too spaced out
                      chartArea = list(
                        top = 50, left = 75,
                        height = "75%", width = "75%"
                      ),
                      # Allow pan/zoom
                      explorer = list(),
                      # Set bubble visual props
                      bubble = list(
                        opacity = 0.4, stroke = "none",
                        # Hide bubble label
                        textStyle = list(
                          color = "none"
                        )
                      ),
                      # Set fonts
                      titleTextStyle = list(
                        fontSize = 16
                      ),
                      tooltip = list(
                        textStyle = list(
                          fontSize = 12
                        )
                      )
                    )
  ),
#  titlePanel("r"),
  
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
      
      
      
    )
  )
  ,
 # mainPanel(
 #   plotOutput("chart")
 # )
)

