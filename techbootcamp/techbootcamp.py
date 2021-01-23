# python script for tech boot camp

## module 5: programming

# exercise 1: print the time
from datetime import datetime

now = datetime.now()
current_time = now.strftime("%H:%M:%S")
print("Current Time =", current_time)

# exercise 2: make a stopwatch
import time

print("Press ENTER to start the stopwatch")
print("and, press CTRL + C to stop the stopwatch")

# infinite loop
while True:
    try:
        input() #For ENTER
        start_time = time.time()
        print("Stopwatch started...")
        
    except KeyboardInterrupt:
        print("Stopwatch stopped...")
        end_time = time.time()
        print("The total time:", round(end_time - start_time, 2),"seconds")
        break # breaking the loop

# exercise 3: print a word provided by the user
print("My name is", input("Enter name: "))

# exercise 4: validate user input
from nltk.corpus import wordnet

def is_word():
    word = input("Enter a word: ")
    if not wordnet.synsets(word):
        print("Not a word")
    else:
        print(word)
        
is_word()

# exercise 5: record and print a list
def make_list():
    mylist = []
    size = int(input("How long is the list? "))
    
    for i in range(size):
        newword = input("Enter a new word: ")
        mylist.append(newword)
    return mylist

make_list()

## module 6: csv + visualization + pipeline

# exercise 1: recreate the example pipeline

import pandas as pd

df =  pd.read_csv("/Users/Brago/msds_spring21/andre.csv")

df = df[ df.Year > 1976 ]
df = df[ df.Year < 1994 ]

df.hist("H",bins=100)

# exercise 2: create my own pipeline

# load the data
df = pd.read_csv("/Users/Brago/msds_spring21/top100.csv")

# filter the guards
df1 = df[df['POSITION'] == 'Guard']

# histogram of points
df1.hist('PTS')
