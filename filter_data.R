data <- read.csv("C:/Users/admin/Desktop/info201/Final-Project/data/data.csv")
library(dplyr)

shinyServer(function(input, output) {

  inputDataOne <- reactive({
    if (input$Age != "All") {
      dataUsed <- data %>% select(grep(input$age, names(data)))
    } else {
      dataUsed <- data
    }
    dataUsed <- dataUsed %>% filter(Offense_charged = input$Type)

    dataUsed
  })
  
 # inputDataTwo <- reactive({
  #  dataUsed <- data[1:6]
  #  dataUsed <- dataUsed %>% select(grep(input$Race, names(data)))
  #  head(dataUsed, input$num)
 # })
  

})