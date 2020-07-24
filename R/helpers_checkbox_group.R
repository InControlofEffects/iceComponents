#' checkbox_group_helpers
#'
#' Create a series of secondary functions that generate the required elements
#' for creating a checkbox input component. The following functions are added
#' to a nested list object and used in the main function.
#'
#' @noRd
checkbox_group_helpers <- list()


#' checkbox_option
#'
#' Create a single checkbox option based
#' @param inputId a unique id for the checkbox option
#' @param choice a name for the option
#' @param value an value for the option (is choice by default)
#' @param checked if TRUE, then input will be checked at render
#' @importFrom htmltools tags
#' @noRd
checkbox_group_helpers$checkbox_option <- function(
    inputId,
    choice,
    value,
    checked
) {

    # create input
    i <- tags$input(
        id = choice,
        class = "option__checkbox",
        type = "checkbox",
        name = inputId
    )

    # add checked when TRUE
    if (checked) i$attribs$checked <- "true"

    # generate markup
    el <- tags$div(
        class = "checkbox__group__option",
        i,
        tags$label(
            `for` = choice,
            class = "option__label",
            choice
        )
    )

    return(el)
}


#' checkox_set
#'
#' Create a series of checkbox inputs
#' @param inputId an ID for the group of inputs
#' @param data an object containing choices, values, checked status
#' @noRd
checkbox_group_helpers$checkbox_set <- function(inputId, data) {
    children <- list()
    lapply(seq_len(length(data$choices)), function(index) {
        children[[index]] <<- checkbox_group_helpers$checkbox_option(
            inputId = inputId,
            choice = data$choice[[index]],
            value = data$value[[index]],
            checked = data$checked[[index]]
        )
    })
    return(children)
}
