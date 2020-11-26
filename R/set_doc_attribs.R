#' Set Document Attributes
#'
#' Easily set document language and direction
#'
#' @param lang the language the document is written in (ie., ISO639 code)
#' @param dir the direction of the content (e.g., left to right)
#'
#' @examples
#' if (interactive()) {
#'   ui <- tagList(
#'     iceComponents::use_iceComponents(),
#'     iceComponents::set_doc_attribs(lang = "en", dir = "ltr"),
#'     iceComponents::main(
#'       tags$h1("This is my cool app")
#'     )
#'   )
#' }
#' @export
set_doc_attribs <- function(lang = "en", dir = "ltr") {

    stopifnot(
        "`lang` must be a character" = is.character(lang),
        "`dir` is must be 'ltr', 'rtl', or 'auto'" = {
            dir %in% c("auto", "ltr", "rtl")
        }
    )

    tags$span(
        id = "icecomponents__meta",
        style = "display: none;",
        `data-html-lang` = lang,
        `data-html-dir` = dir
    )
}