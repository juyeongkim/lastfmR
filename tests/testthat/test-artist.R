context("artist.R")

artists <- c("Olafur Arnalds", "Wye Oak", "Moses Sumney", "Hey Marseilles", "Andrew Bird", "SZA", "The Suffers", "Helado Negro")
user <- "platyjus"

test_that("`artist_getCorrection` works", {
  res <- artist_getCorrection(artists[1])

  expect_is(res, "data.frame")
})

test_that("`artist_getInfo` works", {
  res <- artist_getInfo(artists[2])

  expect_is(res, "data.frame")
})

test_that("`artist_getSimilar` works", {
  res <- artist_getSimilar(artists[3])

  expect_is(res, "data.frame")
})

test_that("`artist_getTags` works", {
  res <- artist_getTags(artists[4], user)

  expect_is(res, "data.frame")
})

test_that("`artist_getTopAlbums` works", {
  res <- artist_getTopAlbums(artists[5])

  expect_is(res, "data.frame")
})

test_that("`artist_getTopTags` works", {
  res <- artist_getTopTags(artists[6])

  expect_is(res, "data.frame")
})

test_that("`artist_getTopTracks` works", {
  res <- artist_getTopTracks(artists[7])

  expect_is(res, "data.frame")
})

test_that("`artist_search` works", {
  res <- artist_search(artists[8])

  expect_is(res, "data.frame")
})

