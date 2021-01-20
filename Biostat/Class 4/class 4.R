
# it is used to clear environment
rm(list = ls())


df <-read.csv("C:/BME/Sem 2/Biostat/Class 4/Participation Lab Class 4 - BMI.csv")

#a.	Calculate all index points for the empirical rule

str(df)
ls(df)

df$BMI

hist(df$BMI)

mean(df$BMI)
sd(df$BMI)

index_points<-data.frame("index_values" = c(mean(df$BMI)+3*sd(df$BMI),
              mean(df$BMI)+2*sd(df$BMI),
              mean(df$BMI)+1*sd(df$BMI),
              mean(df$BMI),
              mean(df$BMI)-sd(df$BMI),
              mean(df$BMI)-2*sd(df$BMI),
              mean(df$BMI)-3*sd(df$BMI)),
              "Z"=(index_points$index_values-mean(df$BMI))/sd(df$BMI),
              "p"=pnorm(index_points$Z))

ls(index_points)      
index_points


