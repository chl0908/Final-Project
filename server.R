data <- read.csv("/Users/a1111/desktop/info201HW/Final-Project/data/data.csv")
#install.packages("plotrix")
library(dplyr)
library(ggplot2)
library(plotrix)
shinyServer(function(input, output) {
    
    inputDataOne <- reactive({
        dataUsed <- data %>% filter(Offense_charged == input$Type)
        dataUsed <- dataUsed[,grepl(input$Age, names(data))]
        
        dataUsed
    })
    
    output$table <- renderTable({
        inputDataOne()
    })
    
    output$plot <- renderPlot({
      c <- as.numeric(inputDataOne()[1,]) 
      pie3D(c,
        main="Pie Chart of Crimes ")
    })
    
})

