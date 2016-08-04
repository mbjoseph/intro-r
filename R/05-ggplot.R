## Introduction to ggplot2 -----------------------------------------------------

# ggplot2 is an R package for visualization that is based on the book "The
# Grammar of Graphics" by Lelend Wilkinson. The book lays out a conceptual
# framework for thinking about graphics as layered elements, and the R package
# ggplot2 implements this concept. ggplot2 provides one common framework to
# produce a wide variety of plots, rather than base graphics which represents
# a collection of independent or at best loosely coupled methods.

# Plots emerge from layering the following elements
# - aesthetics (roles variables play)
# - geometric objects (e.g., points and lines)
# - scales
# - stats
# - facets

# Like dplyr and tidyr, ggplot2 is designed to operate on data frames.
library(ggplot2)

# load data
data(msleep)

# check object class
class(msleep)

# Aesthetics can be defined at the global level or within geoms
ggplot(msleep, aes(x = bodywt, y = brainwt)) +
  geom_point()

ggplot(msleep) +
  geom_point(aes(x = bodywt, y = brainwt))

# Axes can be scaled
ggplot(msleep) +
  geom_point(aes(x = bodywt, y = brainwt)) +
  scale_y_log10() +
  scale_x_log10()

# Because the first argument to ggplot() is a data.frame, you can make use of a
# munge %>% plot workflow
msleep %>%
  filter(order == 'Primates') %>%
  ggplot(aes(bodywt, brainwt, label = name)) +
  geom_text() +
  scale_y_log10() +
  scale_x_log10()

# coordinate systems can be modified:
df <- data.frame(variable = c("does not resemble", "resembles"),
                 value = c(20, 80))

ggplot(df, aes(x = "", y = value, fill = variable)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow")) +
  labs(title = "Pac man")

ggplot(df, aes(x = "", y = value, fill = variable)) +
  geom_bar(width = 1, stat = "identity") +
  scale_fill_manual(values = c("red", "yellow")) +
  coord_polar("y", start = pi / 3) +
  labs(title = "Pac man")

# Plots can be assigned and modified later
p <- ggplot(msleep, aes(x = bodywt, y = brainwt)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10()

# ggplot comes with different themes too
p + theme_bw()
p + theme_minimal()
p + theme_classic()
p + theme_light()

# you can also use themes from the ggthemes package if it is installed
# note that package::function uses a function from a package without loading
# the entire package
p + ggthemes::theme_base()
p + ggthemes::theme_calc()
p + ggthemes::theme_economist()
p + ggthemes::theme_excel()
p + ggthemes::theme_wsj()

# you can easily add fitted lines
p + stat_smooth()

# you can even specify linear and generalized linear models
p + stat_smooth(method = 'lm', formula = y ~ poly(x, 2))

# faceting makes panels for each level of a variable
p +
  facet_wrap(~vore)

p +
  facet_grid(order ~ vore) +
  stat_smooth(method = 'lm')

# color can be added as an aesthetic
ggplot(msleep, aes(x = bodywt, y = brainwt, color = vore)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10()

# when color is defined at the entire plot level propagate to all relevant geoms
ggplot(msleep, aes(x = bodywt, y = brainwt, color = vore)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10() +
  stat_smooth(method = 'lm', se = FALSE, formula = y ~ poly(x, 2)) +
  theme_minimal()

# boxplots are trivial
ggplot(msleep, aes(x = conservation, y = awake)) +
  geom_boxplot()

# how about with the points?
ggplot(msleep, aes(x = vore, y = awake)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter()

# line plots are also easy
data(lynx)
lynx_df <- data.frame(year = 1821:1934, n_trapped = c(lynx))
lp <- ggplot(lynx_df, aes(year, n_trapped)) +
  geom_line() +
  xlab('Time') +
  ylab('Number of lynx trapped')
lp

# Your turn
#
# msleep
#
# 1) Make a scatterplot of sleep_total vs. sleep_rem
# 2) Make point size proportional to log(body mass)
# 3) Add a OLS regression line
# 4) Color-code the points according to vore. Does the scaling of REM & total sleep differ w/ diet?
#
# txhousing
#
# 1) Plot a histogram of median house sales prices
# 2) Plot the overall density of median house sales prices, changing your code as little as possible
# 3) Plot the density for each city (using color, fill, or facet)
# 4) Does median house price vary consistently among months or across years? If so, are patterns consistent among cities?

