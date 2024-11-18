#demonstarate outliers 
#demonstaate outliers

fp <- "/Users/AbhinayP/Downloads/day.csv"
day <- read.csv(fp)

View(day)

sum(is.na(day))
boxplot(day[, c("temp", "hum", "windspeed")])

for(i in c("hum", "windspeed")){
  data <- unlist(day[i])
  newData <- data[ data %in% boxplot.stats(data)$out] #checing if a value is present
  data[data %in% newData] <- NA
  day[i] <- data
}


sum(is.na(data))
day <- na.exclude(day)
boxplot(day[, c("temp", "hum", "windspeed")])

