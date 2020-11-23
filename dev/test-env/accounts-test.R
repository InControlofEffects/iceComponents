#'////////////////////////////////////////////////////////////////////////////
#' FILE: accounts-test.R
#' AUTHOR: David Ruvolo
#' CREATED: 2020-11-23
#' MODIFIED: 2020-11-23
#' PURPOSE: dev and test accounts management class
#' STATUS: working
#' PACKAGES: R6
#' COMMENTS: NA
#'////////////////////////////////////////////////////////////////////////////

# load pkg
devtools::check_man()

# create new instance
myusers <- accounts$new()


# set configuration
myusers$config(
    name = "myusers",
    version = "1.0.0"
)

# add sample accounts
myusers$add_user(username = "testA", password = "my-test-1111")
myusers$add_user(username = "testB", password = "my-test-2222")
myusers$add_user(username = "testC", password = "my-test-3333")

# view
myusers$print_data()

# write
myusers$save_data(dir = "dev/test-env/")
