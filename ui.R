#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage( "",
                    tabPanel("Listings Finder",
  
  # Application title
  titlePanel("Berlin Listings Finder"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(h2("Select Listings"),
       checkboxGroupInput(
               "location",
               h3("Neighbourhood Group"),
               choices = levels(listings$neighbourhood_group),
               selected = levels(listings$neighbourhood_group)
       ),
       checkboxGroupInput(
               "roomType",
               h3("Room Type"),
               choices = levels(listings$room_type),
               selected = levels(listings$room_type)
       ),
       sliderInput(
               "priceSlider",
               h3("Price Range"),
               min=min(listings$price),
               max = max(listings$price),
               value = c(min(listings$price), max(listings$price))
       ),
       sliderInput(
               "availabilitySlider",
               h3("Availability (/365)"),
               min = min(listings$availability_365),
               max = max(listings$availability_365),
               value = c(0, 365)
       )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            leafletOutput("map1", height = 600),
            h3("Price Summary"),
            p("Summarize price for selected listings"),
            verbatimTextOutput("priceTable")
       
    )
  )),
  tabPanel("About",
           titlePanel("App Documentation"),
           sidebarLayout(
             sidebarPanel(
                     h2("How to use this app"),
                     p("Filter the listings by selecting the Neighbourhood
                       and Room Types of choice.", br(),
                       "Use the sliders to filter by the price and availability variables.", br(),
                       "Use the leaflet map to visualize a particular listing or a cluster of listings.
                       Clicking on a particular listing marker will display information about that particular listing.", br(),
                       "A price summary is executed bellow the leaflet map.", br(),
                       strong("Note: This app employs reactive outputs."))
             )
           ,
           mainPanel(
                   h1("About this app"),
                   h2("Description"),
                   p("This App features all Airbnb listings for the city of Berlin in Germany, and allows the user to filter the original database, 
                     by selecting neighbourhood groups, room types, a price range and an availability range.", br(),
                     "The user can visualize the information via a leaflet-generated map.", br(),
                     "A particular listing can be selected in the map and display aditional information by clicking on its marker; 
                     The aditional information to be displayed on a particular marker popup: Listing Name, Listing ID, Neighbourhood, 
                     Host, Room type, and Price.", br(),
                     "A price summary is included for the selected listings."
                     ),
                   h3("Data"),
                   h4("Description"),
                   p("The dataset was scraped on November 07th, 2018 and contains detailed listings data, 
                      of current Airbnb listings in Berlin."),
                   h4("Acknowledgements"),
                   p("This data was created by Murray Cox and his Inside Airbnb project which can be found",
                     a("here", href="http://insideairbnb.com/get-the-data.html")),
                   p("The particular dataset used is the", em("listings.csv"), "file"),
                   h4("File"),
                   p("The ", em("listings"), "file features the following variables:"),
                   tags$ol(
                           tags$li("id"),
                           tags$li("name"),
                           tags$li("host_id"),
                           tags$li("host_name"),
                           tags$li("neighbourhood_group"),
                           tags$li("neighbourhood"),
                           tags$li("lat"),
                           tags$li("lng"),
                           tags$li("room_type"),
                           tags$li("price"),
                           tags$li("minimum_nights"),
                           tags$li("number_of_reviews"),
                           tags$li("last_review"),
                           tags$li("reviews_per_month"),
                           tags$li("calculated_host_listings_count"),
                           tags$li("availability_365")
                   ),
                   h2("Development"),
                   p("This app was developed by Miguel Bravo S. using RStudio and Shiny"),
                   p("R version: 3.5.1 (2018/07/02)")
                   

                           
           )
           )
  )

  ))
