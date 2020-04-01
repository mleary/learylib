
<!-- README.md is generated from README.Rmd. Please edit that file -->

## learylib <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/mleary/learylib.svg?branch=master)](https://travis-ci.org/mleary/learylib)
<!-- badges: end -->

The goal of **learylib** is to easily manage a few personal functions
and themes I find useful. A secondary goal is to explore package
development in R, using **pkgdown**, **usethis**, & **devtools** to
practice fully building out a package.

## Installation

You can install the latest version of learylib from my Github with the
**devtools** package. Given the limited scope & use of **learylib**, it
will always live on Github.

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
#> [1] "leary_html"      "not_in"          "see_lib_paths"   "see_pkg_funcs"  
#> [5] "theme_leary"     "update_rprofile"
```

## Resources used

Shout out to Hadley Wickham, Jenny Bryan, Jim Hester, and the many other
developers building R packages that help people build R packages. I
would not have gotten this far without those tools to make the process
simple. I created the initial version of this package in a matter of
days, with limited experience in package development. If I can do it,
others can as well. And it was fun\! In case anyone sees this who is
considering building their own package, here are some resources I found
helpful. Also for me when I forget where I found something.

  - [R packages](%22http://r-pkgs.had.co.nz%22) by Hadley Wickham - He
    wrote the book on writing R packages (literally)

  - R Package Documentation (built with `pkgdown`)
    
      - [usethis](https://usethis.r-lib.org) for package development.
      - [devtools](https://devtools.r-lib.org) for package development.
      - [pkgdown](https://pkgdown.r-lib.org) easily create a website for
        your package & documentation

  - Blogs
    
      - [Writing an R package
        fromScratch](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)
        by Hilary Parker - Great resource I have gone back to many
        times. Helped me greatly the first time I looked into package
        development and I still Google to find this exact blog.

## Contributions

I can’t imagine why anyone would contribute to this, but hey it would be
cool if you did\! Feel free to submit a pull request or contact me if
you want to add something.
