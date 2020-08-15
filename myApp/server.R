library(shiny)
library(dplyr)
library(plotly)

shinyServer(function(input, output, session) {
    observe({
        choices1 = unique(ChickWeight["Diet"])
        updateSelectInput(session, "diet", choices = choices1)
        })
        
    observeEvent(input$diet,{
        choices1 = as.list(unique(filter(ChickWeight, ChickWeight$Diet %in% input$diet)["Chick"]))
        updateSelectInput(session, "chick", choices = choices1)
        })
    
    r <- reactive({
        diet_no <- input$diet
        s <- as.data.frame(ChickWeight$Chick)
        no_of_chicks <- filter(ChickWeight, ChickWeight$Diet %in% diet_no)
        of_chicks <- input$chick
        c_n <- filter(no_of_chicks, no_of_chicks$Chick==of_chicks)
        minX <- input$slider1[1]
        maxX <- input$slider1[2]
        d <- filter(c_n, c_n$Time %in% minX:maxX)})
        
    output$plot1 <- renderPlotly({
        xlab <- ifelse(input$show_xlab, "Time(days)", "")
        ylab <- ifelse(input$show_ylab, "Weight(gm)", "")
        main <- ifelse(input$show_title, "Time vs increase Chick weight", "")
        text = c("weight", "Time")
        plot_ly(r(), x = ~Time, y = ~weight, color = r()$Chick, type = "scatter", mode = "markers",
             text = paste("<b> Chick Number: </b>", r()$Chick, "<br>",
                          "<b> Time: </b>", r()$Time,"days", "<br>", 
                          "<b> weight: </b>", r()$weight,"grams", "<br>",
                          "<b> Diet: </b>", r()$Diet, "<br>"), hoverinfo = "text") %>%
            layout(title = main, xaxis = list(title = xlab, range = c(-1, 22)), yaxis = list(title = ylab, range = c(0, 400)))
    })
})