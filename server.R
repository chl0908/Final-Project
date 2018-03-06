data <- read.csv("/Users/a1111/desktop/info201HW/Final-Project/data/data.csv")
#install.packages("plotrix")
#install.packages("plotly")
library(dplyr)
library(ggplot2)
library(plotrix)
library(plotly)
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
      colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
      pie3D(c,explode=0.02,radius=1.0,shade=0.5,
        main="Pie Chart of Crimes ")
      })
    
})

