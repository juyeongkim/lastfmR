# CHART METHODS

#' Get the top artists chart.
#'
#' Get the top artists chart.
#' Implementation of last.fm's \emph{chart.getTopArtists} API method
#' (\url{http://www.last.fm/api/show/chart.getTopArtists})
#'
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @return A list of the top artists chart.
#' @examples
#' \dontrun{
#' chart_getTopArtists()
#' }
#' @export
chart_getTopArtists <- function(limit = NA, page = NA) {
  query <- list(
    method = "chart.getTopArtists",
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}


#' Get the top tags chart.
#'
#' Get the top tags chart.
#' Implementation of last.fm's \emph{chart.getTopTags} API method
#' (\url{http://www.last.fm/api/show/chart.getTopTags})
#'
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @return A list of the top tags chart.
#' @examples
#' \dontrun{
#' chart_getTopTags()
#' }
#' @export
chart_getTopTags <- function(limit = NA, page = NA) {
  query <- list(
    method = "chart.getTopTags",
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}


#' Get the top tracks chart.
#'
#' Get the top tracks chart.
#' Implementation of last.fm's \emph{chart.getTopTracks} API method
#' (\url{http://www.last.fm/api/show/chart.getTopTracks})
#'
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @return A list of the top tracks chart.
#' @examples
#' \dontrun{
#' chart_getTopTracks()
#' }
#' @export
chart_getTopTracks <- function(limit = NA, page = NA) {
  query <- list(
    method = "chart.getTopTracks",
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}
