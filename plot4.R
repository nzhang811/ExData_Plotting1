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
png("plot4.png", width=480, height=480)

#setup a 2x2 grid and plot each indivdual plot
par(mfrow=c(2,2))
with(dat, {
  plot(dat$Time, dat$Global_active_power, type="l", 
       xlab="", ylab="Global Active Power (kilowatts)")
  plot(dat$Time, dat$Voltage, type="l",
       xlab="datetime", ylab="Voltage")
  plot(dat$Time, dat$Sub_metering_1, type="l", 
       xlab="", ylab="Energy sub metering")
  #adding lines for the other two meters
  lines(dat$Time, dat$Sub_metering_2, col="Red")
  lines(dat$Time, dat$Sub_metering_3, col="Blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dat$Time, dat$Global_reactive_power, type="l",
       xlab="datetime", ylab="Global Reactive Energy")
})

#closing the plotting device
dev.off()