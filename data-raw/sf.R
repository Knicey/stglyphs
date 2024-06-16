library(sf)
library(ggplot2)
library(dplyr)
library(rnaturalearth)
library(ggthemes)
library(rmapshaper)


us <- ne_states(country = "United States of America", returnclass = "sf")
mainland_us <- us %>%
  filter(!name %in% c("Alaska", "Hawaii", "Puerto Rico", "Guam", "American Samoa", "U.S. Virgin Islands", "Northern Mariana Islands"))

mainland_us <- ms_simplify(mainland_us)

ggplot(mainland_us) +
  geom_sf(color = "white") +
  geom_point(data = stations, aes(x = long, y = lat), color = "red", size = 6) +
  theme_map()

usethis::use_data(mainland_us, overwrite = TRUE)
