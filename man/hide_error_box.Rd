% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/error_box.R
\name{hide_error_box}
\alias{hide_error_box}
\title{hide_error_box}
\usage{
hide_error_box(inputId)
}
\arguments{
\item{inputId}{ID of the error box to hide}
}
\description{
Hide an error box
}
\examples{
if (interactive()) {
  library(shiny)
  ui <- tagList(
    iceComponents::use_iceComponents(),
    iceComponents::container(
      iceComponents::page(
        tags$h2("My App"),
        iceComponents::error_box(
          inputId = "shiny-server-error"
        ),
        tags$button(
          id = "show",
          class = "shiny-bound-input action-button",
          "Do Something"
        ),
        tags$button(
          id = "hide",
          class = "shiny-bound-input action-button",
          "Hide Error"
        )
      )
    )
  )

  server <- function() {
    observeEvent(input$show, {
      iceComponents::show_error_box(
        inputId = "shiny-server-error",
        error = "Internal Server Error (500)"
      )
    })

    observeEvent(input$hide, {
      iceComponents::hide_error_box(
        inputId = "shiny-server-error"
      )
    })
  }

  shinyApp(ui, server)

}

}
