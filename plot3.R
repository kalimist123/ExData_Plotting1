#part 3

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
png("plot3.png", width=480, height=480)
plot(data$POSIXctDT, as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(data$POSIXctDT,  as.numeric(data$Sub_metering_2), type="l", col="red")
lines(data$POSIXctDT, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
