# Getting Started Exercises

install.packages('downloader')
library(downloader)

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
download(url,filename)

df <- read.csv('femaleMiceWeights.csv')
head(df)
df[12,2]
df$Bodyweight[11]
length(df$Bodyweight)
mean(subset(df,Diet=='hf')$Bodyweight)

set.seed(1)
x <- 13:24
row <- sample(x,1)
df[row,]