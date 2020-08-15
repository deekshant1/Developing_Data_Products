library(shiny)
library(plotly)
shinyUI(fluidPage(
    titlePanel("Chick Weight"),
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "diet", label = strong("Diet Number"), choices = unique(as.data.frame(ChickWeight["Diet"]))),
            selectInput(inputId = "chick", label = strong("Chick number"), choices = unique(as.data.frame(ChickWeight["Chick"]))),
            h3("Move the slider!"),
            sliderInput("slider1", "Time", 0, 21, value = c(8, 14), step = 2), 
            checkboxInput("show_xlab", "Show/Hide X axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y axis Label", value = TRUE), 
            checkboxInput("show_title", "Show/Hide Title Label", value = TRUE)
        ),
        mainPanel(
            h3("Plot"),
            plotlyOutput("plot1")
        )
    )
))