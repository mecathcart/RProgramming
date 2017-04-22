corr <- function(directory, threshold=0){
  ## 'directory' is a character vector of length 1 indicating the location
  ## of the .csv files
  
  ## 'threshold' is a numeric vector of length 1 indicating the number of
  ## completely observed observations (on all variables) required to compute
  ## the correlation between nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: do not round the result!
  
  ## First list.files
files_list <- dir(directory, full.names=TRUE)

## initialize result array to NA so we can avoid
## using combine function (don't really understand this part)
result <- rep(NA,length(files_list))
final <- rep(NA,332)


## for loop for each i
for (i in 1:332) {
  ##count observed cases for either sulfate or nitrate columns
  dat <- read.csv(files_list[i])
  result[i] <- sum(complete.cases(dat))
  
  ##  if, then statement inside of it, saying that if the complete.cases meets
  ##  the threshold, print to vector
  if (result[i]>threshold) {
    final[i] <- cor(dat[2],dat[3],use="complete.obs")}
  }

#data.frame(final)
final
}

