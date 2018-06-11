corr <- function(directory,threshold=0) {
  files<-list.files(directory,full.names=TRUE)
  ##Call complete
  invisible(capture.output(universe<-complete(directory)))
  candidates<-subset(universe, nobs > threshold)
  candidateids<-candidates[,"id"]
  i<-1
  correlations<-numeric()
  correlations<-0
  if(threshold > max(universe["nobs"])) {
    correlations <-vector(mode="numeric",length=0)
  } else {
    while(i <= length(candidateids)) {
      x<-candidateids[i]
      datapoint<-read.csv(files[x],header=TRUE)
      attach(datapoint)
      correlations<-c(correlations, cor(sulfate,nitrate,use="complete.obs"))
      detach(datapoint)
      i<-i+1
    }
  }
  print(correlations)
}
