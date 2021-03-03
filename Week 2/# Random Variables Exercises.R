# Random Variables and Probability Distributions
# Random Variables Exercises
dat <- read.csv("femaleControlsPopulation.csv")
dat
population <- unlist(dat)
population
mean(population)

set.seed(1)
abs(mean(population) - mean(sample(population,5)))

set.seed(5)
abs(mean(population) - mean(sample(population,5)))
