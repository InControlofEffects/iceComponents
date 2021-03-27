#' Page Container
#'
#' Define a "page" region inside the main container
#'
#' @param ... Shiny UI content
#' @param inputId an ID for the page (required)
#' @param class apply css classes (optional)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(iceComponents)
#'   ui <- tagList(
#'     use_iceComponents(),
#'     container(
#'       class = "dark-theme",
#'       page(
#'         tags$h1("My Application")
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @export
page <- function(..., inputId, class = NULL) {
    stopifnot("`inputId` is missing" = !is.null(inputId))
    css <- "page"
    if (!is.null(class)) css <- paste0(css, " ", class)
    htmltools::tags$div(id = inputId, class = css, ...)
}