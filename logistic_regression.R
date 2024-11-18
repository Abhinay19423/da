library(pROC)
library(ggplot2)

data(iris)

iris$SpeciesBinary <- ifelse(iris$Species == "setosa", 1, 0)

logistic_model <- glm(SpeciesBinary ~ Sepal.Length, data = iris, family = "binomial")

iris$predicted_probability <- predict(logistic_model, type = "response")

iris$predicted_class <- ifelse(iris$predicted_probability > .5, 1, 0)

confusion_matrix <- table(Actual = iris$SpeciesBinary, Predicted =iris$predicted_class)


ggplot(iris, aes(x = Sepal.Length, y = predicted_probability)) +
  geom_point(aes(color = factor(SpeciesBinary)), size = 3)+
  labs(x = "len", y = "predict")+
  theme_minimal()


roc_curve <- roc(iris$SpeciesBinary, iris$predicted_probability)
auc_value <- auc(roc_curve)
plot(roc_curve, main = "roc curve ", col = "darkblue", lwd =2)


