#' checkbox_group
#'
#' @description Create a custom checkbox input group
#'
#' @param inputId a unique id for the input group
#' @param title a title for the inputs
#' @param caption an optional caption to display
#' @param choices an array of choices
#' @param values an array of values to display
#' @param checked an array of logical values to check an input at start
#'
#' @keywords iceComponents checkboxgroup
#' @importFrom shiny tagList tags
#' @export
checkbox_group <- function(
    inputId,
    title,
    caption = NULL,
    choices,
    values = NULL,
    checked = FALSE
) {

    # process input data
    d <- list(choices = choices, values = choices)
    if (!is.null(values)) d$values <- values
    if (length(checked) == 1) {
        d$checked <- rep(checked, length(choices))
    } else {
        d$checked <- checked
    }

    # generate markup for parent element
    parent <- tags$fieldset(
        id = inputId,
        class = "checkbox__group",
        tags$legend(
            class = "checkbox__title",
            title
        ),
        checkbox_group_helpers$checkbox_set(
            inputId = inputId,
            data = d
        )
    )

    # attach caption
    if (!is.null(caption)) {
        parent$children <- tagList(
            tags$p(
                class = "checkbox__caption",
                caption
            ),
            parent$children
        )
    }

    # return
    return(parent)
}


#' Reset Checkbox Group
#'
#' Reset a checkbox group to it's initial state.
#'
#' @param inputId ID of the Checkbox group to reset
#'
#' @keywords iceComponents checkboxgroup reset
#' @export
reset_checkbox_group <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = "reset"
    )
}


#' Clear Checkbox Group
#'
#' Clear all checked options
#'
#' @param inputId ID of the Checkbox group to clear
#'
#' @keywords iceComponetns checkboxgroup clear
#' @export
clear_checkbox_group <- function(inputId) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = "clear"
    )
}