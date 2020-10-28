#'////////////////////////////////////////////////////////////////////////////
#' FILE: dev.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-07-22
#' MODIFIED: 2020-10-12
#' PURPOSE: package manager
#' STATUS: ongoing
#' PACKAGES: usethis; remotes; pkgbump
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
    "yarn-error.log"
)

usethis::use_git_ignore(ignores = gitignore)
usethis::use_build_ignore(
    files = c(
        gitignore,
        "config",
        "dev",
        "src",
        "node_modules",
        ".babelrc",
        ".gitignore",
        ".pkgbump.json",
        ".Rbuildignore",
        ".travis.yml",
        "iceComponents.code-workspace",
        "incontrolofeffects.png",
        "package.json",
        "postcss.config.js",
        "webpack.config.js",
        "yarn.lock"
    )
)

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

# run dev app
shiny::runApp(appDir = "dev/shiny-dev/", port = 8000, launch.browser = FALSE)


# pkgbump
pkgbump::set_pkgbump(
    files = c(
        "DESCRIPTION",
        "package.json",
        "R/use_iceComponents.R"
    )
)

pkgbump::pkgbump(version = "0.0.8")