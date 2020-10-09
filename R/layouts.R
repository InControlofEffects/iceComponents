#' Container
#'
#' Functional component for creating a new app container. Use `page_ui`,
#' to define individual pages.
#'
#' @param ... Shiny UI content
#' @param class optional css classes to apply to the container
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(iceComponents)
#'   ui <- tagList(
#'     use_iceComponents(),
#'     container(
#'       class = "dark-theme",
#'       tags$h1("My Application")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @export
container <- function(..., class = NULL) {
    css <- "main"
    if (!is.null(class)) css <- paste0(css, " ", class)
    tags$main(id = "main", class = css, ...)
}


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
    tags$article(id = inputId, class = css, ...)
}