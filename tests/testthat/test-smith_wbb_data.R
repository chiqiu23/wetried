testthat::test_that("count number of rows", {
  expect_equal(nrow(smith_wbb_data), 153)
})

testthat::test_that("Number of columns", {
  expect_equal(ncol(smith_wbb_data), 27)
})

