#Clear enviornment
rm(list = ls())
setwd("/BME/Sem 2/Biostat/Class8")
pathname<-"C:/BME/Sem 2/Biostat/Class8"
f<-read.csv("C:/BME/Sem 2/Biostat/Class8/input.csv")


library(dplyr) 
library(plyr)
library(Rmisc)
f<-read.csv("input.csv") 
head(f)

summary(f)
#Con???dence Interval
CI(f$SBP, ci=0.95)
CI(f$DBP, ci=0.95)
male<-f[which(f$gender==1),]
female<-f[which(f$gender==2),]
#Comparing SBP for male and female 
t.test(male$SBP,female$SBP)
#Comparing DBP for male and female 
t.test(male$DBP,female$DBP)


#Comparing BP di???erence in male >60 and <=60 (creating data sets) 
male_older_60<-male[which(male$age>60),]
male_younger_60<-male[which(male$age<=60),] 
female_older_60<-female[which(female$age>60),] 
female_younger_60<-female[which(female$age<=60),]

#SBP in male
t.test(male_older_60$SBP,male_younger_60$SBP)
#DBP in male
t.test(male_older_60$DBP,male_younger_60$DBP)
#SBP in female
t.test(female_older_60$SBP,female_younger_60$SBP)
#DBP in female
t.test(female_older_60$DBP,female_younger_60$DBP)

             
             
             
             
             