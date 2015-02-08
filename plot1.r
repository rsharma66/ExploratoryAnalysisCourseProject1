## Plot 1
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
## create relevant subset for the plot
power1 <- select(powerselect, Date_Time, Global_active_power)
dev.copy(png, file = "plot1.png", width = 480, height = 480)
plot1 <- with(power1, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()
