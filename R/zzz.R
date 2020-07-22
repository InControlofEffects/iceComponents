# add resources
.onLoad <- function(libname, pkgname) {
    addResourcePath(
        prefix = "iceComponents",
        directoryPath = system.file(
            "iceComponents",
            package = "iceComponents"
        )
    )
}

# remove resources
.onUnload <- function(libname, pkgname) {
    removeResourcePath(prefix = "iceComponents")
}