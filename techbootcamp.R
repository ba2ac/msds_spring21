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
  size <- readline(prompt= "How long is the list? ")
  
  for(i in 1:size){
    newword <- readline(prompt= "Enter a new word: ")
    mylist[i] <- newword
  }
  mylist
}

make_list()
