# r script for hackathon

# setting working directory
setwd("~/msds_spring21/techbootcamp")

# loading in libraries
library(readxl)
library(tidyverse)
library(plotly)

# reading in data
co2 <- read_excel("co2_emissions_tonnes_per_person.xlsx")
head(co2)

income_pp <- read_excel("income_per_person_gdppercapita_ppp_inflation_adjusted.xlsx")
head(income_pp)

population_total <- read_excel("population_total.xlsx")

continents <- read.csv('continents2.csv') %>% select('name', 'region')

# reformatting data
co2_long <- co2 %>% gather('year', 'co2_pp', 2:ncol(co2)) %>% filter(year >= 1975 & year <= 2003)
head(co2_long)

incomepp_long <- income_pp %>% gather('year', 'income_pp', 2:ncol(income_pp)) %>% filter(year >= 1975 & year <= 2003)
head(incomepp_long)

population_long <- population_total %>% gather('year', 'population', 2:ncol(population_total)) %>% filter(year >= 1975 & year <= 2003)
head(population_long)

# combining the data into one df
data <- merge(co2_long, incomepp_long, by= c('country', 'year'))
data <- merge(data, population_long, by= c('country', 'year'))
data <- merge(data, continents, by.x= 'country', by.y= 'name', all.x= TRUE)

# scatterplot
g <- data %>% ggplot(aes(x= income_pp, y= co2_pp, size= population/1000000, color= region, frame= year)) + 
  geom_point() + 
  labs(x= 'Income per Person', y= 'CO2 Emissions per Person', 
       title= 'Income vs CO2 Emissions per Person', 
       size= 'Population (in Millions)', color= 'Continent') +
  theme(plot.title= element_text(hjust = 0.5))

ggplotly(g)
