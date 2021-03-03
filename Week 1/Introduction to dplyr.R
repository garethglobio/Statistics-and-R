# Introduction to dplyr

library(dplyr)
dat <- read.csv('femaleMiceWeights.csv')
View(dat)
controls <- filter(dat,Diet=='chow')
View(controls)
controls <- select(controls,Bodyweight)
unlist(controls)

# Pipe Operator
controls <- filter(dat,Diet=='chow') %>% select(Bodyweight) %>% unlist()
controls
mean(controls)
