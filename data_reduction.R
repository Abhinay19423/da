#implement att subset selection for data reduction
#implement attribute subset selection for data reduction

library(leaps)
library(dplyr)

#View(Titanic)

Titanic <- Titanic %>% na.omit()

fwd <- regsubsets(Freq~., data = Titanic, nvmax = 19, method = "forward")
print(summary(fwd))
coef(fwd, 3)

bwd <- regsubsets(Freq~., data = Titanic, nvmax = 19, method = "backward")
print(summary(bwd))
coef(bwd, 3)

full <- regsubsets(Freq~., data = Titanic, nvmax = 19)
summary(full)
coef(full, 3)




