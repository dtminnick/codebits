
library("ggplot2")

data <- data.frame(Date = as.Date(c("2023-10-01", "2023-10-02", "2023-10-03", "2023-10-04", "2023-10-05")),
                   Open = c(100, 102, 105, 103, 108),
                   High = c(105, 106, 107, 105, 110),
                   Low = c(98, 101, 104, 101, 105),
                   Close = c(104, 103, 106, 104, 107))

ggplot(data, aes(x = Date)) +
    geom_segment(aes(xend = Date, y = Low, yend = High), color = "black") +
    geom_segment(aes(x = Date, y = Open, xend = Date, yend = Close), color = "black") +
    geom_point(aes(x = Date, y = Open), shape = 4, color = "red", size = 3) +
    geom_point(aes(x = Date, y = Close), shape = 4, color = "green", size = 3) +
    theme_minimal() +
    labs(title = "Candlestick Chart", x = "Date", y = "Price") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
