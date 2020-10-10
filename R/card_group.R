#' Container for cards
#'
#' A layout container for grouping more than one card
#'
#' @param ... cards and other UI content
#' @param class a string containing one or more css classes
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::container(
#'       iceComponents::page(
#'         tags$h2("Study Progress", style = "text-align: center;"),
#'         iceComponents::card_group(
#'           iceComponents::card(
#'             inputId = "experiments",
#'             text = as.character(
#'               tagList(
#'                 tags$strong("200"),
#'                 "experiments performed"
#'               )
#'             ),
#'             icon_name = "beaker",
#'             icon_type = "solid"
#'           ),
#'           iceComponents::card(
#'             inputId = "recruitment",
#'             text = as.character(
#'               tagList(
#'                 "We recruited",
#'                 tags$strong("62"),
#'                 "new participants"
#'               )
#'             ),
#'             icon_name = "user_add",
#'             icon_type = "outline"
#'           ),
#'           iceComponents::card(
#'             inputId = "statisfaction",
#'             text = as.character(
#'               tagList(
#'                 tags$strong("98.9%"),
#'                 "study satisfaction rate!"
#'               )
#'             ),
#'             icon_name = "emoji_happy",
#'             icon_type = "outline"
#'           )
#'         )
#'       )
#'     )
#'   )
#' }
#'
#' @export
card_group <- function(..., class = NULL) {
    css <- "card__group"
    if (!is.null(class)) css <- paste0(css, " ", class)
    tags$div(class = css, ...)
}