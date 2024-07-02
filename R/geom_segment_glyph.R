#' @import ggplot2
#' @import dplyr
#' @export

#' @title GeomSegmentGlyph
#' @return description

geom_segment_glyph <- function(mapping = NULL, data = NULL, stat = "identity",
                               position = "identity", ..., x_major = NULL,
                               x_minor = NULL, y_major = NULL, y_minor = NULL,
                               yend_minor = NULL, width = ggplot2::rel(2.1),
                               height = ggplot2::rel(2.1), show.legend = NA,
                               inherit.aes = TRUE) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomSegmentGlyph,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      width = width,
      height = height,
      ...
    )
  )
}

GeomSegmentGlyph <- ggproto(
  "GeomSegmentGlyph",
  ggplot2::GeomSegment,

  setup_data = function(data, params) {
    data <- glyph_data_setup(data, params)
    return(data)
  },

  draw_panel = function(data, panel_params, coord, ...) {
    print("Data in draw_panel:")
    ggplot2:::GeomSegment$draw_panel(data, panel_params, coord, ...)
  },

  required_aes = c("x_major", "y_major", "x_minor", "y_minor", "yend_minor"),
  default_aes = aes(
    colour = "black",
    linewidth = 0.5,
    linetype = 1,
    width = ggplot2::rel(2.1),
    height = ggplot2::rel(2.1)

  ),

)


glyph_data_setup <- function(data, params){

  #Group Aesthetic Needed? Uses and Functionality?

  # x = s_x + a_x * w * t
  # y1 = s_y + a_y * h * z1
  # y2 = s_y + a_y * h * z2
  # s_x and s_y are scaling factors
  a_x = 1
  a_y = 1

  browser()

  x <- data$x_major + a_x * params$width * data$x_minor
  xend <- x
  y <- data$y_major + a_y * params$height * data$y_minor
  yend <- data$y_major + a_y * params$height * data$yend_minor

  data$x <- x
  data$xend <- xend
  data$y <- y
  data$yend <- yend

  browser()

  datetime_class <- c(
    "Date", "yearmonth", "yearweek", "yearquarter","POSIXct", "POSIXlt")
  if (any(class(data$x_minor) %in% datetime_class)){
    data[["x_minor"]] <- as.numeric(data[["x_minor"]])
  }

  #print(data)
  return(data)


}

