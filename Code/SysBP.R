library(caret)
predSBP<-function (ShAge,Shbmi,ShDBP){
# read the data for obtaining the model
#    setwd("../Data")
    datall<-read.csv("BPdata.csv")
#divide the data for training and testing
    set.seed(1000)
    indx<-createDataPartition(y=datall$SBP,p=0.7,list=FALSE)
    trainingM<-datall[indx,]
    testingM<-datall[-indx,]
#Obtain the model using random trees

    modfit2<-train(SBP ~ Age + bmi+ DBP,method="rf",prox=TRUE,data=trainingM,ntree=15)
    testingM[1,2]<-ShAge
    testingM[1,4]<-Shbmi
    testingM[1,9]<-ShDBP
    Ptest2<-predict(modfit2,testingM)
    return(Ptest2[1])
}

# print (predSBP(80,40,90))
# print (predSBP(50,30,90))
# print (predSBP(60,20,90))