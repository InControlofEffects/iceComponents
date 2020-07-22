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

# files to ignore
ignore <- c(
    ".Rhistory",
    ".RData",
    ".Rproj.user",
    ".DS_STORE",
    "node_modules",
    ".cache"
)

# init package
usethis::use_git()
usethis::use_github_action_check_standard()
usethis::use_git_ignore(ignores = ignore)
usethis::use_build_ignore(files = ignore)
usethis::use_mit_license(name = "In Control of Effects")
usethis::use_code_of_conduct()


#'//////////////////////////////////////

#' ~ 1 ~
#' Maintaining Package

# declare dependencies (pkgs)
usethis::use_package(package = "htmltools", min_version = TRUE)


# document
devtools::check_man()