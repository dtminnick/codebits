
library("ggplot2")

my_custom_theme <- theme(plot.background = element_rect(fill = "lightgray"),
                         panel.background = element_rect(fill = "white"),
                         axis.title = element_text(size = 12, color = "darkblue"),
                         axis.text = element_text(size = 10, color = "black"),
                         panel.grid.major = element_line(color = "gray", linetype = "dotted"),
                         panel.grid.minor = element_blank(),
                         legend.position = "bottom",
                         legend.title = element_text(size = 12),
                         legend.text = element_text(size = 10),
                         legend.background = element_rect(fill = "lightgray"),
                         plot.margin = margin(1, 1, 1, 1, unit = "cm"),
                         plot.title = element_text(size = 14, hjust = 0.5, vjust = 1),
                         plot.subtitle = element_text(size = 12, hjust = 0.5, vjust = 1))

ggplot(mtcars, aes(x = mpg, y = disp, color = gear)) +
    geom_point() +
    labs(title = "Custom Theme Example",
         subtitle = "This is a test subtitle",
         x = "Label X",
         y = "Label Y") +
    my_custom_theme

my_modern_theme <- theme_minimal() +
    theme(plot.background = element_rect(fill = "white"),
          panel.background = element_rect(fill = "lightgray"),
          text = element_text(family = "Roboto", color = "black"),
          axis.text = element_text(size = 10),
          legend.position = "right",
          legend.background = element_rect(fill = "lightgray"),
          plot.title = element_text(size = 14, hjust = 0.5, vjust = 1),
          plot.subtitle = element_text(size = 12, hjust = 0.5, vjust = 1),
          plot.margin = margin(1, 1, 1, 1, unit = "cm"))

ggplot(mtcars, aes(x = mpg, y = disp, color = gear)) +
    geom_point() +
    labs(title = "Modern Theme Example",
         subtitle = "This is a test subtitle",
         x = "Label X",
         y = "Label Y") +
    my_modern_theme


library(ggplot2)

# Modern theme function
modern_theme <- function(base_size = 12, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(family = base_family),
            axis.title = element_text(size = rel(1.2)),
            axis.text = element_text(size = rel(1)),
            axis.ticks = element_blank(),
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank(),
            plot.background = element_blank(),
            legend.background = element_blank(),
            legend.key = element_rect(fill = "white", color = "white"),
            legend.text = element_text(size = rel(1)),
            legend.title = element_text(size = rel(1.2)),
            plot.title = element_text(size = rel(1.5))
        )
}

# Example usage
set.seed(123)
data <- data.frame(
    x = rnorm(100),
    y = rnorm(100)
)

ggplot(data, aes(x, y)) +
    geom_point() +
    ggtitle("Modern ggplot2 Theme") +
    modern_theme()

library(ggplot2)

# Custom theme function
custom_theme <- function(base_size = 12, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(family = base_family, color = "#333333"),
            axis.text = element_text(size = rel(0.8)),
            axis.title = element_text(size = rel(1)),
            axis.line = element_line(color = "#333333"),
            axis.ticks = element_line(color = "#333333"),
            panel.grid.major = element_line(color = "#DDDDDD", size = 0.5),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank(),
            plot.background = element_blank(),
            legend.background = element_blank(),
            legend.key = element_rect(fill = "white", color = "white"),
            legend.text = element_text(size = rel(0.9)),
            legend.title = element_text(size = rel(1)),
            plot.title = element_text(size = rel(1.5))
        )
}

# Example usage
set.seed(456)
data <- data.frame(
    x = rnorm(100),
    y = rnorm(100)
)

ggplot(data, aes(x, y)) +
    geom_point() +
    ggtitle("Custom ggplot2 Theme") +
    custom_theme()

library(ggplot2)

# Colorful theme function
colorful_theme <- function(base_size = 12, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(family = base_family, color = "#333333"),
            axis.text = element_text(size = rel(0.8)),
            axis.title = element_text(size = rel(1)),
            axis.line = element_line(color = "#333333"),
            axis.ticks = element_line(color = "#333333"),
            panel.grid.major = element_line(color = "#DDDDDD", size = 0.5),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank(),
            plot.background = element_blank(),
            legend.background = element_blank(),
            legend.key = element_rect(fill = "white", color = "white"),
            legend.text = element_text(size = rel(0.9), color = "#555555"),
            legend.title = element_text(size = rel(1), color = "#555555"),
            plot.title = element_text(size = rel(1.5), color = "#555555")
        )
}

# Example usage
set.seed(789)
data <- data.frame(
    x = rnorm(100),
    y = rnorm(100),
    category = rep(c("A", "B"), each = 50)
)

ggplot(data, aes(x, y, color = category)) +
    geom_point(size = 3) +
    ggtitle("Colorful ggplot2 Theme") +
    colorful_theme()


library(ggplot2)

# PowerPoint-friendly theme function
powerpoint_theme <- function(base_size = 14, base_family = "") {
    theme_minimal(base_size = base_size, base_family = base_family) +
        theme(
            text = element_text(family = base_family, color = "#333333"),
            axis.text = element_text(size = rel(0.8)),
            axis.title = element_text(size = rel(1)),
            axis.line = element_line(color = "#333333"),
            axis.ticks = element_line(color = "#333333"),
            panel.grid.major = element_line(color = "#DDDDDD", size = 0.5),
            panel.grid.minor = element_blank(),
            panel.border = element_blank(),
            panel.background = element_blank(),
            plot.background = element_blank(),
            legend.background = element_blank(),
            legend.key = element_rect(fill = "white", color = "white"),
            legend.text = element_text(size = rel(0.9), color = "#555555"),
            legend.title = element_text(size = rel(1), color = "#555555"),
            plot.title = element_text(size = rel(1.5), color = "#333333")
        )
}

# Example usage
set.seed(123)
data <- data.frame(
    x = rnorm(100),
    y = rnorm(100)
)

ggplot(data, aes(x, y)) +
    geom_point(size = 3) +
    ggtitle("PowerPoint-friendly ggplot2 Theme") +
    powerpoint_theme()

