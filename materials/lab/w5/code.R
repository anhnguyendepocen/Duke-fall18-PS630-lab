#----------------
# Generate data
#----------------
rm(list=ls())
library(tidyverse)


# d1: Baseline
#---------------------
b <- 1.6
n <- 100

x <- rnorm(n, 10, 10)
u <- rnorm(n, 0, 5)
y <- b * x + u

d1 <- data.frame(y, x)

ggplot(d1) + geom_point(aes(x = x, y = y))


# d2: Heteroskedasticity
#-----------------------
b <- 1.6
n <- 100

x <- 1:n / 50
u <- rnorm(n, 0, seq(0.1, 10, 5/n))
y <- b * x + u

d3 <- data.frame(y, x)

ggplot(d3) + geom_point(aes(x = x, y = y))

plot(lm(y ~ x, data = d3))


# d3: Non-zero conditional mean
#-------------------------------
b1 <- 1.6
b2 <- 2
n <- 100

x <- rnorm(n, 4, 10)
u <- rnorm(n, 0, 40)
y <- b1 * x + b2 * x^2 + u

d4 <- data.frame(y, x)
ggplot(d4) + geom_point(aes(x = x, y = y))

plot(lm(y ~ x, data = d4))

