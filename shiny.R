library(dplyr)
library(tidyverse)
library(ggpolt)

lines <- read.csv("C:/Users/Haoyue/Desktop/lines.csv")
stop <- read.csv("C:/Users/Haoyue/Desktop/stop.csv")


ui <- 
  navbarPage, collapsible = TRUE, inverse = TRUE, theme = shinytheme("slate"),
             tabPanel("Maps",
                      plotOutput("plot")
             ),
             



                      dataTableOutput("dynamic2"),
                      plotOutput("plot2")
                      
             )
             
  )

server <- function(input, output) {
  
  output$dynamic <- renderDataTable(crime, options = list(pageLength = 5))
  
  output$dynamic2 <- renderDataTable(crime[crime$DISTRICT == input$dt,], options = list(pageLength = 5))
  output$plot <- renderPlot({
    
    ggplot() +
      geom_polygon() +
      
      geom_point() +
      coord_map() +
      labs(title="")
    
  })
  output$plot2 <- renderPlot({
    ggplot() +
      geom_polygon() +
      
      geom_point() +
      coord_map() +
      labs(title="")
    
  })
  
}
shinyApp(ui = ui, server = server)