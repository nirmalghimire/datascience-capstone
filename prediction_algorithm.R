# Prediction Algorithm for Twitter
prediction_twitter <- function(x){
  require(tm)
  twitterdata <- read.csv("C:/Users/nirma/Documents/Coursera/Data Science/Data Science Capstone/final/en_US/en_US.twitter.txt",stringsAsFactors=FALSE)
  default <- twitterdata[twitterdata$length==1,8]
  
  # Creating Data Cleaning Functions
  clean <- tolower(x)
  clean <- gsub("[[:punct:]]","", work)
  clean <- gsub("+\\d+","",work)
  clean <- gsub("^ *|(?<= ) | *$",work, perl = TRUE)
  
  # Splitting Twitter Data into one, two, three, and four word strings
  split_t <- strsplit(work," ")
  length_t <- length(split_t[[1]])
  if(length_t < 3){maxcount <- length_t}else{maxcount <- 3}
  
  for(i in 1:maxcount){
    aanishma <- paste("n", i, "_search", sep="")
    assign(aanishma, split_t[[1]][length_t+1-i])
  }
  
  #Search for trigram
  if(maxcount > 2){
    n3_search <- paste(n3_search,n2_search,n1_search, sep=" ")
    
    n3_twitter <- twitterdata[twitterdata$less1gram==n3_search,]
    if(nrow(n3_twitter)<1){n3_next <- c(0, default)} else{n3_next <- n3_twitter[1,7:8]}
  
  }else {n3_next <- c(0,default)}
  
  #Search for bigram
  if(maxcount > 1){
    n2_search <- paste(n2_search, n1_search, sep="")
    
    n2_twitter <- twitterdata[twitterdata$less1gram==n2_search,]
    if(nrow(n2_twitter)<1){n2_next <- c(0, default)} else{n2_next <- n2_twitter[1,7:8]}
    
  }else {n2_next <- c(0,default)}
  
  #Search for Unigram
  n1_twitter <- twitterdata[twitterdata$less1gram==n1_search,]
  if(nrow(n1_twitter)<1){n1_next <- c(0, default)} else{n1_next <- n1_twitter[1,7:8]}
  
  if(n2_next[1] > n3_next[1]){display <- n2_next} else {display <- n3_next}
  if(n1_next[1] > display[1]) {output <- n1_next} else {display}
  
  output
  }