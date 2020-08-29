# Simple script to run my normal build and check process, including updating README and
# Pkgdown files automatically.

devtools::document()
# rmarkdown::render("./README.Rmd", output_format = "github_document") # need to confirm this works as expected
# knitr::knit("./README.Rmd") # need to fix, runs but creates odd ouput in see_pkgs function on readme page
#!!!!!!!!!!!!!!!!!!!! Need to run Readme to make sure up to date !!!!!!!!!!!!!!!!!!!!
pkgdown::build_site()
devtools::check()
