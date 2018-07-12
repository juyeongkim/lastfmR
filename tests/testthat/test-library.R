context("library.R")

users <- c("platyjus", "slothsonian")

test_library <- function(user) {
  test_that("`library_getArtists` works", {
    res <- library_getArtists(user)

    expect_is(res, "data.frame")
  })
}

purrr::walk(users, test_library)
