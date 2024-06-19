#' @import ggplot2
#' @import dplyr
#' @export

#' @title GeomSegmentGlyph
#' @return description

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
  data <- data %>%
    dplyr::mutate(
      x_minor = x_scale(.data$x_minor)
    )
  data
}

