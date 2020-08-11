#'////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2020-08-11
#' PURPOSE: package manager
#' STATUS: in.progress
#' PACKAGES: NA
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

#' ~ 0 ~
#' Packge Init

#' usethis::use_github_action_check_standard()
#' usethis::use_travis()
#' usethis::use_namespace()
#' usethis::use_description()
#' usethis::use_news_md()
#' usethis::use_testthat()

# set git ignore files
gitignore <- c(
    ".Rhistory",
    ".RData",
    ".Rproj.user",
    ".DS_STORE",
    "node_modules",
    ".cache",
    "yarn.lock",
    "yarn-error.log"
)

# set rbuild ignore files
rignore <- c(
    gitignore,
    "dev",
    "inst/iceComponents/src",
    ".postcssrc",
    ".babelrc",
    "iceComponents.code-workspace",
    "package.json",
    "incontrolofeffects.png"
)
usethis::use_git_ignore(ignores = gitignore)
usethis::use_build_ignore(files = rignore)

#' ~ 1 ~
#' Maintaining Package

# install
remotes::install_github("davidruvolo51/rheroicons")

# declare dependencies (pkgs)
usethis::use_package(package = "shiny", min_version = TRUE)
usethis::use_package(package = "htmltools", min_version = TRUE)
usethis::use_package(package = "rheroicons", min_version = TRUE)

# document
devtools::check_man()

# check
devtools::check()
devtools::test()