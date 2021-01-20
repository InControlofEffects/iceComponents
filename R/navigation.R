#' Page Navigation
#'
#' Create a container for page navigation buttons. The `navigation` function
#' returns a container for the page navigation buttons.
#'
#' @param ... Navigation buttons (`back_btn`, `forward_btn`)
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(iceComponents)
#'
#'   # define app
#'   ui <- tagList(
#'     use_iceComponents(),
#'     container(
#'       tags$h2("Count by 5's"),
#'       uiOutput("count"),
#'       navigation(
#'         back_btn(inputId = "subtract", label = "Subtract 5"),
#'         back_btn(inputId = "add", label = "Add 5"),
#'       )
#'     )
#'   )
#'
#'   # dynamically render pages based on page navigation
#'   server <- function(input, output) {
#'
#'     counter <- reactiveVal(1)
#'
#'     observeEvent(input$subtract, {
#'       counter(counter() - 5)
#'       output$counter <- renderUI(tags$p(counter()))
#'     })
#'
#'     observeEvent(input$add, {
#'       counter(counter() + 5)
#'       output$count <- renderUI(tags$p(counter()))
#'     })
#'
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @export
navigation <- function(...) {
    elems <- htmltools::tagList(...)
    u <- htmltools::tags$ul()
    sapply(seq_len(length(elems)), function(x) {
        u$children[[x]] <<- htmltools::tags$li(
            class = "nav__list__item",
            elems[[x]]
        )
    })

    if (length(elems) == 1) u$attribs$class <- "nav__list single__list"
    if (length(elems) > 1) u$attribs$class <- "nav__list multi__list"

    tags$div(class = "nav__container", u)
}


#' Back Button
#'
#' Create a back button for use in the navigation container. By default,
#' this button renders with the inputId defined as `backBtn`. The button can
#' be accessed in the shiny server via `input$backBtn`. You can also set the
#' button label. The default is `Previous`.
#'
#' @param inputId a unique Id for the button (default `backBtn`)
#' @param label customize the button (default `Previous`)
#'
#' @export
back_btn <- function(inputId = "backBtn", label = "Previous") {
    htmltools::tags$button(
        id = inputId,
        class = "shiny-bound-input action-button ice__btn btn__default",
        rheroicons::rheroicon(
            name = "chevron_left",
            type = "outline"
        ),
        htmltools::tags$span(class = "btn__label", label)
    )
}


#' Forward Button
#'
#' Create a forward button for use in the navigation container. By default,
#' this button renders with the inputId defined as `forwardBtn`. The button can
#' be accessed in the shiny server via `input$forwardBtn`. You can also set the
#' button label. The default is `Next`.
#'
#' @param inputId a unique Id for the button (default `forwardBtn`)
#' @param label set the button label (default `Next`)
#'
#' @export
forward_btn <- function(inputId = "forwardBtn", label = "Next") {
    htmltools::tags$button(
        id = inputId,
        class = "shiny-bound-input action-button ice__btn btn__primary",
        htmltools::tags$span(class = "btn__label", label),
        rheroicons::rheroicon(
            name = "chevron_right",
            type = "outline"
        )
    )
}