#' Container
#'
#' Functional component for creating a new app container. Use `page_ui`,
#' to define individual pages.
#'
#' @param ... Shiny UI content
#' @param classnames optional css classes to apply to the container
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(iceComponents)
#'   ui <- tagList(
#'     use_iceComponents(),
#'     container(
#'       classnames = "dark-theme",
#'       tags$h1("My Application")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'   }
#'   shinyApp(ui, server)
#' }
#'
#' @export
container <- function(..., classnames = NULL) {
    css <- "main"
    if (!is.null(classnames)) css <- paste0(css, " ", classnames)
    tags$main(id = "main", class = css, ...)
}


#' Page Container
#'
#' Define a "page" region inside the main container
#'
#' @param ... Shiny UI content
#' @param inputId an ID for the page (required)
#' @param classnames apply css classes (optional)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(iceComponents)
#'   ui <- tagList(
#'     use_iceComponents(),
#'     container(
#'       classnames = "dark-theme",
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
page <- function(..., inputId, classnames = NULL) {
    stopifnot("`inputId` is missing" = !is.null(inputId))

    css <- "page"
    if (!is.null(classnames)) css <- paste0(css, " ", classnames)
    tags$article(id = inputId, class = css, ...)
}