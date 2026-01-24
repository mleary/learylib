test_that("see_pkg_funcs returns functions from base package", {
  result <- see_pkg_funcs(base)
  expect_type(result, "character")
  expect_true(length(result) > 0)
  expect_true("print" %in% result)
})

test_that("see_pkg_funcs returns error message for unloaded package", {
  expect_message(see_pkg_funcs(nonexistentpackage123))
})

test_that("see_pkg_funcs respects all.names argument", {
  result_default <- see_pkg_funcs(base, all.names = FALSE)
  result_all <- see_pkg_funcs(base, all.names = TRUE)
  # When all.names = TRUE, should include names starting with .
  expect_true(length(result_all) >= length(result_default))
})
