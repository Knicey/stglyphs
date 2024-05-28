
<!-- README.md is generated from README.Rmd. Please edit that file -->

# stglpyhs

<!-- badges: start -->
<!-- badges: end -->

A package which adds glyph map features to represent spatio-temporal data in ggplot2.

This project is being developed as part of Google Summer of Code (GSOC) 2024 and expands upon the kind of glyphs that can be represented in glyph maps currently implemented in the [cubble](https://github.com/huizezhang-sherry/cubble) package.

Information about GSOC can be found [here](https://summerofcode.withgoogle.com/)

The basic project details can be found [here](https://github.com/rstats-gsoc/gsoc2024/wiki/glyph-map-for-visualizing-spatio%E2%80%90temporal-data)

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
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
