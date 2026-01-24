test_that("see_lib_paths runs without error", {
  expect_output(see_lib_paths())
})

test_that("see_lib_paths outputs library path information", {
  output <- capture.output(see_lib_paths())
  expect_true(length(output) > 0)
  expect_true(any(grepl("library|path", output, ignore.case = TRUE)))
})
