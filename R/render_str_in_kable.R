
library("knitr")

id <- c(1, 2, 3, 4, 5)

old_value <- c("a", "b", "c", "d", "e")

new_value <- c("z", "y", "x", "w", "v")

sample <- data.frame(id = id,
                    old_value = old_value,
                    new_value = new_value)

dataset_structure <- data.frame(variable = names(sample),
                                class = sapply(sample, typeof),
                                first_values = sapply(sample, function(x) paste0(head(x),  collapse = ", ")),
                                row.names = NULL)

kable(dataset_structure,
      caption = "Structure of the Sample Dataset",
      col.names = c("Variable", "Class", "First Values"))
