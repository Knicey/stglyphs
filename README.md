
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stglpyhs

<!-- badges: start -->

[![R-CMD-check](https://github.com/Knicey/stglyphs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Knicey/stglyphs/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of stglpyhs is to …

## Installation

You can install the development version of stglpyhs from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Knicey/stglyphs")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(stglpyhs)

grouped <- stations |>
  group_by(month, name, long, lat) |>
  summarise(
    avgmin = mean(tmin, na.rm = TRUE),
    avgmax = mean(tmax, na.rm = TRUE)
)
#TODO: Accommodate for xend aesthetic (required in geom_segment)
ggplot(data = grouped) +
  geom_sf(data = mainland_us, color = "white") +
  ggthemes::theme_map() +
  geom_point(aes(x = long, y = lat)) +
  geom_segment_glyph(aes(
    x_major = long, 
    y_major = lat, 
    x_minor = month, 
    y_minor = avgmin, 
    yend_minor = avgmax)
    ) 
```
