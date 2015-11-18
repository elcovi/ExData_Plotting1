## PLOT-2 code:

## Load libraries:
library(dplyr)
library(readr)

## Get data into data frame, using Hadley Wickham "readr" package, which allows for reading ";" 
## separted data and type assignement to the data in one step:

houseData <- read_csv2("household_power_consumption.txt", 
                       col_names =  TRUE, 
                       col_types = "ccnnnnnnn", 
                       na = "?")
## str(houseData)

## Filter a subset of the data for dates 1/2/2007 & 2/2/2007:
subHouseData <- houseData[houseData$Date %in% c("1/2/2007","2/2/2007"), ]

## str(subHouseData)

dateFormat <- strptime(paste(subHouseData$Date, 
                             subHouseData$Time, sep=" "), 
                       "%d/%m/%Y %H:%M:%S") 

## Make the file and draw the graph:
png("plot2.png", 
    width=480, 
    height=480)
plot(dateFormat, 
     subHouseData$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

## Turn off graphic device:
dev.off()



