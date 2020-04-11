#' Minimal ggplot2 theme
#'
#' @param base_size base font size
#' @param base_family base font family
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

theme_leary <- function(base_size = 12,
                        base_family = "Helvetica",
                        ...){
  plot.out <-
    ggplot2::theme_minimal(base_size = base_size, base_family=base_family) +
    ggplot2::theme(title = element_text(colour = "#132257"),
                   plot.title = element_text(size = rel(2.0),
                                             hjust = 0,
                                             face = "bold"),
                   plot.subtitle = element_text(size = rel(1.25),
                                                hjust = 0,
                                                face = "bold"),
                   axis.title = element_text(size = rel(1.45),
                                             face = "bold"),
                   axis.text  = element_text(size = rel(1.10),
                                             face= "bold",
                                             color = "#132257")
    )
  return(plot.out)
}
