% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/error_text.R
\name{error_text}
\alias{error_text}
\title{error_text}
\usage{
error_text(inputId, class = NULL)
}
\arguments{
\item{inputId}{a ID for the error message element}

\item{class}{optional CSS classes to include}
}
\description{
Create a text element for displaying inline or text only error messages.
By default, this creates an empty element that is hidden by default.
}
\examples{
if (interactive()) {
  library(shiny)

  ui <- tagList(
    iceComponents::use_iceComponents(),
    iceComponents::container(
      iceComponents::page(
        tags$h2("My App"),
        tags$p("Please wait while the app loads..."),
        iceComponents::error_text(
          inputId = "shiny-server-error"
        )
      )
    )
  )

  server <- function() {
    err <- function() {
       Sys.sleep(2)
       iceComponents::show_error_text(
         inputId = "shiny-server-error",
         error = "Internal Server Error (500)"
       )
    }

    err()

  }

  shinyApp(ui, server)

}

}
