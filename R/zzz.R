#' onLoad
#'
#' Set resource path when package is called
#'
#' @noRd
.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath(
        prefix = "iceComponents",
        directoryPath = system.file(
            "iceComponents",
            package = "iceComponents"
        )
    )
}

#' onUnload
#'
#' Package cleanup
#'
#' @noRd
.onUnload <- function(libname, pkgname) {
    shiny::removeResourcePath(prefix = "iceComponents")
}