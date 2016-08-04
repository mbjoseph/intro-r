## For-loops -------------------------------------------------------------------

# For-loops are a control flow construct for doing interative computations.
# The R syntax is:
# for (var in seq) {
#   expr
# }
# where var is an iterator that takes on values in seq, and expr is some
# expression to be evaluated at each iteration in the loop
# e.g.,
dog_names <- c('Tum-tum', 'Haddock', 'Dudley', 'Pickle', 'Doug')

for (d in dog_names) {
  print(d)
}

# What is the value of d after the loop has been evaluated?

# Use a for-loop to print the numbers one through ten:

# Write a function square_vec that returns the element-wise squares of a vector
# using a for loop:
# e.g., square_vec(c(1, 2, 3)) should return c(1, 4, 9)

# Write a function called get_factors which returns all positive integer factors
# of an integer-valued input.
# e.g., get_factors(12) should return c(1, 2, 3, 4, 6, 12)
# Assume that the input is an integer (or for an extra challenge, verify this
# and raise an error if the input is not an integer).
# Hint: the modulo operator %% computes the remainder after division



## Iterable objects ------------------------------------------------------------

# Many objects are iterable in R, including data.frames
random_normals <- rnorm(20)

df <- data.frame(numbers = random_normals,
                 some_letters = LETTERS[1:20],
                 is_positive = random_normals > 0)
head(df)

for (i in df) {
  print(i)
}

# Write a for-loop to print out the rows of the data frame one by one
# Hint: ?nrow()

# Lists are also iterable:
my_list <- list(dairy = c('Cheese', 'Milk'),
                veggies = c('Artichoke', 'Potato', 'Carrot', 'Cabbage'),
                budget = 100,
                Sigma = matrix(1:10, nrow = 2))
my_list

# Write a for-loop that iterates over the elements of my_list, printing the
# class of each element:



## Iterating over files --------------------------------------------------------

# Let's assume that we want to visualise all 12 of the inflammation data sets in
# the data/ directory by applying the following function to each file:
plot_inflammation <- function(filename) {
  # load the data
  d <- read.csv(filename, header = FALSE)

  # compute summary statistics
  daily_mean <- apply(d, 2, mean)
  daily_min <- apply(d, 2, min)
  daily_max <- apply(d, 2, max)

  # visualise the summary statistics
  plot(daily_max,
       xlab = 'Day',
       ylab = 'Inflammation',
       col = 'blue')
  points(daily_min, col = 'red')
  points(daily_mean)
  title(filename)
}

# We could analyze all of the files by manually writing the filenames as inputs:
# plot_inflammation('data/inflammation-01.csv')
# plot_inflammation('data/inflammation-02.csv')
# plot_inflammation('data/inflammation-03.csv')
# ...
# but that would be tedious, prone to typos, and violate the DRY principle.
# If we had a vector of filenames, we could iterate over it and apply our
# function to each element of the vector:

# We can use list.files() to get a vector of inflammation dataset filenames:
files <- list.files(path = 'data', pattern = 'inflammation', full.names = TRUE)
files

# Write a for-loop that prints each filename and plots each dataset:

# Use lapply() to do the same thing:

# Write a function called plot_all which plots all of the datasets into a
# 4 by 3 plot grid. par(mfrow = c(4, 3)) makes a 4 row by 3 column grid.
# Set the plotting grid back to normal (1 X 1) upon exiting (see ?on.exit)

# Challenge: one of your collaborators has decided that they want to plot the
# maxima, minima, and means as lines on the plots instead of points. Modify
# the relevant source code to plot lines instead of points and
# recreate all of the plots using plot_all
# Hint: see the "type" argument to plot and the ?lines function
