#' use_iceComponents
#'
#' Client-side function for initiating package resources
#'
#' @examples
#' if(interactive()) {
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
    htmltools::htmlDependency(
        version = "0.0.7",
        name = "iceComponents",
        src = "iceComponents/public/",
        package = "iceComponents",
        stylesheet = "iceComponents.min.css",
        script = "iceComponents.min.js",
        all_files = FALSE
    )
}
