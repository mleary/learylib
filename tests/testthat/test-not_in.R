test_that("not_in returns TRUE when value is not in set", {
  expect_true(not_in("test", c("quiz", "homework")))
  expect_true(not_in(1, c(2, 3, 4)))
  expect_true(not_in("a", c("b", "c")))
})

test_that("not_in returns FALSE when value is in set", {
  expect_false(not_in("test", c("quiz", "test")))
  expect_false(not_in(1, c(1, 2, 3)))
  expect_false(not_in("a", c("a", "b")))
})

test_that("not_in works with vectors", {
  result <- not_in(c(1, 2, 3), c(2, 4))
  expect_equal(result, c(TRUE, FALSE, TRUE))
})

test_that("not_in handles NA values", {
  expect_true(not_in(NA, c(1, 2, 3)))
  expect_true(is.na(not_in(NA, c(NA, 1, 2))))
})
