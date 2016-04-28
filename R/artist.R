# ARTIST METHODS

# artist.getCorrection: http://www.last.fm/api/show/artist.getCorrection
# Use the last.fm corrections data to check whether the supplied artist has a correction to a canonical artist
artist_getCorrection <- function(artist, api_key = lastkey) {
  params <- list(method  = "artist.getCorrection",
                 artist  = artist,
                 api_key = api_key,
                 format  = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getInfo: http://www.last.fm/api/show/artist.getInfo
# Get the metadata for an artist. Includes biography, truncated at 300 characters.
artist_getInfo <- function(artist, mbid = NA, autocorrect = NA, username = NA, lang = NA, api_key = lastkey) {
  params <- list(method      = "artist.getInfo",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 username    = username,
                 lang        = lang,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getSimilar: http://www.last.fm/api/show/artist.getSimilar
# Get all the artists similar to this artist
artist_getSimilar <- function(artist, mbid = NA, autocorrect = NA, limit = NA, api_key = lastkey) {
  params <- list(method      = "artist.getSimilar",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 limit       = limit,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getTags: http://www.last.fm/api/show/artist.getTags
# Get the tags applied by an individual user to an artist on Last.fm.
artist_getTags <- function(artist, mbid = NA, autocorrect = NA, username = NA, api_key = lastkey) {
  params <- list(method      = "artist.getTags",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 username    = username,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getTopAlbums: http://www.last.fm/api/show/artist.getTopAlbums
# Get the top albums for an artist on Last.fm, ordered by popularity.
artist_getTopAlbums <- function(artist, mbid = NA, autocorrect = NA, page = NA, limit = NA, api_key = lastkey) {
  params <- list(method      = "artist.getTopAlbums",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 page        = page,
                 limit       = limit,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getTopTags: http://www.last.fm/api/show/artist.getTopTags
# Get the top tags for an artist on Last.fm, ordered by popularity.
artist_getTopTags <- function(artist, mbid = NA, autocorrect = NA, api_key = lastkey) {
  params <- list(method      = "artist.getTopTags",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.getTopTracks: http://www.last.fm/api/show/artist.getTopTracks
# Get the top tracks by an artist on Last.fm, ordered by popularity
artist_getTopTracks <- function(artist, mbid = NA, autocorrect = NA, page = NA, limit = NA, api_key = lastkey) {
  params <- list(method      = "artist.getTopTracks",
                 artist      = artist,
                 mbid        = mbid,
                 autocorrect = autocorrect,
                 page        = page,
                 limit       = limit,
                 api_key     = api_key,
                 format      = "json")
  parsed <- request_lfm(params)
  return(parsed)
}


# artist.search: http://www.last.fm/api/show/artist.search
# Search for an artist by name. Returns artist matches sorted by relevance.
artist_search <- function(artist, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "artist.search",
                 artist  = artist,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")
  parsed <- request_lfm(params)
  return(parsed)
}
