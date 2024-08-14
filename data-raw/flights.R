library(jsonlite)
library(readr)
library(tidyverse)
library(httr)
library(airports)

#Requires a kaggle account and API key

credentials = fromJSON("kaggle.json")
username = credentials$username
key = credentials$key

auth <- authenticate(user = username, password = key)

url <- paste0("https://www.kaggle.com/api/v1/datasets/download/",
              "patrickzel/flight-delay-and-cancellation-dataset-2019-2023"
              , "/flights_sample_3m.csv")

response <- GET(url, auth)

if (response$status_code == 200) {
  # Save the content to a temporary file
  zip_file <- tempfile(fileext = ".zip")
  writeBin(content(response, "raw"), zip_file)

  files_in_zip <- unzip(zip_file, list = TRUE)

  csv_file_name <- files_in_zip$Name[1]

  # Read the CSV directly from the ZIP file
  flights_data_raw <- read_csv(unz(zip_file, csv_file_name))

} else {
  stop("Failed to download the dataset. Status code: ", response$status_code)
}

top_100_airports <- flights_data_raw |>
  group_by(ORIGIN) |>
  summarise(
    total_flights = n()
  ) |>
  ungroup() |>
  arrange(desc(total_flights)) |>
  head(100)

sample_airports <- sample(top_100_airports$ORIGIN, 10)

flights_by_monthyear <- flights_data_raw |>
  filter(ORIGIN %in% sample_airports) |>
  mutate(
    month = month(FL_DATE),
    year = year(FL_DATE)
  ) |>
  group_by(ORIGIN, month, year) |>
  summarise(
    total_flights = n()
  )

flights_by_month <- flights_by_monthyear |>
  group_by(ORIGIN, month) |>
  summarise(
    max = max(total_flights),
    min = min(total_flights),
  )

flights <- left_join(flights_by_month, usairports,
  by = c("ORIGIN" = "location_id")) |>
  select(ORIGIN, month, max, min, facility_name, arp_latitude, arp_longitude)

usethis::use_data(flights, overwrite = TRUE)
