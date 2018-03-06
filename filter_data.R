data <- read.csv("/Users/a1111/desktop/info201HW/Final-Project/data/data.csv")
install.packages("plotrix")
library(dplyr)
library(ggplot2)
library(plotrix)
shinyServer(function(input, output) {

  inputDataOne <- reactive({
    dataUsed <- data %>% filter(Offense_charged == input$Type)
    dataUsed <- dataUsed[,grepl(input$Age, names(data))]
    
    dataUsed
  })
  
  inputDataTwo <- reactive({
    dataUsed <- data[,1:6]
    dataUsed <- dataUsed[,grepl(input$Race, names(data))]
    dataUsed$Offense_charged <- data[,1] 
    
    head(dataUsed,input$Num)
  })
  
})