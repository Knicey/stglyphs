library(jsonlite)
library(readr)
library(tidyverse)
library(httr)

url <- "https://api.covidtracking.com/v1/us/daily.json"
covid_data <- content(GET(url), "text")

covid <- fromJSON(covid_data)
