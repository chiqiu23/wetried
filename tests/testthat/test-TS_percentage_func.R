testthat::test_that("Calculate TS percentage", {
  expect_equal(TS_percentage(input_player = "Bondi, Lauren", input_season = "2018-19"), (100 * (538/((2 * 429) + (0.88 * 116)))))
})

