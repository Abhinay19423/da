arr <- c(323,343,43,4343,4456,6,67854,33,3577)

minarr <- min(arr)
maxarr <- max(arr)
arrr <- arr

for(i in 1:length(arr)){
  arrr[i] <- round((arr[i] - minarr)/ (maxarr - minarr))

}

print(arrr)

#z score

sdarr <- sd(arr)
meanarr <- mean(arr)
for(i in 1:length(arr)){
  arrr[i] <- round((arr[i] - meanarr)/sdarr, 2)
}

print(arrr)
