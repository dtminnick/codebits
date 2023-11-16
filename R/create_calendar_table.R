
library("dplyr")
library("lubridate")
library("stringr")

start_date <- as.Date("2021-01-01")
end_date <- as.Date("2023-12-31")

calendar <- data.frame(date = seq.Date(start_date, end_date, by = "1 day"))

calendar <- calendar %>%
    mutate(year = lubridate::year(date),
           quarter = lubridate::quarter(date),
           month = lubridate::month(date),
           week = lubridate::week(date),
           day_of_month = lubridate::day(date),
           year_and_quarter = paste(lubridate::year(date), "-", str_pad(lubridate::quarter(date), 2, "left", "0"), sep = ""),
           year_and_month = paste(lubridate::year(date), "-", str_pad(lubridate::month(date), 2, "left", "0"), sep = ""),
           month_long_name = lubridate::month(date, TRUE, FALSE),
           month_short_name = lubridate::month(date, TRUE, TRUE),
           day = lubridate::wday(date),
           day_long_name = lubridate::wday(date, TRUE, FALSE),
           day_short_name = lubridate::wday(date, TRUE, TRUE))
