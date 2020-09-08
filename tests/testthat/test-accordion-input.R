#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-accordion-input.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-08-11
#' MODIFIED: 2020-09-08
#' PURPOSE: tests for accordion input component
#' STATUS: on.going
#' PACKAGES: testthat; iceComponents
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# init
context("Accordion Input Component")


# set default component
el <- accordion_input(
    inputId = "what-is-shiny",
    title = "Shiny",
    checked = TRUE,
    content = tagList(
        tags$p(
            "Shiny is an R package that makes it easy to build",
            "interactive web apps straight from R. You can host",
            "standalone apps on a webpage or embed them in R Markdown",
            "documents or build dashboards. You can also extend your",
            "Shiny apps with CSS themes, htmlwidgets, and JavaScript",
            "actions."
        ),
        tags$cite("Rstudio.org")
    )
)

#' ~ 1 ~
#' Validate Markup
#' confirm that the default rendering returns the proper elements
#' div >
#'     - input + label + button (icon is not evaluated
#'     - section
test_that("Markup assessment", {
    expect_equal(
        object = c(
            el$name,
            el$children[[1]][[1]]$attribs$type,
            el$children[[1]][[2]]$name,
            el$children[[1]][[3]]$name
        ),
        expected = c("div", "checkbox", "label", "button"),
        label = "Default markup is not correct"
    )
})


#' ~ 2 ~
#' Validate Checked Status
#' confirm that `checked = TRUE` is properly added
test_that("Validating checked = TRUE", {
    expect_equal(
        object = c(
            el$attribs$`data-accordion-initial-state`,
            ifelse(
                length(el$children[[1]][[1]]$attribs$checked) == 1,
                el$children[[1]][[1]]$attribs$checked,
                "false"
            )
        ),
        expected = c("true", "true"),
        label = "The default checked state is not added"
    )
})