# Berlin_Listings
-----
## App Description
Shiny app featuring Airbnb listings for the city of Berlin, Germany.

### Documentation
This App features all Airbnb listings for the city of Berlin in Germany, and allows the user to filter the original database, by selecting neighbourhood groups, room types, a price range and an availability range. 
The user can visualize the information via a leaflet-generated map. 
A particular listing can be selected in the map and display aditional information by clicking on its marker; The aditional information to be displayed on a particular marker popup: Listing Name, Listing ID, Neighbourhood, Host, Room type, and Price. 
A price summary is included for the selected listings.

#### Data
 The dataset was scraped on November 07th, 2018 and contains detailed listings data, of current Airbnb listings in Berlin.

### Inside this repo
This repository contains:
* ui.R
* server.R
* global.R
* data
  + listings.csv

## Acknowledgements
This data was created by Murray Cox and his Inside Airbnb project which can be found [here](insideairbnb.com/get-the-data.html).

## Development
This app was developed by Miguel Bravo S.
