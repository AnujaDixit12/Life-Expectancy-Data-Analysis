getwd()
#loading libraries
library(tidyverse)
library(janitor)
library(ggplot2)
library(dplyr)
library(lubridate)
life<-read.csv("C:\\Users\\anuja\\Downloads\\life_expectancy_by_country.csv")
View(life)
str(life)
dim(life)
#checking for duplicate entries
life <- life[!duplicated(life), ]
dim(life)
life <- unique( life[ , c('country_code','country_name','year','value') ] )
dim(life)
#checking for empty rows and columns
life<-janitor::remove_empty(life,which = c("cols"))
life<-janitor::remove_empty(life,which = c("rows"))
#counting total number of entries in different
#years
life %>% count(year)