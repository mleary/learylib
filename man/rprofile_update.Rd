% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rprofile_update.R
\name{rprofile_update}
\alias{rprofile_update}
\title{A function to update my .Rprofile from a version on Github}
\usage{
rprofile_update(
  open.only = TRUE,
  local.rprofile.path = "~/.Rprofile",
  url = "https://raw.githubusercontent.com/mleary/dotfiles/main/.Rprofile"
)
}
\arguments{
\item{open.only}{logical value. Defaults to opening the local .Rprofile via the
usethis::edit_r_profile.  If False, will update the .Rprofile.}

\item{local.rprofile.path}{character value.  Path to local .Rprofile.  Defaults to
common "~/.Rprofile".}

\item{url}{character value. URL to RAW github text file with Rprofile template.
Defaults to my .Rprofile template on github}
}
\description{
A function to update my .Rprofile from a version on Github
}
\details{
This function helps with editing one's .Rprofile.  It will open the
    current .Rprofile by default.  If open.only set to FALSE, it updates the .Rprofile
    and then opens the .Rprofile.  It defaults to taking a template .Rprofile from my github and updates the
    current working sessions .Rprofile.  Note that it checks for the file at
    the common "~/.Rprofile" location, but can be manually adjusted
    for projects, etc.
}
\examples{
library(learylib)

rprofile_update()  # using default settings

}
