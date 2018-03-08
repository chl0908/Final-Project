library(shiny)
library(plotly)
#install.packages("shinythemes")
library(shinythemes)

navbarPage(theme = shinytheme("darkly"), "Crime Report",
           tabPanel("About",
                    fluidRow(
                      column(5,includeMarkdown("report.md")
                      )
                      
                      #                    column(7, img(class="img-polaroid",
                      #                                 src=("https://www.brennancenter.org/sites/default/files/styles/individual_node_page/public/blog/crime%20cuffs.jpg?itok=WP0o5xht")
                      #                                 )
                      #                    )
                    )
           ),
           
           tabPanel("Search Share of Each Race",
                    sidebarLayout(
                      sidebarPanel(
                        
                        
                        selectInput("Type",
                                    label = "Choose a Crime Type:",
                                    choices = c(crimeType),
                                    selected = "Robbery"
                        ),
                        
                        hr(),
                        
                        radioButtons("Age",
                                     label = "Choose an Age Range: ",
                                     choices = c("Total arrests" = "total",
                                                 "Under 18" = "under", 
                                                 "Above 18" = "over"
                                     )
                        ),
                        
                        helpText(hr("Note: click on a race type on the legend bar to exclude it from the graph"))
                      ),
                      
                      mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Pie Chart", plotlyOutput("pie"),textOutput("pieAnalysis1"),
                                             textOutput("pieAnalysis2"),textOutput("pieAnalysis3"),textOutput("pieAnalysis4")),
                                    tabPanel("Table", tableOutput("pieTable"))
                        )
                      )
                    )
           ),
           tabPanel("Search Top Crime",
                    sidebarLayout(
                      sidebarPanel(
                        selectInput("Race",
                                    label = "Choose a Race:",
                                    choices = c(race),
                                    selected = "White"
                        ),
                        
                        hr(),
                        
                        sliderInput("Num", label = "Choose a number of crime you want ",
                                    min = 1, max = 30, value = 5
                        ),
                        
                        helpText("View the top number of crimes criminals in this race were arrested for.")
                      ),
                      
                      mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Bubble Chart", plotlyOutput("bubble"), textOutput("text1"),
                                             textOutput("text2"),textOutput("text3")),
                                    tabPanel("Table", tableOutput("bubbleTable"))
                        )
                      )
                    )
           )
)
