#' Personalized rmarkdow::html_document template
#'
#' @param toc if TRUE, displays the table of contents
#' @param ... additional arguments provided to \@code{html_document}
#'
#' @export

leary_html = function(toc = TRUE, ...) {

  # locations of resource files in the package
  .pkg_resource <- function(...) {
    base::system.file(..., package = "learylib")
  }

  css    = .pkg_resource("rmarkdown/templates/leary_html/skeleton/styles.css")
  header =  .pkg_resource("rmarkdown/templates/leary_html/skeleton/header.html")
  footer =  .pkg_resource("rmarkdown/templates/leary_html/skeleton/footer.html")

  # call gte base html_document function and adjust
  rmarkdown::html_document(
    toc = toc,
    toc_float = TRUE,
    code_folding = "hide",
    df_print = "paged",
    self_contained = TRUE,
    css = css,
    includes = rmarkdown::includes(before_body = header,
                                    after_body = footer),
    ...
  )
}
