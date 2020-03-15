#' Print the library path(s) from .libPaths()
#'
#'
#' @details This is a helper to let me see the different functions offered by a
#'    package. NOTE: The package most be installed & loaded (i.e. library(janitor))
#'
#'
#' @examples
#' library(learylib)
#'
#' see_lib_paths() #prints all library path(s)
#'
#'
#' @export


see_lib_paths <- function(){
  if (length(.libPaths()) > 1) {
    msg <- "Using libraries at paths:\n"
  } else {
    msg <- "Using library at path:\n"
  }
  libs <- paste("-", .libPaths(), collapse = "\n")
  cat(msg, libs, sep = "")
}


