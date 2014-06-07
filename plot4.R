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
    ## Place Plots 2 and 3 in the first column, Voltage vs datetime on upper right,
    ## and Global reactive power vs datetime on lower right
    par(mfcol = c(2,2))
    with(smallPowerData,{
        ## Plot 2
        plot(smallPowerData$Global_active_power,type="l",axes = FALSE,ylab="Global Active Power (kilowatts)",xlab="")
        axis(side = 1, at = c(0,1500,2881), c("Thu", "Fri", "Sat"))
        axis(side = 2, at = c(0,2,4,6), c(0,2,4,6))        
        ## Plot 3
        plot(smallPowerData$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering",axes = FALSE)
        lines(smallPowerData$Sub_metering_2,col="red")
        lines(smallPowerData$Sub_metering_3,col="blue")
        axis(side = 1, at = c(0,1500,2881), c("Thu", "Fri", "Sat"))
        axis(side = 2, at = c(0,10,20,30), c(0,10,20,30)) 
        legend("topright", col = c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=1)
        ## Voltage
        plot(smallPowerData$Voltage,type="l",axes=FALSE,ylab="Voltage",xlab="datetime")
        axis(side = 1, at = c(0,1500,2881), c("Thu", "Fri", "Sat"))
        axis(side = 2, at = c(234,236,238,240,242,244,246), c(234,236,238,240,242,244,246)) 
        ## Global Reactive
        plot(smallPowerData$Global_reactive_power,type="l",axes=FALSE,ylab="Global_reactive_power",xlab="datetime")
        axis(side = 1, at = c(0,1500,2881), c("Thu", "Fri", "Sat"))
        axis(side = 2, at = c(0.0,0.1,0.2,0.3,0.4,0.5), c(0.0,0.1,0.2,0.3,0.4,0.5)) 
        
    })
    
    ## Copy plot to png
    dev.copy(png, file = "plot4.png")
    ## Close connection
    dev.off() 
}