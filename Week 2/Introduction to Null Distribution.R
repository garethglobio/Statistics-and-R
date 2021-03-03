# Random Variables and Probability Distributions
# Introduction to Null Distribution
library(dplyr)
dat <- read.csv('femaleMiceWeights.csv')
head(dat)
control <- filter(dat,Diet=='chow') %>% select(Bodyweight) %>% unlist()
control
treatment <- filter(dat,Diet=='hf') %>% select(Bodyweight) %>% unlist()
treatment

obs <- mean(treatment) - mean(control)

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

control <- sample(population,12)
treatment <- sample(population,12)
mean(treatment) - mean(control)

n = 10000
nulls <- vector("numeric",n)
for (i in 1:n){
  control <- sample(population,12)
  treatment <- sample(population,12)
  nulls[i] <- mean(treatment) - mean(control)
}
max(nulls)
min(nulls)
mode(nulls)
median(nulls)
mean(nulls)
sd(nulls)
hist(nulls)

# p-value
sum(nulls > obs) / n
mean(nulls > obs)
mean(abs(nulls) > abs(obs))
