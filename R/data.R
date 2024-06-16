#' NOAA Weather Station Data
#'
#' A subset of data from NOAA weather stations in the United States.
#' Selected stations include:
#'
#' @format ## `stations`
#' A data frame with 17,253 rows and 12 columns:
#' \describe{
#'   \item{name}{Station Location}
#'   \item{tmin, tmax}{The minimum and maximum temperatures}
#'   \item{prcp}{Percepitation}
#'   ...
#' }
#' @source <https://www.ncei.noaa.gov/access/search/data-search/daily-summaries>
"stations"


#' rnaturalearth Mainland US Map Shapefile
#'
#' A shapefile from rnatural earth of the contiguous United States.
#' This shapefile was also simplified with rmapshaper using ms_simplify.
#'
#' @format ## `mainland_us`
#' A data frame with 49 rows and 122 columns:
#' \describe{
#'   \item{postal}{The state abbreviation}
#'   \item{name_sv}{The name of the state}
#'   \item{geometry}{The polygon representing the shape of the tsate}
#'   ...
#' }
"mainland_us"


