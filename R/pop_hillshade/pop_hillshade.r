### Hillshade & Population map (Nepal)
# ---1) Install libraries
library(pacman)
pacman::p_load(terra, elevatr, tidyverse, ggnewscale,
               ggpsatial, geodata, sf, scale)

# ---2) Get country boundary (Nepal)
country_sf<- geodata::gadm(country = 'NPL', level = 0, path = tempdir()) |>
  sf::st_as_sf()

#convert to spatvect
country_vect<- terra::vect(country_sf)

# ---3) Fetch population data
pop_100 <- terra::rast('https://data.worldpop.org/GIS/Population/Global_2000_2020_Constrained/2020/BSGM/NPL/npl_ppp_2020_constrained.tif')

# -- DEM Hillshade on a finer res
