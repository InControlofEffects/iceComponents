#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-card.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-10-10
#' MODIFIED: 2020-10-10
#' PURPOSE: unit test for card component
#' STATUS: working
#' PACKAGES: NA
#' COMMENTS: Na
#'////////////////////////////////////////////////////////////////////////////

context("Text Cards")

#' ~ 1 ~
#' Evaluate default use
test_that("Default use returns expected markup", {
    c <- card(inputId = "greeting-card", text = "Good morning!")
    expect_equal(
        object = c(
            c$name,
            names(c$attribs),
            length(c$children)
        ),
        expected = c(
            "div",
            "id",
            "class",
            2
        ),
        label = "Unexpected markup in card component"
    )
})


#' ~ 2 ~
#' Css names are properly added
test_that("CSS classes are added to parent element", {
    c <- card(
        inputId = "greeting-card",
        text = "Good Morning!",
        class = "light-theme"
    )
    expect_equal(
        object = c$attribs$class,
        expected = "ice__card light-theme"
    )
})