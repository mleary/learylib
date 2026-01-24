#' Google search R error messages
#'
#'
#' @param additional_term character. Additional text to add to Google search after "R".

#' @details This function takes the last error in my R session and creates a Google search
#'     for an answer. 93 percent of the time this will be to remember something I
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

search_last_error <- function(additional_term = NULL){
  last_error <- geterrmessage()
  if(is.null(last_error)) {
    stop("Can't find any error message. Well done not screwing up!")
  }

  if(!is.null(additional_term)){
    additional_term <- paste0(additional_term, ",")
  }

  utils::browseURL(
    paste0("https://www.google.com/search?q=R,", additional_term, last_error)
  )
}
