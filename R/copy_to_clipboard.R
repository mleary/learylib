#' Copy a data frame to the clipboard
#'
#' @param data data.frame. Data frame to be copied to the clipboard
#' @param row_names logical. Should row names be included in the output.
#'     Defaults to FALSE.
#'
#' @details This function takes a data frame and copies it to the computer clipboard,
#'     allowing the user to paste the data into Excel, Word, email, etc.
#'
#' @examples
#' library(learylib)
#'
#' copy_to_clipboard(mtcars)
#'
#' @export

copy_to_clipboard <- function(data, row_names = FALSE){
  if (!requireNamespace("clipr", quietly = TRUE)) {
    stop("Package 'clipr' is required for copy_to_clipboard(). Install it with: install.packages('clipr')")
  }
  
  clipr::write_clip(data, row.names = row_names)
}
