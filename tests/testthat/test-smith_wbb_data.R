testthat::test_that("count number of rows", {
  expect_equal(nrow(smith_wbb_data), 153)
})
