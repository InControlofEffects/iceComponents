#' error_text
#'
#' Create a text element for displaying inline or text only error messages.
#' By default, this creates an empty element that is hidden by default.
#'
#' @param inputId a ID for the error message element
#' @param class optional CSS classes to include
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::container(
#'       iceComponents::page(
#'         tags$h2("My App"),
#'         tags$p("Please wait while the app loads..."),
#'         iceComponents::error_text(
#'           inputId = "shiny-server-error"
#'         )
#'       )
#'     )
#'   )
#'
#'   server <- function() {
#'     err <- function() {
#'        Sys.sleep(2)
#'        iceComponents::show_error_text(
#'          inputId = "shiny-server-error",
#'          error = "Internal Server Error (500)"
#'        )
#'     }
#'
#'     err()
#'
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#'
#' @export
error_text <- function(inputId, class = NULL) {
    stopifnot("`inputId` must be a string" = is.character(inputId))
    css <- "error__text error__text__hidden"
    if (!is.null(class)) css <- paste0(css, " ", class)
    htmltools::tags$span(id = inputId, class = css)
}


#' show_error_text
#'
#' Display an error text message
#'
#' @param inputId ID of the error element to display
#' @param error message to display
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::container(
#'       iceComponents::page(
#'         tags$h2("My App"),
#'         iceComponents::error_text(
#'           inputId = "shiny-server-error"
#'         ),
#'         tags$button(
#'           id = "show",
#'           class = "shiny-bound-input action-button",
#'           "Do Something"
#'         )
#'       )
#'     )
#'   )
#'
#'   server <- function() {
#'     observeEvent(input$show, {
#'       iceComponents::show_error_text(
#'         inputId = "shiny-server-error",
#'         error = "Internal Server Error (500)"
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#'
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
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::container(
#'       iceComponents::page(
#'         tags$h2("My App"),
#'         iceComponents::error_text(
#'           inputId = "shiny-server-error"
#'         ),
#'         tags$button(
#'           id = "show",
#'           class = "shiny-bound-input action-button",
#'           "Do Something"
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
#'       iceComponents::show_error_text(
#'         inputId = "shiny-server-error",
#'         error = "Internal Server Error (500)"
#'       )
#'     })
#'
#'     observeEvent(input$hide, {
#'       iceComponents::hide_error_text(
#'         inputId = "shiny-server-error"
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
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