library(UsingR)

shinyServer(
  function(input, output) {
    output$irisPlot  <- renderPlot({
      
      tmpIrisDs <- iris[, c(input$x, input$y, "Species")]
      colnames(tmpIrisDs) <- c("x","y","Species")
      
      plot <- ggplot(data = tmpIrisDs,aes(x = x, y = y, color=Species)) + 
        geom_point() +
        xlab(input$x) +  ylab(input$y) +
        ggtitle( paste0(input$x," (mean " , round(mean(tmpIrisDs$x),2) ,  ") vs. ", input$y,
                        " (mean ", round(mean(tmpIrisDs$y),2), ")\n"))
      
      if (input$showlm) {  
       plot <- plot + stat_smooth(method = "lm", col = "blue")
      }
    
      if (input$showYMean) {
        plot <- plot + geom_hline(yintercept=mean(tmpIrisDs$y),linetype="dashed")
      }
      
      if (input$showXMean) {  
       plot <- plot +  geom_vline(xintercept=mean(tmpIrisDs$x),linetype="dotdash")
      }
      
      plot
    })
    
    output$data <- renderTable({
      data.frame(iris)
    })
    
    
    output$table <- renderDataTable({
      iris
    })
  }
)
