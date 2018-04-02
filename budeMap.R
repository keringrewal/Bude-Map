library(ggmap)
library(tidyverse)
library(magick)


map1 <- get_map(location = "Bude", zoom = 14)

df <- data.frame(location = c('Crooklets Beach', 'Summerleaze Beach', 'The Barrel at Bude'), stringsAsFactors = FALSE)

geo_loc <- geocode(df$location)

df1 <- cbind(df, geo_loc)


start <- "Bude North Cornwall Cricket Club"
end <- "The Barrel at Bude"
path <- route(start, end, structure = "route")

ggmap(map1) + geom_point(data = df1, aes(x = lon, y = lat)) + 
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = path, lineend = "round"
  )

watermap <- get_map(location = "Bude", maptype = "watercolor", zoom = 15)
ggmap(watermap) + geom_point(data = df1, aes(x = lon, y = lat)) + 
  geom_path(
    aes(x = lon, y = lat), colour = "red", size = 1.5,
    data = path, lineend = "round"
  )


crook_beach <- image_scale(image_read("https://www.thebeachguide.co.uk/public/geophotos/1450635.jpg"))

print(crook_beach)

summ_beach <- image_scale(image_read("https://www.natureflip.com/sites/default/files/photo//bude-summerleaze-beach-summerleaze-beach-at-bude-cornwall.jpg"))

print(summ_beach)

