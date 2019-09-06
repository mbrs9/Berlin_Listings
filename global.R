library(dplyr)
library(leaflet)
listings <- read.csv("data/listings.csv", encoding = "UTF-8")
listings <- rename(listings, lat=latitude, lng=longitude)
