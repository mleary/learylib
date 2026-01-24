#' A function to update my .Rprofile from a version on Github
#'
#'
#' @param open_only logical value. Defaults to opening the local .Rprofile via the
#'    usethis::edit_r_profile.  If False, will update the .Rprofile.
#'
#' @param local_rprofile_path character value.  Path to local .Rprofile.  Defaults to
#'     common "~/.Rprofile".
#' @param url character value. URL to RAW github text file with Rprofile template.
#'     Defaults to my .Rprofile template on github
#'
#' @details This function helps with editing one's .Rprofile.  It will open the
#'     current .Rprofile by default.  If open_only set to FALSE, it updates the .Rprofile
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

rprofile_update <- function(open_only = TRUE,
                            local_rprofile_path = "~/.Rprofile",
                            url = 'https://raw.githubusercontent.com/mleary/dotfiles/main/.Rprofile') {
    if(open_only == TRUE){

      usethis::edit_r_profile()

    } else {

      rprofile <- text_from_github(url = url)

      if(file.exists(local_rprofile_path)) {
          writeLines(rprofile, local_rprofile_path)
          message("Rprofile Updated")
          usethis::edit_r_profile()
      } else {
          message("Rprofile not found.  Check your file path for local .Rprofile.")
      }
    }
}



