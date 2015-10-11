library(dplyr)

#part 1
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(data)
str(data)

filterDates <- c("1/2/2007","2/2/2007")
data<- filter(data, data$Date %in% filterDates)

png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), main="Global Active Power", col = "red", xlab="Global Active Power (Kilowatts")
dev.off()