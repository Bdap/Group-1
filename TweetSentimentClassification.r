tweets=read.csv("/Users/Dinesh/Desktop/BDAP/NLP/nilesh-tweets.csv")
View(tweets)
some_txt<-gsub("(RT|via)((?:\\b\\w*@\\w+)+)","",tweets$text)
some_txt<-gsub("http[^[:blank:]]+","",some_txt)
some_txt<-gsub("@\\w+","",some_txt)
some_txt<-gsub("[[:punct:]]"," ",some_txt)
some_txt<-gsub("[^[:alnum:]]"," ",some_txt)


tweetSentiment <- get_nrc_sentiment(some_txt,)


x<-tweetSentiment[1:10,]
View(x)
barplot(
  sort(colSums(prop.table(tweetSentiment[, 1:8]))), 
   col = "blue",
  cex.names = 0.7, 
  las = 2, 
  main = "Emotions in Tweets text", ylab="Percentage"
)



