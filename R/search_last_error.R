#' Google search R error messages
#'
#'
#' @param additonal.term character. Additional text to add to Google search after "R".

#' @details This function takes the last error in my R session and Googles it
#'     for an answer. 93.4% of the time this will be to remember something I
#'     have done in `{ggplot2}` 1,573 times before but forgot.  For example,
#'     adding "ggplot" will search 'R, ggplot, {error message here}'. Heavily
#'     borrowed from & influenced from David Robinson's github.
#'
#' @examples
#' library(learylib)
#'
#' search_last_error("ggplot")
#'
#' @export

search_last_error <- function(additonal.term = NULL){
  last.error <- base::geterrmessage()
  if(is.null(last.error)) {
    stop("Can't find any error message. Well done not screwing up!")
  }

  if(!is.null(additonal.term)){
    additonal.term <- paste0(additonal.term, ",")
  }

  utils::browseURL(
    base::paste0("https://www.google.com/search?q=R,", additonal.term, last.error)
  )
}
