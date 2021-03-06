% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/error_text.R
\name{hide_error_text}
\alias{hide_error_text}
\title{hide_error_text}
\usage{
hide_error_text(inputId)
}
\arguments{
\item{inputId}{Id of the error element}
}
\description{
Reset an error text element
}
\examples{
if (interactive()) {
  library(shiny)
  ui <- tagList(
    iceComponents::use_iceComponents(),
    iceComponents::container(
      iceComponents::page(
        tags$h2("My App"),
        iceComponents::error_text(
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
      iceComponents::show_error_text(
        inputId = "shiny-server-error",
        error = "Internal Server Error (500)"
      )
    })

    observeEvent(input$hide, {
      iceComponents::hide_error_text(
        inputId = "shiny-server-error"
      )
    })
  }

  shinyApp(ui, server)

}

}
