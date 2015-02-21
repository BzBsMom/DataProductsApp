library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("The following app gives a prediction of your Systolic Blood Pressure."),
  sidebarPanel(
    h3("For doing so I will need some info."),
    numericInput('Age', 'Type your age', 18, min = 18, max = 100, step = 1),
    numericInput('BMI', 'Now your body mass index (your weight / your height)', 18, min = 18, max = 40, step = 1),
    numericInput('DBP', 'Finally your Diastolic Blood Pressure ', 50, min = 50, max = 110, step = 1),
    submitButton("Submit")
  ),
  mainPanel(
         h3("Your Estimate Systolic Blood Pressure is"),
         verbatimTextOutput("SBP"),
         tableOutput("TableBP"),
         h4("Source National Center for Biotechnology Information")
  )
))
