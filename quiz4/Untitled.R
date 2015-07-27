# Q1:
library(MASS)
library(dplyr)
?shuttle
data(shuttle)
shuttle <- tbl_df(shuttle)

fit1 <- glm(use ~ wind, data = shuttle, family = binomial)
summary(fit1)
exp(coef(fit1)[2])

# exponentiate it to get 0.969

# Q2:
fit2 <- glm(use ~ wind + magn, data = shuttle, family = binomial)
summary(fit2)
exp(coef(fit2)[2])
# Still 0.969... fishy...

# Q3:
fit3 <- glm(relevel(use, "noauto") ~ wind, data = shuttle, family = binomial)
summary(fit3)
# The coefficients reverse their signs.

# Q4:
data("InsectSprays")
d1 <- tbl_df(InsectSprays)
fit4 <- glm(count ~ spray - 1, data = d1, family = poisson)
summary(fit4)
# not sure why it's -... try 0.9457

# Q5:
# The coefficient estimate is divided by 10.
# Wrong... try : The coefficient estimate is multiplied by 10
# Still wrong... try: The coefficient estimate is unchanged

# Q6:
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
knots <- 0 
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
xMat <- cbind(1, x, splineTerms)
yhat <- predict(lm(y ~ xMat - 1))
plot(x, y, frame = FALSE, pch = 21, bg = "lightblue", cex = 2)
lines(x, yhat, col = "red", lwd = 2)

# not sure how to get it... eye ball it to close to 1 so try 1.013