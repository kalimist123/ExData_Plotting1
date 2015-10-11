#part 4

library(dplyr)

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(data)
str(data)

filterDates <- c("1/2/2007","2/2/2007")
data<- filter(data, data$Date %in% filterDates)
data$POSIXctDT <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)
data$POSIXctDT <- as.POSIXct(data$POSIXctDT)

globalActivePower <- as.numeric(data$Global_active_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(data$POSIXctDT, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(data$POSIXctDT, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$POSIXctDT, as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(data$POSIXctDT, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(data$POSIXctDT, as.numeric(data$Sub_metering_3), type="l", col="blue")
#legend bty="n" removes border
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(data$POSIXctDT, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()