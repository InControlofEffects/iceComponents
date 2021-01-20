#' accordion_input_group
#'
#' Create a container for multiple accordion inputs
#'
#' @param inputId a unique identifier for the accordion group
#' @param max_choices a limit on number of choices selected
#' @param ... additional ui content
#'
#' @return A container for accordion inputs
#'
#' @export
accordion_input_group <- function(inputId, ...) {
    htmltools::tags$fieldset(
        id = inputId,
        class = "accordion__input___group",
        ...
    )
}