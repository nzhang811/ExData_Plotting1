library(dplyr)

#reading the data and filtering only the time period wanted
dat <- read.table("household_power_consumption.txt", sep = ";", 
                  header=TRUE, na.strings="?", as.is=TRUE)
dat <- filter(dat, Date=="1/2/2007"|Date=="2/2/2007")

#convert the time to POXITlt class
dt <- paste(dat$Date, dat$Time, sep=" ")
dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")
dat$Time <- dt

#opening the png plotting device
png("plot2.png", width=480, height=480)

#plot of time vs. global active power
plot(dat$Time, dat$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

#closing the plotting device
dev.off()