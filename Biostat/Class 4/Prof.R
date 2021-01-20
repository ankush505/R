#Emptying environment
rm(list=ls())
#load dataset
df<-read.csv("//YUWACAFSV01/jraimann$/Desktop/BTM6000 Spring 2020/Class 4/Participation Lab Class 4 - BMI.csv")

#inspect datafile
str(df)
ls(df)

#display distribution of BMI
hist(df$BMI)

#evaluate central tendency and variability 
mean(df$BMI)
sd(df$BMI)

#creation of a data fram
test<-data.frame("count"=1:6,"counter_count"=6:1)
ls(test)

#creation of index points 
index_points<-data.frame("index_values"=c(mean(df$BMI)+3*sd(df$BMI),
                mean(df$BMI)+2*sd(df$BMI),
                mean(df$BMI)+1*sd(df$BMI),
                mean(df$BMI),
                mean(df$BMI)-sd(df$BMI),
                mean(df$BMI)-2*sd(df$BMI),
                mean(df$BMI)-3*sd(df$BMI)))
index_points$z=(index_points$index_values-mean(df$BMI))/sd(df$BMI)
index_points$p<-pnorm(index_points$z)







