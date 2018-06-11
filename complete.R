complete <- function(directory,id=1:322) {
  ##load data specified by id variable
  files<-list.files(directory,full.names=TRUE) ##Load all file names in specified directory
  observations<-data.frame("id"=integer(0),"nobs"=numeric(0))##create data frame with column headers
  i <- 1 ##set value for start of loop
  row<-1 ##could use i but in case I need to perform an operation on this, used a different variable
  while(i <= length(id)) { ##cycles through all values in id variable
    x<-id[i]
    specdata<-read.csv(files[x],header=TRUE) ##reads file
    ##data loaded
    completes<-(complete.cases(specdata)) ##creates logical vector with complete cases
    completescount<-(length(completes[completes==TRUE])) ##Counts number of "TRUE" in logical vector - if this could contain NAs, would need to use other method, but complete.cases cannot
    observations[row,]<-c(x,completescount) ##writes values of id and count of completes for this iteration to the appropriate row
    row <- row+1
    i<-i+1
  }
  print(observations) 
}


