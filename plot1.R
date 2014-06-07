plot1  <- function ( ) {
    ## Set to the correct working directory
    setwd("~/Desktop/Exploratory Data Analysis/Project 1")
    ## Read household_power_consumption.txt data
    powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = "character")
    ## Clean up data, by fixing data and time format and subsetting only the dates to analyze
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")  
    powerData$Time <- as.POSIXct(powerData$Time,format="%H:%M:%S")
    smallPowerData <- subset(powerData,subset=(Date < "2007-02-03"))
    smallPowerData <- subset(smallPowerData, subset=(Date > "2007-01-31"))
    ## Create a histogram for Global Active Power data, use  red bars
    hist(as.numeric(smallPowerData$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
    ## Copy plot to png
    dev.copy(png, file = "plot1.png")
    ## Close connection
    dev.off()  
}