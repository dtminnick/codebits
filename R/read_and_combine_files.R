
# Iterate through a set of files in a folder and combine the source data in the
# files into a single data frame.

# Assumes the files are of the same structure.

files <- list.files("./inst/extdata/data", full.names = TRUE)

readings <- data.frame()

for(f in 1:length(files)) {

        source <- read.csv(files[f],
                           header = FALSE,
                           sep = ",",
                           stringsAsFactors = FALSE,
                           na.strings = c(""),
                           skipNul = TRUE)

        source <- cbind(source, f)

        readings <- rbind(readings, source)

}
