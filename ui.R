library(shiny)

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
           
           tabPanel("Pie Chart",
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
                        )
                      ),
                      
                      mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Pie Chart", plotlyOutput("pie")),
                                    tabPanel("Table", tableOutput("pieTable"))
                        )
                      )
                    )
           ),
           tabPanel("Bubble Chart",
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
                        )
                      ),
                      
                      mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Bubble Chart", plotlyOutput("bubble")),
                                    tabPanel("Table", tableOutput("bubbleTable"))
                        )
                      )
                    )
           )
)
