#'////////////////////////////////////////////////////////////////////////////
#' FILE: test-set-doc-attribs.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-10-08
#' MODIFIED: 2020-10-08
#' PURPOSE: unit tests for set document attribs functions
#' STATUS: in.progress
#' PACKAGES: testthat; iceComponents
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

context("Set Document Attributes")

#' ~ 1 ~
#' Default use contains expected markup
test_that("Default use is valid", {
    el <- set_doc_attribs()
    expect_setequal(
        object = c(
            el$name,
            names(el$attribs),
            el$attribs$id,
            el$attribs$style,
            el$attribs$`data-html-lang`,
            el$attribs$`data-html-dir`
        ),
        expected = c(
            "span",
            "id",
            "style",
            "data-html-lang",
            "data-html-dir",
            "icecomponents__meta",
            "display: none;",
            "en",
            "ltr"
        )
    )
})


#' ~ 2 ~
#' Expect Error for `dir`
test_that("Correct errors are thrown", {
    expect_error(
        object = set_doc_attribs(lang = "en", "1234")
    )
})