data <- read.csv("data/data.csv")
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

      #pie3D(c,
      #  main="Pie Chart of Crimes ")
      df <- data.frame(COM = c("ch", "ch", "zu","zu"), year = c("2015", "2016","2015", "2016"), values= c(100,125,65,17))
      data2015 <- filter(df, year == "2015")
      data2016 <- filter(df, year == "2016")
      
      plot_ly(data2015, labels = ~COM, values = ~ values, type = "pie", domain = list(x = c(0, 0.5), y = c(0, 1))) %>%
        add_trace(data = data2016, labels = ~COM, values = ~ values, type = "pie", domain = list(x = c(0.5, 1), y = c(0, 1)))

    
})

