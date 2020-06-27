library(readr)
hpv <- read_csv("~/Desktop/7460 project/topic modeling/hpv(no duplicated.csv")
library(stringr)
Clean_text <- function(text){
#remove urls
text <- str_replace_all(text,"https[^[:blank:]]+", " ")
# Remove everything that is not a number or letter
text <- str_replace_all(text,"[^a-zA-Z\\s]", " ")
# Shrink down to just one white space
text <- str_replace_all(text,"[\\s]+", " ")
return(text)
}
hpv$cleantext = Clean_text(hpv$text)
library(syuzhet)
hpv$sentiment = get_sentiment(hpv$cleantext,method="bing")
hpv$emotion = get_nrc_sentiment(hpv$cleantext)
