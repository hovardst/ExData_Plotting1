# Code for creating  plot in Plotting Assignment 1 for Exploratory Data Analysis

#read data
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE )

#Convert data
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")
epc <- subset(epc, Date == "2007-02-01" | Date == "2007-02-02" )
epc$DateTime = paste(epc$Date, epc$Time, sep=" ")
epc$DateTime = as.POSIXct(epc$DateTime)
epc$Global_active_power <- as.numeric(epc$Global_active_power)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)
epc$Voltage <- as.numeric(epc$Voltage)
epc$Sub_metering_1 <- as.numeric(epc$Sub_metering_1)
epc$Sub_metering_2 <- as.numeric(epc$Sub_metering_2)
epc$Sub_metering_3 <- as.numeric(epc$Sub_metering_3)

#Plot1
png(filename = "Plot1.png", width = 480, height = 480,  units = "px")
hist(epc$Global_active_power, col="red", main="Global active power", xlab="Global active power (kilowatts)", ylab="Frequency")
dev.off()
