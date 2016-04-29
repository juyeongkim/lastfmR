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
#' @param api_key A Last.fm API key.
#' @return A list of corrections.
#' @examples
#' track_getCorrection("King Kunta", "Kendrick Lamar")
#' @export
track_getCorrection <- function(track, artist, api_key = lastkey) {
  params <- list(method  = "track.getCorrection",
                 track   = track,
                 artist  = artist,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
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
#' @param api_key A Last.fm API key.
#' @return A list of the metadata for a track.
#' @examples
#' track_getInfo("King Kunta", "Kendrick Lamar")
#' @export
track_getInfo <- function(track, artist, mbid = NA, autocorrect = NA, username = NA, api_key = lastkey) {
  params <- list(method      = "track.getInfo",
                 track       = track,
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 username    = username,
                 api_key     = api_key,
                 format      = "json")

  request_lfm(params)
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
#' @param api_key A Last.fm API key.
#' @return A list of the similar tracks.
#' @examples
#' track_getSimilar("Hard Times", "Thundercat")
#' @export
track_getSimilar <- function(track, artist, mbid = NA, autocorrect = NA, limit = NA, api_key = lastkey) {
  params <- list(method      = "track.getSimilar",
                 track       = track,
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 limit       = limit,
                 api_key     = api_key,
                 format      = "json")

  request_lfm(params)
}


#' Get the tags applied by an individual user to a track.
#'
#' Get the tags applied by an individual user to a track on Last.fm.
#' Implementation of last.fm's \emph{track.getTags} API method
#' (\url{http://www.last.fm/api/show/track.getTags})
#'
#' @param track The track name.
#' @param artist The artist name.
#' @param mbid The musicbrainz id for the track
#' @param autocorrect Transform misspelled artist and track names into correct
#' artist and track names, returning the correct version instead.
#' The corrected artist and track name will be returned in the response. [0|1]
#' @param username If called in non-authenticated mode you must specify the user
#'  to look up.
#' @param api_key A Last.fm API key.
#' @return A list of the metadata for a track.
#' @examples
#' track_getTags("Sleeping In", "The Postal Service")
#' @export
track_getTags <- function(track, artist, mbid = NA, autocorrect = NA, username = NA, api_key = lastkey) {
  params <- list(method      = "track.getTags",
                 track       = track,
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 username    = username,
                 api_key     = api_key,
                 format      = "json")

  request_lfm(params)
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
#' @param api_key A Last.fm API key.
#' @return A list of the top tags for a track.
#' @examples
#' track_getTopTags("Tommy Chong", "The Blue Scholars")
#' @export
track_getTopTags <- function(track, artist, mbid = NA, autocorrect = NA, api_key = lastkey) {
  params <- list(method      = "track.getTopTags",
                 track       = track,
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 api_key     = api_key,
                 format      = "json")

  request_lfm(params)
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
#' @param api_key A Last.fm API key.
#' @return A list of track matches sorted by relevance.
#' @examples
#' track_search("Depreston")
#' @export
track_search <- function(track, artist = NA, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "track.search",
                 track   = track,
                 artist  = artist,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}
