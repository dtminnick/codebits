
# Create directories for external data sources.

dir.create("./inst/extdata", recursive = TRUE)

dir.create("./R", recursive = TRUE)

dir.create("./man", recursive = TRUE)

# Remove unwanted files.

file.remove("./R/hello.R")

file.remove("./man/hello.Rd")

# Create additional folders and files.

usethis::use_data_raw()

file.remove("./data-raw/DATASET.R")

file.create("./data-raw/dataset.R")

usethis::use_testthat()

usethis::use_roxygen_md()

usethis::use_pipe(); devtools::document()
