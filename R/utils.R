#' A function to read text from github (or really any site)
#'
#' @param url URL to RAW github text file
#'
#' @details This is a helper function for geting text files from my Githb repo.
#'     It is currently used in the update_rprofile function and could be used in
#'     future functions such as update_gitignore.
#'


text_from_github <- function(url){
  github.text <- readr::read_file(url)
  return(github.text)
}
