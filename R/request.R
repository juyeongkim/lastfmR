# Request to last.fm with parameters

#' @importFrom RCurl getForm
#' @importFrom jsonlite fromJSON
request_lfm <- function(params) {
  params <- params[!as.logical(lapply(params, is.na))]

  ret <- getForm(baseurl, .params = params)
  parsed <- fromJSON(ret)

  if (length(parsed) == 0) {
    return(parsed)
  }

  if (names(parsed)[1] == "error") {
    stop(paste0(parsed$message, " (ERROR ", parsed$error, ")."))
  }

  parsed[[1]]
}
