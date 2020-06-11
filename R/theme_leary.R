#' Minimal ggplot2 theme
#'
#' @param base_size base font size
#' @param ... Other arguments passed to \code{theme_leary}
#'
#' @importFrom ggplot2 element_text rel
#'
#' @details This is a draft version and will be updated as I improve my package
#'     development skills.  It does not currently match the Roboto font used in
#'     my rmarkdown template (leary_html), but currently uses Helvetica font.
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mtcars, aes(wt, mpg)) +
#'     geom_point() +
#'     labs(title = "A basic example plot",
#'          subtitle = "A little more detail in substitle?") +
#'     theme_leary()
#'
#'
#' @export

theme_leary <- function(base_size = 12, ...){
  plot.out <-
    ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(plot.title = element_text(size = rel(2.0),
                                             hjust = 0),
                   plot.subtitle = element_text(size = rel(1.25),
                                                hjust = 0),
                   axis.title = element_text(size = rel(1.45)),
                   axis.text  = element_text(size = rel(1.10))
    )
  return(plot.out)
}
