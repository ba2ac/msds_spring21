# r script for tech boot camp

## module 5: programming

# exercise 1: print the time
Sys.time()

# exercise 2: make a stopwatch
tic <- function(){
  now <- proc.time()
  function(){
    proc.time() - now
  }
}

toc <- tic()
toc

proc.time()

# exercise 3: print a word provided by the user
print(paste("My name is", readline(prompt= "Enter name: ")))

# exercise 4: validate user input
library(qdapDictionaries)

is.word <- function(){
  word <- readline(prompt= "Enter a word: ")
  if(word %in% GradyAugmented){
  print(word)
} else{
  print('Not a word')
}
}

is.word()

# exercise 5: record and print a list
make_list <- function(){
  mylist <- c()
  size <- as.numeric(readline(prompt= "How long is the list? "))
  
  for(i in 1:size){
    newword <- readline(prompt= "Enter a new word: ")
    mylist[i] <- newword
  }
  mylist
}

make_list()


## module 6: csv + visualization + pipeline

#exercise 1: recreate the example pipeline

library(tidyverse)

df <- read_csv("/Users/Brago/msds_spring21/andre.csv", col_names = TRUE)

df <- filter(df, Year != 1976)
df <- filter(df, Year <  1994)

ggplot(data=df, aes(df$H)) + geom_histogram()

# exercise 2: create my own pipeline

# load the data
df <- read_csv("/Users/Brago/msds_spring21/top100.csv", col_names = TRUE)

# filter the guards
df1 = filter(df, POSITION == 'Guard')

# histogram of points
ggplot(df1, aes(x= PTS)) + geom_histogram()
