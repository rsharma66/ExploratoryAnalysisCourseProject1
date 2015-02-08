## Plot 3

library(lubridate)
library(dplyr)
library(tidyr)
## read the file into a table
setwd("/Users/rajivsharma/Desktop/Coursera/")
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
## create a combined Date Time column and choose 2 days
powerdate <- paste(power$Date, power$Time, sep = " ")
powerdate1 <- dmy_hms(powerdate)
power$Date_Time <- powerdate1
Date1 <- ymd_hms("2007-02-01 00:00:00")
Date2 <- ymd_hms("2007-02-02 23:59:59")
powerselect <- subset(power, power$Date_Time >= Date1 & power$Date_Time <= Date2, na.rm=TRUE)
power3 <- select(powerselect, Date_Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
## create relevant subset for the plot
plot(Sub_metering_1 ~ Date_Time, data = power3, type = "l", ylim = c(0,38), col = "black", xlab = "", ylab = "Energy sub metering")
lines(power3$Date_Time, power3$Sub_metering_2, type = "l", col = "red")
lines(power3$Date_Time, power3$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = NA, lty = c(rep("solid", 3)), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()