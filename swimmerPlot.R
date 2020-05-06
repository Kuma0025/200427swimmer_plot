#install.packages("tidyverse")
library(tidyverse)
library(reshape2)
library(dplyr)
library(grid)

#?̌??f?[?^?̓ǂݍ???
df <- read.table("blood_sampling.csv", header=F, sep=",", stringsAsFactors = F)
names(df) <- c("department", "id", "date", 
               "day1", "day2", "day3", "day4", "day5") #?񖼂̒??`
df$date <- as.Date(df$date) #data???̕???????Date?^?ɕϊ?
df$duration <- as.integer(Sys.Date() - df$date)
#df$type <- df$id  #ID???ɂ????F?????͂܂????Ƃł??낤?B
df.m <- melt(df[, c("id", "day1", "day2", "day3", "day4", "day5")],
             id.var=c("id"))


ggplot(df, aes(id, duration)) +
  geom_bar(stat="identity") +
  geom_point(data=df.m, aes(id, value)) +
  coord_flip()+
  labs(x="Case", y="Days")+
  theme_bw()
  
  


my_birthday <- c("1996/09/29", "1998/09/29","1997/09/29",  "1999/09/29", "2000/09/29")
my_birthday <- as.Date(my_birthday)
my_birthday_diff <- my_birthday - my_birthday[1]

