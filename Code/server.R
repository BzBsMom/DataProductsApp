library(shiny)
library(caret)
source("SysBP.R")
tableBP<-read.csv("TableBP.csv")
tableBP<-tableBP[1:4,1:3]

datall<-read.csv("BPdata.csv")
shinyServer(
  function(input, output) {
    output$SBP <- renderPrint(predSBP(input$Age,input$BMI,input$DBP))
    output$TableBP<-renderTable(tableBP[1:4,1:3])
  }
)
