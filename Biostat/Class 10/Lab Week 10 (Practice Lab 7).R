library("pwr")
#1) Researchers want to compare for a planned RCT the sample sizes needed (sig level of 0.05)
#to detect a difference with a power of 90% under the assumption of 
pwr.t.test(power = 0.9, d=0.2,sig.level=.05,alternative="two.sided")
pwr.t.test(power = 0.9, d=0.5,sig.level=.05,alternative="two.sided")
pwr.t.test(power = 0.9, d=0.8,sig.level=.05,alternative="two.sided")
pwr.t.test(n=18, d=0.8,sig.level=.05,alternative="two.sided")

#2)	Researchers want to compare the sample sizes needed within each group when comparing 5 groups using a one-way ANOVA
#in a planned RCT (sig level of 0.05) aiming for a power of 90% with
pwr.anova.test(k=5,f=.2,sig.level=.05,power=.9)
pwr.anova.test(k=5,f=.5,sig.level=.05,power=.9)
pwr.anova.test(k=5,f=.8,sig.level=.05,power=.9)
pwr.anova.test(k=5,f=.8,sig.level=.05,power=.9)
pwr.anova.test(k=5,f=.8,sig.level=.05,n=8)

#3)	In a population study in Western Africa with an incidence proportion of infectious gastroenteritis of 30% in two neighboring villages a
#NGO implements a membrane filtration device cleaning water. Considering 150 villagers in each village, what effect size can be detected with
#a power of 80% at a significance level of 
pwr.2p.test(n=45,sig.level=0.01,power=0.80)
pwr.2p.test(n=45,sig.level=0.05,power=0.80)

#4)	ANOVA: Load the NHANES subset  into your R environment. 
#Stratify the sample population in SBP tertiles. 
#ANOVA
pathname<-"C:/BME/Sem 2/Biostat/Class 10.csv"
df<-read.csv("C:/BME/Sem 2/Biostat/Class 10/lab.csv")
ls(df)
library(dplyr)
df$SBP_cat<-ntile(df$SBP,3)
df$SBP_cat<-factor(df$SBP_cat)
summary(df$SBP_cat)
library(doBy)
summaryBy(SBP~SBP_cat,data=df,FUN=c(min, max))
aov(SBP~SBP_cat,data=df)
#compare the age of subjects in the respective tertiles. 
summary(aov(age~SBP_cat,data=df))

#compare the age of subjects applying Bonferroni correction. 
anova_example<-aov(age~SBP_cat,data=df)
TukeyHSD(anova_example)
pairwise.t.test(df$age,df$SBP_cat,p.adjust.method = "bonf" )



