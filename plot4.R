plot4 <- function ( ) {
    ## Set to the correct working directory
    ## setwd("~/Desktop/Exploratory Data Analysis/Project 1")
    ## Read household_power_consumption.txt data
    powerData <- read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?", colClasses = "character")
    ## Clean up data, by fixing data and time format and subsetting only the dates to analyze
    powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")  
    powerData$Time <- as.POSIXct(powerData$Time,format="%H:%M:%S")
    smallPowerData <- subset(powerData,subset=(Date < "2007-02-03"))
    smallPowerData <- subset(smallPowerData, subset=(Date > "2007-01-31"))
    ## Create four plots on on page. 
    ## Place Plots 2 and 3 in the first column, oltage vs datetime on upper right,
    ## and Global reactive power vs datetime on lower right
    par(mfcol = c(2,2))
    with(smallPowerData,{
        hist(as.numeric(smallPowerData$Global_active_power),col="red",xlab="Global Active Power (kilowatts)")
        plot(smallPowerData$Sub_metering_2,type="l",col="blue",xlab="")
        plot(smallPowerData$Voltage,type="l",ylab="Voltage",xlab="datetime")
        plot(smallPowerData$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
    })
    
    ## Copy plot to png
    dev.copy(png, file = "plot4.png")
    ## Close connection
    dev.off() 
}