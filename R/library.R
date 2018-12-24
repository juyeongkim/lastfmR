# LIBRARY METHODS

#' Get a list of the artists in a user's library.
#'
#' A paginated list of all the artists in a user's library,
#' with play counts and tag counts.
#' Implementation of last.fm's \emph{library.getArtists} API method
#' (\url{http://www.last.fm/api/show/library.getArtists})
#'
#' @param user The user whose library you want to fetch.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number you wish to scan to.
#' @return A list of the artists.
#' @examples
#' \dontrun{
#' library_getArtists("platyjus")
#' }
#' @export
library_getArtists <- function(user, limit = NA, page = NA) {
  query <- list(
    method = "library.getArtists",
    user = user,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_geo(res)
}
