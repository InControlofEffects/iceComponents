#' Input
#'
#' Create a input field for use in Shiny. This component returns an
#' input element (either password or text) with the addition of functions for
#' validating inputs
#'
#' @param inputId unique ID for the component
#' @param label text that describes the input
#' @param type input type (password or text)
#' @param icon an rheroicons icon
#'
#' @importFrom htmltools tags tagList
#' @export
input <- function(inputId, label, type = "text", icon = NULL) {

    # generate internal IDs
    ids <- list(
        label = paste0(inputId, "__label"),
        error = paste0(inputId, "__status")
    )

    # define input type
    if (!type %in% c("password", "text")) {
        stop("Value for 'type' is invalid. Use 'password' or 'text'")
    }

    # generate markup
    tagList(
        tags$label(
            id = ids$label,
            class = "field__label",
            `for` = inputId,
            label
        ),
        tags$span(
            id = ids$error,
            role = "alert",
            class = "field__status"
        ),
        tags$div(
            class = "field__icon__input",
            icon,
            tags$input(
                id = inputId,
                type = type,
                class = paste0("field__input field__", type),
                `aria-describedby` = paste0(ids$label, " ", ids$error)
            )
        )
    )
}

#' Invalidate Input
#'
#' Invalidate an input field based on server side logic
#'
#' @param inputId Id of the password component to invalidate
#' @param error message to display that describes the error
#'
#' @export
invalidate_input <- function(inputId, error) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "invalidateInput",
            error = error
        )
    )
}

#' Clear Input
#'
#' Remove all invalidation attributes from an input element while
#' leaving user entered input text untouched. Use `reset_input` for
#' removing everything.
#'
#' @param InputId Id of the component to clear
#'
#' @export
clear_input <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "clearInput"
        )
    )
}


#' Reset Input
#'
#' Clear and reset input to its default state
#'
#' @param inputId ID of the component to reset
#'
#' @export
reset_input <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "resetInput"
        )
    )
}