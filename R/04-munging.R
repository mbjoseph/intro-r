## Data processing
library(tidyr)
library(dplyr)

## Piping  ---------------------------------------------------------------------

# With the pipe operator %>%, the left hand side is piped as the input to the
# first argument to a function on the right hand side, e.g.,

iris %>%
  str() # same as str(iris)

iris %>%
  summary() # same as summary(iris)

500 %>%
  rnorm() %>%
  hist() # same as hist(rnorm(500))

# The pipe operator is extremely useful for processing data when combined with
# data.frame objects and functions from the dplyr and tidyr packages.
# For instance:

# Filtering data (analogous to base::subset)
iris %>%
  filter(Species == 'setosa')

# Selecting specific columns
names(iris)

iris %>%
  select(Sepal.Length) %>%
  str()

iris %>%
  select(starts_with('Petal')) %>%
  str()

iris %>%
  select(ends_with('Width'), Species) %>%
  str()



## Wide to long conversion -----------------------------------------------------

# Some people insist on entering data in wide format. In the wild you will
# have to convert from wide to long format at some point.

# Load the inflammation-01.csv data file and store it as a data.frame:

# Recall that the rows in the data correspond to different patients
# and columns are timesteps.

# Add a column 'patient' to your data frame with a unique patient id for each:

# Currently the data are in 'wide' format, where columns correspond to the
# same measurement (inflammation) but in different groups (days).
# Use gather() to convert the data to 'long' format, where each column is
# a unique variable, storing the resulting data frame as long_df:


## Challenge: the iris dataset can also be considered to be in 'wide' format.
# Convert the iris dataset to long format:


## Mutation --------------------------------------------------------------------

# Now, we would like to create a numeric representation for the timestep, rather
# than the current string representation. Create a new column in long_df called
# num_t that is an integer valued timestep. (Hint: ?gsub, ?mutate):


# Suppose we also want to have a unique identifier associated with each
# observation formatted as pX_tY (e.g., p1_t2 for patient 1, time 2). Use the
# mutate() function to add a column for this unique identifier (see ?paste):




## Group by - summarize --------------------------------------------------------

# Group-by summarize operations are incredibly useful for computing
# statistics for each value or level of a variable. For instance,
# to compute patient-level means, we would group_by() patient, then pipe your
# grouped data frame to the summarize function and compute mean inflammation:

# Now expand the code above by also computing the patient-wise min, max, mean,
# and standard deviation, filtering out all of the observations on day 10, which
# are known to be incorrect:



## Writing functions to merge dataframes ---------------------------------------

# Currently we have twelve different data files containing the inflammation data
# but we would like to analyze all of the data together. Ideally, the data are
# contained in one data frame object, with columns corresponding to unique
# patient IDs, timesteps, and inflammation values. Patient 1 in
# inflammation-01.csv is not the same as patient 1 in inflammation-02.csv. Each
# patient appears only in one file. Timesteps and the scale of inflammation
# values are the same among the data frames (timestep 1 is always timestep 1
# regardless of the file).

# Write a patient name generator function that takes a filename
# (e.g., 'data/inflammation-01.csv') and an integer n for the number of patients
# as arguments, and returns a vector of patient ids corresponding to the number
# of the data frame and patients 1:n (e.g. 01-1, 01-2, 01-3, ...)
# Hint: see gsub and paste:

# Write a function that creates a long-form data frame containing three columns:
# patient_id (chr), timestep (num), and inflammation (num) for one file. Make
# use of your patient name generating function:

# Now, use list.files to make a vector of filenames pointing to the 12 data
# files, and use lapply() to apply your function to each filename:

# lapply() returns a list of data.frames but we want just one data frame. If we
# had N data frames with identical columns, we could merge them by binding
# rows (stacking one atop the other), e.g., rbind(df1, df2, df3, df4, ..., dfN).
# However, we don't want to have to write each dataframe as an argument. Instead
# we can use do.call and provide the data frames as a list of arguments to the
# rbind function, e.g., do.call(rbind, list_of_dataframes). Do this to make one
# big dataframe containing all of the patient data:

