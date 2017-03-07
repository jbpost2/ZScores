library(shiny)
library(markdown)
# Define server logic required to draw the plots etc
shinyServer(function(input, output,session) {
 

    
  output$YPlot<-renderPlot({
    #get inputs
    mu<-input$mu
    sigma<-input$sigma
    #shading stuff
    Lower<-input$probL
    Upper<-input$probU
    
    #plotting sequence
    x<-seq(from=mu-4*sigma,to=mu+4*sigma,length=10000)

    ##############################################
    ##Graph of Y distribution
    plot(x=x,y=dnorm(x,mean=mu,sd=sigma),type='l',col="blue",xaxt="n",ylab="PDF of Y",lwd=3,xlab="y Values",main="Distribution of Y")
    axis(side=1)
    
    shortseq<-seq(from=Lower,to= Upper,length=10000)
    polygon(c(shortseq,rev(shortseq)),c(rep(0,length(shortseq)),rev(dnorm(shortseq,mean=mu,sd=sigma))),col=rgb(0.3,0.1,0.5,0.3))
    
  })
  
  output$YMeanPlot<-renderPlot({
      #get inputs
      mu<-input$mu
      sigma<-input$sigma
      #shading stuff
      Lower<-input$probL-mu
      Upper<-input$probU-mu
      
      #plotting sequence
      x<-seq(from=-4*sigma,to=4*sigma,length=10000)
      
      ##############################################
      ##Graph of Y distribution
      plot(x=x,y=dnorm(x,mean=0,sd=sigma),type='l',col="blue",xaxt="n",ylab="PDF of Y-mu",lwd=3,xlab="y-mu Values",main="Distribution of Y-mu")
      axis(side=1)
      
      shortseq<-seq(from=Lower,to= Upper,length=10000)
      polygon(c(shortseq,rev(shortseq)),c(rep(0,length(shortseq)),rev(dnorm(shortseq,mean=,sd=sigma))),col=rgb(0.3,0.1,0.5,0.3))
      
  })
  output$ZPlot<-renderPlot({
      #get inputs
      mu<-input$mu
      sigma<-input$sigma
      #shading stuff
      Lower<-(input$probL-mu)/sigma
      Upper<-(input$probU-mu)/sigma
      
      #plotting sequence
      x<-seq(from=-4,to=4,length=10000)
      
      ##############################################
      ##Graph of Y distribution
      plot(x=x,y=dnorm(x,mean=0,sd=1),type='l',col="blue",xaxt="n",ylab="PDF of Z",lwd=3,xlab="z Values",main="Distribution of Z")
      axis(side=1)
      
      shortseq<-seq(from=Lower,to= Upper,length=10000)
      polygon(c(shortseq,rev(shortseq)),c(rep(0,length(shortseq)),rev(dnorm(shortseq,mean=0,sd=1))),col=rgb(0.3,0.1,0.5,0.3))
      
  })
  

  output$Z<-renderUI({
     #get inputs
      mu<-input$mu
      sigma<-input$sigma
      Lower<-input$probL
      Upper<-input$probU
      withMathJax(paste("\\(P\\left(",Lower,"\\leq Y \\leq",Upper,"\\right)\\\\
            =P\\left(\\frac{",Lower,"-",mu,"}{",sigma,"}\\leq \\frac{Y-\\mu}{\\sigma}\\leq\\frac{",Upper,"-",mu,"}{",sigma,"}\\right)\\\\
            =P\\left(",round((Lower-mu)/sigma,2),"\\leq Z\\leq ",round((Upper-mu)/sigma,2),"\\right)\\\\
            =", round(pnorm(Upper,mean=mu,sd=sigma)-pnorm(Lower,mean=mu,sd=sigma),4),"\\)",sep=""))
  })
  
  
})    