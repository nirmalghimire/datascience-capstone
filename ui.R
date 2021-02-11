
library(shiny)

shinyUI (pageWithSidebar(
    headerPanel("Predicting Next Word App"),
    sidebarPanel(
        textInput("text", label=h3("Text Input Box"),
                  value="Type Your Text Here"),
        h6(em("Note: Please, Don't Instert any Number or Special Characters", align = "center",style = "color:green")),
        h6(em("Note: Please, Instert English Words or Phrases", align = "center",style = "color:brown")),
        submitButton("Submit")
    ),
    mainPanel(
        h4("Next Word Prediction for Twitter:"),
        verbatimTextOutput("twitter_next"),
        h4("Next Word Prediction for Blogs:"),
        verbatimTextOutput("blogs_next"),
        h4("Next Word Prediction for News:"),
        verbatimTextOutput("news_next"),
        
        p("This app predicts a next word based on your input text. 
           The prediction comes from what my algorithm found on the
           training set, i.e., twitter, bolgs, and news data at:", style = "font-family: 'times'; font-si16pt"),
                h6(a("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip")),
        br(),
        h5("Here's the Link to the Exploratory Data Analyses:", style = "color:blue"),
        h6(a("https://rpubs.com/nirmal/724007")),
        h5("Here's the Link to the Presentation with Pitch:", style = "color:blue"),
        h6(a("https://rpubs.com/nirmal/723671")),
        h5(strong("Created in February 2021 by Nirmal Ghimire", style = "color:red"))
    )
    
    
))
