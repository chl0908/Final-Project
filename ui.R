library(shiny)

ui <- fluidPage(
  titlePanel("Criminal Percentage"),
  
  sidebarLayout(
    sidebarPanel(
      
      selectInput("Type",
                  label = "What kind of crime are you looking for? ",
                  choices = c("???????????")
      ),
      
      hr(),
      
      selectInput("Age",
                  label = "Which age range are you looking for? ",
                  choices = c("Under 18" = "under", 
                              "Above 18" = "over", 
                              "Total arrests" = "All")
      )
      
      
      
    ),
    mainPanel(
      plotOutput("pieChart")
    )
  )
)

