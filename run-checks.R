# Simple script to run my normal build and check process, including updating README and
# Pkgdown files automatically.

devtools::document()
rmarkdown::render("./README.Rmd", output_format = "github_document") # need to confirm this works as expected
pkgdown::build_site()
devtools::check()
