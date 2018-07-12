# Request to last.fm with query parameters
#' @importFrom httr GET config content
#' @importFrom jsonlite fromJSON
request <- function(query) {
  query$api_key <- get_key()
  query$format <- "json"
  query <- query[!as.logical(lapply(query, is.na))]

  res <- GET(
    url = "http://ws.audioscrobbler.com/2.0/",
    query = query,
    config = config(useragent = get_useragent())
  )
  text <- content(res, as = "text")
  parsed <- fromJSON(text, simplifyVector = TRUE)

  if (length(parsed) == 0) {
    return(parsed)
  }

  if (identical(names(parsed)[1],"error")) {
    stop(build_error_message(parsed))
  }

  parsed[[1]]
}

get_key <- function() {
  key <- Sys.getenv("lastfm_key")

  if (identical(key, "")) {
    stop(
      "Please set environment variable `lastfm_key` to your Last.fm API key",
      call. = FALSE
    )
  }

  key
}

#' @importFrom utils packageVersion
get_useragent <- function() {
  paste0(
    "R/", R.version$major, ".", R.version$minor,
    " (", Sys.info()["sysname"], " ", Sys.info()["machine"], ")",
    " lastfmr/", packageVersion("lastfmr")
  )
}

build_error_message <- function(parsed) {
  paste0(parsed$message, " (ERROR ", parsed$error, ").")
}

process <- function(res){
  res
}

process_df <- function(res) {
  if (identical(res[[1]], " ")) res[[1]] <- data.frame()
  attributes(res[[1]]) <- c(attributes(res[[1]]), res$`@attr`)

  res[[1]]
}

#' @importFrom tidyr spread
#' @importFrom jsonlite flatten
process_search <- function(res) {
  match <- names(res)[grepl("matches", names(res))]

  matches <- res[[match]][[1]]
  matches$image <- do.call(
    what = rbind,
    args = lapply(
      matches$image, function(x) spread(x, size, `#text`)
    )
  )
  matches <- flatten(matches)
  attr(matches, "searchTerms") <- res$`opensearch:Query`$searchTerms
  attr(matches, "page") <- res$`opensearch:Query`$startPage
  attr(matches, "perPage") <- res$`opensearch:itemsPerPage`
  attr(matches, "total") <- res$`opensearch:totalResults`

  matches
}

#' @importFrom purrr map_df
#' @importFrom jsonlite flatten
process_geo <- function(res) {
  if (!is.data.frame(res[[1]])) {
    res[[1]] <- data.frame()
  } else {
    if (!is.null(res[[1]]$image)) {
      res[[1]]$image <- map_df(res[[1]]$image, tidy_image)
    }
    res[[1]] <- flatten(res[[1]])
  }
  attributes(res[[1]]) <- c(attributes(res[[1]]), res$`@attr`)

  res[[1]]
}

process_correction <- function(res) {
  if (is.character(res)) return(data.frame())

  correction <- as.data.frame(res$correction[[1]], stringsAsFactors = FALSE)
  attributes(correction) <- c(attributes(correction), res$correction$`@attr`)

  correction
}

#' @importFrom dplyr distinct
#' @importFrom tidyr spread
#' @importFrom jsonlite flatten
#' @importFrom dplyr %>%
tidy_image <- function(df) {
  df %>%
    distinct(`#text`, .keep_all = TRUE) %>%
    spread(size, `#text`)
}

list_flatten <- function(df) {
  if (is.data.frame(df)) {
    list(flatten(df))
  } else {
    list(data.frame())
  }
}
