# Random Variables and Probability Distributions
library(dplyr)
dat <- read.csv('femaleMiceWeights.csv')
head(dat)
control <- filter(dat,Diet=='chow') %>% select(Bodyweight) %>% unlist()
control
treatment <- filter(dat,Diet=='hf') %>% select(Bodyweight) %>% unlist()
treatment
mean(control)
mean(treatment)

# Statistical Inference
population <- read.csv("femaleControlsPopulation.csv")
population
population <- unlist(population)
mean(sample(population,12))
