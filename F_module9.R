# This file will fullfill the requirements of Assingment 9 wherin use 
#of version control such as Git and Github with R studio 
#integration was explored.
# Authors: Jessie Briggs and Tyler Koloski
# last modified: 10/26/17

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
#Omnivores have the least variation.

#Question 2
msleep$lnWeight <- log(msleep$bodywt)
plot(msleep$lnWeight, msleep$sleep_cycle, xlab = "Natural log of Body size", ylab = "Sleep Cycle")

ggplot(data = msleep, aes(x = lnWeight, y = sleep_cycle)) + geom_point(color = "black", alpha = 0.5) +
  facet_wrap(~conservation) + stat_smooth(method = "lm", se = F)

#The specie within each conservation status show a positive correlation between body weight and sleep cycle duration.
#However, only 3 conservations groups had enough data to show a trend.

#Question 3
se <- function(x){
  semean <- sd(x, na.rm=TRUE)/sqrt(length(na.omit(x)))
  return(semean)
  }

brain_body_ratio<-function(msleep){
  msleep <- msleep[!is.na(msleep$brainwt) & !is.na(msleep$bodywt) & !is.na(msleep$vore), ] 
  bbmean <- as.data.frame(tapply(msleep$brainwt/msleep$bodywt, msleep$vore, mean))
  bbse <- as.data.frame(tapply(msleep$brainwt/msleep$bodywt, msleep$vore, se)) 
  brainbody<-cbind(bbmean, bbse)
  colnames(brainbody) <-c("brain body mean", "brain body se")
  brainbody$vore<-rownames(brainbody)
  return(brainbody)
}

brain_body_ratio(msleep)
