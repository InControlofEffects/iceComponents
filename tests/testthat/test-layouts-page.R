#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-layouts-page.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-10-08
#' MODIFIED: 2021-03-27
#' PURPOSE: unit tests for page component
#' STATUS: working
#' PACKAGES: usethis; iceComponents
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

context("Page Layout")


#' ~ 1 ~
#' Confirm markup of generic use
test_that("Default use is valid", {
    p <- page(inputId = "test-page")
    expect_identical(
        object = c(
            p$name,
            names(p$attribs),
            p$attribs$id,
            p$attribs$class
        ),
        expected = c(
            "div",
            "id",
            "class",
            "test-page",
            "page"
        ),
        label = "Default output does not have expected elements"
    )
})

#' ~ 2 ~
#' Css classnames are properly added
test_that("CSS classes are properly added", {
    p <- page(inputId = "test-page", class = "dark-theme hidden")
    expect_identical(
        object = p$attribs$class,
        expected = "page dark-theme hidden",
        label = "Css classnames are not properly added to container"
    )
})


#' ~ 3 ~
#' Confirm that children are properly nested
test_that("Children elements are properly added", {
    p <- page(
        inputId = "test-page",
        tags$h1("Hello, world!"),
        tags$p("This is a test")
    )
    expect_equal(
        object = length(p$children),
        expected = 2,
        label = "Children are not properly nested"
    )
})