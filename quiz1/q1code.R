# Q1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)

mu <- lapply(c(0.0025, 0.3, 1.077, 0.1471), function(x){rep(x,4)})
lapply(mu, function(y){sum(w*(x - y)^2)})

