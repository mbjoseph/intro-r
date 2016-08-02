## Creating functions ----------------------------------------------------------

# create a function called fahr_to_kelvin that converts temperatures from
# farenheight to Kelvin:

# the freezing point of water is 32 degrees farenheight - what is it in Kelvin?

# the boiling point of water is 212 degrees farenheight - what is it in Kelvin?


## Function composition --------------------------------------------------------

# create a function called kelvin_to_celsius that converts from kelvin to C:

# create a function called fahr_to_celsius that converts from farenheight to C,
# using the function fahr_to_kelvin and kelvin_to_celsius:

# use function chaining to achieve the same result:



## Practice --------------------------------------------------------------------

# In the last lesson, we learned to concatenate elements into a vector using
# the c() function, e.g. x <- c("A", "B", "C") creates a vector x with three
# elements. Furthermore, we can extend that vector again using c(), e.g.
# y <- c(x, "D") creates a vector y with four elements.

# Write a function called fence that takes two vectors as arguments, called
# original and wrapper`, and returns a new vector that has the wrapper vector
# at the beginning and end of the original:


# Test your function below and verify that the results match your expectations:



## Default function arguments --------------------------------------------------

# The function below computes sums of numbers that are provided as inputs or
# arguments to the function. If no arguments are supplied, the function uses
# default values that are provided when the function is defined (in this case
# the default value for y is 2).

my_sum <- function(x, y = 2) {
  return(x + y)
}

# what should my_sum() return?

# what should my_sum(3) return?

# what should my_sum(x = 3) return?

# what should my_sum('a string') return?

# Define an object y, mapped to the value 199 and execute my_sum(1). Which y
# was used by my_sum?



## Inspecting functions --------------------------------------------------------

# To inspect the source code for a function, you can execute the functions name
# with no parentheses. Print the source code for your fence() function:



## Function environments -------------------------------------------------------

# The following function defines variables and returns a vector
f <- function() {
  a <- 1
  b <- 2
  c(a, b)
}

# executing the function:
f()

# After executing the function f(), notice that a and b are not found
print(a)
print(b)

# Every function in R has an environment that is created when the function is
# executed. Once the function has returned its value, the environment does not
# persist.

# By default, objects created in the R console exist in a "Global environment".

# List all of the objects in your global environment using ls():

# Remove f() from the global environment using rm():

# Run the command below, which removes all objects from your global environment:
rm(list = ls())

# For more information on environments: http://adv-r.had.co.nz/Environments.html



## Name masking ----------------------------------------------------------------

# If a function uses an object that is not defined in the function, it searches
# for the object in the global environment.

g <- function() {
  y <- 1
  c(x, y)
}

g() # should throw an error, because x is not defined

x <- 5
g() # now g() has acquired x from the global environment

# Why is this a dangerous feature to rely on when writing functions?



# Application ------------------------------------------------------------------

# In statistics, it is often useful to center and scale variables so that they
# have mean = 0 and standard deviation = 1. Write a function called cscale that
# centers and scales numeric vectors. The function should stop (see ?stop) and
# print an error message if the input is not a numeric vector, or if the user
# provides just one number as an input.
# (Hint: you can center and scale a vector by first subtracting the mean and
# then dividing the resulting values by the standard deviation):



## Testing functions -----------------------------------------------------------

# Writing tests is a great way to ensure that your functions work.
# We can use the testthat package to test that functions are doing what they're
# supposed to.
# If testthat is not installed, uncomment the following line to install it:
# install.packages('testhat')

# the next line loads the package, giving us access to its functions
library(testthat)

# Here is an example test:
expect_error(cscale('String input'))

# When tests pass, the expect_* functions return nothing. If a test fails,
# it will raise an error.

# Write the following tests to ensure your function behaves as expected:

# cscale returns an error when given a matrix as an input:

# cscale returns an error when given one number as an input:

# cscale returns the correct vector for a small input vector (?expect_equal):

# cscale returns a result that is the correct length (?expect_length):

# cscale returns a vector with mean = 0:

# cscale returns a vector with standard deviation = 1:

# Bonus question:
# Does R treat single real numbers or integers as vectors? How do you know?

