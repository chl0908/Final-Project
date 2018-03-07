data <- read.csv("data/data.csv")
dataTwo <- read.csv("data/dataTwo.csv")
#install.packages("plotrix")
#install.packages("plotly")
library(dplyr)
library(plotly)
library(ggplot2)
options(warn = -1)
packageVersion('plotly')
shinyServer(function(input, output) {
    
    inputDataOne <- reactive({
      dataUsed <- data %>% filter(Offense_charged == input$Type)
      dataUsed[,grepl(input$Age, names(data))]
    })
    
    inputDataTwo <- reactive({
      amount <- dataTwo[,grepl(input$Race, names(dataTwo))]
      dataUsed <- data.frame(amount = amount, Offense_charged = dataTwo$Offense.charged)
      dataUsed$x <- runif(30, min=0, max=4)
      dataUsed <- dataUsed %>% arrange(desc(amount))
      dataUsed <- tail(dataUsed,input$Num)
      dataUsed$y <-seq(0,4,4/(input$Num - 1))
      dataUsed$size <- seq(10,10+5*(input$Num - 1),5)
      
      dataUsed
    })
    
    output$pieTable <- renderTable({
        inputDataOne()
    })
    
<<<<<<< HEAD
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

=======
    output$pie <- renderPlotly({
        c <- as.numeric(inputDataOne()[1,]) 
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        plot_ly(inputDataOne()[1,], labels = ~names(inputDataOne()), values = ~c, type = 'pie', 
                textinfo = 'label', hoverinfo = 'text', text = ~paste(c, ' %'),
                marker = list(colors = colors,
                              line = list(color = '#FFFFFF', width = 1)) )%>%
              layout(showlegend=TRUE,title = 'Pie Chart for Selected Crime',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels =FALSE),
                      yaxis = list(showgrid =FALSE, zeroline =FALSE, showticklabels = FALSE))
    })
    
    output$bubbleTable <- renderTable({
      data.frame(Offense = inputDataTwo()$Offense_charged, Amount = inputDataTwo()$amount)
    })
    
    output$bubble <- renderPlotly({
      plot_ly(inputDataTwo(), x = ~x, y = ~y, text = ~paste0(Offense_charged,": ", amount), type = 'scatter', 
              mode = 'markers',color = ~size, colors = "Paired",marker = list(size = ~size, opacity = 0.5))  %>%
      layout(title = 'Top Crime Type in Selected Race',
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels =FALSE),
              yaxis = list(showgrid = FALSE, zeroline =FALSE, showticklabels = FALSE))
    })
<<<<<<< HEAD
=======
>>>>>>> 208fb50db88f46faced8042b4783a5e5d952f398
    
>>>>>>> 4d407dbced4a4b1d6b854ce196400125e2adf1a7
})

