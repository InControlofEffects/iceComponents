#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-accordion.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-08-11
#' MODIFIED: 2020-08-11
#' PURPOSE: unit testing for accordion component (non-input)
#' STATUS: on.going
#' PACKAGES: testthat; iceComponents
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# init
context("Accordion Component")


# render default component
default_component <- accordion(
    inputId = "testAccordion",
    title = "What is an accordion component?",
    content = "Accordion components are collapsible sections."
)


#' ~ 1 ~
#' Initial Validation of Component in Default State
#' confirm that the output has the correct parent elements (heading and section)
test_that("Component has required parent elements", {
    expect_equal(
        object = c(
            default_component$children[[1]]$name,
            default_component$children[[2]]$name
        ),
        expected = c("h3", "section"),
        label = "Default structure does not have expected elements"
    )
})


#' ~ 2 ~
#' Validate Heading
#' Confirm that the heading element has the required elements
#' Markup: heading > button > span + icon
test_that("Heading has required child elements", {
    markup <- c(
        default_component$children[[1]]$name,
        default_component$children[[1]]$children[[1]]$name,
        default_component$children[[1]]$children[[1]]$children[[1]]$name,
        default_component$children[[1]]$children[[1]]$children[[2]]$name
    )
    expect_equal(
        object = markup,
        expected = c("h3", "button", "span", "svg"),
        label = "Heading does not have expected child elements"
    )
})


#' ~ 3 ~
#' Validate Heading Levels
#' Confirm that heading level accepts different levels
test_that("Heading is accurately changed", {
    h <- lapply(seq_along(1:6), function(i) {
        accordion(
            inputId = "testAccordion",
            title = "What is an accordion component?",
            content = "Accordion components are collapsible sections.",
            heading_level = paste0("h", i)
        )$children[[1]]$name
    })
    expect_equal(
        object = as.character(h),
        expected = c("h1", "h2", "h3", "h4", "h5", "h6"),
        label = "Modifying Heading level is not done accurately"
    )
})
