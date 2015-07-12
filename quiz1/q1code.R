# Q1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

mu <- lapply(c(0.0025, 0.3, 1.077, 0.1471), function(x){rep(x,4)})
lapply(mu, function(y){sum(w*(x - y)^2)})

# Q2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

# add the -1 to force it through the origin
s <- lm(y~x-1)

# Q3
data(mtcars)
