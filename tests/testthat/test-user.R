context("user.R")

users <- c("platyjus", "slothsonian")

test_user <- function(user, artist) {
  test_that("`user_getFriends` works", {
    res <- user_getFriends(user)

    expect_is(res, "data.frame")
  })

  test_that("`user_getInfo` works", {
    res <- user_getInfo(user)

    expect_is(res, "data.frame")
    expect_equal(res$name, user)
  })

  test_that("`user_getLovedTracks` works", {
    res <- user_getLovedTracks(user)

    expect_is(res, "data.frame")
  })

  test_that("`user_getPersonalTags` works", {
    res <- user_getPersonalTags(user, "indie", "artist")

    expect_is(res, "data.frame")
  })

  test_that("`user_getRecentTracks` works", {
    res <- user_getRecentTracks(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getTopAlbums` works", {
    res <- user_getTopAlbums(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getTopArtists` works", {
    res <- user_getTopArtists(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getTopTags` works", {
    res <- user_getTopTags(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getTopTracks` works", {
    res <- user_getTopTracks(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getWeeklyAlbumChart` works", {
    res <- user_getWeeklyAlbumChart(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getWeeklyArtistChart` works", {
    res <- user_getWeeklyArtistChart(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getWeeklyChartList` works", {
    res <- user_getWeeklyChartList(user)

    expect_is(res, "data.frame")

  })

  test_that("`user_getWeeklyTrackChart` works", {
    res <- user_getWeeklyTrackChart(user)

    expect_is(res, "data.frame")

  })
}

purrr::walk(users, test_user)
