library(shiny); library(ggplot2)

shinyServer(function(input,output) {

     ## generate graph of the chord's waveform
     output$chordgraph <- renderPlot({
          
          ## start by getting the frequency ratios for the chord selected
          
          if (input$chordtype=="major") {
               fund.mult = c(1,5/4,6/4)
          } else if (input$chordtype=="minor") {
               fund.mult = c(1,12/10,15/10)
          } else if (input$chordtype=="dom7") {
               fund.mult = c(1,5/4,6/4,18/10)
          } else if (input$chordtype=="major7") {
               fund.mult = c(1,10/8,12/8,15/8)
          } else if (input$chordtype=="minor7") {
               fund.mult = c(1,12/10,15/10,18/10)
          } else if (input$chordtype=="159") {
               fund.mult = c(1,3/2,9/4)
          } else if (input$chordtype=="power") {
               fund.mult = c(1,3/2,2)
          } else if (input$chordtype=="oct") {
               fund.mult = c(1,2)
          } else if (input$chordtype=="minpower") {
               fund.mult = c(1,3/2,2,24/10,6/2,4)
          } else if (input$chordtype=="majpower") {
               fund.mult = c(1,3/2,2,10/4,6/2,4)
          } else if (input$chordtype=="majorinv1") {
               fund.mult = c(1,5/4/2,6/4/2)
          } else if (input$chordtype=="majorinv2") {
               fund.mult = c(1,5/4,6/4/2)
          } else if (input$chordtype=="minorinv1") {
               fund.mult = c(1,12/10/2,15/10/2)
          } else if (input$chordtype=="minorinv2") {
               fund.mult = c(1,12/10,15/10/2)
          }else stop("I'm afraid I don't know that chord type, Sam.")
          
          
          ## make our x/time variable
          ## also initialize our dummy note and chord
          x <- seq(0,input$root.cycles,by=.001)
          newnote <- x
          chord <- rep(0,length(x))
          
          ## building the chord wave
          for (i in 1:length(fund.mult)) {
               newnote <- sin(2*pi*fund.mult[i]*x)
               chord <- chord + newnote
          }
          
          ## generate the graph
          ## ticks/labels have been removed for max cleanliness
          p <- qplot(x=seq_along(chord), y=chord,geom="line",
                     xlab=NULL, ylab=NULL)
          p <- p + theme(axis.ticks=element_blank(), axis.text=element_blank())
          print(p)
     })
})