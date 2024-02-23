## Problem

You need to list and extract files from Amazon AWS cloud storage.

## Solution

This solution uses the `aws.s2`, `dplyr`, `knitr` and `stringr`
libraries. The code chunk below checks for installation and, if needed,
will install the libraries and load them.

#### Load Libraries

``` r
packages <- c("aws.s3", "dplyr", "knitr", "stringr")

installed_packages <- packages %in% rownames(installed.packages())

if(any(installed_packages == FALSE)) {
  
  install.packages(packages[!installed_packages])
  
}

invisible(lapply(packages, library, character.only = TRUE))
```

#### List Files

This example will use data collected and stored by Divvy, a
Chicago-based bike sharing service and can be found
[here](https://divvy-tripdata.s3.amazonaws.com/index.html).

The following code chunk uses the `aws.s3` library to create and display
a data frame listing the files in the divvy-tripdata AWS bucket.

``` r
files <- as.data.frame(get_bucket("divvy-tripdata")) %>%
  rename(bucket = Bucket,
         key = Key,
         date_last_modified = LastModified,
         size_in_bytes = Size) %>%
  mutate(size_in_bytes = as.numeric(size_in_bytes),
         size_in_megabytes = round(size_in_bytes / 1e+06, 1),
         date_last_modified = as.Date(date_last_modified)) %>%
  select(bucket,
         key,
         size_in_megabytes,
         date_last_modified) %>%
  arrange(key)
```

Here’s the list in a table.

``` r
kable(files,
      col.names = c("Bucket",
                    "File Name",
                    "File Size (Mb)",
                    "Date Last Modified"),
      caption = "Cyclistic Data Files",
      format.args = list(big.mark = ","),
      align = c("l", "l", "r", "r"))
```

| Bucket         | File Name                          | File Size (Mb) | Date Last Modified |
|:------------|:----------------------------|------------:|----------------:|
| divvy-tripdata | 202004-divvy-tripdata.zip          |            3.3 |         2020-06-01 |
| divvy-tripdata | 202005-divvy-tripdata.zip          |            8.0 |         2020-06-01 |
| divvy-tripdata | 202006-divvy-tripdata.zip          |           14.7 |         2020-07-06 |
| divvy-tripdata | 202007-divvy-tripdata.zip          |           23.6 |         2020-08-12 |
| divvy-tripdata | 202008-divvy-tripdata.zip          |           27.9 |         2020-09-04 |
| divvy-tripdata | 202009-divvy-tripdata.zip          |           24.3 |         2020-10-13 |
| divvy-tripdata | 202010-divvy-tripdata.zip          |           17.9 |         2020-11-04 |
| divvy-tripdata | 202011-divvy-tripdata.zip          |           11.7 |         2020-12-04 |
| divvy-tripdata | 202012-divvy-tripdata.zip          |            4.8 |         2021-01-05 |
| divvy-tripdata | 202101-divvy-tripdata.zip          |            3.7 |         2021-02-04 |
| divvy-tripdata | 202102-divvy-tripdata.zip          |            1.9 |         2021-03-10 |
| divvy-tripdata | 202103-divvy-tripdata.zip          |            8.0 |         2021-04-08 |
| divvy-tripdata | 202104-divvy-tripdata.zip          |           11.8 |         2021-05-07 |
| divvy-tripdata | 202105-divvy-tripdata.zip          |           18.9 |         2021-06-11 |
| divvy-tripdata | 202106-divvy-tripdata.zip          |           26.5 |         2021-07-15 |
| divvy-tripdata | 202107-divvy-tripdata.zip          |           29.7 |         2021-08-14 |
| divvy-tripdata | 202108-divvy-tripdata.zip          |           27.9 |         2021-09-08 |
| divvy-tripdata | 202109-divvy-tripdata.zip          |           27.5 |         2021-10-04 |
| divvy-tripdata | 202110-divvy-tripdata.zip          |           23.0 |         2021-11-04 |
| divvy-tripdata | 202111-divvy-tripdata.zip          |           13.8 |         2021-12-08 |
| divvy-tripdata | 202112-divvy-tripdata.zip          |            9.3 |         2022-01-06 |
| divvy-tripdata | 202201-divvy-tripdata.zip          |            3.8 |         2022-02-02 |
| divvy-tripdata | 202202-divvy-tripdata.zip          |            4.3 |         2022-03-02 |
| divvy-tripdata | 202203-divvy-tripdata.zip          |           10.4 |         2022-04-06 |
| divvy-tripdata | 202204-divvy-tripdata.zip          |           13.4 |         2022-05-03 |
| divvy-tripdata | 202205-divvy-tripdata.zip          |           22.7 |         2022-06-04 |
| divvy-tripdata | 202206-divvy-tripdata.zip          |           26.9 |         2022-07-15 |
| divvy-tripdata | 202207-divvy-tripdata.zip          |           29.5 |         2022-08-05 |
| divvy-tripdata | 202208-divvy-tripdata.zip          |           27.1 |         2022-09-08 |
| divvy-tripdata | 202209-divvy-tripdata.zip          |           25.3 |         2022-10-11 |
| divvy-tripdata | 202210-divvy-tripdata.zip          |           20.1 |         2022-11-08 |
| divvy-tripdata | 202211-divvy-tripdata.zip          |           12.4 |         2022-12-05 |
| divvy-tripdata | 202212-divvy-tripdata.zip          |            6.7 |         2023-01-03 |
| divvy-tripdata | 202301-divvy-tripdata.zip          |            6.8 |         2023-02-07 |
| divvy-tripdata | 202302-divvy-tripdata.zip          |            7.1 |         2023-03-07 |
| divvy-tripdata | 202303-divvy-tripdata.zip          |           10.3 |         2023-04-06 |
| divvy-tripdata | 202304-divvy-tripdata.zip          |           15.4 |         2023-05-04 |
| divvy-tripdata | 202305-divvy-tripdata.zip          |           23.4 |         2023-06-08 |
| divvy-tripdata | 202306-divvy-tripdata.zip          |           25.7 |         2023-07-13 |
| divvy-tripdata | 202307-divvy-tripdata.zip          |           28.5 |         2023-08-14 |
| divvy-tripdata | 202308-divvy-tripdata.zip          |           28.6 |         2023-10-12 |
| divvy-tripdata | 202309-divvy-tripdata.zip          |           24.9 |         2023-10-12 |
| divvy-tripdata | 202310-divvy-tripdata.zip          |           19.1 |         2023-11-13 |
| divvy-tripdata | 202311-divvy-tripdata.zip          |           13.2 |         2023-12-05 |
| divvy-tripdata | 202312-divvy-tripdata.zip          |            8.4 |         2024-01-04 |
| divvy-tripdata | 202401-divvy-tripdata.zip          |            5.5 |         2024-02-05 |
| divvy-tripdata | Divvy_Stations_Trips_2013.zip      |           14.6 |         2020-01-24 |
| divvy-tripdata | Divvy_Stations_Trips_2014_Q1Q2.zip |           18.0 |         2020-01-24 |
| divvy-tripdata | Divvy_Stations_Trips_2014_Q3Q4.zip |           30.8 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2015-Q1Q2.zip          |           22.4 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2015_Q3Q4.zip          |           43.6 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2016_Q1Q2.zip          |           31.0 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2016_Q3Q4.zip          |           57.2 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2017_Q1Q2.zip          |           42.0 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2017_Q3Q4.zip          |           57.5 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2018_Q1.zip            |           10.0 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2018_Q2.zip            |           27.2 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2018_Q3.zip            |           38.8 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2018_Q4.zip            |           16.7 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2019_Q1.zip            |            9.6 |         2021-11-08 |
| divvy-tripdata | Divvy_Trips_2019_Q2.zip            |           28.7 |         2021-11-08 |
| divvy-tripdata | Divvy_Trips_2019_Q3.zip            |           42.4 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2019_Q4.zip            |           18.4 |         2020-01-24 |
| divvy-tripdata | Divvy_Trips_2020_Q1.zip            |           15.9 |         2020-05-27 |
| divvy-tripdata | index.html                         |            0.0 |         2020-01-24 |

Cyclistic Data Files

The bucket contains 65 zip files with last modified dates ranging from
2020-01-24 to 2024-02-05.

There are some inconsistencies in files names and time periods covered,
e.g. some monthly and others quarterly. Data is available beginning in
January 2013 and is refreshed monthly.

#### Download Files

For this example, I will download the January 2024 file.

The code chunk below saves the zip and source files in a project
subfolder.

I am using a sub-string to filter out all files except those with 202401
in the file name.

``` r
target_files <- files %>%
  filter(str_sub(key, 1, 6) == "202401")

for(i in 1:nrow(target_files)) {

  save_object(object = target_files[i,]$key,
              bucket = target_files[i,]$bucket,
              file = paste("../inst/extdata/zip/", target_files[i,]$key, sep = ""),
              overwrite = TRUE)
  
}
```

#### Extract Files

The following code chunk extracts the source files from the zip files
and saves them.

``` r
source_files <- list.files("../inst/extdata/zip", full.names = TRUE)

for(i in 1:length(source_files)) {

  unzip(zipfile = source_files[i],
        exdir = "../inst/extdata/divvy",
        overwrite = TRUE)
  
}
```

#### Cleanup Folder

To cleanup the source directory, I remove extracted MacOS versions of
the source files, which I don’t need.

``` r
unlink("../inst/extdata/divvy/__MACOSX", recursive = TRUE)
```

## Discussion

When downloading multiple files, you can use [this
code](https://github.com/dtminnick/codebits/blob/main/R/file_reconciliation.md)
to perform an automated reconciliation and combine the files into a
single output file.
