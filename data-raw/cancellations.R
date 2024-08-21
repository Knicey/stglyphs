library(tidyverse)
library(lubridate)
library(janitor)



flights_by_monthyear <- flights |>
  mutate(
    month = month(FL_DATE),
    year = year(FL_DATE)
  ) |>
  group_by(ORIGIN, month, year, longitude, latitude) |>
  summarise(
    total_flights = n()
  )

flights_by_month <- flights_by_monthyear |>
  group_by(ORIGIN, month, longitude, latitude) |>
  summarise(
    max = max(total_flights),
    min = min(total_flights),
  )


ggplot(data = flights_by_month) +
  geom_segment(aes(x = factor(month), xend = factor(month), y = min, yend = max)) +
  theme_bw() +
  labs(
    title = "Average Monthly Precipitation Across Different Locations in the Past 5 Years",
    x = "Month",
    y = "Average Precipitation (in)",
    color = "Location"
  ) +
  facet_wrap(vars(ORIGIN))


