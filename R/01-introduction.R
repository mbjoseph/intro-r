## Getting started -------------------------------------------------------------

# print the current working directory:
getwd()


## Objects and assignment ------------------------------------------------------

# create an object (weight_kg) that is mapped to a numeric value:

# compute weight in pounds and assign the result to a new object weight_lb by
# multiplying weight_kg by 2.20462:

# change the value of weight_kg:

# did the value of weight_lb change automatically?

# create a vector called birth_months that contains the birth months of your two
# closest neighbors and your own birth month:


## Loading data ----------------------------------------------------------------

# load the dataset inflammation-01.csv with read.csv:
# (rows = patients, columns = days, and values = degree of inflammation )

# assign the result of read.csv to an object:

# use head() to read the first five rows of the data:

# use class() to find the class of your data object:

# use dim() to find the number of rows and columns in the data:

# use str() to inspect the structure of the object:


## Subsetting and extraction ---------------------------------------------------

# find the value in the first row, first column:

# find the value in the thirtieth row, twentieth column:

# extract the subset of the data up to row 4, column 10:

# extract rows five through ten, columns one through ten:

# extract all values from the fifth row:

# extract all values from the sixteenth column:

# compute the maximum value for all of the data:

# compute the maximum value for patient one (row one):

# compute the minimum value for day one (column one):

# compute the standard deviation on day seven (column seven):

# compute the maximum inflammation for patient 5 across days three to seven:



## Row and column wise statistics with apply() ---------------------------------

# compute average inflammation on each day across patients and store the result:

# compute average inflammation for each patient across days & store the result:

# create a sequence of integers containing only even numbers from 2 to 40:

# calculate the mean inflammation for every second day (across all patients):



## Plotting --------------------------------------------------------------------

# plot the average daily inflammation across all patients:

# plot the maximum daily inflammation across all patients:

# plot the minimum daily inflammation across all patients:

# plot the standard deviation among patients for each day:

