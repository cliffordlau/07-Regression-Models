# Q1:
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
summary(lm(y ~ x))
# 2.325 from the t value
# This was wrong...
# Tried the 0.053 instead :P
# this is right

# Q2:
# 0.223 std error for the residual

# Q3
data(mtcars)
data <- mtcars
model <- lm(mpg ~ wt, data)
summary(model)

# This line is not used, just do the predict function
model$coefficients[[1]] + model$coefficients[[2]] * mean(data$wt)

predict(model, newdata = data.frame(wt = mean(data$wt)), interval = "confi")

# Q4:
predict(model, newdata = data.frame(wt = 3), interval = "predi")

# Q5
# -5.3345 for 1 so my guess 2 is double and the lower bound will be even lower

# Q7
# centimeter to meter is NOT divded by 100
# It is TIMES 100

# Q9:
model2 <- lm(mpg ~ 1, data)
summary(model)
summary(model2)

sum(residuals(model)^2)/sum(residuals(model2)^2)

# Q10:
# in intercept is included