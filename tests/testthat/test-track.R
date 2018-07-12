context("track.R")

user <- c("platyjus", "slothsonian")
tracks <- data.frame(
  track = c("King Kunta", "DNA", "Depreston"),
  artist = c("Kendrick Lamar", "Kendrick Lamar", "Courtney Barnett"),
  stringsAsFactors = FALSE
)

test_that("`track_getCorrection` works", {
  res <- track_getCorrection("Mrbrownstone", "guns and roses")

  expect_is(res, "data.frame")
})

test_that("`track_getInfo` works", {
  res <- track_getInfo(tracks$track[1], tracks$artist[1])

  expect_is(res, "data.frame")

  res <- purrr::pmap_df(tracks, track_getInfo)
  expect_is(res, "data.frame")
  expect_equal(nrow(res), 3)
})

test_that("`track_getSimilar` works", {
  res <- track_getSimilar(tracks$track[1], tracks$artist[1])

  expect_is(res, "data.frame")
})

test_that("`track_getTags` works", {
  res <- track_getTags(tracks$track[1], tracks$artist[1], user[1])

  expect_is(res, "data.frame")
})

test_that("`track_getTopTags` works", {
  res <- track_getTopTags(tracks$track[1], tracks$artist[1])

  expect_is(res, "data.frame")
})

test_that("`track_search` works", {
  res <- track_search(tracks$track[1])

  expect_is(res, "data.frame")
})
