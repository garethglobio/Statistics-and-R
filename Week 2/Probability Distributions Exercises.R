# Random Variables and Probability Distributions
# Probability Distributions Exercises
install.packages("gapminder")
library(gapminder)
data("gapminder")
head(gapminder)

summary(gapminder)
gapminder.1952 <- gapminder[gapminder$year == 1952,]
gapminder.1952

# 1. What is the proportion of countries in 1952 that have a life 
# expectancy less than or equal to 40?
less.than.or.equal.40 <- gapminder.1952[gapminder.1952$lifeExp <= 40,]
less.than.or.equal.40
length(less.than.or.equal.40$country) / length(gapminder.1952$country)
  
# 2 . What is the proportion of countries in 1952 that have a life 
# expectancy between 40 and 60 years? Hint: this is the proportion that 
# have a life expectancy less than or equal to 60 years, minus the 
# proportion that have a life expectancy less than or equal to 40 years.
less.than.60 <-  gapminder.1952[gapminder.1952$lifeExp <= 60,]
(length(less.than.60$country) - length(less.than.or.equal.40$country)) / 
  length(gapminder.1952$country)
