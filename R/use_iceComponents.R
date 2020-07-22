#' use_iceComponents
#'
#' Client-side function for initiating package resources
#'
#' @importFrom shiny htmlDependency
#' @examples
#' if(interactive) {
#'   library(shiny)
#'   ui <- tagList(
#'     use_iceComponents(),
#'     tags$main(
#'       tags$h2("Hello, world!")
#'     )
#'   )
#'   server <- function(input, output) {}
#'   shinyApp(ui, server)
#' }
#' @export
use_iceComponents <- function() {
    htmlDependency(
        version = "0.0.1",
        name = "iceComponents",
        src = "iceComponents/",
        package = "iceComponents",
        stylesheet = "iceComponents.min.css",
        script = "iceComponents.min.js",
        all_files = FALSE
    )
}