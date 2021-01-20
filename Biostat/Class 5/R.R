download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData") 
getwd()
pathname<- "C:/BME/Sem 2/Biostat/Class 5/"
write.csv(ames,paste(pathname,"ames.csv",sep=""))

Summary(ames$Gr.Liv.Area)
sd(ames$Gr.Liv.Area)

ls(ames)

df1<-sample(ames$Gr.Liv.Area,60,replace=FALSE)
summary(df1)
sd(df1)
hist(df1)

#.	Create a second sample and describe and compare this one.
df2<-sample(ames$Gr.Liv.Area,60,replace=FALSE)
summary(df2)
sd(df2)
hist(df2)

# What would be the result to take more samples? 
# ans. it would be more bell shaped

# .	Create a dataset with 500 independent sample means from the overall population; how does the mean distribute? What does the mean of this distribution tell us?

sample_means<-as.vector(rep(NA,500))
length((sample_means))

for(i in 1: 500)
{

  sample_means[i]<-mean(sample(ames$Gr.Liv.Area,60,replace=FALSE))  
}
sample_means
hist(sample_means)
mean(sample_means)
mean(ames$Gr.Liv.Area)

#	Take a random sample of 50 from price. What is the best point estimate of the population mean?

df_price<-sample(ames$SalePrice,50,replace=FALSE)
summary(df_price)
sd(df_price)
hist(df_price)

#	Create a dataframe with 5000 independent sample means and compare the distribution and the mean of the means to those of the overall population.

sample_means_price<-as.vector(rep(NA,5000))
for(i in 1: 5000)
{
  
  sample_means_price[i]<-mean(sample(ames$SalePrice,50,replace=FALSE))  
}

summary(sample_means_price)
sd(sample_means_price)
hist(sample_means_price)

#.	Stratify the overall population by prize 

library(dplyr)
ames$price_quartile<-ntile(ames$SalePrice,4)

library(doBy)
summaryBy(SalePrice~price_quartile,data=ames,FUN=mean)
