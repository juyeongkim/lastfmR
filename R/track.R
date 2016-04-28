# TRACK METHODS

# track.getCorrection: http://www.last.fm/api/show/track.getCorrection
# Use the last.fm corrections data to check whether the supplied track has a correction to a canonical track
#' @export
track_getCorrection <- function(track, artist, api_key = lastkey) {
  params <- list(method  = "track.getCorrection",
                 track   = track,
                 artist  = artist,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


# track.getInfo: http://www.last.fm/api/show/track.getInfo
# Get the metadata for a track on Last.fm using the artist/track name or a musicbrainz id.
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


# track.getSimilar: http://www.last.fm/api/show/track.getSimilar
# Get the similar tracks for this track on Last.fm, based on listening data.
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


# track.getTags: http://www.last.fm/api/show/track.getTags
# Get the tags applied by an individual user to a track on Last.fm.
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


# track.getTopTags: http://www.last.fm/api/show/track.getTopTags
# Get the top tags for this track on Last.fm, ordered by tag count. Supply either track & artist name or mbid.
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


# track.search: http://www.last.fm/api/show/track.search
# Search for a track by track name. Returns track matches sorted by relevance.
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
