#'////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2020-07-22
#' PURPOSE: package manager
#' STATUS: in.progress
#' PACKAGES: NA
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

#' ~ 99 ~
#' Package Initiation

#' ~ 99a ~
#' Create Ignore Files


# set git ignore files
gitignore <- c(
    ".Rhistory",
    ".RData",
    ".Rproj.user",
    ".DS_STORE",
    "node_modules",
    ".cache"
)

# set rbuild ignore files
rignore <- c(
    gitignore,
    "dev",
    "inst/iceComponents/src",
    ".postcssrc",
    ".babelrc"
)
usethis::use_git_ignore(ignores = gitignore)
usethis::use_build_ignore(files = rignore)

#'//////////////////////////////////////

#' ~ 99b ~
#' Create Package Directories and Files

# init dev dependencies
system("yarn init -y")

# init essential package files
usethis::use_github_action_check_standard()
usethis::use_mit_license(name = "In Control of Effects")
usethis::use_code_of_conduct()
usethis::use_readme_md()

# inst/
sapply(
    c(
        "inst",
        "inst/iceComponents",
        "inst/iceComponents/src",
        "inst/iceComponents/src/scss",
        "inst/iceComponents/src/js"
    ),
    dir.create
)

# src/js
file.create("inst/iceComponents/src/index.js")
file.create("inst/iceComponents/src/js/_accordion.js")
file.create("inst/iceComponents/src/js/_accordion_input.js")
file.create("inst/iceComponents/src/js/_checkbox_group.js")

# src/scss
file.create("inst/iceComponents/src/scss/index.scss")
file.create("inst/iceComponents/src/scss/_accordion.scss")
file.create("inst/iceComponents/src/scss/_accordion_input.scss")
file.create("inst/iceComponents/src/scss/_checkbox_group.scss")


# R/
file.create("R/zzz.R")
file.create("R/use_iceComponents.R")
sapply(c("R/accordion.R", "R/helpers_accordion.R"), file.create)
sapply(c("R/accordion_input.R", "R/helpers_accordion_input.R"), file.create)
sapply(c("R/checkbox_group.R", "R/helpers_checkbox_group.R"), file.create)


# test/
usethis::use_testthat()


# dev/
dir.create("dev/shiny-dev")
file.create("dev/shiny-dev/app.R")

#'//////////////////////////////////////

#' ~ 1 ~
#' Maintaining Package


# declare dependencies (pkgs)
usethis::use_package(package = "shiny", min_version = TRUE)
usethis::use_package(package = "htmltools", min_version = TRUE)
usethis::use_package(package = "rheroicons")


# document
devtools::check_man()