source("http://www.openintro.org/stat/data/cdc.R")
head(cdc)
ncol(cdc)
nrow(cdc)
dim(cdc)
sum(cdc$gender == "m")
sum(cdc$gender == "f")
sum(cdc$age>25)
sum(cdc$age>35)
hist(cdc$age, xlab = "age", main = "Histogram" )
mean(cdc$height)
summary((cdc$height))
median(cdc$height)
mode(cdc$height)
getmode <- function(cdc$height) {
  uniqv <- unique(cdc$height)
  uniqv[which.max(tabulate(match(cdc$height, uniqv)))]
}
result <- getmode(cdc$height)
print(result)
var((cdc$height))
sd(cdc$height)
IQR(cdc$height)
hist(cdc$height,xlab = "height", main = "Histogram")
boxplot(cdc$height)

# newdata vaa nhi smjh me aya
newdata <- cdc[which(cdc$gender=="f" ),] 
head(newdata)
h<-hist(newdata$height,xlab = "height", main = "Histogram of women's height")

# isme x axis or y axis kaise add krni
boxplot(newdata$height)

table(cdc$gender)

barplot(table(cdc$gender)
,main = "Gender counts", xlab = "Gender", ylab = "Frequency")
        
# type it
cdc$BMI<-cdc$weight/(cdc$height*cdc$height)
head(cdc)

# type it 
men<-cdc[which(cdc$gender=='m'), ]
head(men)
hist(men$BMI,xlab ="BMI", main = " Men's Histogram")
summary(men)

#type it
women<-cdc[which(cdc$gender=='f'), ]
head(women)
hist(women$BMI,xlab ="BMI", main = "Women's Histogram")
summary(women)
# yaha pr mean vala scen kyu ni chla
