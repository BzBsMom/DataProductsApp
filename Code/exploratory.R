setwd("../Data")
datafem<-read.csv("fem_todos_.csv",sep=";")
datafem$bmi<-gsub(",",".",datafem$bmi)
datafem$SBP<-gsub(",",".",datafem$SBP)
datafem$DBP<-gsub(",",".",datafem$DBP)
datamasc<-read.csv("masc_todos_.csv",sep=";")
datamasc$bmi<-gsub(",",".",datamasc$bmi)
datamasc$SBP<-gsub(",",".",datamasc$SBP)
datamasc$DBP<-gsub(",",".",datamasc$DBP)
summary(datafem)
str(datafem)
summary(datamasc)
str(datamasc)
homoname<-names(datafem)
homoname[10]<-"hyper"
names(datafem)<-homoname
datall<-rbind(datafem,datamasc)
datall$bmi<-as.numeric(datall$bmi)
datall$SBP<-as.numeric(datall$SBP)
datall$DBP<-as.numeric(datall$DBP)
datall$DBP<-as.factor(round(datall$DBP))
datall$bmi<-as.factor(round(datall$bmi))
nzv<-nearZeroVar(datall,saveMetrics=TRUE)
write.csv(datall,file="BPdata.csv",row.names=FALSE)

library(caret)
set.seed(1000)
indx<-createDataPartition(y=datall$SBP,p=0.7,list=FALSE)
trainingM<-datall[indx,]
testingM<-datall[-indx,]


modfit2<-train(SBP ~ Age + bmi+ DBP,method="rf",prox=TRUE,data=trainingM,ntree=15)
testingM[1,2]<-50
testingM[1,4]<-30
testingM[1,9]<-90
str(testingM)
Ptest2<-predict(modfit2,testingM)


