#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-layouts-main.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-10-08
#' MODIFIED: 2020-10-08
#' PURPOSE: unit tests for container component
#' STATUS: working
#' PACKAGES: usethis; iceComponents
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

context("Container Layout")


#' ~ 1 ~
#' Confirm markup of generic use
test_that("Default use is valid", {
    c <- container(tags$h1("test"))
    expect_identical(
        object = c(
            c$name,
            names(c$attribs),
            c$attribs$id,
            c$attribs$class
        ),
        expected = c(
            "main",
            "id",
            "class",
            "main",
            "main"
        ),
        label = "Default output does not have expected elements"
    )
})

#' ~ 2 ~
#' Css classnames are properly added to parent element
test_that("CSS classes are properly added", {
    c <- container(class = "dark-theme hidden", tags$h1("test"))
    expect_identical(
        object = c$attribs$class,
        expected = "main dark-theme hidden",
        label = "Css classnames are not properly added to container"
    )
})

#' ~ 2 ~
#' Confirm that children are properly nested
test_that("Children elements are properly added", {
    c <- container(tags$h1("Hello, world!"), tags$p("This is a test"))
    expect_equal(
        object = length(c$children),
        expected = 2,
        label = "Children are not properly nested"
    )
})