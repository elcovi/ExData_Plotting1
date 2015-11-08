## PLOT-4 code:

## Load libraries:
library(dplyr)
library(readr)

## Get data into data frame:
houseData <- read_csv2("household_power_consumption.txt", col_names =  TRUE, na = "?")
## str(houseData)

## Filter a subset of the data for dates 1/2/2007 & 2/2/2007:
subHouseData <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007"), ]
## str(subHouseData)

dateFormat <- strptime(paste(subHouseData$Date, subHouseData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Make the file:
png("plot4.png", width=480, height=480)

## Make the rows & columns for display:
par(mfrow = c(2, 2)) 

## Draw the graphs & legends:
plot(dateFormat, subHouseData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(dateFormat, subHouseData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
plot(dateFormat, subHouseData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateFormat, subHouseData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateFormat, subHouseData$Sub_metering_2, type="l", col="red")
lines(dateFormat, subHouseData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Turn off graphic device:
dev.off()
