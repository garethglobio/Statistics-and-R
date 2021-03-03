# Week 2 - Central Limit Theorem

# The Normal Distribution
library(dplyr)
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url,destfile=filename)
x <- unlist(read.csv(filename))
x <- na.omit(x)

# Using the same process as before (in Null Distribution Exercises), 
# set the seed at 1, then using a for-loop take a random sample of 5 
# mice 1,000 times. Save these averages. After that, set the seed at 1, 
# then using a for-loop take a random sample of 50 mice 1,000 times. 
# Save these averages.
set.seed(1)
n = 1000
averages5 <- vector("numeric",n)
for (i in 1:n){
  averages5[i] <- sample(x,5)
}

set.seed(1)
n = 1000
averages50 <- vector("numeric",n)
for (i in 1:n){
  averages50[i] <- sample(x,50)
}

library(rafalib)
hist(averages5,xlim=c(18,30))
hist(averages50,xlim=c(18,30))

# For the last set of averages, the ones obtained from a sample size of 50, 
# what proportion are between 23 and 25?
mean(averages50 > 23 & averages50 < 25)
mean(averages50 < 25 & averages50 > 23)

# Now ask the same question of a normal distribution with average 23.9 and 
# standard deviation 0.43.
pnorm((25 - 23.9) / 0.43) - pnorm((23 - 23.9) / 0.43)
pnorm((25-23.9) / 0.43)  - pnorm((23-23.9) / 0.43) 

# Populations, parameters, and sample estimates
## url <- url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
## file <- basename(url)
## download(url,destfile=filename)
## dat <- read.csv(filename)
dat <- read.csv('mice_pheno.csv')
dat <- na.omit(dat)

# Use dplyr to create a vector x with the body weight of all males on the 
# control (chow) diet. What is this population's average?
x <- filter(dat,(Diet=='chow') & Sex=='M') %>% select(Bodyweight) %>% unlist()
mean(x)

# Now use the rafalib package and use the popsd function to compute the 
# population standard deviation.
library(rafalib)
popsd(x)

# Set the seed at 1. Take a random sample  X  of size 25 from x. 
# What is the sample average?
set.seed(1)
X <- sample(x,25)
mean(X)

# Use dplyr to create a vector y with the body weight of all males on 
# the high fat hf) diet. What is this population's average?
y <- filter(dat, (Diet=='hf') & (Sex=='M')) %>% select(Bodyweight) %>% unlist()
mean(y)            

# Now use the rafalib package and use the popsd function to compute the 
# population standard deviation.
popsd(y)

# Set the seed at 1. Take a random sample  Y  of size 25 from y. 
# What is the sample average?
set.seed(1)
Y <- sample(y,25)
mean(y)

# What is the difference in absolute value between  y¯???x¯  and  Y¯???X¯ ?
abs((mean(y) - mean(x) - (mean(Y) - mean(X))))

# Repeat the above for females. Make sure to set the seed to 1 before each 
# sample call. What is the difference in absolute value between  y¯???x¯  
# and  X¯???Y¯ ?
dat <- read.csv('mice_pheno.csv')
dat <- na.omit(dat)

x2 <- filter(dat, Sex=='F' & Diet=='chow') %>% select(Bodyweight) %>% unlist()
y2 <- filter(dat, Sex=='F'& Diet=='hf') %>% select(Bodyweight) %>% unlist()

set.seed(1)
X2 <- sample(x2,25)

set.seed(1)
Y2 <- sample(y2,25)
abs((mean(y) - mean(x) - (mean(Y) - mean(X))))

