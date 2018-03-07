<<<<<<< HEAD
library(shiny)

server <- function(input, output, session) {
  
}
=======
data <- read.csv("data/data.csv")
#install.packages("plotrix")
library(dplyr)
library(ggplot2)
library(plotrix)
shinyServer(function(input, output) {
  
  inputDataTwo <- reactive({
    dataUsed <- data[,1:6]
    dataUsed <- dataUsed[,grepl(input$Race, names(data))]
    dataUsed$Offense_charged <- data[,1] 
    
    head(dataUsed,input$Num)
  })
  

    output$chart <- reactive({
      # Return the data and options
      list(
        data =  inputDataTwo(),
        options = list(
          title = sprintf(
            "Health expenditure vs. life expectancy, %s",
            input$year),
          series = series)
      )
    })
  })

  
>>>>>>> d686b13a0e66d41cf4cdf81a115b93d49ab24c3c
