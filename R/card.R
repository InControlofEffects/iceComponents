#' Card
#'
#' Create a generic text card that displays an icon and title side by side.
#' The title can be changed from the shiny server using the function
#' `update_card`.
#'
#' @param inputId a unique ID for the card
#' @param text text to display
#' @param icon_name an rheroicons icon name
#' @param icon_type an rheroicons icon type ("output" or "solid")
#' @param class css classes to apply to the card
#'
#' @references
#' \url{https://github.com/davidruvolo51/rheroicons}
#'
#' @export
card <- function(
    inputId,
    text,
    icon_name = "check_circle",
    icon_type = "outline",
    class = NULL
) {
    css <- "ice__card"
    if (!is.null(class)) css <- paste0(css, " ", class)

    tags$div(
        id = inputId,
        class = css,
        rheroicons::rheroicon(
            name = icon_name,
            type = icon_type,
            classnames = "ice__card__icon"
        ),
        tags$p(
            class = "ice__card__label",
            HTML(text)
        )
    )
}


#' Update Card
#'
#' Update the text of card
#'
#' @param inputId the ID of the card to update
#' @param text a string containing a title to send to the card
#'
#' @export
update_card <- function(inputId, text) {
    session <- shiny::getDefaultReactiveDomain()
    session$sendInputMessage(
        inputId = inputId,
        message = list(
            text = text
        )
    )
}