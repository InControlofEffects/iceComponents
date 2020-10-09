#' error_box
#'
#' Create an error message box to inform users when an error has occured.
#' This element is designed to render without an message. Use the server-side
#' function `show_error_box` to render an message into the error box, and then
#' the `hide_error_box` to reset the error. You can further customize the error
#' box to fit the error by choosing an icon.
#'
#' @param inputId a unique id for the error box
#' @param classnames pass css class names
#' @param icon_name an rheroicons icon name
#' @param icon_type an rheroicons icon type ("output" or"solid")
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::container(
#'       iceComponents::page(
#'         tags$h2("My App"),
#'         iceComponents::error_box(
#'           inputId = "shiny-server-error",
#'           icon_name = "ban",
#'           icon_type = "ouline"
#'         ),
#'         tags$button(
#'           id = "show",
#'           class = "shiny-bound-input action-button",
#'           "Show Error"
#'         ),
#'         tags$button(
#'           id = "hide",
#'           class = "shiny-bound-input action-button",
#'           "Hide Error"
#'         )
#'       )
#'     )
#'   )
#'
#'   server <- function() {
#'     observeEvent(input$show, {
#'       iceComponents::show_error_box(
#'         inputId = "shiny-server-error",
#'         error = "You are not authorized to do this."
#'       )
#'     })
#'
#'     observeEvent(input$hide, {
#'       iceComponents::hide_error_box(
#'         inputId = "shiny-server-error"
#'       )
#'     })
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @references
#' \url{https://github.com/davidruvolo51/rheroicons}
#'
#' @export
error_box <- function(
    inputId,
    classnames = NULL,
    icon_name = "exclamation",
    icon_type = "outline"
) {
    stopifnot(
        "`inputId` is missing" = !is.null(inputId),
        "`inputId` must be a string" = is.character(inputId),
        "`icon_type` must be 'outline' or 'solid'" = {
            !icon_type %in% c("outline", "solid")
        }
    )

    css <- "error__box error__hidden"
    if (!is.null(classnames)) css <- paste0(css, " ", classnames)

    tags$div(
        id = inputId,
        class = css,
        role = "alert",
        rheroicons::rheroicon(name = icon_name, type = icon_type),
        tags$span(class = "error__box__text")
    )
}


#' show_error_box
#'
#' Reveal a message box and display a message
#'
#' @param inputId ID of error to update
#' @param error message to display
#'
#' @export
show_error_box <- function(inputId, error) {
    stopifnot("`error` must be a string" = is.character(error))
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "show",
            error = error
        )
    )
}


#' hide_error_box
#'
#' Hide an error box
#'
#' @param inputId ID of the error box to hide
#'
#' @export
hide_error_box <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            type = "hide"
        )
    )
}