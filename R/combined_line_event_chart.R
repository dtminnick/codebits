
library("dplyr")
library("ggplot2")

set.seed(42)

metric_df <- data.frame(date = seq(as.Date("2023-01-01"), by = "week", length.out = 20),
                        value = cumsum(runif(20, min = -1, max = 1)) + 10)

event_df <- data.frame(date = metric_df$date[c(5, 8, 12, 16)],
                       label = c("Event A", "Event B", "Event C", "Event D"))

event_df <- left_join(event_df, metric_df, by = "date")

threshold <- quantile(metric_df$value, 0.8)

event_df <- event_df %>%
  mutate(direction = ifelse(value > threshold, -1, 1),
         offset = 0.5 * direction,
         label_y = value + offset,
         vjust_val = ifelse(direction == 1, 0, 1))

ggplot(metric_df, aes(x = date, y = value)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(data = event_df, aes(x = date, y = value), color = "darkred", size = 3) +
  geom_segment(data = event_df,
               aes(x = date, xend = date, y = value, yend = label_y),
               linetype = "dotted", color = "gray40") +
  geom_text(data = event_df,
            aes(x = date, y = label_y, label = label, vjust = vjust_val),
            hjust = 0, angle = 0, size = 3.5) +
  labs(title = "Metric with Smartly Positioned Event Labels",
       x = "Date", y = "Metric Value") +
  theme_minimal()
