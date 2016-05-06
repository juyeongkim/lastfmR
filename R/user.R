# USER METHODS

#' Get a list of tracks by a given artist scrobbled by this user.
#'
#' Get a list of tracks by a given artist scrobbled by this user,
#' including scrobble time. Can be limited to specific timeranges, defaults to all time.
#' Implementation of last.fm's \emph{user.getArtistTracks} API method
#' (\url{http://www.last.fm/api/show/user.getArtistTracks}).
#'
#' @param user The last.fm username to fetch the recent tracks of.
#' @param artist The artist name you are interested in.
#' @param startTimestamp An unix timestamp to start at.
#' @param endTimestamp An unix timestamp to end at.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of tracks by a given artist scrobbled by this user.
#' @examples
#' user_getArtistTracks("platyjus", "Leon Bridges")
#' @export
user_getArtistTracks <- function(user, artist, startTimestamp = NA, endTimestamp = NA, page = NA, api_key = lastkey) {
  params <- list(method         = "user.getArtistTracks",
                 user           = user,
                 artist         = artist,
                 startTimestamp = startTimestamp,
                 endTimestamp   = endTimestamp,
                 page           = page,
                 api_key        = api_key,
                 format         = "json")

  request_lfm(params)
}



#' Get a list of the user's friends.
#'
#' Get a list of the user's friends on Last.fm.
#' Implementation of last.fm's \emph{user.getFriends} API method
#' (\url{http://www.last.fm/api/show/user.getFriends}).
#'
#' @param user The last.fm username to fetch the friends of.
#' @param recenttracks Whether or not to include information about friends' recent listening in the response.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the user's friends.
#' @examples
#' user_getFriends("platyjus")
#' @export
user_getFriends <- function(user, recenttracks = NA, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method       = "user.getFriends",
                 user         = user,
                 recenttracks = recenttracks,
                 limit        = limit,
                 page         = page,
                 api_key      = api_key,
                 format       = "json")

  request_lfm(params)
}


#' Get information about a user profile.
#'
#' Get information about a user profile.
#' Implementation of last.fm's \emph{user.getInfo} API method
#' (\url{http://www.last.fm/api/show/user.getInfo}).
#'
#' @param user The user to fetch info for.
#' @param api_key A Last.fm API key.
#' @return A list of user profile information
#' @examples
#' user_getInfo("platyjus")
#' @export
user_getInfo <- function(user, api_key = lastkey) {
  params <- list(method  = "user.getInfo",
                 user    = user,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get the last 50 tracks loved by a user.
#'
#' Get the last 50 tracks loved by a user.
#' Implementation of last.fm's \emph{user.getLovedTracks} API method
#' (\url{http://www.last.fm/api/show/user.getLovedTracks}).
#'
#' @param user The user name to fetch the loved tracks for.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the last 50 tracks loved by a user.
#' @examples
#' user_getLovedTracks("platyjus")
#' @export
user_getLovedTracks <- function(user, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "user.getLovedTracks",
                 user    = user,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get the user's personal tags.
#'
#' Get the user's personal tags.
#' Implementation of last.fm's \emph{user.getPersonalTags} API method
#' (\url{http://www.last.fm/api/show/user.getPersonalTags}).
#'
#' @param user The user who performed the taggings.
#' @param tag The tag you're interested in.
#' @param taggingtype The type of items which have been tagged [artist|album|track].
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the user's personal tags.
#' @examples
#' user_getPersonalTags("platyjus", "indie", "artist")
#' @export
user_getPersonalTags <- function(user, tag, taggingtype, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method      = "user.getPersonalTags",
                 user        = user,
                 tag         = tag,
                 taggingtype = taggingtype,
                 limit       = limit,
                 page        = page,
                 api_key     = api_key,
                 format      = "json")

  request_lfm(params)
}


#' Get a list of the recent tracks listened to by user.
#'
#' Get a list of the recent tracks listened to by this user.
#' Also includes the currently playing track with the nowplaying="true" attribute
#' if the user is currently listening.
#' Implementation of last.fm's \emph{user.getRecentTracks} API method
#' (\url{http://www.last.fm/api/show/user.getRecentTracks}).
#'
#' @param user The last.fm username to fetch the recent tracks of.
#' @param limit The number of results to fetch per page. Defaults to 50. Maximum is 200.
#' @param page The page number you wish to scan to.
#' @param from Beginning timestamp of a range - only display scrobbles after this time,
#' in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC).
#' This must be in the UTC time zone.
#' @param to End timestamp of a range - only display scrobbles before this time,
#' in UNIX timestamp format (integer number of seconds since 00:00:00, January 1st 1970 UTC).
#' This must be in the UTC time zone.
#' @param extended Includes extended data in each artist, and whether or not the user has loved each track
#' @param api_key A Last.fm API key.
#' @return A list of the recent tracks.
#' @examples
#' user_getRecentTracks("platyjus")
#' @export
user_getRecentTracks <- function(user, limit = NA, page = 1, from = NA, to = NA, extended = 0, api_key = lastkey) {
  params <- list(method   = "user.getrecenttracks",
                 user     = user,
                 limit    = limit,
                 page     = page,
                 from     = from,
                 to       = to,
                 extended = extended,
                 api_key  = api_key,
                 format   = "json")

  request_lfm(params)
}


#' Get the top albums listened to by a user.
#'
#' Get the top albums listened to by a user. You can stipulate a time period.
#' Sends the overall chart by default.
#' Implementation of last.fm's \emph{user.getTopAlbums} API method
#' (\url{http://www.last.fm/api/show/user.getTopAlbums}).
#'
#' @param user The user name to fetch top albums for.
#' @param period overall | 7day | 1month | 3month | 6month | 12month -
#' The time period over which to retrieve top albums for.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the top albums listened to by a user.
#' @examples
#' user_getTopAlbums("platyjus")
#' @export
user_getTopAlbums <- function(user, period = NA, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "user.getTopAlbums",
                 user    = user,
                 period  = period,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get the top artists listened to by a user.
#'
#' Get the top artists listened to by a user. You can stipulate a time period.
#' Sends the overall chart by default.
#' Implementation of last.fm's \emph{user.getTopArtists} API method
#' (\url{http://www.last.fm/api/show/user.getTopArtists}).
#'
#' @param user The user name to fetch top artists for.
#' @param period overall | 7day | 1month | 3month | 6month | 12month -
#' The time period over which to retrieve top artists for.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the top artists listened to by a user.
#' @examples
#' user_getTopArtists("platyjus")
#' @export
user_getTopArtists <- function(user, period = NA, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "user.getTopArtists",
                 user    = user,
                 period  = period,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get the top tags listened to by a user.
#'
#' Get the top tags listened to by a user.
#' Implementation of last.fm's \emph{user.getTopTags} API method
#' (\url{http://www.last.fm/api/show/user.getTopTags}).
#'
#' @param user The user name.
#' @param limit Limit the number of tags returned
#' @param api_key A Last.fm API key.
#' @return A list of the top tags listened to by a user.
#' @examples
#' user_getTopTags("platyjus")
#' @export
user_getTopTags <- function(user, limit = NA, api_key = lastkey) {
  params <- list(method  = "user.getTopTags",
                 user    = user,
                 limit   = limit,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get the top tracks listened to by a user.
#'
#' Get the top tracks listened to by a user. You can stipulate a time period.
#' Sends the overall chart by default.
#' Implementation of last.fm's \emph{user.getTopTracks} API method
#' (\url{http://www.last.fm/api/show/user.getTopTracks}).
#'
#' @param user The user name to fetch top tracks for.
#' @param period overall | 7day | 1month | 3month | 6month | 12month -
#' The time period over which to retrieve top tracks for.
#' @param limit The number of results to fetch per page. Defaults to 50.
#' @param page The page number to fetch. Defaults to first page.
#' @param api_key A Last.fm API key.
#' @return A list of the top tracks listened to by a user.
#' @examples
#' user_getTopTracks("platyjus")
#' @export
user_getTopTracks <- function(user, period = NA, limit = NA, page = NA, api_key = lastkey) {
  params <- list(method  = "user.getTopTracks",
                 user    = user,
                 period  = period,
                 limit   = limit,
                 page    = page,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get an album chart for a user profile.
#'
#' Get an album chart for a user profile, for a given date range.
#' If no date range is supplied, it will return the most recent album chart for this user.
#' Implementation of last.fm's \emph{user.getWeeklyAlbumChart} API method
#' (\url{http://www.last.fm/api/show/user.getWeeklyAlbumChart}).
#'
#' @param user The last.fm username to fetch the charts of.
#' @param from The date at which the chart should start from.
#' See user_getChartsList for more.
#' @param to  The date at which the chart should end on.
#' See user_getChartsList for more.
#' @param api_key A Last.fm API key.
#' @return A list of an album chart for a user profile.
#' @examples
#' user_getWeeklyAlbumChart("platyjus")
#' @export
user_getWeeklyAlbumChart <- function(user, from = NA, to = NA, api_key = lastkey) {
  params <- list(method  = "user.getWeeklyAlbumChart",
                 user    = user,
                 from    = from,
                 to      = to,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get an artist chart for a user profile.
#'
#' Get an artist chart for a user profile, for a given date range.
#' If no date range is supplied, it will return the most recent artist chart for this user.
#' Implementation of last.fm's \emph{user.getWeeklyArtistChart} API method
#' (\url{http://www.last.fm/api/show/user.getWeeklyArtistChart}).
#'
#' @param user The last.fm username to fetch the charts of.
#' @param from The date at which the chart should start from.
#' See user_getChartsList for more.
#' @param to  The date at which the chart should end on.
#' See user_getChartsList for more.
#' @param api_key A Last.fm API key.
#' @return A list of an artist chart for a user profile.
#' @examples
#' user_getWeeklyArtistChart("platyjus")
#' @export
user_getWeeklyArtistChart <- function(user, from = NA, to = NA, api_key = lastkey) {
  params <- list(method  = "user.getWeeklyArtistChart",
                 user    = user,
                 from    = from,
                 to      = to,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get a list of available charts for this user.
#'
#' Get a list of available charts for this user,
#' expressed as date ranges which can be sent to the chart services.
#' Implementation of last.fm's \emph{user.getWeeklyChartList} API method
#' (\url{http://www.last.fm/api/show/user.getWeeklyChartList}).
#'
#' @param user TThe last.fm username to fetch the charts list for.
#' @param api_key A Last.fm API key.
#' @return A list of an artist chart for a user profile.
#' @examples
#' user_getWeeklyChartList("platyjus")
#' @export
user_getWeeklyChartList <- function(user, api_key = lastkey) {
  params <- list(method  = "user.getWeeklyChartList",
                 user    = user,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}


#' Get an track chart for a user profile.
#'
#' Get an track chart for a user profile, for a given date range.
#' If no date range is supplied, it will return the most recent track chart for this user.
#' Implementation of last.fm's \emph{user.getWeeklyTrackChart} API method
#' (\url{http://www.last.fm/api/show/user.getWeeklyTrackChart}).
#'
#' @param user The last.fm username to fetch the charts of.
#' @param from The date at which the chart should start from.
#' See user_getChartsList for more.
#' @param to  The date at which the chart should end on.
#' See user_getChartsList for more.
#' @param api_key A Last.fm API key.
#' @return A list of an track chart for a user profile.
#' @examples
#' user_getWeeklyTrackChart("platyjus")
#' @export
user_getWeeklyTrackChart <- function(user, from = NA, to = NA, api_key = lastkey) {
  params <- list(method  = "user.getWeeklyTrackChart",
                 user    = user,
                 from    = from,
                 to      = to,
                 api_key = api_key,
                 format  = "json")

  request_lfm(params)
}
