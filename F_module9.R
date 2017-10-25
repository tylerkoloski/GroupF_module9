# This file will fullfill the requirements of Assingment 9 wherin use 
#of version control such as Git and Github with R studio 
#integration was explored.
# Authors: Jessie Briggs and Tyler Koloski
# last modified: 10/25/17

#Question 1
library(ggplot2)
data(msleep)
?msleep

head(msleep)
summary(msleep)
unique(msleep$vore)
# There are 4 unique types of diet as well as NAs 
boxplot(msleep$sleep_total[msleep$vore != "NA"] ~ msleep$vore[msleep$vore != "NA"], ylab = "sleep_total", xlab = "Vore")

#On average mammals with a insect diet will have higher sleeping totals than animals which eat in the other categories. 

#Question 2



#Question 3