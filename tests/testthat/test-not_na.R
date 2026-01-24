test_that("not_na returns TRUE for non-NA values", {
  expect_true(not_na(1))
  expect_true(not_na("text"))
  expect_true(not_na(TRUE))
})

test_that("not_na returns FALSE for NA values", {
  expect_false(not_na(NA))
  expect_false(not_na(NA_integer_))
  expect_false(not_na(NA_character_))
})

test_that("not_na works with vectors", {
  result <- not_na(c(1, NA, 3, NA))
  expect_equal(result, c(TRUE, FALSE, TRUE, FALSE))
})

test_that("not_na handles empty vectors", {
  expect_equal(not_na(numeric(0)), logical(0))
})
