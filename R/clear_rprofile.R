#' A function to update my .Rprofile from a version on Github
#'
#' @param local.rprofile.path character value.  Path to local .Rprofile.  Defaults to
#'     common "~/.Rprofile".
#'
#' @details This function takes an existing Rprofile file and deletes any cusomization.
#'     Note that it checks for the file at the common "~/.Rprofile" location, but can be
#'     manually adjusted for projects, etc.
#'
#' @examples
#' library(learylib)
#'
#' clear_rprofile()  # using default settings
#'
#' @export
#'

clear_rprofile <- function(local.rprofile.path = "~/.Rprofile") {
    if(file.exists(local.rprofile.path)) {
      writeLines("", local.rprofile.path)
      message("Rprofile cleared")
    } else {
      message("Rprofile not found.  Check you file path for local .Rprofile.")
    }
}


