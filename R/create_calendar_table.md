## Problem

You need to create a calendar dimension table to support a data analysis
or business intelligence project.

## Solution

#### Load Libraries

This solution uses the `dplyr`, `knitr`, `lubridate` and `stringr`
libraries. The code chunk below checks for installation and, if needed,
will install the libraries and load them. The `ggplot` library is used
to generate the plot at the end of this example.

``` r
packages <- c("dplyr", "knitr", "lubridate", "stringr")

installed_packages <- packages %in% rownames(installed.packages())

if(any(installed_packages == FALSE)) {
  
  install.packages(packages[!installed_packages])
  
}

invisible(lapply(packages, library, character.only = TRUE))
```

#### Set Date Range

Set the start and end dates for the table.

``` r
start_date <- as.Date("2022-01-01")
end_date <- as.Date("2022-12-31")
```

#### Create Data Frame

Create the data frame using the date sequence.

``` r
calendar <- data.frame(date = seq.Date(start_date, 
                                       end_date, 
                                       by = "1 day"))
```

#### Add Variables

Add date-related variables to the data frame.

``` r
calendar <- calendar %>%
  mutate(year = year(date),
         quarter = quarter(date),
         month = month(date),
         week = week(date),
         day_of_month = day(date),
         year_and_quarter = paste(year(date), 
                                  "-",
                                  str_pad(quarter(date), 2, "left", "0"),
                                  sep = ""),
         year_and_month = paste(year(date), 
                                "-",
                                str_pad(month(date), 2, "left", "0"),
                                sep = ""),
         month_long_name = month(date, TRUE, FALSE),
         month_short_name = month(date, TRUE, TRUE),
         day = wday(date),
         day_long_name = wday(date, TRUE, FALSE),
         day_short_name = wday(date, TRUE, TRUE))
```

Here’s the first ten rows of the table.

``` r
kable(head(calendar, 10),
      col.names = c("Date", "Year", "Quarter", "Week",
                    "Month", "Day of Month", "Year and Quarter", 
                    "Year and Month", "Month Long", "Month Short", 
                    "Day", "Day Long", "Day Short"),
      caption = "Calendar Table",
      align = c("l", "r", "r", "r",
                "r", "r", "r", 
                "r", "r", "r",
                "r", "r", "r"))
```

| Date       | Year | Quarter | Week | Month | Day of Month | Year and Quarter | Year and Month | Month Long | Month Short | Day |  Day Long | Day Short |
|:------|---:|----:|---:|---:|------:|--------:|-------:|------:|------:|--:|-----:|-----:|
| 2022-01-01 | 2022 |       1 |    1 |     1 |            1 |          2022-01 |        2022-01 |    January |         Jan |   7 |  Saturday |       Sat |
| 2022-01-02 | 2022 |       1 |    1 |     1 |            2 |          2022-01 |        2022-01 |    January |         Jan |   1 |    Sunday |       Sun |
| 2022-01-03 | 2022 |       1 |    1 |     1 |            3 |          2022-01 |        2022-01 |    January |         Jan |   2 |    Monday |       Mon |
| 2022-01-04 | 2022 |       1 |    1 |     1 |            4 |          2022-01 |        2022-01 |    January |         Jan |   3 |   Tuesday |       Tue |
| 2022-01-05 | 2022 |       1 |    1 |     1 |            5 |          2022-01 |        2022-01 |    January |         Jan |   4 | Wednesday |       Wed |
| 2022-01-06 | 2022 |       1 |    1 |     1 |            6 |          2022-01 |        2022-01 |    January |         Jan |   5 |  Thursday |       Thu |
| 2022-01-07 | 2022 |       1 |    1 |     1 |            7 |          2022-01 |        2022-01 |    January |         Jan |   6 |    Friday |       Fri |
| 2022-01-08 | 2022 |       1 |    1 |     2 |            8 |          2022-01 |        2022-01 |    January |         Jan |   7 |  Saturday |       Sat |
| 2022-01-09 | 2022 |       1 |    1 |     2 |            9 |          2022-01 |        2022-01 |    January |         Jan |   1 |    Sunday |       Sun |
| 2022-01-10 | 2022 |       1 |    1 |     2 |           10 |          2022-01 |        2022-01 |    January |         Jan |   2 |    Monday |       Mon |

Calendar Table

## Discussion
