#' A function to clear my .Rprofile
#'
#' @param local_rprofile_path character value.  Path to local .Rprofile.  Defaults to
#'     common "~/.Rprofile".
#'
#' @details This function takes an existing Rprofile file and deletes the text.
#'     Note that it checks for the file at the common "~/.Rprofile" location, but can be
#'     manually adjusted for projects, etc.
#'
#' @examples
#' library(learylib)
#'
#' rprofile_clear()  # using default settings
#'
#' @export
#'

rprofile_clear <- function(local_rprofile_path = "~/.Rprofile") {
    if(file.exists(local_rprofile_path)) {
      writeLines("", local_rprofile_path)
      message("Rprofile cleared")
    } else {
      message("Rprofile not found.  Check your file path for local .Rprofile.")
    }
}


