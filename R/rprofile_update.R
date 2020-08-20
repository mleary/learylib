#' A function to update my .Rprofile from a version on Github
#'
#'
#' @param open.only logical value. Defaults to opening the local .Rprofile via the
#'    usethis::edit_r_profile.  If False, will update the .Rprofile.
#'
#' @param local.rprofile.path character value.  Path to local .Rprofile.  Defaults to
#'     common "~/.Rprofile".
#' @param url character value. URL to RAW github text file with Rprofile template.
#'     Defaults to my .Rprofile template on github
#'
#' @details This function helps with editing one's .Rprofile.  It will open the
#'     current .Rprofile by default.  If open.only set to FALSE, it updates the .Rprofile
#'     and then opens the .Rprofile.  It defaults to taking a template .Rprofile from my github and updates the
#'     current working sessions .Rprofile.  Note that it checks for the file at
#'     the common "~/.Rprofile" location, but can be manually adjusted
#'     for projects, etc.
#'
#'
#' @examples
#' library(learylib)
#'
#' rprofile_update()  # using default settings
#'
#' @export
#'

rprofile_update <- function(open.only=TRUE,
                            local.rprofile.path = "~/.Rprofile",
                            url = 'https://raw.githubusercontent.com/mleary/dotfiles/main/.Rprofile') {
    if(open.only == TRUE){

      usethis::edit_r_profile()

    } else {

      rprofile <- text_from_github(url = url)

      if(base::file.exists(local.rprofile.path)) {
          base::writeLines(rprofile, local.rprofile.path)
          base::message("Rprofile Updated")
          usethis::edit_r_profile()
      } else {
          base::message("Rprofile not found.  Check you file path for local .Rprofile.")
      }
    }
}



