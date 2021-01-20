pathname<-"/Users/jochen.raimann/Library/Mobile Documents/com~apple~CloudDocs/Academia/Yeshiva/Spring 2020/Graduates/Classes/Class 9/Practice Lab 5 (for Class 9)/Dataset Participation Lab 5.csv"
df<-read.csv(pathname)

#The attached data setPreview the document is a simulated
#dataset of dialysis patients receiving thrice-weekly dialysis.

#DAYS_FROM_FDD – running time counter, NLR – neutrophil lymphocyte ratio,
#SBP and DBP – systolic and diastolic blood pressure.

#Aggregate all parameters to a patient-level (using the aggregate function)
#by building means of all continuous parameters
#Count the number of deaths.
#Was there a difference between SBP and DBP between those that died and those that didn’t?
#  Did Albumin differ between men and women?
#  Did NLR differ between the highest and the lowest tertile of SBP?

rm(list = ls())
setwd("C:/BME/Sem 2/Biostat/Class 9")
f<-read.csv("C:/BME/Sem 2/Biostat/Class 9/lab.csv")
df<-data.frame("PATIENT_ID"=unique(f$PATIENT_ID))

f[f$PATIENT_ID==1,]
max(df$DAYS_FROM_FDD[df$PATIENT_ID==1])
df_temp_max<-aggregate(df$DAYS_FROM_FDD,by=list(df$PATIENT_ID),FUN=max)
colnames(df_temp_max)<-c("PATIENT_ID","max_days")
df_temp_NLR<-aggregate(df$NLR,by=list(df$PATIENT_ID),FUN=mean,na.rm=TRUE)
colnames(df_temp_NLR)<-c("PATIENT_ID","NLR")
df_temp_SBP<-aggregate(df$SBP,by=list(df$PATIENT_ID),FUN=mean,na.rm=TRUE)
colnames(df_temp_SBP)<-c("PATIENT_ID","SBP")

library(dplyr)
df_agg<-left_join(df_agg,df_temp_max,by="PATIENT_ID")
df_agg<-left_join(df_agg,df_temp_NLR,by="PATIENT_ID")
df_agg<-left_join(df_agg,df_temp_SBP,by="PATIENT_ID")

df_agg$tertiles_SBP<-factor(ntile(df_agg$SBP,3),labels=c("Tertile 1","Tertile 2","Tertile 3"))
df_agg$tertiles_SBP<-relevel(df_agg$tertiles_SBP,"Tertile 1")
summary(df_agg$tertiles_SBP)

mean(df_agg$NLR)
mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 1"])
mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 2"])
mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 3"])

Demographics<-data.frame("Parameter"=c("Tertile 1","Tertile 2","Tertile 3"),
                         "NLR_mean"=NA,"NLR_sd"=NA)
Demographics[1,2]<-mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 1"])
Demographics[1,3]<-sd(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 1"])
Demographics[2,2]<-mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 2"])
Demographics[2,3]<-sd(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 2"])
Demographics[3,2]<-mean(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 3"])
Demographics[3,3]<-sd(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 3"])
Demographics

Demographics[,2:3]<-round(Demographics[,2:3],2)

?t.test

t<-t.test(df_agg$NLR[df_agg$tertiles_SBP=="Tertile 3"],df_agg$NLR[df_agg$tertiles_SBP=="Tertile 1"])
t$parameter
t$p.value
t$conf.int[1]
t$conf.int[2]

for (i in 1:length(t$conf.int))
{
  print(t$conf.int[i])
  
  
}

