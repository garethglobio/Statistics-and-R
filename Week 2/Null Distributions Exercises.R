# Random Variables and Probability Distributions
# Null Distributions Exercises

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)
mean(population)
control <- filter(dat,Diet=='chow') %>% select(Bodyweight) %>% unlist()
control
treatment <- filter(dat,Diet=='hf') %>% select(Bodyweight) %>% unlist()
treatment

obs <- mean(treatment) - mean(control)

# 1. Set the seed at 1, then using a for-loop take a random sample of 5 mice 
# 1,000 times. Save these averages. What proportion of these 1,000 averages 
# are more than 1 gram away from the average of x ?
set.seed(1)
n = 1000
averages <- vector("numeric",n)
for (i in 1:n){
  averages[i] <- sample(population,5)
}
sum(abs(averages) > mean(population)) / n
