#' accounts
#'
#' Methods for creating a user accounts dataset for creating basic
#' "password protected" Shiny application. These methods aren't designed
#' for any rebust applications and should be used for offering very basic
#' authentication. It is not recommended to use these methods for use in
#' applications that store any senstitive information.
#'
#' @description class for account management
accounts <- R6::R6Class(
    classname = "accounts",
    public = list(
        #' @description config
        #' @param name name of the accounts database
        #' @param version db version
        config = function(name, version) {
            private$name <- name
            private$version <- version
        },
        #' @description add_user
        #' @param username account name
        #' @param password account password
        #' @param type account type; developer defined
        add_user = function(username, password, type = "standard") {
            private$data <- rbind(
                private$data,
                data.frame(
                    id = paste0(sodium::random(n = 16), collapse = ""),
                    name = private$name,
                    version = private$version,
                    created = Sys.time(),
                    updated = NA,
                    username = username,
                    password = sodium::password_store(password = password),
                    type = type
                )
            )
        },
        #' @description remove_user
        #' @param username name for the account
        remove_user = function(username) {
            usr <- private$data[private$data$username == username, ]
            if (NROW(usr) == 0) {
                message("Error: ", "'", username, "' does not exist")
            }
            if (NROW(usr) == 1) {
                message("Removed: '", username, "'")
                private$data <- private$data[!private$data$username == usr, ]
            }
        },
        #' @description reset_password
        #' @param username account name
        #' @param password account password
        reset_password = function(username, password) {
            usr <- private$data[private$data$username == username, ]
            if (NROW(usr) == 0) {
                message("Error: ", "'", username, "' does not exist")
            }
            if (NROW(usr) == 1) {
                message("Updated Password for '", username, "'")
                private$data[
                    private$data$username == username,
                    c("password", "updated")
                ] <- c(
                    sodium::password_store(password = password),
                    Sys.time()
                )
            }
        },
        #' @description print dataset
        print_data = function() {
            private$data
        },
        #' @description save data
        #' @param dir output path
        save_data = function(dir) {
            saveRDS(private$data, paste0(dir, "/", private$name, ".RDS"))
        }
    ),
    private = list(
        name = NA,
        version = NA,
        data = data.frame()
    )
)