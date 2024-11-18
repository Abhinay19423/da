library(tidyverse)

View(airquality)

which(is.na(airquality))
sum(is.na(airquality))

oz <- mean(airquality$Ozone, na.rm = TRUE)

newaq <- airquality %>% mutate(Ozone = ifelse(is.na(Ozone), oz, Ozone))

View(newaq)

#which(is)