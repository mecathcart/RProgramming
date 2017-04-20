pollutantmean <- function(directory, pollutant, id = 1:332){
  files_list <- list.files(directory, full.names=TRUE) 
  dat <- data.frame() 
  
  for (i in id) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[pollutant]
  dat_subset <- dat_subset[!is.na(dat_subset)]
  mean(dat_subset, na.rm=TRUE)      
}