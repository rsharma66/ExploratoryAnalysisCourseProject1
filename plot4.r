## Plot 4

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
## create relevant subsets for the plot
power4a <- select(powerselect, Date_Time, Global_active_power)
power4b <- select(powerselect, Date_Time, Voltage)
power4c <- select(powerselect, Date_Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
power4d <- select(powerselect, Date_Time, Global_reactive_power)
dev.copy(png, file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), cex=0.5, bty="n", mar = c(4, 4, 4, 2))
plot(power4a$Date_Time, power4a$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(power4b$Date_Time, power4b$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(Sub_metering_1 ~ Date_Time, data = power4c, type = "l", ylim = c(0,38), col = "black", xlab = "", ylab = "Energy sub metering")
lines(power4c$Date_Time, power4c$Sub_metering_2, type = "l", col = "red")
lines(power4c$Date_Time, power4c$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = NA, lty = c(rep("solid", 3)), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(power4d$Date_Time, power4d$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
