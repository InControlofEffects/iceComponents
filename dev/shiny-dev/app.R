#' ////////////////////////////////////////////////////////////////////////////
#' FILE: app.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2020-10-07
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
            }"
        ),
        tags$title("Test")
    ),
    main_ui(
        page_ui(
            inputId = "accordion-section",
            classnames = "test",
            tags$h1("iceComponents Development & Testing"),
            tags$h2("Accordion (non-input)"),
            accordion(
                inputId = "what-is-shiny",
                title = "What is Shiny?",
                content = tagList(
                    tags$p(
                        "Shiny is an R package that makes it easy to build ",
                        "interactive web apps straight from R. You can host",
                        "standalone apps on a webpage or embed them in R",
                        "Markdown documents or build dashboards. You can also",
                        "extend your Shiny apps with CSS themes, htmlwidgets",
                        "and JavaScript actions."
                    ),
                    tags$cite("@rstudio")
                )
            )
        )#,
        # tags$section(
        #     tags$h2("Accordion (input)"),
        #     accordion_input(
        #         inputId = "do-you-use-shiny",
        #         title = "Do you like the Shiny R package?",
        #         content = tagList(
        #             tags$p(
        #                 "Shiny is an R package that makes it easy to build ",
        #                 "interactive web apps straight from R. You can host",
        #                 "standalone apps on a webpage or embed them in R",
        #                 "Markdown documents or build dashboards. You can also",
        #                 "extend your Shiny apps with CSS themes, htmlwidgets",
        #                 "and JavaScript actions."
        #             ),
        #             tags$cite("@rstudio")
        #         )
        #     )
        # ),
        # tags$section(
        #     tags$h2("Input Fields"),
        #     input(
        #         inputId = "user",
        #         type = "text",
        #         label = "Username",
        #         icon = rheroicons::rheroicon(name = "user_circle")
        #     ),
        #     input(
        #         inputId = "pwd",
        #         type = "password",
        #         label = "Password",
        #         icon = rheroicons::rheroicon(name = "lock_closed")
        #     ),
        #     tags$button(
        #         id = "clear",
        #         class = "shiny-bound-input action-button",
        #         "Clear"
        #     ),
        #     tags$button(
        #         id = "reset",
        #         class = "shiny-bound-input action-button",
        #         "Reset"
        #     ),
        #     tags$button(
        #         id = "invalidate",
        #         class = "shiny-bound-input action-button",
        #         "Invalidate"
        #     )
        # ),
    ),
    tags$script(src = "iceComponents/iceComponents.min.js")
)

# server
server <- function(input, output, session) {
    observe({
        print(input$pwd)
    })

    observeEvent(input$clear, {
        clear_input(inputId = "user")
        clear_input(inputId = "pwd")
    })

    observeEvent(input$reset, {
        reset_input(inputId = "user")
        reset_input(inputId = "pwd")
    })

    observeEvent(input$invalidate, {
        invalidate_input(
            inputId = "user",
            error = "username is wrong"
        )
        invalidate_input(
            inputId = "pwd",
            error = "Password is wrong"
        )
    })
}


# app
shinyApp(ui, server)