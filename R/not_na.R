#' Determine if value(s) are NOT in another value or set.
#'
#' @param x single value or vector
#'
#' @details This is a helper function to check for NOT NA.  This is mainly
#'     to hel me quickly check without having to negate 'is.na' with '!is.na(x)'.
#'     This is a test to see if this function is helpful, and might be deleted
#'     later on.
#'
#' @examples
#' library(learylib)
#'
#' x <- c(1,2,3,NA)
#'
#' not_na(x)
#'
#' @export

not_na <- function(x){
  !is.na(x)
}
