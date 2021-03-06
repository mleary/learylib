
<!-- README.md is generated from README.Rmd. Please edit that file -->

## learylib <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/mleary/learylib/workflows/R-CMD-check/badge.svg)](https://github.com/mleary/learylib/actions)
<!-- badges: end -->

The goal of **learylib** is to easily manage a few personal functions I
find useful. A secondary goal is to explore package development in R,
using **pkgdown**, **usethis**, & **devtools** to practice fully
building out a package.

## Installation

You can install the latest version of learylib from my Github repo with
the **devtools** package. Given the limited scope & use of **learylib**,
it will always live on Github.

``` r
install.packages("devtools")
devtools::install_github("mleary/learylib")
```

## Usage

Using `theme_leary` with the `mtcars` dataset.

``` r
library(learylib)
library(ggplot2)
## basic example code

ggplot(mtcars, aes(wt, mpg)) +
     geom_point() +
     labs(title = "A basic example plot",
          subtitle = "A little more detail in subtitle?") +
     theme_leary()
```

<img src="man/figures/README-example1-1.png" width="70%" />

Using `see_pkg_funcs` to see all the functions within a package.

``` r
library(learylib)

see_pkg_funcs(learylib)
#> [1] "copy_to_clipboard" "not_in"            "not_na"           
#> [4] "rprofile_clear"    "rprofile_update"   "search_last_error"
#> [7] "see_lib_paths"     "see_pkg_funcs"     "theme_leary"
```

## Contributions

I can’t imagine why anyone would contribute to this, but hey it would be
cool if you did\! Feel free to submit a pull request or contact me if
you want to add something.

## To do items

  - Create a xarignan presentation template
  - Create Rmarkdown template
  - Clean up ggplot theme, maybe create a color palette
  - Explore pkgdown, usethis, etc., for additional capabilities
  - Learn about package builds and checks | confirm how to make sure
    README.md is updated from README.RMD, pkgdown docs are updated, etc.
  - Add unit tests
