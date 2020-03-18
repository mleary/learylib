#' A function to update my .Rprofile from a version on Github
#'
#' @param local.rprofile.path character value.  Path to local .Rprofile.  Defaults to
#'     commmon "~/.Rprofile".
#' @param url character value. URL to RAW github text file with Rprofile template
#'
#' @details This function takes a template Rprofile text file on Github
#'     (really, this could be URL to a valid file, but Github seems most logical)
#'     and updates the current working sessions .Rprofile.  Note that it checks
#'     for the file at the common "~/.Rprofile" location, but can be manually adjusted
#'     for projects, etc.
#'
#'
#' @examples
#' library(learylib)
#'
#' update_rprofile()  # using default settings
#'
#' @export
#'


update_rprofile <- function(local.rprofile.path = "~/.Rprofile",
  url = 'https://raw.githubusercontent.com/mleary/dotfiles/master/.Rprofile'){
    rprofile <- text_from_github(url = url)

    if(file.exists(local.rprofile.path)) {
      writeLines(rprofile, local.rprofile.path)
      message("Rprofile Updated")
    } else {
      message("Rprofile not found.  Check you file path for local .Rprofile.")
    }
}


