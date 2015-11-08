library(dplyr)
library(datasets)
library(lubridate)
setwd("/Users/pinugant/Personal/Tutorials/Coursera/ExploratoryDataAnalysis")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="household_power_consumption.zip",
              method = "curl")
downloadDate = date()
unzip("household_power_consumption.zip", exdir = "./ExData_Plotting1")

hpwr <- filter(as.data.frame(
                    read.table("./ExData_Plotting1/household_power_consumption.txt", 
                               header = TRUE, sep = ";")
                    ), Date == "1/2/2007" | Date == "2/2/2007")
head(hpwr)
globalActivePower <- as.numeric(hpwr$Global_active_power)
#wkday <- wday(as.Date(paste(hpwr$Date,hpwr$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), label = TRUE, abbr = TRUE)
wkday <- strptime(paste(hpwr$Date, hpwr$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "./ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(wkday, globalActivePower,  xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )
dev.off()

