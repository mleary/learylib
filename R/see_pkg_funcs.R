#' Print functions within a package
#'
#' @param package R package to inspect
#' @param all.names  logical value. If TRUE, all object names are returned.
#'     If FALSE, names which begin with a . are omitted.

#' @details This is a helper to let me see the different functions offered by a
#'    package. NOTE: The package most be installed & loaded (i.e. library(janitor))
#'
#'@examples
#' library(learylib)
#'
#' see_pkg_funcs(learylib)
#'
#' @export


see_pkg_funcs <-function(package, all.names = FALSE){
  package <- deparse(substitute(package))
  tryCatch(
    ls(
      pos = paste("package", package, sep = ":"),
      all.names = all.names
    ),
  error = function(e) message(paste("Error:  Is the", package, "packge installed/loaded?"))
  )
}


