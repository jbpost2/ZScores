###########################################################################
##R Shiny App to visualize Z scores (standardizing values) from the normal distribution
##Justin Post - 2017
###########################################################################
  
library(shiny)
library(shinydashboard)

# Define UI for application that displays an about page and the app itself

dashboardPage(skin="red",
  #add title
  dashboardHeader(title="Visualizing Standardization of Normal Random Variables",titleWidth=750),
              
  #define sidebar items
  dashboardSidebar(sidebarMenu(
    menuItem("About", tabName = "about", icon = icon("archive")),
    menuItem("Application", tabName = "app", icon = icon("laptop"))
  )),
              
  #define the body of the app
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "about",
        fluidRow(
          #add in latex functionality if needed
          withMathJax(),
                
          #two columns for each of the two items
          column(6,
            #Description of App
            h1("What does this app do?"),
            #box to contain description
            box(background="red",width=12,
              h4("This application visualizes probabilities from a normal distribution and their transformation to the standard normal distribution."),
              h4("Given that a random variable follows a normal distribution, $$Y\\sim N(\\mu,\\sigma),$$ it can be shown that $$Z=\\frac{Y-\\mu}{\\sigma}\\sim N(0,1).$$ This distribution is called the Standard Normal Distribution."),
              h4("Historically, Normal random variables were transformed in this way when a probability value was requested."),
              h4("This applet shows graphically that the probability requested is the same for distribution of \\(Y\\) and the standard normal distribution as well as giving the analytical tranformation.")
            )
          ),
                
          column(6,
            #How to use the app
            h1("How to use the app?"),
            #box to contain description
            box(background="red",width=12,
              h4("The controls for the app are located to the left and the visualization and information are available on the right."),
              h4("The boxes on the top left allow the user to change the mean and standard deviation of the Normal distribution of interest."),
              h4("The boxes on the lower left allow the user to input a lower and upper bound for a probability calculation.  For a greater than or less than probability, the user can put in a very large or small value for one of the end points."),
              h4("The graphs on the right represent the distribution of \\(Y\\) and the Standard Normal distribution.  For the probability requested, the appropriate area is shaded on the graphs."),
              h4("Below the graphs, information on the tranformation is given.")
            )
          )
        )
      ),
      
      #actual app layout      
      tabItem(tabName = "app",        
        fluidRow(
          column(3,
            box(width=12,background="red",title="\\(Y\\sim N(\\mu,\\sigma)\\)",
              numericInput("mu",'Mean, \\(\\mu\\)',value=25,step=0.1),
              numericInput("sigma",'Standard Deviation, \\(\\sigma\\)',value=9,step=0.5,min=0)
            ),
            box(width=12,background="red",title="Find Probability",
              h5("P(Lower \\(\\leq\\ Y \\leq\\) Upper)"),
              numericInput("probL","Lower limit",value=19,step=0.5),
              numericInput("probU","Upper limit",value=26,step=0.5)
            )
          ),
      
          #Show a plot of the distribution  
          column(9,
            fluidRow(
              box(plotOutput("YPlot")),
              box(plotOutput("ZPlot"))
            ), 
            fluidRow(
              h4("Conversion to Z-score"),
              box(width=8,background="red",uiOutput("Z"))
            )
          )
        )
      )
    )
  )
)


