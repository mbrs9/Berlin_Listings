#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        lstDa <- reactive({
                filter(listings, 
                       price>=input$priceSlider[1],
                       price<= input$priceSlider[2],
                       neighbourhood_group %in% input$location,
                       room_type %in% input$roomType,
                       availability_365>= input$availabilitySlider[1],
                       availability_365 <= input$availabilitySlider[2]
                )
        })
                
        output$map1 <- renderLeaflet({
                listdata <- lstDa()
                leaflet(listdata ) %>%
                        addTiles() %>%
                        addMarkers(popup = paste0(
                                "<br/>Name: ", "<strong>",(listdata$name),"</strong>",
                                "<br/>id: ", listdata$id,
                                "<br/>Neighbourhood: ", listdata$neighbourhood,
                                "<br/>Host: ", listdata$host_name,
                                "<br/>Room Type: ", listdata$room_type,
                                "<br/>Price: ", "$",format(listdata$price, big.mark = ",", nsmall = 2, decimal.mark = ".")
                                ),
                                label = listdata$name,
                                clusterOptions = markerClusterOptions(),
                                lng = listdata$lng, lat = listdata$lat
                                )
        })
        output$priceTable <- renderPrint({
                listdata <- lstDa()
                summary(listdata$price)
        })
})
