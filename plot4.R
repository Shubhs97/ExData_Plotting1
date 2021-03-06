dataFile <- "./Week 1/household_power_consumption.txt"
file <- read.table(dataFile, header = TRUE, sep = ";", na.strings = "?")
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
data <- subset(file, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste (data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data$datetime, data$Global_active_power,xlab = "", ylab = "Global Active Power", type = "l", cex = 0.2)
plot(data$datetime, data$Voltage, ylab = "Voltage", xlab = "datetime", type = "l" )
plot(data$datetime, data$Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "l", col = "black")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")
plot(data$datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datatime")
dev.off()