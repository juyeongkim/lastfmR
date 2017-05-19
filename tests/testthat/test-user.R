context("user.R")

test_that("user_getInfo", {
  expect_equal(user_getInfo("platyjus")$name, "platyjus")
})
