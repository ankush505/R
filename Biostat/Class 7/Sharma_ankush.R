rm(list = ls())
pathname<-"C:/BME/Sem 2/Biostat/Class 7/"
sbp<-read.csv(paste(pathname,"Lab Week 7 - NHANES subset.csv",sep=""))

summary(sbp$SBP)
mean(sbp$SBP)
median(sbp$SBP)
sd(sbp$SBP)

library(plotrix)
std.error(sbp$SBP)
quantile(sbp$SBP)
quantile(sbp$SBP)[2]
quantile(sbp$SBP)[4]
IQR(sbp$SBP)

pdf(paste(pathname,"Grade Lab.pdf",sep=""))
{
        
        {
                hist(df$SBP,breaks = 70)
                abline(v=mean(df$SBP)+sd(df$SBP), lty=2,col="red")
                abline(v=mean(df$SBP),lty=1,col="blue")
                abline(v=mean(df$SBP)-sd(df$SBP), lty=2,col="red")
                text(x=175,y=150,labels="mean+/-sd")
        }
        {
                hist(df$SBP,breaks = 50)
                abline(v=mean(df$SBP)+sd(df$SBP), lty=2,col="red")
                abline(v=mean(df$SBP),lty=1,col="blue")
                abline(v=mean(df$SBP)-sd(df$SBP), lty=2,col="red")
                text(x=175,y=150,labels="mean+/-sd, SE")
                
        }
        {
                hist(df$SBP,breaks = 20)
                abline(v=mean(df$SBP)+sd(df$SBP), lty=2,col="red")
                abline(v=mean(df$SBP),lty=1,col="blue")
                abline(v=mean(df$SBP)-sd(df$SBP), lty=2,col="red")
                text(x=175,y=150,labels="mean+/-sd")
                
        }}

dev.off()

sd(sbp$SBP)
standard_error = sd(sbp$SBP)/sqrt(length(sbp$SBP))
standard_error

#Sample 1
set.seed(123)
index1 <- sample(1:nrow(sbp), 100)
Sample1 <- sbp[index1,]

View(Sample1)
nrow(Sample1)
sd(Sample1$SBP)
sd(Sample1$SBP)/sqrt(length(Sample1$SBP))

#Sample 2
set.seed(124)
index2 <- sample(1:nrow(sbp), 100)
Sample2 <- sbp[index2,]

sd(Sample2$SBP)
sd(Sample2$SBP)/sqrt(length(Sample2$SBP))

#Sample 3
set.seed(125)
index3 <- sample(1:nrow(sbp), 100)
Sample3 <- sbp[index3,]

sd(Sample3$SBP)
sd(Sample3$SBP)/sqrt(length(Sample3$SBP))

mean(sbp$SBP) - 2*sd(sbp$SBP)
mean(sbp$SBP) + 2*sd(sbp$SBP)

