library(shiny)
library(leaflet)
library(readr)
library(ggplot2)

overview <- read_csv("data/overview.csv")
standings <- read_csv("data/standings.csv")

ui <- fluidPage(
  titlePanel("Canadian NHL Teams"),
  
  tabsetPanel(
    tabPanel("Overview",
             mainPanel(
               leafletOutput("map", width = "1000", height = "600")
             )
    ),
    tabPanel("Calgary",
             fluidRow(
               column(width = 3,
                      imageOutput("calgaryImage")
               ),
               column(width = 6,
                      plotOutput("calgary_graph", width = "600", height = "400")
               ),
               column(width = 3,
                      plotOutput("calgary_bar", width = "100%", height = "500px")
               )
             )
    )
  )
)
  
  server <- function(input, output) {
    output$map <- renderLeaflet({
      leaflet() %>%
        addProviderTiles(provider = providers$OpenStreetMap) %>%
        addMarkers(data = overview,
                   lng = ~Longitude,
                   lat = ~Latitude,
                   icon = icons(
                     iconUrl = c(
                       "data/icons/calgary.png",    
                       "data/icons/edmonton.png",   
                       "data/icons/montreal.png",   
                       "data/icons/ottawa.png",     
                       "data/icons/toronto.png",    
                       "data/icons/winnipeg.png",   
                       "data/icons/vancouver.png"   
                     ),
                     iconWidth = 40,    
                     iconHeight = 40    
                   ),
                   popup = paste0(
                     "<b>Name:</b> ", overview$Name, "<br>",
                     "<b>Arena:</b> ", overview$Arena, "<br>",
                     "<b>Capacity:</b> ", overview$Capacity, "<br>",
                     "<b>Founded:</b> ", overview$Founded, "<br>",
                     "<b>Standings:</b> ", overview$Standings, "<br>"
                   )
        )
    })
    
    output$calgary_graph <- renderPlot({
      calgary_standings <- standings[standings$team == "calgary", ]
      ggplot(calgary_standings, aes(x = year, y = place)) +
        geom_line(color = "red") +
        geom_point(color = "yellow") +
        labs(x = "Year", y = "Place") +
        xlim(min(calgary_standings$year), max(calgary_standings$year)+1) +
        scale_y_continuous(breaks = 1:32, trans = "reverse") +
        theme(panel.grid = element_blank(),
              panel.background = element_blank())
    })
    
    
    
    
    output$calgaryImage <- renderImage({
      list(src = "data/icons/calgary.png",
           width = "100%",
           height = "auto")
    }, deleteFile = FALSE)
    
    
    output$calgary_bar <- renderPlot({
      calgary_data <- overview[overview$Name == "Calgary", ]
      ggplot(data, aes(fill=Avg, y= Capacity, x= Name)) + 
        geom_bar(position="stack", stat="identity")
    })
  }
  
  
  shinyApp(ui, server)
  