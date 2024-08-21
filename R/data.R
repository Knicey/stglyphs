#' NOAA Weather Station Data
#'
#' A subset of data from NOAA weather stations in the United States.
#' Selected stations include: MIAMI BEACH, MT LECONTE, RALEIGH AP,
#' KANSAS CITY INTL AP, MCCARRAN INTL AP, CHEYENNE, NY CITY CNTRL PARK
#' SANTA MONICA MUNI AP and SEATTLE TACOMA AP
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

#' Flight Cancellation Data from 2019-2023
#'
#' A list of canceled flights that originated from the top 10 airports with the
#' most canceled flights. The included airports are DEN, MCO, SEA, ATL, DFW,
#' ORD, LAS, LAX, and PHX.
#'
#' @format ## `flights`
#' A data frame with 989355 rows and 45 columns:
#' \describe{
#'   \item{FL_DATE}{The date of the flight}
#'   \item{ORIGIN}{The origin airport for that flight}
#'   ...
#' }
"flights"


