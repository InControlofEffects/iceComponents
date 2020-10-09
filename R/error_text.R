#' error_text
#'
#' Create a text element for displaying inline or text only error messages.
#' By default, this creates an empty element that is hidden by default.
#'
#' @param inputId a ID for the error message element
#' @param class optional CSS classes to include
#'
#' @export
error_text <- function(inputId, class = NULL) {
    stopifnot("`inputId` must be a string" = is.character(inputId))
    css <- "error__text error__text__hidden"
    if (!is.null(class)) css <- paste0(css, " ", class)
    tags$span(id = inputId, class = css)
}


#' show_error_text
#'
#' Display an error text message
#'
#' @param inputId ID of the error element to display
#' @param error message to display
#'
#' @export
show_error_text <- function(inputId, error) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "show",
            error = error
        )
    )
}

#' hide_error_text
#'
#' Reset an error text element
#'
#' @param inputId Id of the error element
#'
#' @export
hide_error_text <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "hide"
        )
    )
}