library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Epidemiological Model For Number of Covid Cases"),
  
  # Sidebar with a slider input for reproduction rate 
  sidebarLayout(
    sidebarPanel(
      h1("Parameters"),
      sliderInput("dperiod",
                  "Enter Doubling Period in Days",
                  min = 1,
                  max = 30,
                  value = 5,
                  step = 1),
    sliderInput("ndays",
                "Enter Total Number of Days Desired",
                min = 0,
                max = 3650,
                value = 365,
                step = 50),
  sliderInput("population",
              "Enter Total Population (in millions)",
              min = 1,
              max = 1000,
              value = 100,
              step = 10)
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1")
    )
  )
))
