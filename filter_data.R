data <- read.csv("/Users/a1111/desktop/info201HW/Final-Project/data/data.csv")
install.packages("plotrix")
library(dplyr)
library(ggplot2)
library(plotrix)
shinyServer(function(input, output) {

  inputDataOne <- reactive({
<<<<<<< HEAD
    dataUsed <- data %>% filter(Offense_charged == input$Type)
    dataUsed <- dataUsed[,grepl(input$Age, names(data))]
    
=======
    if (input$Age != "All") {
      dataUsed <- data %>% select(grep(input$age, names(data)))
    } else {
      dataUsed <- data
    }
    dataUsed <- dataUsed %>% filter(Offense_charged = input$Type)

>>>>>>> yajing-feature
    dataUsed
  })
  
  inputDataTwo <- reactive({
    dataUsed <- data[,1:6]
    dataUsed <- dataUsed[,grepl(input$Race, names(data))]
    dataUsed$Offense_charged <- data[,1] 
    
    head(dataUsed,input$Num)
  })
  
<<<<<<< HEAD
=======

>>>>>>> yajing-feature
})