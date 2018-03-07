library(shiny)

ui <- fluidPage(
  titlePanel("Criminal Percentage"),
  
  sidebarLayout(
    sidebarPanel(
      

      selectInput("Type",
                  label = "Choose a Crime Type:",
                  choices = c(crimeType),
                  selected = "Robbery"
      ),
      
      hr(),
      
      radioButtons("Age",
                  label = "Choose an Age Range: ",
                  choices = c("Total arrests" = "total",
                              "Under 18" = "under", 
                              "Above 18" = "over"
                              )
      ),
      
      selectInput("Race",
                  label = "Choose a Race:",
                  choices = c(race),
                  selected = "White"
      ),
      
      hr(),
      
      sliderInput("Num", label = "Choose a number of crime you want ",
                  min = 1, max = 30, value = 5
      )
    ),
    
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel("Pie Chart", plotlyOutput("pie")),
                  tabPanel("Table", tableOutput("pieTable")),
                  tabPanel("bubble Chart", plotlyOutput("bubble")),
                  tabPanel("able", tableOutput("bubbleTable"))
    )
  )
)
)
