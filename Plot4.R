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
voltage <- as.numeric(hpwr$Voltage)
globalReactivePower <- as.numeric(hpwr$Global_reactive_power)
SubMtr1 <- as.numeric(hpwr$Sub_metering_1)
SubMtr2 <- as.numeric(hpwr$Sub_metering_2)
SubMtr3 <- as.numeric(hpwr$Sub_metering_3)

wkday <- strptime(paste(hpwr$Date, hpwr$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename = "./ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 
plot(wkday, globalActivePower, xlab = "", ylab = "Global Active Power", type = "l")
plot(wkday, voltage, xlab = "datetime", ylab = "Volatge", type = "l")

plot(wkday, SubMtr1,  xlab = "", ylab = "Energy sub metering", type = "l" )
lines(wkday, SubMtr2, type = "l", col = "red")
lines(wkday, SubMtr3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border = "black", lty = 1, lwd = 2, col = c("black", "red", "blue"), box.lwd = 1, box.lty = 2)
plot(wkday, globalReactivePower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()

