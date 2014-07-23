#Please note: The original application read the dataset "BMI_data.csv", but this is not possible with shinyapps, therefore the necessary data was entered as data.frame. The original code is kept as remark.
#Reading the dataset from http://apps.who.int/gho/data/node.main.A904 (World Health Organization)
#bmn <- read.csv("BMI_data.csv", sep=";", header=TRUE)

#subsetting the DMI dataset, i.e. selecting only the data for the year 2009 and then create subsets for the two sexes
#bm <- subset(bmn, bmn$Year=="2009")
#m<-subset(bm, bm$Sex=="Male")
#f<-subset(bm, bm$Sex=="Female")
#create datasets for the two sexes representing the six regions as specified in the Global Health Observatory Data Repository dataset (http://apps.who.int/gho/data/node.main.A904)
#aggdataMale <- aggregate(m$Numeric.Value, list(region=m$WHO.region), mean)
#aggdataFemale <- aggregate(f$Numeric.Value, list(region=f$WHO.region), mean)
#cleandataMale <- na.omit(aggdataMale)
#cleandataFemale <- na.omit(aggdataFemale)

#sorting the datasets created above to display them in numerical order of the average BMI in the barplot
#sorteddataMale <- cleandataMale[order(cleandataMale$x),]
#sorteddataFemale <- cleandataFemale[order(cleandataFemale$x),]

#creating data for average BMI per region according to World Health Organization dataset which can not be loaded with shinyapp
region<-c("South-East-Asia", "Africa", "Eastern Mediteranean", "Americas", "Western Pacific", "Europe")
bm<-c(21.86,22.54,25.81,26.1,26.52,26.61)
bf<-c(22.62,23.99,25.99,27.21,27.44,27.72)
sorteddataMale <- data.frame(region,bm)
sorteddataFemale <- data.frame(region,bf)

#function calculating the BMI from inputs of weight and height
bmi <- function(mass, height){round(mass/(height/100)^2, 2)}

#beginning shiny input/output function
shinyServer(
  
  function(input, output){
    #Render the output of the calculated BMI
    output$bmi <-renderPrint({bmi(input$mass, input$height)})
    
    #Render barplot with the data for male BMI
    output$graphMale <-renderPlot({
      par(mar=c(10,3,3,3))#Set margins to display the complete lables for the x-axis
      bp<-barplot(bm, names=region, las=2, ylim=c(0,50), main="Average Male BMI")
      text(bp, 0, bm, cex=1, pos=3)
      abline(h=bmi(input$mass, input$height), col="red")#Add red line to show user's BMI in plot
      text(0.5,c(bmi(input$mass, input$height)+1.5), "Your BMI", col="red")#Label red line
    })
    #Render barplot with the data for female BMI
    output$graphFemale <-renderPlot({
      par(mar=c(10,3,3,3))#Set margins to display the complete lables for the x-axis
      bp<-barplot(bf, names=region, las=2, ylim=c(0,50), main="Average Female BMI")
      text(bp, 0, bf, cex=1, pos=3)
      abline(h=bmi(input$mass, input$height), col="red")#Add red line to show user's BMI in plot
      text(0.5,c(bmi(input$mass, input$height)+1.5), "Your BMI", col="red")#Label red line
    })
  }
  
)