library(shiny)

shinyUI
(pageWithSidebar(
  headerPanel("BMI calculator"),
  
  sidebarPanel(
    numericInput('mass', 'Please insert your weight in kg:', 60, min=20, max=250, step =1),
    numericInput('height', 'Please insert your height in cm:', 160, min=50, max=250, step =1),
    radioButtons('sex', 'Your Sex', c("Male"="ma","Female"="fe"), selected="ma"),
    tags$br(),
    p('Please enter your weight (in kilogram) and your height (in centimeter) in the fields above to calculate your Body Mass index (BMI).'),
    tags$br(),
    p('The diagram shows you the average BMI for different regions and your selected sex (for the year 2009), according to the Global Health Observatory Data Repository by the World Health Organization. The red line represents your BMI.'),
    tags$br(),
    tags$br(),
    p('For the related dataset please refer to: '),
    tags$a(href="http://apps.who.int/gho/data/node.main.A904","http://apps.who.int/gho/data/node.main.A904")
  ),
  mainPanel(
    h5('Your BMI: '),
    verbatimTextOutput("bmi"),
    tags$br(),
    conditionalPanel(
      condition="input.sex=='ma'", plotOutput("graphMale")),
    conditionalPanel(
      condition="input.sex=='fe'", plotOutput("graphFemale"))
  )
)
)