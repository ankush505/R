rm(list = ls())
pathname<-"C:/BME/Sem 2/Biostat/Class 6/"
df<-read.csv(paste(pathname,"Lab Week 6 - NHANES subset.csv",sep=""))

ls(df)
hist(df$eGFR)
summary(df$eGFR)
df[1,]
df[,1]
colnames(df[1])
colnames(df)
df<-df[which(!is.na(df$eGFR)),]

df$CKD_new<-NA
df$CKD_new<-ifelse(df$eGFR<60,1,0)
summary(df$CKD_new)
df$CKD_new_factor<-factor(df$CKD_new,labels = c("no CKD","CKD"))
summary(df$CKD_new_factor)

a<-c(0,0,1)
a[a==1]
a[a!=1]

ls(df)
summary(df$SCr_elevated)
df$SCr_elevated<-factor(df$SCr_elevated,labels = c("elevated","not elevated"))
ctable<-table(df$SCr_elevated,df$CKD_new_factor)

Sensitivty <-ctable[4]/(ctable[4]+ctable[3])
specifcity <- ctable[1]/(ctable[1]+ctable[2])

library(pROC)
# ROC curve
roc(df$CKD3,df$creatinine,plot=TRUE)

