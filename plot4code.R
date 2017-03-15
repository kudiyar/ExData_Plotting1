data <- read.table(unzip("household_power_consumption.zip", "household_power_consumption.txt"),
                   header = TRUE, sep = ";")
head(data)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- with(data, data[ (Date == "2007-02-01") | (Date == "2007-02-02"),])
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
par(mfrow = c(2,2))
### Plot
plot(data$timestamp, data$Global_active_power/500, type = "l", ylab = "Global Active Power")
### Plot
plot(data$timestamp, data$Voltage, type = "l", xlab="datetime", ylab="Voltage")
### Plot
plot(data$timestamp, data$Sub_metering_1, type = "l",xlab="", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, col = "red")
lines(data$timestamp, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))
### Plot
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
plot(data$timestamp, data$Global_reactive_power, type = "l", 
     xlab = "datatime", ylab = "Global reactive power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()