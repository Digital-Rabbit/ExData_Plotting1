plot3 <- function ( ) {
    ## Set to the correct working directory
    setwd("~/Desktop/Exploratory Data Analysis/Project 1")
    ## Read household_power_consumption.txt data
    powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = "character")
    ## Clean up data, by fixing data and time format and subsetting only the dates to analyze
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")  
    powerData$Time <- as.POSIXct(powerData$Time,format="%H:%M:%S")
    smallPowerData <- subset(powerData,subset=(Date < "2007-02-03"))
    smallPowerData <- subset(smallPowerData, subset=(Date > "2007-01-31"))
    ## Energy submetering on the y and Thur, Fri, Sat on x, with submetering_1
    ## submetering_2 and submetering_3 separately plotted and in a legend
    plot(smallPowerData$Sub_metering_1,type="l",xlab = "",axes = FALSE)
    lines(smallPowerData$Sub_metering_2,col="blue",xlab = "")
    lines(smallPowerData$Sub_metering_3,col="red",ylab="Energy sub metering",xlab = "")
    ## Legend
    ## Sub_metering_1, Sub_metering_2 (red), Sub_metering_3 (blue)
    legend("topright", col = c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=1)
         
    ## Copy plot to png
    dev.copy(png, file = "plot3.png")
    ## Close connection
    dev.off() 
}