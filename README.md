
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stglpyhs

<!-- badges: start -->

[![R-CMD-check](https://github.com/Knicey/stglyphs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Knicey/stglyphs/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of stglpyhs is to introduce new ways of visualizing
spatio-temporal data and in particular analyzing across multivariate
seasonal data. The existing cubble package implements glyph maps in the
form of line graphs. This project seeks to expand this functionality to
segment plots to visualize multivariable data better and analyze
seasonal trends.

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
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

``` r
library(ggplot2)

grouped <- stations |>
  group_by(month, name, long, lat) |>
  summarise(
    avgmin = mean(tmin, na.rm = TRUE),
    avgmax = mean(tmax, na.rm = TRUE)
  ) |>
  ungroup()
#> `summarise()` has grouped output by 'month', 'name', 'long'. You can override
#> using the `.groups` argument.
```

``` r
#TODO: Accommodate for xend aesthetic (required in geom_segment)
```

``` r
ggplot(data = grouped) +
  geom_sf(data = mainland_us, color = "white") +
  ggthemes::theme_map() +
  geom_point(aes(x = long, y = lat)) +
  geom_segment_glyph(
    x_scale = rescale11x,
    y_scale = rescale11y,
    global_rescale = FALSE,
    width = 2,
    height = 3,
    aes(
    x_major = long, 
    y_major = lat, 
    x_minor = month, 
    y_minor = avgmin, 
    yend_minor = avgmax)
    ) 
#> Warning: Unknown or uninitialised column: `linewidth`.
#> Warning: Unknown or uninitialised column: `size`.
```

<img src="man/figures/README-example-1.png" width="100%" />

    #> [1] "Data in draw_panel:"
    #> # A tibble: 120 × 20
    #> # Groups:   x_major, y_major [10]
    #>    x_major y_major x_minor y_minor yend_minor PANEL group      x   xend     y
    #>      <dbl>   <dbl>   <dbl>   <dbl>      <dbl> <fct> <int>  <dbl>  <dbl> <dbl>
    #>  1  -105.     41.2      -1  -0.874     -0.677 1        -1 -107.  -107.   38.5
    #>  2   -96.8    32.8      -1  -0.947     -0.117 1        -1  -98.8  -98.8  30.0
    #>  3   -94.7    39.3      -1  -0.901     -0.598 1        -1  -96.7  -96.7  36.6
    #>  4  -115.     36.1      -1  -1         -0.263 1        -1 -117.  -117.   33.1
    #>  5   -80.1    25.8      -1  -1          0.382 1        -1  -82.1  -82.1  22.8
    #>  6   -83.4    35.7      -1  -1         -0.752 1        -1  -85.4  -85.4  32.7
    #>  7   -74.0    40.8      -1  -1         -0.552 1        -1  -76.0  -76.0  37.8
    #>  8   -78.8    35.9      -1  -1         -0.227 1        -1  -80.8  -80.8  32.9
    #>  9  -118.     34.0      -1  -1          0.506 1        -1 -120.  -120.   31.0
    #> 10  -122.     47.4      -1  -0.902     -0.266 1        -1 -124.  -124.   44.7
    #> # ℹ 110 more rows
    #> # ℹ 10 more variables: yend <dbl>, colour <chr>, linewidth <dbl>,
    #> #   linetype <dbl>, width <dbl>, height <dbl>, alpha <dbl>,
    #> #   global_rescale <lgl>, x_scale <list>, y_scale <list>
