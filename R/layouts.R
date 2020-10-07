#' Main Container
#'
#' Functional component for creating a new app container. Use `page_ui`,
#' to define individual pages.
#'
#' @param ui Shiny UI content
#' @param classnames optional css classes to apply to the container
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::main_ui(
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
main_ui <- function(..., classnames = NULL) {
    m <- tags$main(
        id = "main",
        class = "main",
        ...
    )

    if (!is.null(classnames)) {
        m$attribs$class <- paste0(m$attribs$class, " ", classnames)
    }

    return(m)
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
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::main_ui(
#'       classnames = "dark-theme",
#'       iceComponents::page_ui(
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
page_ui <- function(..., inputId, classnames = NULL) {

    stopifnot("`inputId` is missing" = !is.null(inputId))

    css <- "page"
    if (!is.null(classnames)) {
        stopifnot("`classnames` must be a string" = is.character(classnames))
        css <- paste0(css, " ", classnames)
    }

    tags$article(
        id = inputId,
        class = css,
        ...
    )

}