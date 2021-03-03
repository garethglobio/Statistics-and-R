# Getting Started with R

install.packages("rafalib")
library(rafalib)

version
v <- c(2.23,3.45,1.87,2.11,7.33,18.34,19.23)
mean(v)

sum = 0
for (i in 1:25){
  sum = sum +  i^2
  print(sum)
}

class(cars)
str(cars)
head(cars)
mean(cars[,2])
which(cars==85)
cars

x <- 1:10
y <- rnorm(10)
plot(x,y)
fit <- lm(y~x)

dat <- read.csv('femaleMiceWeights.csv')
head(dat)