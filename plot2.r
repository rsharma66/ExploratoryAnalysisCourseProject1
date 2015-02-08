## Plot 2
## read the file into a table
library(lubridate)
library(dplyr)
library(tidyr)

setwd("/Users/rajivsharma/Desktop/Coursera/")
power <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
## create a combined Date Time column and choose 2 days
powerdate <- paste(power$Date, power$Time, sep = " ")
powerdate1 <- dmy_hms(powerdate)
power$Date_Time <- powerdate1
Date1 <- ymd_hms("2007-02-01 00:00:00")
Date2 <- ymd_hms("2007-02-02 23:59:59")
powerselect <- subset(power, power$Date_Time >= Date1 & power$Date_Time <= Date2, na.rm=TRUE)
## create relevant subset for the plot
power1 <- select(powerselect, Date_Time, Global_active_power)

plot2 <- plot(power1$Date_Time, power1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()