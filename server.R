data <- read.csv("data/data.csv",stringsAsFactors=FALSE)
dataTwo <- read.csv("data/dataTwo.csv",stringsAsFactors=FALSE)
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
    dataUsed <- data.frame(amount = as.numeric(gsub(",", "", amount)), Offense_charged = dataTwo$Offense.charged)
    dataUsed$x <- runif(30, min=0, max=10)
    dataUsed <- dataUsed %>% arrange(desc(amount))
    dataUsed <- head(dataUsed,input$Num)
    if(input$Num == 1) {
      dataUsed$y <- c(2)
      dataUsed$size <- c(100)
    } else {
      dataUsed$y <-seq(4,0,-4/(input$Num - 1))
      dataUsed$size <- seq(155,10,-145/(input$Num - 1))
    }
    dataUsed
  })
  
  output$pieTable <- renderTable({
    data.frame("Race" = names(inputDataOne()), "Share" = paste0(unlist(inputDataOne()[1,]),"%"))
  })
  
  output$pie <- renderPlotly({
    c <- as.numeric(inputDataOne()[1,]) 
    colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
    plot_ly(inputDataOne()[1,], labels = ~names(inputDataOne()), values = ~c, type = 'pie', 
            textinfo = 'label', hoverinfo = 'text', text = ~paste(c, ' %'),
            marker = list(colors = colors,
                          line = list(color = '#FFFFFF', width = 1)) )%>%
      layout(showlegend=TRUE,title = ' ',
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels =FALSE),
             yaxis = list(showgrid =FALSE, zeroline =FALSE, showticklabels = FALSE)) %>%
      config(displayModeBar = F)
  })
  
  output$pieAnalysis1 <- renderText({paste0("Crime Type: ",input$Type)})
  
  output$pieAnalysis2 <- renderText({
    if(input$Age != "total") {
      paste0("Age: ",input$Age, " 18")
    } else {
      paste0("Age: All")
    }
  })
  
  precent <- reactive({
    sapply(inputDataOne()[1,], as.numeric)
  })
  
  tempt <- reactive({
    data.frame("amount" = precent(), "name" = names(inputDataOne()))
  })
  
  output$pieAnalysis3 <- renderText({
    paste0("1. Given these conditions, the highest percentage of criminals arrested, ", max(precent()),
            "% were classified as ", with(tempt(),tempt()[amount == max(precent()),])$name, ", implying that they have the highest risk of being arrested.")
  })
  
  output$pieAnalysis4 <- renderText({
    paste0("2. The lowest percentage of criminals arrested, ", min(precent()),
           "% were classified as ", with(tempt(),tempt()[amount == min(precent()),])$name, ", suggesting that they have the lowest risk of being arrested.")
  })

  
  output$bubbleTable <- renderTable({
    data.frame(Offense = inputDataTwo()$Offense_charged, Amount = inputDataTwo()$amount)
  })
  
  output$bubble <- renderPlotly({
    plot_ly(inputDataTwo(), x = ~x, y = ~y, text = ~paste0(Offense_charged,": ", amount), type = 'scatter', 
            mode = 'markers',color = ~size, colors = "Paired",marker = list(size = ~size, opacity = 0.5))  %>%
      layout(title = ' ',
             xaxis = list(title = " ", showgrid = FALSE, zeroline = FALSE, showticklabels =FALSE),
             yaxis = list(title = " ", showgrid = FALSE, zeroline =FALSE, showticklabels = FALSE)) %>%
      config(displayModeBar = F)
  })
  
  output$text1 <- renderText({
    paste0("1. This graph shows the top ", input$Num," types of crime that criminals classified as ", input$Race," were arrested for.")
  })
  
  secondCrime <- reactive({
    inputDataTwo()[2,]$Offense_charged
  })
  
  
  output$text2 <- renderText({
   # a <- head(inputDataTwo(),-1)$Offense_charged
    paste0("2. While the top crime for every race was all other offenses,
           the next most common crime type criminals under this race were mainly arrested for was ",
           inputDataTwo()[2,]$Offense_charged, " and the least number of criminals were arrested for ",
           tail(inputDataTwo(),1)$Offense_charged,".")
  })
  
  output$text3 <- renderText({
    paste0("3. ",sum(inputDataTwo()$amount)," criminals were arrested for the top ", input$Num," types of crimes.")
  })
})

