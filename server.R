library(shiny)

shinyServer(function(input, output) {
  
 
  growthrate <- reactive({
    doublingperiod <- input$dperiod
    growthrate <- (2^(1/doublingperiod))-1
  })
  
  population <- reactive({
    popultion <- input$population*1e6
  })
   
  output$text1 = renderText(input$dperiod)
  output$text2 = renderText({growthrate()})
  output$text3 = renderText({population()})
  
  ndays <- reactive({
    ndays <- 1:input$ndays
  })
  
  ncases <- reactive({
    n <- ndays()
    rate <- growthrate()
    pop <- population()
    cases <- 100
    newcases = vector()
    for (i in 1:length(n)){
     newcases[i] = cases*rate*(1-(cases/pop))
     cases=cases+newcases[i]
    }
    ncases <- newcases
  })
  
  output$plot1 <- renderPlot({
    plot(ndays(),ncases(),xlab = "Number of Days",
         ylab = "Number of New Cases", log ="y", bty = "n", pch = 16,
         type = "l", ylim = c(1e2,1e8))
  })
  
 
  
})
