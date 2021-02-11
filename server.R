
source("~/Coursera/Data Science/Data Science Capstone/capstone.R/prediction_algorithm.R")
shinyServer(function(input,output){
    output$twitter_next<-renderText({
        hope<-as.character(prediction_twitter(as.character(input$text))[2])
    })
    output$blogs_next<-renderText({
        hope<-as.character(prediction_blogs(as.character(input$text))[2])
    })
    output$news_next<-renderText({
        hope<-as.character(prediction_news(as.character(input$text))[2])
    })
    
})
