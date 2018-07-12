context("album.R")

test_that("`album_getInfo` works", {
  res <- album_getInfo("Father John Misty", "Fear Fun")

  expect_is(res, "data.frame")
})

test_that("`album_getTags` works", {
  res <- album_getTags("Sufjan Stevens", "Carrie & Lowell", "platyjus")

  expect_is(res, "data.frame")
})

test_that("`album_getTopTags` works", {
  res <- album_getTopTags("Miles Davis", "Kind of Blue")

  expect_is(res, "data.frame")
})

test_that("`album_search` works", {
  res <- album_search("Rhythm & Reason")

  expect_is(res, "data.frame")
})
