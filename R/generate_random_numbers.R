
set.seed(91210)

# Generate a set of normally distributed numbers using mean and standard deviation.

generate_random_numbers <- function(n, mean, sd) {

    random_numbers <- rnorm(n, mean, sd)

    return(random_numbers)

}
