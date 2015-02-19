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
    Ptest2<-predict(modfit2,testingM)
    testingM[1,2]<-ShAge
    testingM[1,4]<-Shbmi
    testingM[1,9]<-ShDBP
    return(Ptest2[1])
}

#print (predSBP(50,40,100))