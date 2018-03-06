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

  
