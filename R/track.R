# TRACK METHODS

#' Get corrections of a track title or artist.
#'
#' Use the last.fm corrections data to check whether the supplied track has a
#' correction to a canonical track
#' Implementation of last.fm's \emph{track.getCorrection} API method
#' (\url{http://www.last.fm/api/show/track.getCorrection})
#'
#' @param track The track name to correct.
#' @param artist The artist name to correct.
#' @return A list of corrections.
#' @examples
#' track_getCorrection("Mrbrownstone", "guns and roses")
#' @export
track_getCorrection <- function(track, artist) {
  query <- list(
    method = "track.getCorrection",
    track = track,
    artist = artist
  )

  res <- request(query)

  process_correction(res)
}


#' Get the metadata for a track.
#'
#' Get the metadata for a track on Last.fm using the artist/track name or a musicbrainz id.
#' Implementation of last.fm's \emph{track.getInfo} API method
#' (\url{http://www.last.fm/api/show/track.getInfo})
#'
#' @param track The track name.
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the track
#' @param autocorrect Transform misspelled artist and track names into correct artist and track names,
#' returning the correct version instead.
#' The corrected artist and track name will be returned in the response. [0|1]
#' @param username The username for the context of the request.
#' If supplied, the user's playcount for this track and
#' whether they have loved the track is included in the response.
#' @return A list of the metadata for a track.
#' @examples
#' track_getInfo("King Kunta", "Kendrick Lamar")
#' @export
track_getInfo <- function(track, artist, mbid = NA, autocorrect = NA, username = NA) {
  query <- list(
    method = "track.getInfo",
    track = track,
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    username = username
  )

  res <- request(query)

  temp <- list(as.data.frame(res$toptags$tag))

  res$album$image <- spread(res$album$image, size, `#text`)
  res$album <- as.list(as.data.frame(res$album, stringsAsFactors = FALSE))
  res$toptags <- NA
  res <- as.data.frame(res, stringsAsFactors = FALSE)
  res$toptags <- temp

  res
}


#' Get the similar tracks for this track.
#'
#' Get the similar tracks for this track on Last.fm, based on listening data.
#' Implementation of last.fm's \emph{track.getSimilar} API method
#' (\url{http://www.last.fm/api/show/track.getSimilar})
#'
#' @param track The track name.
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the track
#' @param autocorrect Transform misspelled artist and track names into correct
#' artist and track names, returning the correct version instead.
#' The corrected artist and track name will be returned in the response. [0|1]
#' @param limit Maximum number of similar tracks to return.
#' @return A list of the similar tracks.
#' @examples
#' track_getSimilar("Hard Times", "Thundercat")
#' @export
track_getSimilar <- function(track, artist, mbid = NA, autocorrect = NA, limit = NA) {
  query <- list(
    method = "track.getSimilar",
    track = track,
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect,
    limit = limit
  )

  res <- request(query)

  if (identical(res[[1]], " ")) res[[1]] <- data.frame()
  attributes(res[[1]]) <- c(attributes(res[[1]]), res$`@attr`)

  res[[1]]
}


#' Get the tags applied by an individual user to a track.
#'
#' Get the tags applied by an individual user to a track on Last.fm.
#' Implementation of last.fm's \emph{track.getTags} API method
#' (\url{http://www.last.fm/api/show/track.getTags})
#'
#' @param track The track name.
#' @param artist The artist name.
#' @param user The user name.
#' @param mbid The musicbrainz id for the track
#' @param autocorrect Transform misspelled artist and track names into correct
#' artist and track names, returning the correct version instead.
#' The corrected artist and track name will be returned in the response. [0|1]
#' @return A list of the metadata for a track.
#' @examples
#' track_getTags("Sleeping In", "The Postal Service", "platyjus")
#' @export
track_getTags <- function(track, artist, user, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "track.getTags",
    track = track,
    artist = artist,
    user = user,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  if (identical(res[[1]], " ")) res[[1]] <- data.frame()
  attributes(res[[1]]) <- c(attributes(res[[1]]), res$`@attr`)

  res[[1]]
}


#' Get the top tags for this track.
#'
#' Get the top tags for this track on Last.fm, ordered by tag count.
#' Supply either track & artist name or mbid.
#' Implementation of last.fm's \emph{track.getTopTags} API method
#' (\url{http://www.last.fm/api/show/track.getTopTags})
#'
#' @param track The track name.
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the track
#' @param autocorrect Transform misspelled artist and track names into correct
#' artist and track names, returning the correct version instead.
#' The corrected artist and track name will be returned in the response. [0|1]
#' @return A list of the top tags for a track.
#' @examples
#' track_getTopTags("Tommy Chong", "The Blue Scholars")
#' @export
track_getTopTags <- function(track, artist, mbid = NA, autocorrect = NA) {
  query <- list(
    method = "track.getTopTags",
    track = track,
    artist = artist,
    mbid = mbid,
    autocorrect = autocorrect
  )

  res <- request(query)

  if (identical(res[[1]], " ")) res[[1]] <- data.frame()
  attributes(res[[1]]) <- c(attributes(res[[1]]), res$`@attr`)

  res[[1]]
}


#' Search for a track by track name.
#'
#' Search for a track by track name. Returns track matches sorted by relevance.
#' Supply either track & artist name or mbid.
#' Implementation of last.fm's \emph{track.search} API method
#' (\url{http://www.last.fm/api/show/track.search})
#'
#' @param track The track name.
#' @param artist Narrow your search by specifying an artist.
#' @param limit The number of results to fetch per page. Defaults to 30.
#' @param page The page number to fetch. Defaults to first page.
#' @return A list of track matches sorted by relevance.
#' @examples
#' track_search("Depreston")
#' @export
track_search <- function(track, artist = NA, limit = NA, page = NA) {
  query <- list(
    method = "track.search",
    track = track,
    artist = artist,
    limit = limit,
    page = page
  )

  res <- request(query)

  process_search(res)
}
