test_that("theme_leary returns a ggplot2 theme object", {
  theme <- theme_leary()
  expect_s3_class(theme, "theme")
  expect_s3_class(theme, "gg")
})

test_that("theme_leary respects base_size argument", {
  theme_small <- theme_leary(base_size = 8)
  theme_large <- theme_leary(base_size = 16)
  expect_s3_class(theme_small, "theme")
  expect_s3_class(theme_large, "theme")
})

test_that("theme_leary can be added to a ggplot", {
  skip_if_not_installed("ggplot2")
  p <- ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg)) +
    ggplot2::geom_point() +
    theme_leary()
  expect_s3_class(p, "ggplot")
})
