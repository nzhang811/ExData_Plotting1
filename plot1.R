library(dplyr)

#reading the data and filtering only the time period wanted
dat <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
dat <- filter(dat, Date=="1/2/2007"|Date=="2/2/2007")

#opening the png plotting device
png("plot1.png", width = 480, height = 480)

#drawing the histogram
hist(dat$Global_active_power, freq=TRUE, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#closing the plotting device
dev.off()