
library(ggplot2)

data <- data.frame(x = LETTERS[1:26],
                   y = abs(rnorm(26)))

ggplot(data, aes(x = x, y = y)) +
    geom_segment(aes(x = x, xend = x, y = 0, yend = y), color = "grey") +
    geom_point(color = "orange", size = 4) +
    theme_light() +
    theme(panel.grid.major.x = element_blank(),
          panel.border = element_blank(),
          axis.ticks.x = element_blank()) +
    xlab("") +
    ylab("Value of Y")

ggplot(data, aes(x = x, y = y)) +
    geom_segment(aes(x = x, xend = x, y = 0, yend = y), color = "skyblue") +
    geom_point(color = "blue", size = 4, alpha = 0.6) +
    theme_light() +
    coord_flip() +
    theme(panel.grid.major.y = element_blank(),
          panel.border = element_blank(),
          axis.ticks.y = element_blank())
