#' Create a glyph map
#'
#' @param string A dataframe with the fields: name, month, avgmin, and avgmax.
#' @inheritParams stringr::str_split
#'
#' @return A ggplot object.
#' @export
#'
#' @examples
#' data <- tribble(
#'  ~name, ~month, ~avgmin, ~avgmax,
#'  "A", 1, 0.5, 1.5,
#'  "A", 2, 0.6, 1.6,
#'  "A", 3, 0.7, 1.7,
#' )
#' st_glyph(data)
st_glyph <- function(data) {
  ggplot(data) +
    geom_segment(aes(x = factor(month), xend = factor(month), y = avgmin, yend = avgmax)) +
    theme_bw() +
    labs(
      title = "Average Monthly Precipitation Across Different Locations in the Past 5 Years",
      x = "Month",
      y = "Average Precipitation (in)",
      color = "Location"
    ) +
    facet_wrap(vars(name))
}
