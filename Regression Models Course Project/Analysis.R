# 1. Context --------------------------------------------------------------
# You work for Motor Trend, a magazine about the automobile industry.
# Looking at a data set of a collection of cars, they are interested in 
# exploring the relationship between a set of variables and miles per gallon 
# (MPG) (outcome). They are particularly interested in the following two 
# questions:
# 
# “Is an automatic or manual transmission better for MPG”
# "Quantify the MPG difference between automatic and manual transmissions"


# 2. Requirements ---------------------------------------------------------

# Take the mtcars data set and write up an analysis to answer their question
# using regression models and exploratory data analyses.
#
# Written as a PDF printout of a compiled (using knitr) R markdown document.
# 
# Brief. 
# 
# Roughly the equivalent of 2 pages or less for the main text.
# 
# Supporting figures in an appendix can be included up to 5 total pages 
# including the 2 for the main report. The appendix can only include figures.
# 
# Include a first paragraph executive summary.

library(ggplot2)
library(dplyr)

data(mtcars)
mtcars <- 
  tbl_df(mtcars) %>%
  mutate(am = as.factor(ifelse(am == 0, "automatic", "manual")),
         cyl = as.factor(cyl))

glimpse(mtcars)

ggplot(mtcars, aes(am, mpg, cyl)) + 
  geom_boxplot() +
  facet_grid(.~cyl) +
  ggtitle("MPG for Auto vs Manual by Number of Cylinders")

ggplot(mtcars, aes(wt, mpg, am))+ 
  geom_line() +
  geom_smooth() +
  facet_grid( .~am) +
  ggtitle("MPG for Auto vs Manual by Number of Cylinders")

fit1 <- lm(mpg ~ am, data = mtcars)
fit2 <- lm(mpg ~ am + cyl + wt, data = mtcars)
