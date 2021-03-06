% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/artist.R
\name{artist_getInfo}
\alias{artist_getInfo}
\title{Get info of an artist.}
\usage{
artist_getInfo(artist, mbid = NA, lang = NA, autocorrect = NA,
  username = NA)
}
\arguments{
\item{artist}{The artist name.}

\item{mbid}{The musicbrainz id for the artist}

\item{lang}{The language to return the biography in, expressed as an ISO 639
alpha-2 code.}

\item{autocorrect}{Transform misspelled artist names into correct artist
names, returning the correct version instead. The corrected artist name will
be returned in the response. [0|1]}

\item{username}{The username for the context of the request. If supplied,
the user's playcount for this artist is included in the response.}
}
\value{
A list of artist info.
}
\description{
Get the metadata for an artist. Includes biography, truncated at 300 characters.
Implementation of last.fm's \emph{artist.getInfo} API method
(\url{http://www.last.fm/api/show/artist.getInfo})
}
\examples{
\dontrun{
artist_getInfo("Wye Oak")
}
}
