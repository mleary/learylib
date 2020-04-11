#' Determine if value(s) are NOT in another value or set.
#'
#' @param x single value or vector
#' @param y single value or vector
#'
#' @details This is a helper function to see if values are NOT IN other values.
#'     Mainly this helps me quickly check without having to negate the %in% function.
#'     This is a test to see if this function is helpful, and might be deleted.
#'     later on.
#'
#' @examples
#' library(learylib)
#' library(dplyr)
#'
#' "test" %>% not_in(c("quiz", "homework"))
#'
#' "test" %>% not_in(c("quiz", "test"))
#'
#' @export

not_in <- function(x, y){
  !(x %in% y)
}
