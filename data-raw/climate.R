library(tidyverse)
library(lubridate)
library(janitor)

#Near the Himalayas
shiquanhe <- read_csv("data/NOAA/CHM00055228.csv")

#Near the Grand Canyon
mccarran_airport <- read_csv("data/NOAA/USW00023169.csv")

#RDU Airport
rdu_airport <- read_csv("data/NOAA/USW00013722.csv")

#Near the Sahara Desert (doesn't have any data past 1967)
wheelus_lybia <- read_csv("data/NOAA/LYW00033123.csv")

#Miami Beach
miami_beach <- read_csv("data/NOAA/USW00092811.csv")

#Near the Smokey Mountains
mount_leconte <- read_csv("data/NOAA/USC00406328.csv")

whole_dataset <- bind_rows(shiquanhe, mccarran_airport, rdu_airport, miami_beach, mount_leconte)

dataset_cleaned <- whole_dataset |>
  clean_names() |>
  mutate(
    date = ymd(date),
    month = month(date),
    year = year(date)
  ) |>
  filter(
    year > 2018
  )

#The average here is calcaulted by taking the mean of the precipitation values for each month across all days in the past 5 years
dataset_grouped <- dataset_cleaned |>
  group_by(month, name) |>
  summarise(avg = mean(prcp, na.rm = TRUE))

ggplot(data = dataset_grouped, mapping = aes(x = factor(month), y = avg, color = name, group = name)) +
  geom_line() +
  theme_bw() +
  labs(
    title = "Average Monthly Precipitation Across Different Locations in the Past 5 Years",
    x = "Month",
    y = "Average Precipitation (in)",
    color = "Location"
  )
