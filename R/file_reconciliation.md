## Problem

You want to perform a reconciliation of record counts between input and
output files when combining multiple files during the pre-processing
step of a data analysis.

## Solution

Use a data frame to capture and reconcile record counts while combining
input files. Generate a table that shows the reconciliation.

#### Load Libraries

This solution uses the `dplyr` and `knitr` libraries. The code chunk
below checks for installation and, if needed, will install the libraries
and load them.

``` r
packages <- c("dplyr", "knitr")

installed_packages <- packages %in% rownames(installed.packages())

if(any(installed_packages == FALSE)) {
  
  install.packages(packages[!installed_packages])
  
}

invisible(lapply(packages, library, character.only = TRUE))
```

#### List Input Files

Start by generating a list of source files to be combined.

The code chunk below lists .csv files in the specified directory.

``` r
input_files <- list.files("../inst/extdata/file_reconciliation", full.names = TRUE, pattern = "\\.csv$")
```

#### Create Data Frames

Create two data frames, a `source` data frame that will contain the
combined data, and a `recon` data frame that will contain record counts.

``` r
source <- data.frame()

recon <- data.frame(input_file = character(0),
                    count = integer(0),
                    cumulative_count = integer(0),
                    source_count = integer(0))
```

#### Set Cumulative Count

Create a cumulative count variable and set it to zero. This variable
will store the cumulative record count for the input files.

``` r
cumulative_count <- 0
```

#### Read and Reconcile Input Files

Use a for loop to reach each of the input files, bind the source data to
the source data frame and capture the record counts for reconciliation.

The code chunk below uses the `read.csv` function of the base R `utils`
library.

Note that this code uses a third, temporary data frame, i.e. `data`, to
store the records of each input file before combining them in the
`source` data frame.

The counts for each input file are taken from the `data` data frame.

``` r
for(i in 1:length(input_files)) {

  data <- read.csv(input_files[i],
                   header = TRUE,
                   sep = ",",
                   na.strings = c(""),
                   stringsAsFactors = FALSE)

  source <- rbind(source, data)

  count <- nrow(data)

  cumulative_count <- cumulative_count + count

  source_count <- nrow(source)
  
  recon <- recon %>%
    add_row(input_file = input_files[i],
            count = count,
            cumulative_count = cumulative_count,
            source_count = source_count)

}
```

#### Generate Reconciliation Table

Generate a table to show the record counts.

``` r
kable(recon,
      col.names = c("Input File",
                    "Input File Count",
                    "Cumulative Input File Count",
                    "Output File Count"),
      caption = "File Reconciliation Table",
      format.args = list(big.mark = ","),
      align = c("l", "r", "r", "r"))
```

| Input File                                                    | Input File Count | Cumulative Input File Count | Output File Count |
|:----------------------------------|----------:|----------------:|----------:|
| ../inst/extdata/file_reconciliation/202210-divvy-tripdata.csv |              218 |                         218 |               218 |
| ../inst/extdata/file_reconciliation/202211-divvy-tripdata.csv |              499 |                         717 |               717 |
| ../inst/extdata/file_reconciliation/202212-divvy-tripdata.csv |              231 |                         948 |               948 |

File Reconciliation Table

## Discussion

If there is a discrepancy between input and output record counts, this
table enables you to pinpoint the specific input file that needs to be
checked.
