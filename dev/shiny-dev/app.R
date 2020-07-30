#'////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2020-07-30
#' PURPOSE: a dev app for developing and debugging components
#' STATUS: ongoing
#' PACKAGES: see below
#' COMMENTS: This application should be used for developing and debugging
#' new components for the accessibleshiny package. Building new components
#' will require a lot of debugging as there are many elements to test.
#' Components in the accessibleshiny package usually have a primary function
#' and a series of helper functions, as well as css, javascript functions, and
#' svg elements. This app was designed to make the development process a bit
#' easier as you can write R code, apply CSS, create JavaScript input
#' bindings and functions, and integrate other assets without having to rebuild
#' the package and create a separate demo application.
#'
#' Here is what you will need to get started.
#'
#' 1. Load a component and helpers from the R/ folder
#' 2. Start the development server (which will initiate Shiny and Parcel)
#' 3. Develop the component and document
#' 4. Use accessiblity tools (I am using WAVE)
#' 5. Write unit tests (a test for every option)
#'
#'////////////////////////////////////////////////////////////////////////////

# load pkgs used by the component
suppressPackageStartupMessages({
    library(shiny)
    library(htmltools)
})

# load component
source("../../R/accordion_input.R")
source("../../R/helpers_accordion_input.R")

# add resource path
addResourcePath(
    "iceComponents",
    directoryPath = "~/Github/iceComponents/inst/iceComponents/"
)

#'//////////////////////////////////////

# create app

# ui
ui <- tagList(
    tags$head(
        tags$meta(
            name = "viewport",
            content = "width=device-width, initial-scale=1"
        ),
        tags$link(
            rel = "stylesheet",
            href = "iceComponents/iceComponents.min.css"
        ),
        tags$style(
            "html, body {
                font-family: Helvetica;
            }",
            "main {
                width: 90%;
                max-width: 972px;
                margin: 0 auto;
            }"
        ),
        tags$title("Test")
    ),
    tags$main(
        tags$h2("Accordions"),
        tags$p("Accordion (standard)"),
        accordion_input(
            inputId = "anticholinergic",
            title = "Dry mouth and constipation",
            content = tags$p(
                "Antipsychotic medications can block acetylcholine",
                " a type of chemical in the brain.",
                " Blocking it can affect involuntary muscle",
                " movements (for example the ones in the bladder and",
                " the guts) and various bodily functions (for",
                " example saliva production)."
            )
        ),
        tags$button(
            id = "reset",
            class = "shiny-bound-input action-button",
            "Reset"
        ),
        tags$button(
            id = "clear",
            class = "shiny-bound-input action-button",
            "Clear"
        )
    ),
    tags$script(src = "iceComponents/iceComponents.min.js")
)

# server
server <- function(input, output, session) {
    observe({
        print(input$anticholinergic)
    })

    observeEvent(input$reset, {
        reset_accordion_input(inputId = "anticholinergic")
    })

    observeEvent(input$clear, {
        clear_accordion_input(inputId = "anticholinergic")
    })
}


# app
shinyApp(ui, server)