library(tidyverse)
library(lubridate)
library(janitor)

# devtools::install_github("ropensci/rnoaa")

load("./data/stations.rda")

grouped <- stations |>
  group_by(month, name) |>
  summarise(
    avgmin = mean(tmin, na.rm = TRUE),
    avgmax = mean(tmax, na.rm = TRUE)
)

ggplot(data = grouped) +
  geom_segment(aes(x = factor(month), xend = factor(month), y = avgmin, yend = avgmax)) +
  theme_bw() +
  labs(
    title = "Average Monthly Precipitation Across Different Locations in the Past 5 Years",
    x = "Month",
    y = "Average Precipitation (in)",
    color = "Location"
  ) +
  facet_wrap(vars(name))

#Use RNOAA package and put cleanup in stations.R
#Choose the stations with more frequent reporting

#Maps Package: SF
#Create a basemap and put dots where the stations are

#ggplot extension book (how a new geom is created), geoms (Chapters 18, 20(.3))
#Look at ggrepel (2 geoms + position functions) package structure, documentation, etc.
#Create GitHub workflow (package tests)

#Look at the Glyph map paper to get an idea of the linear algebra
#Use_data_raw()
