dataFile <- "./Week 1/household_power_consumption.txt"
file <- read.table(dataFile, header = TRUE, sep = ";", na.strings = "?")
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
data <- subset(file, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste (data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()