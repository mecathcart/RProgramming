complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ##list.files first
  files_list <- dir(directory, full.names=TRUE)[id]
  
  ## initialize result array to NA so we can avoid
  ## using combine function (don't really understand this part)
  result <- rep(NA,length(files_list))
  
  ##then, for loop to go through each file
  for (i in 1:length(files_list)) {
    ##count observed cases for either sulfate or nitrate columns
    dat <- read.csv(files_list[i])
    result[i] <- sum(complete.cases(dat))
  }
  
  ##then, create data frame with 2 columns with names id and nobs
  data.frame(id, nobs=result)
}