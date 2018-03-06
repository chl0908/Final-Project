data <- read.csv("C:/Users/admin/Desktop/info201/Final-Project/data/data.csv")
library(dplyr)

shinyServer(function(input, output) {

  inputData <- reactive({
    if (input$Age != "All") {
      dataUsed <- data %>% select(grep(input$age, names(data)))
    } else {
      dataUsed <- data
    }
    dataUsed <- dataUsed %>% filter(Offense_charged = input$Type)

    dataUsed
  })
  

})