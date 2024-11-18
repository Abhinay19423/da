library(caTools)
data <- data.frame(
  Years_Exp = c(1.1, 1.3, 1.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7),
  Salary = c(39343.00, 46205.00, 37731.00, 43525.00, 39891.00, 
             56642.00, 60150.00, 54445.00, 64445.00, 57189.00))

split = sample.split(data$Salary, SplitRatio = .7)
train = subset(data, split=TRUE)
test = subset(data, split = FALSE)

lm.r = lm(formula = Salary ~ Years_Exp, data = train)
coef(lm.r)

library(ggplot2)

ggplot() + geom_point(aes(x = train$Years_Exp, y = train$Salary), col = "darkred")+
  geom_line(aes(x = train$Years_Exp, y = predict(lm.r, data = train)), col = "blue")

test_predict <- predict(lm.r, newdata = test)

mae <- mean(abs(test$Salary - test_predict))

                          