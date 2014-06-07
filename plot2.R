plot2 <- function ( ) {
    ## Set to the correct working directory
    setwd("~/Desktop/Exploratory Data Analysis/Project 1")
    ## Read household_power_consumption.txt data
    powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = "character")
    ## Clean up data, by fixing data and time format and subsetting only the dates to analyze
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")  
    powerData$Time <- as.POSIXct(powerData$Time,format="%H:%M:%S")
    smallPowerData <- subset(powerData,subset=(Date < "2007-02-03"))
    smallPowerData <- subset(smallPowerData, subset=(Date > "2007-01-31"))
    ## Create a graph ..Thurs, Fri, Sat on x for Global Active Power (kilowatts) on y
    plot(smallPowerData$Global_active_power,type="l",axes = FALSE,ylab="Global Active Power (kilowatts)",xlab="datetime")
    axis(side = 1, at = c(0,1500,2881), c("Thu", "Fri", "Sat"))
    axis(side = 2, at = c(0,2,4,6), c(0,2,4,6))
    ## Copy plot to png
    dev.copy(png, file = "plot2.png")
    ## Close connection
    dev.off() 
}