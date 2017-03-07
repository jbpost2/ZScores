###########################################################################
##R Shiny App to visualize normal approximations distributions
##Justin Post - Fall 2015
###########################################################################
  
#Load package
library(shiny)

# Define UI for application that draws the prior and posterior distributions given a value of y
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualizing Standardization of Normal Random Variables"),
  withMathJax(),
  fluidRow(
    column(3,br(),
      h3("\\(Y\\sim N(\\mu,\\sigma)\\)"),
      numericInput("mu",'Mean, \\(\\mu\\)',value=25,step=0.1),
      numericInput("sigma",'Standard Deviation, \\(\\sigma\\)',value=9,step=0.5,min=0),
      h3("Find Probability"),
      h5("P(Lower \\(\\leq\\ Y \\leq\\) Upper)"),
      numericInput("probL","Lower limit",value=19,step=0.5),
      numericInput("probU","Upper limit",value=26,step=0.5),
      h4("Conversion to Z-score"),
      uiOutput("Z")
     ),
      
    #Show a plot of the distribution  
    column(6,
           fluidRow(
            plotOutput("YPlot")
         ), 
#         fluidRow(
#             plotOutput("YMeanPlot",  width = "70%")
#         ),
         fluidRow(
             plotOutput("ZPlot")
         )
    )#, column (9,fluidRow())
  )
))

