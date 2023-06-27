library(shiny)
library(leaflet)
library(tidyverse)
library(readxl)

overview <- read_csv("data/overview.csv")

calgary_statistics <- read_xlsx("data/calgary2.xlsx")

ui <- fluidPage(
  titlePanel("Canadian NHL Teams"),
  
  tabsetPanel(
    tabPanel("Overview",
             mainPanel(
               leafletOutput("map", width = "1000", height = "600")
             )
    ),
    
    tabPanel("Calgary",
             id = "#tab-calgary",
             fluidRow(
               column(width = 1,
                       imageOutput("calgary_icon")
               )
             ),
             fluidRow(
               column(width = 3,
                      radioButtons("Pos", "Position",
                                   choices = c("Forward", "Defencemean", "Goaltenders"),
                                   selected = "Forward")
               ),
               column(width = 9,
                      "Table content goes here"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Edmonton",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Montreal",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Ottawa",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Toronto",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Winnipeg",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               )
             )
    ),
    
    tabPanel("Vancouver",
             fluidRow(
               column(width = 12,
                      "test"
               )
             ),
             fluidRow(
               column(width = 6,
                      "test"
               ),
               column(width = 6,
                      "test"
               )
             ),
             fluidRow(
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
               ),
               column(width = 4,
                      "test"
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
                     "<b>Standings:</b> ", overview$Standings, "<br>", 
                     "<a href='#tab-calgary'>Open Team Tab</a>"
                   )
        )
    })
    #output$calgary_icon <- renderImage({
     # matrix(
        #image("data/icons/calgary.png", alt = "Calgary Icon", width = "100px", height = "100px"),
        #nrow = 1, ncol = 1, byrow = TRUE
      #)
    #}, deleteFile = FALSE)
    
    # FUCKING FINALLY
    
    output$calgary_icon <- renderImage({
      list(src = "data/icons/calgary.png",
           alt = "Calgary Icon",
           width = "100px",
           height = "100px")
    }, deleteFile = FALSE)
    
  }
  
  
  
  shinyApp(ui, server)
  
  # checkout plotly for the stats