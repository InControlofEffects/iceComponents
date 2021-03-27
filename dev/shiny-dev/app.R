#' ////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2021-03-27
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
#' ////////////////////////////////////////////////////////////////////////////

# load pkgs used by the component
suppressPackageStartupMessages({
    library(shiny)
    library(htmltools)
})

# load component
devtools::load_all()

# add resource path
addResourcePath(
    "iceComponents",
    directoryPath = "~/Github/iceComponents/inst/iceComponents/public"
)

#' //////////////////////////////////////

# create app

devProgressBar <- progressbar(start = 2, max = 12)

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
                font-size: 16pt;
                padding: 0;
                margin: 0;
            }",
            ":root {
                --primary: #06D6A0;
            }",
            ".ice__card {
                --card-text: var(--primary);
            }"
        ),
        tags$title("Test")
    ),
    devProgressBar$bar(inputId = "test", fixed = TRUE),
    set_doc_attribs(),
    container(
        page(
            inputId = "component-tests",
            class = "test",
            tags$h2("Count by 5's", style = "text-align: center;"),
            uiOutput("count", style = "text-align: center"),
            navigation(
                back_btn(inputId = "subtract", label = "Subtract 5"),
                forward_btn(inputId = "add", label = "Add 5")
            ),
            tags$p(
                stringi::stri_rand_lipsum(1)
            ),
            input(
                inputId = "usr",
                label = "Enter your username",
                icon = rheroicons::rheroicon(name = "user")
            ),
            input(
                inputId = "nname",
                label = "Enter your nickname",
                icon = rheroicons::rheroicon(name = "emoji_happy")
            ),
            card(
                inputId = "test",
                text = "Colors",
                icon_name = "color_swatch"
            ),
            error_box(inputId = "error"),
            error_text(inputId = "errMsg"),
            accordion(
                inputId = "ac",
                title = "Hello World!",
                content = "this is an example"
            ),
            accordion_input(
                inputId = "acc",
                title = "Some input",
                content = "this is an example"
            )
        )
    ),
    tags$script(src = "iceComponents/iceComponents.min.js")
)

# server
server <- function(input, output, session) {
    counter <- reactiveVal(25)
    output$count <- renderUI(tags$p(counter()))

    observeEvent(input$subtract, {
        counter(counter() - 5)
        output$count <- renderUI(tags$p(counter()))
    })

    observeEvent(input$add, {
        counter(counter() + 5)
        output$count <- renderUI(tags$p(counter()))
    })

    # show_error_box("error", "Error (1245): user not authorized")
    # show_error_text("errMsg", "Error (1245): user not authorized")
    invalidate_input("usr", "Error")
}


# app
shinyApp(ui, server)