library(shiny)
library(caret)
source("SysBP.R")
datall<-read.csv("BPdata.csv")
shinyServer(

  
  function(input, output) {
    output$SBP <- renderPrint(predSBP(input$Age,input$BMI,input$DBP))
  }
)
