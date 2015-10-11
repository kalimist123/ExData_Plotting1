#part 2

library(dplyr)

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(data)
str(data)

filterDates <- c("1/2/2007","2/2/2007")
data<- filter(data, data$Date %in% filterDates)
data$POSIXctDT <- paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time)

globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(as.POSIXct(data$POSIXctDT), globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()