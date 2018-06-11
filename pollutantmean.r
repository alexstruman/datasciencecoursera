

pollutantmean <- function(directory,pollutant,id=1:322) {
  ##load data specified by id variable
  files<-list.files(directory,full.names=TRUE) ##Create a vector with all file names in specified directory
  i <- 1 ##set value for start of loop
  while(i<=length(id)) { ##cycles through all values in id variable
    x<-id[i] 
    filename<-(files[x]) ##Sets file name, based on id
    if(!exists("specdata")){  ##Checks if the varialbe is already present if so, skips to append, if not, creates it
      specdata<-read.csv(filename,header=TRUE)
    } else {
      temp_specdata<-read.csv(filename,header=TRUE)
      specdata<-rbind(specdata,temp_specdata)  ##this is the append function used if the variable is present
    }
    i<-i+1
  }
  ##data loaded
  mean(specdata[ ,pollutant],na.rm=TRUE)  ##take mean of selected column, disregarding NAs
}

