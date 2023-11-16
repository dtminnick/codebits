# Function to generate a random walk

# You can specify the number of steps and dimensions when calling the random_walk function.

# n is the number of steps in the random walk.

# dimensions in the number of dimensions for the walk; must have at least one
# dimension.

random_walk <- function(n, dimensions = 1) {
  
  if (dimensions < 1) {
    
    stop("Number of dimensions must be at least 1")
    
  }

  # Generate random increments
  
  increments <- matrix(rnorm(n * dimensions), ncol = dimensions)

  # Create the random walk by cumulatively summing the increments
  
  walk <- apply(increments, 2, cumsum)

  return(walk)
  
}

# Set the number of steps and dimensions

n_steps <- 100

n_dimensions <- 2

# Generate a random walk with the specified dimensions

walk <- random_walk(n_steps, n_dimensions)

# Plot the random walk if you have 2 dimensions

if (n_dimensions == 2) {
  
  plot(walk, type = 'l', xlab = 'X', ylab = 'Y', main = '2D Random Walk')
  
}
