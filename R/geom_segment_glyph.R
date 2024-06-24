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
  },

  draw_panel = function(data, panel_params, coord, ...) {
    ggplot2:::GeomPath$draw_panel(data, panel_params, coord, ...)
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

  # x = s_x + a_x * w * t
  # y1 = s_y + a_y * h * z1
  # y2 = s_y + a_y * h * z2
  # s_x and s_y are scaling factors
  a_x = 1
  a_y = 1

  x <- data$x_major + a_x * data$x_minor * params$width
  y1 <- data$y_major + a_y * data$y_minor * params$height
  y2 <- data$y_major + a_y * data$yend_minor * params$height

  datetime_class <- c(
    "Date", "yearmonth", "yearweek", "yearquarter","POSIXct", "POSIXlt")
  if (any(class(data$x_minor) %in% datetime_class)){
    data[["x_minor"]] <- as.numeric(data[["x_minor"]])
  }

  data |> dplyr::ungroup()


}

