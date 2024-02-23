
numbers <- c(8, 5, 2, 9, 5, 6, 3, 10, 1, 0, 2, 9, 8, 7, 6)

bubble_sort <- function(x) {

    pointer = length(x) - 1

    while(pointer > 0) {

        for(index in 1:pointer) {

            first_item = x[index]

            second_item = x[index + 1]

                if(first_item > second_item) {

                    x[index] = second_item

                    x[index + 1] = first_item

                }
        }

    pointer <- pointer - 1

    }

    return(x)

}

check <- bubble_sort(numbers)
