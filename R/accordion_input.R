
#' \code{accordion_input}
#'
#' Create an accordion input element for use in shiny apps. This function
#' function a component that expands and collapses user defined content. The
#' component is designed to be selectable i.e., accessible in the shiny
#' server via `input$*`. If you would display content that is collapsible,
#' use the `accordion` component.
#'
#' This component is useful for creating checkbox groups that have further
#' descriptions or other information than may be useful for the user in regards
#' to which element should be selection.
#'
#' @param inputId a unique ID for the accordion component
#' @param title a text string containing a title for the collapsible section
#' @param html an html element or a list of html elements
#' @param checked a logical argument that indicates if the item should be
#'      selected by default (default: FALSE)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(accessibleshiny)
#'   ui <- tagList(
#'     accessibleshiny::use_accessibleshiny(),
#'     tags$head(
#'       tags$style(
#'         "#what-is-shiny {
#'            width: 400px;
#'         }"
#'       )
#'     ),
#'     tags$main(
#'       id = "main",
#'       class = "main",
#'       tags$h2("Is Shiny your favorite R technology?"),
#'       accordion_input(
#'         inputId = "what-is-shiny",
#'         title = "Shiny",
#'         checked = TRUE,
#'         html = tagList(
#'           tags$p(
#'             "Shiny is an R package that makes it easy to build",
#'             "interactive web apps straight from R. You can host",
#'             "standalone apps on a webpage or embed them in R Markdown",
#'             "documents or build dashboards. You can also extend your",
#'             "Shiny apps with CSS themes, htmlwidgets, and JavaScript",
#'             "actions."
#'           ),
#'           tags$cite("Rstudio.org")
#'         )
#'       )
#'     )
#'   )
#'   server <- function(input, output) {}
#'   shinyApp(ui, server)
#' }
#' @keywords iceComponents accordion input
#' @return Create an accordion component that is also a checkbox input
#' @export
accordion_input <- function(inputId, title, html, checked = FALSE) {

    # validate
    if (!is.character(inputId)) stop("argument 'inputId' must be a string")
    if (!is.character(title)) stop("argument 'title' must be a string")
    if (is.null(html)) stop("argument 'html' cannot be null")
    if (!is.logical(checked)) stop("argument 'checked' must be TRUE or FALSE")

    # define ids
    ids <- accordion_input_helpers$set_html_ids(inputId = inputId)

    # build child elements
    el <- tags$div(
        id = ids$group,
        class = "accordion accordion__input",
        accordion_input_helpers$heading(
            ids = ids,
            title = title,
            checked = checked
        ),
        accordion_input_helpers$content(
            ids = ids,
            html = html
        )
    )

    # return
    return(el)
}


#' \code{reset_accordion_input}
#'
#' A server-side function that resets the accordion input component to it's
#' default statue. Resetting the component will uncheck the import, close
#' the accordion (if open), and reset the input value.
#'
#' @param inputId the of of the component to reset
#'
#' @keywords iceComponents accordion input reset
#' @importFrom shiny getDefaultReactiveDomain
#' @export
reset_accordion_input <- function(inputId) {
    session <- getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = "reset"
    )
}