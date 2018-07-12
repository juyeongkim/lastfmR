context("geo.R")

countries <- c("Iceland", "Nigeria", "Cook Islands", "Korea, Republic of")

test_geo <- function(country) {
  test_that("`geo_getTopArtists` works", {
    res <- geo_getTopArtists(country)

    expect_is(res, "data.frame")
  })

  test_that("`geo_getTopTracks` works", {
    res <- geo_getTopTracks(country)

    expect_is(res, "data.frame")
  })
}

purrr::walk(countries, test_geo)
