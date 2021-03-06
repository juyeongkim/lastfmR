# ALBUM METHODS

#' Get the metadata and tracklist for an album.
#'
#' Get the metadata and tracklist for an album on Last.fm using the album name or a musicbrainz id.
#' Implementation of last.fm's \emph{album.getInfo} API method
#' (\url{http://www.last.fm/api/show/album.getInfo})
#'
#' @param artist The artist name.
#' @param album The album name.
#' @param mbid The musicbrainz id for the album.
#' @param autocorrect Transform misspelled artist names into correct artist names,
#' returning the correct version instead.
#' The corrected artist name will be returned in the response. [0|1]
#' @param username The username for the context of the request.
#' If supplied, the user's playcount for this album is included in the response.
#' @param lang The language to return the biography in,
#' expressed as an ISO 639 alpha-2 code.
#' @return A list of the metadata and tracklist for an album.
#' @examples
#' \dontrun{
#' album_getInfo("Father John Misty", "Fear Fun")
#' }
#' @export
album_getInfo <- function(artist, album, mbid = NA, autocorrect = NA, username = NA, lang = NA) {
  query <- list(
    method = "album.getInfo",
    artist = artist,
    album = album,
    mbid = mbid,
    autocorrect = autocorrect,
    username = username,
    lang = lang
  )

  res <- request(query)

  temp_tracks <- list(flatten(res$tracks$track))
  temp_tags <- list(flatten(res$tags$tag))

  res$image <- distinct(res$image, `#text`, .keep_all = TRUE) %>%
    spread(size, `#text`)
  res$tracks <- NA
  res$tags <- NA

  res <- as.data.frame(res, stringsAsFactors = FALSE)
  res$tracks <- temp_tracks
  res$tags <- temp_tags

  res
}


#' Get the tags applied by an user to an album.
#'
#' Get the tags applied by an user to an album on Last.fm.
#' To retrieve the list of top tags applied to an album by all users use
#' \code{\link{album_getTopTags}}.
#' Implementation of last.fm's \emph{album.getTags} API method
#' (\url{http://www.last.fm/api/show/album.getTags})
#'
#' @param artist The artist name.
#' @param album The album name.
#' @param user The user name for the context of the request.
#' @param mbid The musicbrainz id for the album.
#' @param autocorrect Transform misspelled artist names into correct artist names,
#' returning the correct version instead.
#' The corrected artist name will be returned in the response. [0|1]
#' If supplied, the user's playcount for this album is included in the response.
#' @return A list of the tags applied by an user to an album.
#' @examples
#' \dontrun{
#' album_getTags("Sufjan Stevens", "Carrie & Lowell", "platyjus")
#' }
#' @export
album_getTags <- function(artist, album, user, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "album.getTags",
    artist = artist,
    album = album,
    user = user,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  process_df(res)
}


#' Get the top tags for an album, ordered by popularity.
#'
#' Get the top tags for an album on Last.fm, ordered by popularity.
#' Implementation of last.fm's \emph{album.getTopTags} API method
#' (\url{http://www.last.fm/api/show/album.getTopTags})
#'
#' @param artist The artist name.
#' @param album The album name.
#' @param mbid The musicbrainz id for the album.
#' @param autocorrect Transform misspelled artist names into correct artist names,
#' returning the correct version instead.
#' The corrected artist name will be returned in the response. [0|1]
#' @return A list of the top tags for an album.
#' @examples
#' \dontrun{
#' album_getTopTags("Miles Davis", "Kind of Blue")
#' }
#' @export
album_getTopTags <- function(artist, album, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "album.getTopTags",
    artist = artist,
    album = album,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  process_geo(res)
}


#' Search for an album by name.
#'
#' Search for an album by name. Returns album matches sorted by relevance.
#' Implementation of last.fm's \emph{album.search} API method
#' (\url{http://www.last.fm/api/show/album.search})
#'
#' @param album The album name.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number you wish to scan to.
#' @return A list of the searched albums.
#' @examples
#' \dontrun{
#' album_search("Rhythm & Reason")
#' }
#' @export
album_search <- function(album, limit = NA, page = NA) {
  query <- list(
    method = "album.search",
    album = album,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_search(res)
}
