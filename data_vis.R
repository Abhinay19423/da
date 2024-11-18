#data visualization

library(tidyverse)

fp <- "/Users/AbhinayP/Downloads/titanic.csv"


titanic <- read.csv(fp)

head(titanic)
sapply(titanic, class)

#convert sex and survived into factors
titanic$Sex = as.factor(titanic$Sex)
titanic$Survived = as.factor(titanic$Survived)

dropNa <- titanic[rowSums(is.na(titanic)) <= 0,]

#spliting based on survival 
survivedL = dropNa[dropNa$Survived == 1, ]
notSurvivedL = dropNa[dropNa$Survived == 0, ]

#pie chart of survived & not survived 
mytable <- table(titanic$Survived)
pie(mytable, labels = c("not survived", "survived"))


#histogrm  of ages
hist(titanic$Age, xlab="gender", ylab="frequency")

#bar plot
barplot(table(notSurvivedL$Sex), xlab = "gender", ylab= "frequency")

#density plot
temp <- density(table(survivedL$Fare))
plot(temp, main = "fare charged", xlab = "fares")
polygon(temp, col = "lightgreen")

#boxplot
boxplot(titanic$Fare, main = "fare")




