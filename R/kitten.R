#' Download kittens from the internet
#'
#' This is the details section
#'
#' @title Download kittens
#' @param width Width of the kitten, in pixels
#' @param height Height of the kitten, in pixels
#' @param destfile Place to download the kitten to.  \code{\link{tempfile}()} makes a good place
#' @param ... Additional arguments passed through to \code{\link{download.file}}
#'
#' @return Returns the filename of the kitten (i.e., \code{destfile})
#' @export
#'
#' @examples
#' # download a small cat
#' file <- kitten(100, 100, tempfile())
#' # download a very large cat
#' file <- kitten(1000, 100, tempfile())
kitten <- function(width, height, destfile, ...) {
  if (length(width) != 1 || length(height) != 1) {
    stop("width and height must both be scalars")
  }
  url <- make_url(width, height)
  fetch_file(url, destfile)
  destfile
}

make_url <- function(width, height) {
  sprintf("http://placekitten.com/g/%d/%d", width, height)
}

fetch_file <- function(url, destfile, ...) {
  download.file(url, destfile, ..., mode = "wb")
}

another_function <- function() {
  message("I am a hidden function")
}
