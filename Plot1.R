## PLOT-1 code:

## Load libraries:
library(dplyr)
library(readr)

## Get data into data frame:
houseData <- read_csv2("household_power_consumption.txt", col_names =  TRUE, na = "?")
## str(houseData)

## Filter a subset of the data for dates 1/2/2007 & 2/2/2007:
subHouseData <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007"), ]
## str(subHouseData)

## Make the file and draw the graph:
png("plot1.png", width=480, height=480)
hist(subHouseData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## Turn off graphic device:
dev.off()

