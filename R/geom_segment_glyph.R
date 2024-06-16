#' @import ggplot2
#' @import dplyr
#' @export

#' @title GeomSegmentGlyph
#' @return description

GeomSegmentGlyph <- ggproto("GeomSegmentGlyph", GeomSegment,
                             default_aes = aes(
                               colour = "black",
                               fill = NA,
                               linewidth = 0.5,
                               linetype = 1,
                               alpha = NA
                             )
)

geom_chull <- function(mapping = NULL, data = NULL, stat = "chull",
                       position = "identity", na.rm = FALSE,
                       show.legend = NA, inherit.aes = TRUE, ...) {
  layer(
    geom = GeomSegmentGlyph,
    data = data,
    mapping = mapping,
    stat = stat,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
