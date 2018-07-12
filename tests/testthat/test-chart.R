context("chart.R")

test_that("`chart_getTopArtists` works", {
  res <- chart_getTopArtists()

  expect_is(res, "data.frame")
})

test_that("`chart_getTopTags` works", {
  res <- chart_getTopTags()

  expect_is(res, "data.frame")
})

test_that("`chart_getTopTracks` works", {
  res <- chart_getTopTracks()

  expect_is(res, "data.frame")
})
