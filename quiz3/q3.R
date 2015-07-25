# Q1:
library(dplyr)
data(mtcars)
d1 <- mtcars
d1 <- tbl_dt(d1)

d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ cyl + wt, data = .) %>%
  summary()

# -0.6071
  
# Q2:
d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ cyl, data = .) %>%
  summary()

# Holding weight constant, cylinder appears to have 
# less of an impact on mpg than if weight is disregarded.

# Q3:
