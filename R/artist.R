# ARTIST METHODS

#' Get corrections of an artist name.
#'
#' Use the last.fm corrections data to check whether the supplied artist has a
#' correction to a canonical artist.
#' Implementation of last.fm's \emph{artist.getCorrection} API method
#' (\url{http://www.last.fm/api/show/artist.getCorrection})
#'
#' @param artist The artist name.
#' @return A list of corrections.
#' @examples
#' \dontrun{
#' artist_getCorrection("guns and roses")
#' }
#' @export
artist_getCorrection <- function(artist) {
  query <- list(
    method = "artist.getCorrection",
    artist = artist
  )

  res <- request(query)

  process_correction(res)
}

#' Get info of an artist.
#'
#' Get the metadata for an artist. Includes biography, truncated at 300 characters.
#' Implementation of last.fm's \emph{artist.getInfo} API method
#' (\url{http://www.last.fm/api/show/artist.getInfo})
#'
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the artist
#' @param lang The language to return the biography in, expressed as an ISO 639
#' alpha-2 code.
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @param username The username for the context of the request. If supplied,
#' the user's playcount for this artist is included in the response.
#' @return A list of artist info.
#' @examples
#' \dontrun{
#' artist_getInfo("Wye Oak")
#' }
#' @export
artist_getInfo <- function(artist, mbid = NA, lang = NA, autocorrect = NA, username = NA) {
  query <- list(
    method = "artist.getInfo",
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    username = username,
    lang = lang
  )

  res <- request(query)

  temp_similar <- list_flatten(res$similar$artist)
  temp_tags <- list_flatten(res$tags$tag)

  res$image <- tidy_image(res$image)
  res$similar <- NA
  res$tags <- NA

  res <- as.data.frame(res, stringsAsFactors = FALSE)
  res$similar <- temp_similar
  res$tags <- temp_tags

  res
}


#' Get all the artists similar to this artist.
#'
#' Get all the artists similar to this artist.
#' Implementation of last.fm's \emph{artist.getSimilar} API method
#' (\url{http://www.last.fm/api/show/artist.getSimilar})
#'
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the artist.
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @param limit Limit the number of similar artists returned.
#' @return A list of artists.
#' @examples
#' \dontrun{
#' artist_getSimilar("Moses Sumney")
#' }
#' @export
artist_getSimilar <- function(artist, mbid = NA, autocorrect = NA, limit = NA) {
  query <- list(
    method = "artist.getSimilar",
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    limit = limit
  )

  res <- request(query)

  process_geo(res)
}


#' Get the tags applied by an individual user to an artist.
#'
#' Get the tags applied by an individual user to an artist on Last.fm.
#' Implementation of last.fm's \emph{artist.getTags} API method
#' (\url{http://www.last.fm/api/show/artist.getTags})
#'
#' @param artist The artist name.
#' @param user Username.
#' @param mbid The musicbrainz id for the artist.
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @return A list of tags.
#' @examples
#' \dontrun{
#' artist_getTags("Hey Marseilles", "platyjus")
#' }
#' @export
artist_getTags <- function(artist, user, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "artist.getTags",
    artist = artist,
    user = user,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  process_df(res)
}


#' Get the top albums for an artist.
#'
#' Get the top albums for an artist on Last.fm, ordered by popularity.
#' Implementation of last.fm's \emph{artist.getTopAlbums} API method
#' (\url{http://www.last.fm/api/show/artist.getTopAlbums})
#'
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the artist.
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @param page The page number to fetch. Defaults to first page.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @return A list of albums.
#' @examples
#' \dontrun{
#' artist_getTopAlbums("Andrew Bird")
#' }
#' @export
artist_getTopAlbums <- function(artist, mbid = NA, autocorrect = NA, page = NA, limit = NA) {
  query <- list(
    method = "artist.getTopAlbums",
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    page = page,
    limit = limit
  )

  res <- request(query)

  process_geo(res)
}


# artist.getTopTags: http://www.last.fm/api/show/artist.getTopTags
# Get the top tags for an artist on Last.fm, ordered by popularity.
#' Get the top tags for an artist.
#'
#' Get the top tags for an artist on Last.fm, ordered by popularity.
#' Implementation of last.fm's \emph{artist.getTopTags} API method
#' (\url{http://www.last.fm/api/show/artist.getTopTags})
#'
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the artist.
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @return A list of tags.
#' @examples
#' \dontrun{
#' artist_getTopTags("SZA")
#' }
#' @export
artist_getTopTags <- function(artist, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "artist.getTopTags",
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  process_geo(res)
}


#' Get the top tracks by an artist.
#'
#' Get the top tracks by an artist on Last.fm, ordered by popularity.
#' Implementation of last.fm's \emph{artist.getTopTracks} API method
#' (\url{http://www.last.fm/api/show/artist.getTopTracks})
#'
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the artist
#' @param autocorrect Transform misspelled artist names into correct artist
#' names, returning the correct version instead. The corrected artist name will
#' be returned in the response. [0|1]
#' @param page The page number to fetch. Defaults to first page.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @return A list of tracks.
#' @examples
#' \dontrun{
#' artist_getTopTracks("The Suffers")
#' }
#' @export
artist_getTopTracks <- function(artist, mbid = NA, autocorrect = NA, page = NA, limit = NA) {
  query <- list(
    method = "artist.getTopTracks",
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    page = page,
    limit = limit
  )

  res <- request(query)

  process_geo(res)
}


#' Search for an artist by name.
#'
#' Search for an artist by name. Returns artist matches sorted by relevance.
#' Implementation of last.fm's \emph{artist.search} API method
#' (\url{http://www.last.fm/api/show/artist.search})
#'
#' @param artist The artist name to search.
#' @param limit The number of results to fetch per page. Defaults to 30.
#' @param page The page number to fetch. Defaults to first page.
#' @return A list of search results.
#' @examples
#' \dontrun{
#' artist_search("Helado Negro")
#' }
#' @export
artist_search <- function(artist, limit = NA, page = NA) {
  query <- list(
    method = "artist.search",
    artist = artist,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_search(res)
}
