# Q1:
library(dplyr)
data(mtcars)
d1 <- mtcars
d1 <- tbl_dt(d1)

model1 <-
  d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ cyl + wt, data = .)

summary(model1)

# -0.6071
  
# Q2:
model2 <- 
  d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ cyl, data = .)

summary(model2)

# Holding weight constant, cylinder appears to have 
# less of an impact on mpg than if weight is disregarded.

# Q3:
model3 <- 
  d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ cyl + wt + cyl * wt, data = .)

summary(model3)

anova(model2, model3)
# The P-value is small (less than 0.05). So, according to 
# our criterion, we reject, which suggests that the interaction 
# term is necessary

# that was wrong... try something else
# Try this:
# The P-value is larger than 0.05. So, according to our criterion, 
# we would fail to reject, which suggests that the interaction terms
# may not be necessary.

# this is right
# But still don't know why i got the p value wrong...

# Q4:
model4 <- 
  d1 %>%
  select(mpg, cyl, wt) %>%
  mutate(cyl = as.factor(cyl)) %>%
  mutate(cyl = relevel(cyl, ref = "4")) %>%
  lm(mpg ~ I(wt*0.5) + cyl, data = .)

summary(model4)

# The estimated expected change in MPG per half ton increase in weight.

# Also wrong, try this:
# The estimated expected change in MPG per half ton increase in weight 
# for for a specific number of cylinders (4, 6, 8).

# oops this should be it:
# The estimated expected change in MPG per one ton increase in weight.
# It's 2000lb is a ton

# damn it should maybe:
# The estimated expected change in MPG per one ton increase in weight 
# for a specific number of cylinders (4, 6, 8).

# Q5:
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y ~ x)
hatvalues(fit)
# 0.9946

# Q6:
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit <- lm(y ~ x)
dfbetas(fit)

# -134

# Q7:
# It is possible for the coefficient to reverse sign after adjustment. 
# For example, it can be strongly significant and positive before adjustment 
# and strongly significant and negative after adjustment.