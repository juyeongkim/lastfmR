% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/album.R
\name{album_getTags}
\alias{album_getTags}
\title{Get the tags applied by an user to an album.}
\usage{
album_getTags(artist, album, user, mbid = NA, autocorrect = NA)
}
\arguments{
\item{artist}{The artist name.}

\item{album}{The album name.}

\item{user}{The user name for the context of the request.}

\item{mbid}{The musicbrainz id for the album.}

\item{autocorrect}{Transform misspelled artist names into correct artist names,
returning the correct version instead.
The corrected artist name will be returned in the response. [0|1]
If supplied, the user's playcount for this album is included in the response.}
}
\value{
A list of the tags applied by an user to an album.
}
\description{
Get the tags applied by an user to an album on Last.fm.
To retrieve the list of top tags applied to an album by all users use
\code{\link{album_getTopTags}}.
Implementation of last.fm's \emph{album.getTags} API method
(\url{http://www.last.fm/api/show/album.getTags})
}
\examples{
\dontrun{
album_getTags("Sufjan Stevens", "Carrie & Lowell", "platyjus")
}
}
