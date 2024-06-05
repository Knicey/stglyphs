## code to prepare `stations` dataset goes here
library(tidyverse)
library(rnoaa)

station_data <- ghcnd_stations() |>
  filter(id %in% c("USC00406328", "USW00023169", "USW00013722", "USW00092811")) |>
  filter(element %in% c("PRCP", "TMAX", "TMIN"))

station_data_raw <- station_data |>
  rowwise() |>
  mutate(ts = list(meteo_pull_monitors(
    monitors = id, var = c("PRCP", "TMAX", "TMIN"),
    date_min = "2020-01-01",
    date_max = "2023-12-31") |>
      select(-id))) |>
  rename(lat = latitude, long = longitude, elev = elevation)

stations <- station_data_raw |>
  select(id, long, lat, elev, name, wmo_id, ts) |>
  unnest(ts) |>
  mutate(
    tmax = tmax/10,
    tmin = tmin/ 10,
    date = ymd(date),
    month = month(date),
    year = year(date)
  )

usethis::use_data(stations, overwrite = TRUE)
