# GEO METHODS

#' Get the most popular artists on Last.fm by country.
#'
#' Get the most popular artists on Last.fm by country.
#' Implementation of last.fm's \emph{geo.getTopArtists}
#' API method (\url{http://www.last.fm/api/show/geo.getTopArtists})
#'
#' @param country A country name, as defined by the ISO 3166-1 country names standard.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page TThe page number to fetch. Defaults to first page.
#' @return A list of the artists.
#' @examples
#' \dontrun{
#' geo_getTopArtists("Iceland")
#' }
#' @export
geo_getTopArtists <- function(country, limit = NA, page = NA) {
  query <- list(
    method = "geo.getTopArtists",
    country = country,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}


#' Get the most popular tracks on Last.fm last week by country.
#'
#' Get the most popular tracks on Last.fm last week by country.
#' Implementation of last.fm's \emph{geo.getTopTracks}
#' API method (\url{http://www.last.fm/api/show/geo.getTopTracks})
#'
#' @param country A country name, as defined by the ISO 3166-1 country names standard.
#' @param location A metro name, to fetch the charts for
#' (must be within the country specified)
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page TThe page number to fetch. Defaults to first page.
#' @return A list of the tracks.
#' @examples
#' \dontrun{
#' geo_getTopTracks("Nigeria")
#' }
#' @export
geo_getTopTracks <- function(country, location = NA, limit = NA, page = NA) {
  query <- list(
    method = "geo.getTopTracks",
    country = country,
    location = location,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}
