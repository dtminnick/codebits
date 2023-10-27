
number_mappings <- function() {

    c("Zero" = 0,
      "One" = 1,
      "Two" = 2,
      "Three" = 3,
      "Four" = 4,
      "Five" = 5,
      "Six" = 6,
      "Seven" = 7,
      "Eight" = 8,
      "Nine" = 9)

}

word_to_number <- function(word) {

    numbers <- number_mappings()

    numbers[word]

}

number_to_word <- function(number) {

    words <- names(number_mappings())

    name_mapping <- setNames(names(number_mappings()), number_mappings())

    name_mapping[as.character(number)]

}
