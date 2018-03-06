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
    cereal()
  })
  
  output$plot <- renderPlot({
    ggplot(cereal(), aes(x=rating, y=calories)) + geom_point(color="red") + ggtitle("the relationship between rating & calories")
  })
  
})