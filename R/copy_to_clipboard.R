#' A function to update my .Rprofile from a version on Github
#'
#' @param data.input data.frame. Data frame desired to by moved outside of R
#' @param row.names.input logical. Should row names be included in in the output
#'     data frame.  Defaults to FALSE.
#'
#' @details This function takes a data frame and copies it to the computer clipboard,
#'     allowing user to paste the data into excel, word, email, etc.
#'
#' @examples
#' library(learylib)
#'
#' copy_to_clipboard(mtcars)
#'
#' @export

copy_to_clipboard <- function(data.input, row.names.input = FALSE){
  utils::write.table(data.input,
              file = paste0("clipboard-", utils::object.size(data.input)),
              sep="\t",
              row.names = row.names.input)
}
