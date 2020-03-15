
<!-- README.md is generated from README.Rmd. Please edit that file -->

## learylib <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/mleary/learylib.svg?branch=master)](https://travis-ci.org/mleary/learylib)
<!-- badges: end -->

The goal of **learylib** is to easily manage a few custom functions and
themes I find useful. A secondary goal is to explore package development
in R. This is why I am going overboard and exploring the use of
**pkgdown**, **usethis**, & **devtools** for more complex package
development.

## Installation

You can install the latest version of learylib from my Github with the
**devtools** package. Given the limited scope & use of **learylib**, it
will always live on Github.

``` r
install.packages("devtools")
devtools::install_github("https://github.com/mleary/learylib")
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
          subtitle = "A little more detail in substitle?") +
     theme_leary()
```

<img src="man/figures/README-example 1-1.png" width="70%" />

Using `see_pkg_funcs` to see all the functions within a package.

``` r
library(learylib)

see_pkg_funcs(learylib)
#> [1] "leary_html"         "leary_presentation" "not_in"            
#> [4] "see_lib_paths"      "see_pkg_funcs"      "theme_leary"
```

## Contributions

I can’t imagine why anyone would contribute to this, but hey it would be
cool if you did\! Feel free to submit a pull request or contact me if
you want to add something.
