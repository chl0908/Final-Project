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
      )
      
      
      
    ),
    mainPanel(
      tableOutput("table"),
      plotOutput("plot")
    )
  )
)

