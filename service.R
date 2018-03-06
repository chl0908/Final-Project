data <- read.csv("/Users/a1111/desktop/info201HW/Final-Project/data/data.csv")
install.packages("plotrix")
library(dplyr)
library(ggplot2)
library(plotrix)
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
  
  output$table <- renderTable({
    inputDataOne()
  })
  
  output$plot <- renderPlot({
    pie3D(slices,labels=lbls,explode=0.1,
          main="Pie Chart of Countries ")
  })
  
})