## Problem

You need to visualize variation in a compelling way.

## Solution

#### Load Libraries

This solution uses the `dplyr`, `knitr` and `stringr` libraries. The
code chunk below checks for installation and, if needed, will install
the libraries and load them. The `ggdist`, `ggplot` and `ggthemes`
libraries are used to generate the plot at the end of this example.

``` r
packages <- c("dplyr", "ggdist", "ggplot2", "ggthemes", "knitr", "stringr")

installed_packages <- packages %in% rownames(installed.packages())

if(any(installed_packages == FALSE)) {

  install.packages(packages[!installed_packages])

}

invisible(lapply(packages, library, character.only = TRUE))
```

#### Create Sample Data

Generate a normal distribution of 200 values each for three groups.
Combine the data into a single data frame.

``` r
set.seed(91210)

number_samples <- 200

group1_mean <- 12
group1_sd <- 2

group2_mean <- 24
group2_sd <- 3

group3_mean <- 36
group3_sd <- 4

group1 <- round(rnorm(number_samples, mean = group1_mean, sd = group1_sd), 2)
group2 <- round(rnorm(number_samples, mean = group2_mean, sd = group2_sd), 2)
group3 <- round(rnorm(number_samples, mean = group3_mean, sd = group3_sd), 2)

combined_data <- c(group1, group2, group3)

groups <- rep(c("Group 1", "Group 2", "Group 3"), each = number_samples)

data <- data.frame(group = groups, value = combined_data)
```

#### View the Data Frame

View the first ten rows of the data frame.

``` r
kable(head(data, 10),
      col.names = c("Group", "Value"),
      caption = "Sample Data",
      format.args = list(big.mark = ","),
      align = c("l", "r"))
```

| Group   | Value |
|:--------|------:|
| Group 1 | 13.41 |
| Group 1 | 12.54 |
| Group 1 |  9.72 |
| Group 1 | 10.16 |
| Group 1 | 12.70 |
| Group 1 | 13.59 |
| Group 1 |  9.44 |
| Group 1 | 12.81 |
| Group 1 | 13.25 |
| Group 1 | 11.77 |

Sample Data

#### Plot the Data

``` r
ggplot(data, aes(x = factor(group), y = value, fill = factor(group))) +
    stat_halfeye(adjust = 0.5,
                 justification = -0.2,
                 .width = 0,
                 point_colour = NA) +
    geom_boxplot(width = 0.12,
                 outlier.color = NA,
                 alpha = 0.5) +
    stat_dots(side = "left",
              justification = 1.1,
              binwidth = 0.25) +
    scale_fill_tableau("Tableau 20", name = NULL) +
    labs(title = "Raincloud Plot",
         x = "Group",
         y = "Value",
         fill = "Group") +
    coord_flip()
```

![](raincloud_chart_files/figure-markdown_github/plot_data-1.png)

## Discussion

The combination of these visuals (density plot, box and whisker plot and
dot plot) effectively highlight the variation present in the values for
each of these groups.